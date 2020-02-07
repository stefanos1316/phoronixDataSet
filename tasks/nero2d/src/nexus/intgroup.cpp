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
#include "intgroup.h"
#include "levelhandler.h"
#include "leveldata.h"
#include "level.h"
#include "subtree.h"

using namespace std;

// ============================================================================
// SUBTREE CLASS
// ============================================================================

IntGroup::IntGroup(int groupID_, SepTree sepTree_, Subtree* basisSt,
                   Subtree* testSt, const Point& LL_, const Point& UR_,
                   LevelData *ld_) : groupID(groupID_), sepTree(sepTree_),
        basisSubtree(basisSt), testSubtree(testSt), LL(LL_), UR(UR_), ld(ld_),
        nlAggLevels(0), nlDagLevels(0), nFarLevels(0), nlFarLevels(0),
        blockJacobiLevel(0), lh(NULL)
{
        assert(ld != NULL);
        assert(basisSubtree != NULL);

        if (sepTree == TREE_EQUAL)
                testSubtree = basisSubtree;

#ifdef HAVE_MPI
        // prepare the communicators
        MPI_Comm_dup(MPI_COMM_WORLD, &nearCommunicator);
        MPI_Comm_dup(MPI_COMM_WORLD, &upCommunicator);
        MPI_Comm_dup(MPI_COMM_WORLD, &downCommunicator);
#endif
}

IntGroup::~IntGroup()
{
#ifdef HAVE_MPI
        MPI_Comm_free(&nearCommunicator);
        MPI_Comm_free(&upCommunicator);
        MPI_Comm_free(&downCommunicator);
#endif

        delete [] lh;
}

// ============================================================================
// TREE CONSTRUCTION
// ============================================================================

void IntGroup::finalizeAddingUnknowns(int bjl)
{
        int nLevels = basisSubtree->getNumLevels();
        assert(nLevels > 0);

        if (bjl >= nLevels) bjl = nLevels-1;
        blockJacobiLevel = bjl;

        lh = new LevelHandler*[nLevels];
        for (int i = 0; i < nLevels; i++)
                lh[i] = NULL;
}

void IntGroup::setLevelHandler(int lvl, LevelHandler *lh_)
{
        int nLevels = basisSubtree->getNumLevels();

        lh_->boxSize = ld[lvl].boxSize;
        lh_->lvl = lvl;
        lh_->groupID = groupID;
        lh_->ig = this;
        lh[lvl] = lh_;

        // if it is not the bottom level
        if ((lvl > 0) && (lh[lvl-1] != NULL)) {
                lh[lvl-1]->parLh = lh[lvl];
                lh[lvl]->chdLh = lh[lvl-1];
        }

        // if it is not the top level
        if ((lvl < (nLevels-1)) && (lh[lvl+1] != NULL)) {
                lh[lvl+1]->chdLh = lh[lvl];
                lh[lvl]->parLh = lh[lvl+1];
        }
}

void IntGroup::setOwnerGroup(int loLvl, int hiLvl, int nPartitions)
{
        for (int lvl = loLvl; lvl <= hiLvl; lvl++)
                lh[lvl]->setNumPartitions(nPartitions);

        // set the owner group for the boxes
        basisSubtree->setOwnerGroup(loLvl, hiLvl, nPartitions);

        if (sepTree == TREE_SEPARATE)
                testSubtree->setOwnerGroup(loLvl, hiLvl, nPartitions);
}

void IntGroup::inheritLoadBalancing()
{
        const int discardTop = (groupID == 0) ? 5 : 5; // FIXME
        int nLevels = basisSubtree->getNumLevels();

        // set the number of partitions for all higher levels
        int prevLvl = 0, nPart = 1;
        for(int lvl = 0; lvl < nLevels; lvl++) {

                // we should reparitition
                if (ld[lvl].nPartitions > nPart) {
                        // but we can't :(
                        if ((2*nPart) > lh[lvl]->getMaxNumPartitions())
                                continue;
                        // we can :)
                        setOwnerGroup(prevLvl, lvl-1, nPart);
                        if ((nLevels - lvl) > discardTop)
                                nPart *= 2;
                        prevLvl = lvl;
                }
        }

        // do the final partitioning
        setOwnerGroup(prevLvl, nLevels-1, nPart);
}

