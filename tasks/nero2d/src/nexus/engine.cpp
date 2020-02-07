/***************************************************************************
 *   Copyright (C) 2006, 2007, 2008 by Jan Fostier                         *
 *   jan.fostier@intec.ugent.be                                            *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

#include "base.h"
#include "box.h"
#include "boxmemh.h"
#include "level.h"
#include "leveldata.h"
#include "engine.h"
#include "intgroup.h"
#include "nearinthandler.h"
#include "tree.h"
#include <fftw3.h>

using namespace std;

// ============================================================================
// TYPEDEFS
// ============================================================================

typedef map<int, int>::const_iterator intIntIt;

typedef map<int, InComm>::iterator inCommIt;
typedef map<int, InComm>::const_iterator inCommItC;
typedef map<int, OutComm>::iterator outCommIt;
typedef map<int, OutComm>::const_iterator outCommItC;

// ===========================================================================
// PROCESSOR INFORMATION
// ===========================================================================

int nProc;              // number of processes
int thisProc;           // identifier for this process

double NearIntHandler::targetWorkAmount = 1e10;

// ============================================================================
// FMM TREE CLASS
// ============================================================================

Engine::Engine() : basisTree(NULL), testTree(NULL), sepTree(TREE_EQUAL),
        ld(NULL), blockJacobiLevel(-1), nNearLevels(0), nNearIntHandlers(0),
        locNearTrain(NULL), nearMetaData(NULL), nearInt(NULL),
        nearIntTemp(NULL), canCalculate(false)
{
#ifdef HAVE_MPI
        nInComms = nOutComms =  nPendingRecvs = nPendingSends = 0;
        indices = NULL;
        status = NULL;
        recvMsg = NULL;

        // prepare the communicators
        MPI_Comm_dup(MPI_COMM_WORLD, &nearCommunicator);
        MPI_Comm_dup(MPI_COMM_WORLD, &upCommunicator);
        MPI_Comm_dup(MPI_COMM_WORLD, &downCommunicator);
#endif

#ifdef USE_MPE
        // TODO : Cleanup these logs
        for (int i = 0; i < 14; i++)
                MPE_Log_get_state_eventIDs(&eventB[i], &eventE[i]);

        if (thisProc == 0) {
                MPE_Describe_state(eventB[0], eventE[0], "Recv", "red");
                MPE_Describe_state(eventB[1], eventE[1], "Send", "green");
                MPE_Describe_state(eventB[2], eventE[2], "Work Package",
                                                          "salmon");
                MPE_Describe_state(eventB[3], eventE[3], "AllReduce", "yellow");
                MPE_Describe_state(eventB[4], eventE[4], "Matvec", "gray");
                MPE_Describe_state(eventB[5], eventE[5], "WaitRecv", "black");
                MPE_Describe_state(eventB[6], eventE[6], "Memcpy", "purple");
                MPE_Describe_state(eventB[8], eventE[8], "Near",
                                                         "cornflower blue");
                MPE_Describe_state(eventB[9], eventE[9], "Far", "red");
                MPE_Describe_state(eventB[10], eventE[10], "Agg", "yellow");
                MPE_Describe_state(eventB[11], eventE[11], "Dag", "orange");
                MPE_Describe_state(eventB[12], eventE[12], "LZAgg", "pink");
                MPE_Describe_state(eventB[13], eventE[13], "LZDag",
                                                           "DarkKhaki");
        }

        MPI_Pcontrol(0);
        MPE_Start_log();
#endif
}

Engine::~Engine()
{
#ifdef USE_MPE
        MPE_Stop_log();
#endif

#ifdef HAVE_MPI
        MPI_Comm_free(&nearCommunicator);
        MPI_Comm_free(&upCommunicator);
        MPI_Comm_free(&downCommunicator);

        deleteTree();

        delete [] OutComm::sendReq;
        delete [] InComm::recvReq;
        delete [] status;
        delete [] indices;
        delete [] recvMsg;

        // allocate memory for the near interaction communication process
        for(inCommIt e = nearInComm.begin(); e != nearInComm.end(); e++) {
                delete [] e->second.buffer;
                e->second.buffer = NULL;
        }

        // allocate memory for the near interaction communication process
        for(outCommIt e = nearOutComm.begin(); e != nearOutComm.end(); e++) {
                OutComm &comm = e->second;

                delete [] comm.buffer;
                delete [] comm.srcOffset;
                delete [] comm.srcSize;

                comm.buffer = NULL;
                comm.srcOffset = NULL;
                comm.srcSize = NULL;
        }
#endif

        delete [] nearIntTemp;
        delete [] nearInt;
        delete [] nearMetaData;

        // delete all interaction groups
        for (MapIGIt e = intGroup.begin(); e != intGroup.end(); e++)
                delete e->second;
        intGroup.clear();

        delete [] ld;
        if (testTree != basisTree)
                delete testTree;
        delete basisTree;
}

// ============================================================================
// FMMTREE CONSTRUCTION
// ============================================================================

void Engine::createTree(const Point &rootCentre, deci rootSize,
                        int nLevels, SepTree sepTree_)
{
        assert(nLevels > 0);
        sepTree = sepTree_;

        // make sure this function is called only once
        assert(basisTree == NULL);

        // create a basis function tree
        basisTree = new Tree(rootCentre, rootSize, nLevels);

        // create a test function tree
        if (sepTree == TREE_EQUAL)
                testTree = basisTree;
        else {
                testTree = new Tree(rootCentre, rootSize, nLevels);
                blockJacobiLevel = -1;
        }

        // create level data
        ld = new LevelData[nLevels];
        for (int lvl = 0; lvl < nLevels; lvl++) {
                ld[lvl].boxSize = rootSize / (1 << (nLevels - 1 - lvl));
                ld[lvl].minDist = 3.0*ld[lvl].boxSize;
        }
}

void Engine::createInteractionGroup(const Point& LL, const Point& UR,
                                    int groupID)
{
        // make sure that create tree has already been called
        assert(basisTree != NULL);

        Point rootCentre = basisTree->rootCentre;
        deci rootSize = basisTree->rootSize;

        // make sure the bounding box is within the tree parameters
        assert(intGroup.find(groupID) == intGroup.end());
        assert(LL.getX() > rootCentre.getX()-(0.5+ZERO_THRESHOLD)*rootSize);
        assert(LL.getY() > rootCentre.getY()-(0.5+ZERO_THRESHOLD)*rootSize);
        assert(UR.getX() < rootCentre.getX()+(0.5+ZERO_THRESHOLD)*rootSize);
        assert(UR.getY() < rootCentre.getY()+(0.5+ZERO_THRESHOLD)*rootSize);

        // make sure the groupID does not exist
        assert(intGroup.find(groupID) == intGroup.end());

        Subtree *basisSubtree, *testSubtree;
        basisSubtree = basisTree->createSubtree(groupID, LL, UR);

        if (sepTree == TREE_SEPARATE)
                testSubtree = testTree->createSubtree(groupID, LL, UR);

        // create the interaction group
        IntGroup *newIntGroup = new IntGroup(groupID, sepTree, basisSubtree,
                                             testSubtree, LL, UR, ld);
        intGroup[groupID] = newIntGroup;
}

void Engine::setFmmLimits(int lvl, deci minXDist, deci maxXDist)
{
        // make sure that lvl is within normal range
        assert((lvl >= 0) && (lvl < basisTree->nLevels));

        ld[lvl].minDist = minXDist*ld[lvl].boxSize;
        ld[lvl].maxDist = maxXDist*ld[lvl].boxSize;
}

void Engine::setBlockJacobiLevel(int bjl)
{
        // make sure that create tree has already been called
        assert(basisTree != NULL);

        // the block jacobi level cannot be larger than the top level
        if (bjl >= basisTree->nLevels)
                bjl = basisTree->nLevels-1;
        blockJacobiLevel = bjl;
        // no block jacobi if we have separate trees!
        if (sepTree == TREE_SEPARATE)
                blockJacobiLevel = -1;

        // update the near levels to disallow partitioning below the BJ level
        if (nNearLevels <= blockJacobiLevel)
                nNearLevels = blockJacobiLevel+1;
}

void Engine::setMinimalPartitionLevel(int mpl)
{
        // the minimal partition level cannot be larger than the top level
        if (mpl >= basisTree->nLevels)
                mpl = basisTree->nLevels-1;

        // update the near levels to disallow partitioning below the BJ level
        if (nNearLevels <= mpl)
                nNearLevels = mpl+1;
}

void Engine::addUnknown(const Point& r, int nID, const int *listID,
                        int targetLvl, TreeType treeType)
{
        if (nNearLevels <= targetLvl)
                nNearLevels = targetLvl+1;

        if (treeType == TREE_BASIS) {
                assert(basisTree != NULL);
                basisTree->addUnknown(r, nID, listID, targetLvl);
        } else {
                assert(testTree != NULL);
                testTree->addUnknown(r, nID, listID, targetLvl);
        }
}

bool Engine::isLocal(const Point& r, TreeType treeType) const
{
        if (treeType == TREE_BASIS) {
                assert(basisTree != NULL);
                return basisTree->isLocal(r);
        } else {
                assert(testTree != NULL);
                return testTree->isLocal(r);
        }
}

int Engine::getOwner(const Point&r, TreeType treeType) const
{
        if (treeType == TREE_BASIS) {
                assert(basisTree != NULL);
                return basisTree->getOwner(r);
        } else {
                assert(testTree != NULL);
                return testTree->getOwner(r);
        }
}

int Engine::getUnknownIndex(const Point &r, TreeType treeType)
{
        if (treeType == TREE_BASIS) {
                assert(basisTree != NULL);
                return basisTree->getUnknownIndex(r);
        } else {
                assert(testTree != NULL);
                return testTree->getUnknownIndex(r);
        }
}

void Engine::finalizeAddingUnknowns()
{
        assert(basisTree != NULL);
        assert(basisTree->nUnknowns > 0);

        basisTree->finalizeAddingUnknowns();
        if (sepTree == TREE_SEPARATE)
                testTree->finalizeAddingUnknowns();

        for (MapIGIt e = intGroup.begin(); e != intGroup.end(); e++)
                e->second->finalizeAddingUnknowns(blockJacobiLevel);
}

int Engine::doLoadBalancing(LoadHandler *loadHandler, bool calcAllRadPat)
{
        assert(basisTree != NULL);
        basisTree->doLoadBalancing(loadHandler, ld, nNearLevels);

        if (sepTree == TREE_SEPARATE)
                testTree->doLoadBalancing(loadHandler, ld, nNearLevels);

        // calculate the number of lFarLevels and delete empty intgroups
        for (MapIGIt e = intGroup.begin(); e != intGroup.end(); ) {
                // set the unknown offset for the local boxes
                setLocalUnknownOffset();

                IntGroup *ig = e->second;

                // find the subtree roots in the fmm tree
                ig->prepareFarInteractions(calcAllRadPat);

                // if the intGroup is completely not local
                if (ig->hasFarInteractions() == 0) {
                        basisTree->deleteSubtree(e->second->groupID);
                        if (sepTree == TREE_SEPARATE)
                                testTree->deleteSubtree(e->second->groupID);
                        delete e->second;
                        intGroup.erase(e++);
                } else
                        e++;
        }

        // prepare the near interactions
        prepareNearInteractions();

        return basisTree->nlUnknowns;
}

void Engine::deleteTree()
{
        BoxMemHandler::deleteAllBoxes();
}

void Engine::prepareMatrixVector()
{
        // create the near interation packages
        createNearInteractionPackages();

        // create the far interaction packages
        for (MapIGIt e = intGroup.begin(); e != intGroup.end(); e++)
                e->second->createFarIntPackages();

#ifdef HAVE_MPI
        nOutComms = nInComms = 0;
        // prepare the nearComm structures
        prepareNearCommunications(nOutComms, nInComms);

        // prepare the upComm and dagComm structures
        for (MapIGIt e = intGroup.begin(); e != intGroup.end(); e++)
                e->second->prepareCommunications(nOutComms, nInComms);

        // allocate memory for the communication structures
        prepareCommunications();
#endif
}

// ============================================================================
// NEAR INTERACTIONS
// ============================================================================

void Engine::recCalcNearIntList(const Point& p, int targetLvl, Point pathC,
                                 int parentLvl, vector<Box*> &nList,
                                 vector<Point> &cList) const
{
        if (parentLvl <= targetLvl) return;
        int childLvl = parentLvl-1;

        // descend in the path
        int s = Box::searchSector(pathC, p);
        deci offset = 0.25*ld[parentLvl].boxSize;

        // update the root centrum
        deci addX = (s & 0x1) ? offset : -offset;
        deci addY = (s & 0x2) ? offset : -offset;
        deci addZ = (s & 0x4) ? offset : -offset;
        pathC = pathC + Point(addX, addY, addZ);

        vector<Box*> pNList = nList;
        vector<Point> pCList = cList;
        nList.clear();
        cList.clear();

        vector<Box*>::iterator e = pNList.begin();
        vector<Point>::iterator c = pCList.begin();
        for( ; e != pNList.end(); e++, c++) {
                Box* chd = (*e)->firstChild;
                int nChildren = (*e)->getNChildren();
                for (int i = 0; i < nChildren; i++, chd = chd->next) {
                        int s = chd->getSector();
                        Point cCentre = (*c);
                        deci addX = (s & 0x1) ? offset : -offset;
                        deci addY = (s & 0x2) ? offset : -offset;
                        deci addZ = (s & 0x4) ? offset : -offset;
                        cCentre = cCentre + Point(addX, addY, addZ);

                        if (ld[childLvl].isSuffSeparated(pathC, cCentre))
                                continue;
                        if (childLvl == blockJacobiLevel)
                                if ((pathC-cCentre).norm() < offset) continue;

                        nList.push_back(chd);
                        cList.push_back(cCentre);
                }
        }

        recCalcNearIntList(p, targetLvl, pathC, childLvl, nList, cList);
}

void Engine::setLocalUnknownOffset()
{
        assert(basisTree != NULL);
        basisTree->setLocalUnknownOffset(nNearLevels);

        if (sepTree == TREE_SEPARATE)
                testTree->setLocalUnknownOffset(nNearLevels);
}

void Engine::calcNearIntList(const Box* box, TreeType boxType,
                             vector<Box*> &nearList) const
{
        nearList.clear();
        if (!box->isFlagged()) return;

        Tree *boxTree = (boxType == TREE_BASIS) ? basisTree : testTree;
        Tree *otherTree = (boxType == TREE_BASIS) ? testTree : basisTree;

        int lvl = boxTree->getBoxLevel(box);
        Point centre = boxTree->getBoxCentre(box, lvl);

        nearList.reserve(30);
        nearList.push_back(const_cast<Box*>(otherTree->root));

        vector<Point> cList;
        cList.clear();
        cList.reserve(30);
        cList.push_back(otherTree->rootCentre);

        recCalcNearIntList(centre, lvl, boxTree->rootCentre,
                           boxTree->nLevels-1, nearList, cList);

        // delete any boxes in the nearList if both boxes still have children
        if (box->getNChildren() != 0) {
                for (BoxIt e = nearList.begin(); e != nearList.end(); )
                        if ((*e)->getNChildren() > 0)
                                e = nearList.erase(e);
                        else
                                e++;
        }

        if (boxTree->nLevels == 1) return; // FIXME : look at me !!

        // add the box itself to the near list if it is a block jacobi box
        if (lvl == blockJacobiLevel)
                nearList.push_back(const_cast<Box*>(box));
}

void Engine::recMarkNearBoxes(Box *box1, Box *box2, int lvl)
{
        // get out early
        if ((box1 == NULL) || (box2 == NULL)) return;

        // temp variables
        int i, j;
        int nBox1 = (box1->parent == NULL) ? 1 : box1->parent->getNChildren();
        int nBox2 = (box2->parent == NULL) ? 1 : box2->parent->getNChildren();
        Box *b1, *b2;

        for(b1 = box1, i = 0; i < nBox1; i++, b1 = b1->next) {
                for(b2 = box2, j = 0; j < nBox2; j++, b2 = b2->next) {
                        Point b1c = testTree->getBoxCentre(b1, lvl);
                        Point b2c = basisTree->getBoxCentre(b2, lvl);
                        if (!ld[lvl].isSuffSeparated(b1c, b2c)) {
                                if ((lvl == blockJacobiLevel) && (b1 == b2)) {
                                        b1->setFlag(true);
                                } else if ((b1->firstChild == NULL) ||
                                           (b2->firstChild == NULL)) {
                                        if (nNearLevels <= lvl)
                                                nNearLevels = lvl+1;
                                        b1->setFlag(true);
                                        b2->setFlag(true);
                                } else {
                                        recMarkNearBoxes(b1->firstChild,
                                                         b2->firstChild, lvl-1);
                                }
                        }

                        if (b1 == b2) break;
                }
        }
}

void Engine::recCountNearInteractions(Box *box)
{
        if (box == NULL) return;

        // calculate the near list
        vector<Box*> nL;
        calcNearIntList(box, TREE_TEST, nL);

        int m = box->getNUnknowns();
        for(BoxIt e = nL.begin(); e != nL.end(); e++) {
                int srcProc = (*e)->getOwner();

                // mark the near interaction
                nNearInt[srcProc]++;
                nNearIntHandlers++;

                // check whether to receive (*e)
                if ((*e)->containsLocalData()) continue;

                // don't recv a box from yourself
                if (srcProc == thisProc) continue;

                nearInComm[srcProc].recvSize += (*e)->getNUnknowns();
                (*e)->recSetContainsLocalData(true);
        }

        Box *chd = box->firstChild;
        for (int i = 0; i < box->getNChildren(); i++, chd = chd->next)
                recCountNearInteractions(chd);
}

void Engine::recCountNearSendComm(Box *box, set<int> sL)
{
        if (box == NULL) return;

        // calculate the near list
        vector<Box*> nL;
        calcNearIntList(box, TREE_BASIS, nL);

        int m = box->getNUnknowns();
        for(BoxIt e = nL.begin(); e != nL.end(); e++) {
                int dstProc = (*e)->getOwner();

                // don't send a box to yourself
                if (dstProc == thisProc) continue;

                // check whether to send this box
                if (sL.find(dstProc) == sL.end()) {
                        nearOutComm[dstProc].numSrc++;
                        nearOutComm[dstProc].sendSize += m;
                        sL.insert(dstProc);
                }
        }

        Box *chd = box->firstChild;
        for (int i = 0; i < box->getNChildren(); i++, chd = chd->next)
                recCountNearSendComm(chd, sL);
}

void Engine::recStoreNearInteractions(Box *box, map<int, int> &index)
{
        if (box == NULL) return;

        // calculate the near list
        vector<Box*> nL;
        calcNearIntList(box, TREE_TEST, nL);

        int m = box->getNUnknowns();
        int dstUnknownOffset = box->getOffset();
        for (BoxIt e = nL.begin(); e != nL.end(); e++) {
                int n = (*e)->getNUnknowns();
                int srcUnknownOffset = (*e)->getOffset();
                int srcProc = (*e)->getOwner();

                NearInt &nI = nearInt[index[srcProc]];
                NearIntTemp &nT = nearIntTemp[index[srcProc]];

                nI.srcUnknownOffset = srcUnknownOffset;
                nI.dstUnknownOffset = dstUnknownOffset;

                nT.basisStart = srcUnknownOffset+basisTree->procOffset[srcProc];
                nT.basisEnd = nT.basisStart + n - 1;
                nT.testStart = dstUnknownOffset;
                nT.testEnd = nT.testStart + m - 1;

                index[srcProc]++;
        }

        Box *chd = box->firstChild;
        for (int i = 0; i < box->getNChildren(); i++, chd = chd->next)
                recStoreNearInteractions(chd, index);
}

void Engine::recStoreNearSendComm(Box *box, set<int> sL, map<int, int> &cIndex)
{
        if (box == NULL) return;

        // calculate the near list
        vector<Box*> nL;
        calcNearIntList(box, TREE_BASIS, nL);

        int m = box->getNUnknowns();
        int srcUnknownOffset = box->getOffset();
        for(BoxIt e = nL.begin(); e != nL.end(); e++) {
                int dstProc = (*e)->getOwner();

                // don't communicate to yourself
                if (dstProc == thisProc) continue;

                // check whether to send this box
                if (sL.find(dstProc) != sL.end()) continue;

                // yes: schedule it for sending
                int ind = cIndex[dstProc]++;
                assert(ind < nearOutComm[dstProc].numSrc);
                nearOutComm[dstProc].srcOffset[ind] = srcUnknownOffset;
                nearOutComm[dstProc].srcSize[ind] = m;

                sL.insert(dstProc);
        }

        Box *chd = box->firstChild;
        for (int i = 0; i < box->getNChildren(); i++, chd = chd->next)
                recStoreNearSendComm(chd, sL, cIndex);
}

void Engine::prepareNearInteractions()
{
        // reset variables (from any previous call)
        nNearInt.clear(); nNearIntHandlers = 0;
        nearInComm.clear(); nearOutComm.clear();

        set<int> emptyList;

        // flag all boxes that have at least one near interaction
        recMarkNearBoxes(testTree->root, basisTree->root, basisTree->nLevels-1);

        // count all near interactions
        Box *box = testTree->level[nNearLevels-1].lFirstBox;
        for (int i = 0; i < testTree->level[nNearLevels-1].nlBoxes; box = box->next, i++)
                recCountNearInteractions(box);

        // count all near outgoing communications
        box = basisTree->level[nNearLevels-1].lFirstBox;
        for (int i = 0; i < basisTree->level[nNearLevels-1].nlBoxes; box = box->next, i++)
                recCountNearSendComm(box, emptyList);

#ifdef HAVE_MPI
        // allocate memory for the near interaction communication process
        for(inCommIt e = nearInComm.begin(); e != nearInComm.end(); e++) {
                InComm &comm = e->second;

                comm.srcProc = e->first;
                comm.buffer = new cplx[comm.recvSize];
                comm.communicator = &nearCommunicator;
                comm.tag = 0;
        }

        // allocate memory for the near interaction communication process
        for(outCommIt e = nearOutComm.begin(); e != nearOutComm.end(); e++) {
                OutComm &comm = e->second;

                comm.dstProc = e->first;
                comm.buffer = new cplx[comm.sendSize];
                comm.srcOffset = new int[comm.numSrc];
                comm.srcSize = new int[comm.numSrc];
                comm.communicator = &nearCommunicator;
                comm.tag = 0;
        }
#endif

        // after marking the local boxes, calculate the unknownOffset
        basisTree->calcUnknownOffset(nNearLevels);
        if (sepTree == TREE_SEPARATE)
                testTree->calcUnknownOffset(nNearLevels);

        // allocate necessary memory
        nearIntTemp = new NearIntTemp[nNearIntHandlers];
        nearInt = new NearInt[nNearIntHandlers];

        // Set the starting postitions for the index vector
        map<int, int> index = nNearInt;
        int cumSum = 0;
        for (map<int, int>::iterator e = index.begin(); e != index.end(); e++) {
                int temp = e->second;
                e->second = cumSum;
                cumSum += temp;
        }

        map<int, int> cIndex;

        // actually store the near interactions and the near communications
        box = testTree->level[nNearLevels-1].lFirstBox;
        for (int i = 0; i < testTree->level[nNearLevels-1].nlBoxes; box = box->next, i++)
                recStoreNearInteractions(box, index);

        // actually store the near interactions and the near communications
        box = basisTree->level[nNearLevels-1].lFirstBox;
        for (int i = 0; i < basisTree->level[nNearLevels-1].nlBoxes; box = box->next, i++)
                recStoreNearSendComm(box, emptyList, cIndex);
}

void Engine::setNearIntHandler(int nearID, NearIntHandler *nih)
{
        assert((nearID >= 0) && (nearID < nNearIntHandlers));
        nearInt[nearID].nih = nih;
}

void Engine::createNearInteractionPackages()
{
        int fIndex = 0, mdInd = 0;
        double targetWorkAmount = NearIntHandler::targetWorkAmount;

        nearMetaData = new NearMetaData[nNearInt.size()];
        for (intIntIt e = nNearInt.begin(); e != nNearInt.end(); e++, mdInd++) {
                int srcProc = e->first;

                NearMetaData &md = nearMetaData[mdInd];

                md.srcBase = (srcProc == thisProc) ? NULL :
                        nearInComm[srcProc].buffer;

                double workAmount = targetWorkAmount+1;
                vector <unsigned int> nNearIntPerPackage;

                // count the number of packages
                for (int i = fIndex; i < fIndex+e->second; i++) {
                        NearInt &nI = nearInt[i];

                        // check if it is necessary to start a new package
                        if (workAmount > targetWorkAmount) {
                                workAmount = 0;
                                nNearIntPerPackage.push_back(0);
                        }

                        workAmount += nI.nih->getWorkAmount();
                        nNearIntPerPackage.back()++;
                }

                // allocate memory for the near packages
                Train<NearPack> &nt = nearTrain[srcProc];
                nt.nPackages = nNearIntPerPackage.size();
                nt.package = new NearPack[nt.nPackages];
                nt.metaData = &nearMetaData[mdInd];

                for (int i = 0, index = fIndex; i < nt.nPackages; i++) {
                        nt.package[i].nearInt = nearInt + index;
                        nt.package[i].nNearInts = nNearIntPerPackage[i];
                        index += nNearIntPerPackage[i];
                }

                fIndex += e->second;

                if (srcProc == thisProc)
                        locNearTrain = &nearTrain[srcProc];
        }
}

#ifdef HAVE_MPI

void Engine::prepareNearCommunications(int &nOutComms, int &nInComms)
{
        for(inCommIt e = nearInComm.begin(); e != nearInComm.end(); e++) 
                e->second.msgID = nInComms++;

        for(outCommIt e = nearOutComm.begin(); e != nearOutComm.end(); e++) 
                e->second.msgID = nOutComms++;
}

int Engine::postNearIntSend(const cplx *U)
{
        for(outCommIt e = nearOutComm.begin(); e != nearOutComm.end(); e++) {
                OutComm &comm = e->second;

                comm.pack(U);
                comm.post();
        }

        return nearOutComm.size();
}

int Engine::postNearIntRecv()
{
        for(inCommIt e = nearInComm.begin(); e != nearInComm.end(); e++)
                e->second.post();

        return nearInComm.size();
}

#endif

// ============================================================================
// TREE AUXILIARY FUNCTIONS
// ============================================================================

int Engine::getNumLevels()
{
        return basisTree->nLevels;
}

deci Engine::getBoxSize(int lvl)
{
        return ld[lvl].boxSize;
}

int Engine::calcNumLevels(const Point& LL, const Point& UR, deci minBoxSize)
{
        Point diff = UR - LL;
        deci geoSize = (diff.getX() > diff.getY()) ? diff.getX() : diff.getY();
#ifdef NEXUS_3D
        geoSize = (geoSize > diff.getZ()) ? geoSize : diff.getZ();
#endif
        int nLevels = int(ceil(log(geoSize/minBoxSize)/log(deci(2)))) + 1;
        return (nLevels <= 0) ? 1 : nLevels;
}

deci Engine::calcMinBoxSize(const Point& LL, const Point& UR, int nLevels)
{
        Point diff = UR - LL;
        deci geoSize = (diff.getX() > diff.getY()) ? diff.getX() : diff.getY();
#ifdef NEXUS_3D
        geoSize = (geoSize > diff.getZ()) ? geoSize : diff.getZ();
#endif

        return geoSize/pow(2.0, nLevels-1);
}

void Engine::getNumLocalUnknowns(vector<int> &nlUnknProc,
                                 TreeType treeType) const
{
        int nlUnknowns = (treeType == TREE_BASIS) ? basisTree->nlUnknowns :
                testTree->nlUnknowns;

        // obtain the local number of unknowns from all processes
        int *nlUnknTemp = new int[nProc];
        nlUnknTemp[thisProc] = nlUnknowns;
#ifdef HAVE_MPI
        MPI_Allgather(&nlUnknowns, 1, MPI_INT, nlUnknTemp, 1,
                      MPI_INT, MPI_COMM_WORLD);
#endif

        // copy the data into the vector
        nlUnknProc.clear();
        nlUnknProc.reserve(nProc);
        for (int i = 0; i < nProc; i++)
                nlUnknProc.push_back(nlUnknTemp[i]);

        delete [] nlUnknTemp;
}

#ifdef HAVE_MPI

void Engine::getCommSize(std::map<int, int> &inSize,
                          std::map<int, int> &outSize) const
{
        inSize.clear();
        outSize.clear();

        // A) for the near interactions
        for(inCommItC e = nearInComm.begin() ; e != nearInComm.end(); e++)
                inSize[e->first] += e->second.recvSize * sizeof(cplx);

        for(outCommItC e = nearOutComm.begin() ; e != nearOutComm.end(); e++)
                outSize[e->first] += e->second.sendSize * sizeof(cplx);

        // B) for the far interactions
        for (MapIGItC igIt = intGroup.begin(); igIt != intGroup.end(); igIt++)
                igIt->second->getCommSize(inSize, outSize);
}

void Engine::prepareCommunications()
{
        // calculate the total number of communications
        int nComms = (nOutComms > nInComms) ? nOutComms : nInComms;
        if (nComms == 0) return;

        // allocate memory for the communication structures
        OutComm::sendReq = new MPI_Request[nOutComms];
        for (int i = 0; i < nOutComms; i++)
                OutComm::sendReq[i] = MPI_REQUEST_NULL;
        InComm::recvReq = new MPI_Request[nInComms];
        for (int i = 0; i < nInComms; i++)
                InComm::recvReq[i] = MPI_REQUEST_NULL;

        status = new MPI_Status[nComms];
        indices = new int[nComms];

        // =============================
        // prepare the recvMsg structure
        // =============================

        recvMsg = new RecvMsg[nInComms];
        int counter = 0;

        // A) for the near interactions
        for(inCommIt e = nearInComm.begin() ; e != nearInComm.end(); e++) {
                int srcProc = e->first;
                recvMsg[counter].msgType = NEAR_COMM;
                if (nearTrain.find(srcProc) != nearTrain.end())
                        recvMsg[counter].nearTrain = &nearTrain[srcProc];
                counter++;
        }

        // B) for the far interactions
        for (MapIGIt igIt = intGroup.begin(); igIt != intGroup.end(); igIt++) {
                IntGroup *st = igIt->second;
                st->storeInCommunications(recvMsg, counter);
        }

        assert(counter == nInComms);
}

#endif