void IntGroup::prepareFarInteractions(bool calcAllRadPat)
{
        // mark the boxes that belong to this interaction group
        basisSubtree->markSubtreeBoxes();
        if (sepTree == TREE_SEPARATE)
                testSubtree->markSubtreeBoxes();

        for (int lvl = 0; lvl < basisSubtree->nLevels; lvl++) {
                lh[lvl]->basisSt = basisSubtree;
                lh[lvl]->testSt = testSubtree;
                lh[lvl]->basisLevel = &basisSubtree->level[lvl];
                lh[lvl]->testLevel = &testSubtree->level[lvl];
        }

        // mark the fmm boxes
        recMarkFmmBoxes(testSubtree->root, basisSubtree->root,
                        basisSubtree->nLevels-1);

        if (calcAllRadPat) {
                nFarLevels = basisSubtree->nLevels;
                basisSubtree->root->recSetFlagFast(true);
        }

        // inherit the load balancing and set the owner groups
        inheritLoadBalancing();

        // get the highest local lowest-level aggregation / disaggregation lvl
        nlAggLevels = basisSubtree->getLocalHighestLeafLevel() + 1;
        nlDagLevels = testSubtree->getLocalHighestLeafLevel() + 1;

        // count the number of local boxes at each level
        for(int lvl = 0; lvl < basisSubtree->nLevels; lvl++)
                lh[lvl]->allocateRadPatMemory();

        // count the number of local far levels
        for(int lvl = 0; lvl < nFarLevels; lvl++) {
                if (testSubtree->level[lvl].nlFlagged > 0)
                        nlFarLevels = lvl + 1;
                if (basisSubtree->level[lvl].nlFlagged > 0)
                        nlFarLevels = lvl + 1;
        }

        // correction if a higher level is received from elsewhere
        if (nlFarLevels > 0) {
                int nlBoxes = testSubtree->level[nlFarLevels-1].nlBoxes;
                Box *box = testSubtree->level[nlFarLevels-1].lFirstBox;
                bool extraLevel = false;
                for(int i = 0; i < nlBoxes; box = box->getNext(), i++)
                        if((box->isFlagged()) && (box->parent != NULL))
                                if (box->parent->isFlagged())
                                        extraLevel = true;
                if (extraLevel) nlFarLevels++;
        }

        // second correction in case we need to calculate them all
        if (calcAllRadPat) nlFarLevels = basisSubtree->nLevels;

        calculateFarInteractions();

        // reset the subtree markation
        basisSubtree->removeAllMarks();
        if (sepTree == TREE_SEPARATE)
                testSubtree->removeAllMarks();
}

// ============================================================================
// NEAR AND FAR INTERACTION LISTS
// ============================================================================

void IntGroup::recCalcNearIntList(const Point& p, int targetLvl, Point pathC,
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

void IntGroup::calcFarIntList(const Box* box, TreeType boxType,
                              vector<Box*> &farList) const
{
        farList.clear();
        if (box == NULL) return;
        if (!box->isFlagged()) return;

        Subtree *boxSubtree = (boxType == TREE_BASIS) ?
                basisSubtree : testSubtree;
        Subtree *otherSubtree = (boxType == TREE_BASIS) ?
                testSubtree : basisSubtree;

        if (otherSubtree->root == NULL) return;

        int targetLvl = boxSubtree->getBoxLevel(box);
        Point tCentre = boxSubtree->getBoxCentre(box, targetLvl);

        // special case if the box is the root
        if (targetLvl == (boxSubtree->nLevels-1)) return;

        // otherwise: find the near interaction list of the parent box
        Point pCentre = boxSubtree->getBoxCentre(box->parent, targetLvl+1);

        vector<Box*> pNList;
        vector<Point> pCList;

        pNList.clear();
        pNList.reserve(30);
        pNList.push_back(const_cast<Box*>(otherSubtree->root));

        pCList.clear();
        pCList.reserve(30);
        pCList.push_back(otherSubtree->rootCentre);

        recCalcNearIntList(pCentre, targetLvl+1, boxSubtree->rootCentre,
                           boxSubtree->nLevels-1, pNList, pCList);

        farList.reserve(30);

        deci offset = 0.5*lh[targetLvl]->boxSize;
        vector<Box*>::iterator e = pNList.begin();
        vector<Point>::iterator c = pCList.begin();
        for( ; e != pNList.end(); e++, c++) {
                Box* chd = (*e)->firstChild;
                int nChildren = (*e)->getNChildren();
                for (int i = 0; i < nChildren; i++, chd = chd->next) {
                        if (!chd->belongsToThisIntGroup()) continue;

                        int s = chd->getSector();
                        Point cCentre = (*c);
                        deci addX = (s & 0x1) ? offset : -offset;
                        deci addY = (s & 0x2) ? offset : -offset;
                        deci addZ = (s & 0x4) ? offset : -offset;
                        cCentre = cCentre + Point(addX, addY, addZ);

                        if (ld[targetLvl].isWellSeparated(tCentre, cCentre))
                                farList.push_back(chd);
                }
        }
}

// ============================================================================
// FAR INTERACTIONS
// ============================================================================

void IntGroup::recMarkFmmBoxes(Box *box1, Box *box2, int lvl)
{
        // get out early
        if ((box1 == NULL) || (box2 == NULL)) return;

        Box *p1 = box1->parent, *p2 = box2->parent;

        Box *b1 = box1;
        for( ; (b1 != NULL) && (b1->parent == p1); b1 = b1->getNext()) {
                Box *b2 = box2;
                for( ; (b2 != NULL) && (b2->parent == p2); b2 = b2->getNext()) {
                        Point b1c = testSubtree->getBoxCentre(b1, lvl);
                        Point b2c = basisSubtree->getBoxCentre(b2, lvl);
                        if (lvl == blockJacobiLevel)
                                if (b1 == b2) break;

                        if (!ld[lvl].isOverSeparated(b1c, b2c)) {
                                if (ld[lvl].isSuffSeparated(b1c, b2c)) {
                                        if (nFarLevels <= lvl)
                                                nFarLevels = lvl+1;
                                        b1->recSetFlagFast(true);
                                        b2->recSetFlagFast(true);
                                } else {
                                        Box *c1 = b1->getFirstChild();
                                        Box *c2 = b2->getFirstChild();
                                        recMarkFmmBoxes(c1, c2, lvl-1);
                                }
                        }
                        if (b1 == b2) break;
                }
        }
}

void IntGroup::calculateFarInteractions()
{
        // prepare and store the lowest level aggregations
        for(int lvl = 0; lvl < nlAggLevels; lvl++)
                lh[lvl]->prepareLowestLevelAggregations();

        // prepare and store the lowest level disaggregations
        for(int lvl = 0; lvl < nlDagLevels; lvl++)
                lh[lvl]->prepareLowestLevelDisaggregations();

        // A) UPWARD PASS

        // prepare the higher levels aggregations
        for(int lvl = 1; lvl < nlFarLevels; lvl++)
                lh[lvl]->prepareHigherLevAggregations();

        // prepare the translations on each level
        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->prepareTranslations();

        // after marking the local boxes, calculate the radiation pattern offset
        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->calcRadPatOffset();

#ifdef HAVE_MPI
        // allocate memory for the upward pass send and receive schedule
        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->allocateUpRendRecvBuffer();
#endif

        // store the translations on each level
        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->storeTranslations();

        // store the higher level aggregations
        for(int lvl = 1; lvl < nlFarLevels; lvl++)
                lh[lvl]->storeHigherLevAggregations();

        // C) DOWNWARD PASS

        // prepare the higher levels disaggregations
        for(int lvl = 0; lvl < (nlFarLevels-1); lvl++)
                lh[lvl]->prepareHigherLevDisaggregations();

#ifdef HAVE_MPI
        // allocate memory for the downward pass send and receive schedule
        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->allocateDownRendRecvBuffer();
#endif

        // store the higher level disaggregations
        for(int lvl = 0; lvl < (nlFarLevels-1); lvl++)
                lh[lvl]->storeHigherLevDisaggregations();
}

void IntGroup::createFarIntPackages()
{
        for(int lvl = 0; lvl < nlAggLevels; lvl++)
                lh[lvl]->createLowestLevelAggPackages();

        for(int lvl = 1; lvl < nlFarLevels; lvl++)
                lh[lvl]->createAggPackages();

        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->createTranslPackages();

        for(int lvl = 0; lvl < (nlFarLevels-1); lvl++)
                lh[lvl]->createDagPackages();

        for(int lvl = 0; lvl < nlDagLevels; lvl++)
                lh[lvl]->createLowestLevelDagPackages();
}

// ============================================================================
// MODIFIERS
// ============================================================================

void IntGroup::setLowLevAggHandler(uint lvl, uint aggID, AggHandler *handler)
{
        lh[lvl]->setLowLevAggHandler(aggID, handler);
}

void IntGroup::setLowLevDagHandler(uint lvl, uint dagID, DagHandler *handler)
{
        lh[lvl]->setLowLevDagHandler(dagID, handler);
}

// ============================================================================
// AUXILIARY FUNCTIONS
// ============================================================================

lZAgg& IntGroup::getLowLevAgg(uint lvl, uint aggID) const
{
        return lh[lvl]->levZeroAgg[aggID];
}

lZAggTemp& IntGroup::getLowLevAggTemp(uint lvl, uint aggID) const
{
        return lh[lvl]->levZeroAggTemp[aggID];
}

lZDag& IntGroup::getLowLevDag(uint lvl, uint dagID) const
{
        return lh[lvl]->levZeroDag[dagID];
}

lZDagTemp& IntGroup::getLowLevDagTemp(uint lvl, uint dagID) const
{
        return lh[lvl]->levZeroDagTemp[dagID];
}

uint IntGroup::getNumLowLevAgg(int lvl) const
{
        return lh[lvl]->nLvlZeroAgg;
}

uint IntGroup::getNumLowLevDag(int lvl) const
{
        return lh[lvl]->nLvlZeroDag;
}

bool IntGroup::containsPoint(const Point& p) const
{
        if (p.getX() < (LL.getX()-ZERO_THRESHOLD)) return false;
        if (p.getY() < (LL.getY()-ZERO_THRESHOLD)) return false;
        if (p.getX() > (UR.getX()+ZERO_THRESHOLD)) return false;
        if (p.getY() > (UR.getY()+ZERO_THRESHOLD)) return false;

        return true;
}

uint IntGroup::getNumLevels() const
{
        return basisSubtree->getNumLevels();
}

#ifdef HAVE_MPI

void IntGroup::getCommSize(std::map<int, int> &inSize, 
                          std::map<int, int> &outSize) const
{
        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->getCommSize(inSize, outSize);
}

void IntGroup::prepareCommunications(int &nOutComms, int &nInComms)
{
        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->prepareCommunications(nOutComms, nInComms);
}

void IntGroup::storeInCommunications(RecvMsg *recvMsg, int &msgInd)
{
        // for the aggregation communications
        for(int lvl = 0; lvl < nlFarLevels; lvl++)
                lh[lvl]->storeInCommunications(recvMsg, msgInd);
}

#endif
