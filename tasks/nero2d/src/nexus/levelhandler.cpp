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
#include "agghandler.h"
#include "levelhandler.h"
#include "translhandler.h"
#include "intpolhandler.h"
#include "subtree.h"
#include "intgroup.h"
#include "level.h"
#include <vector>

using namespace std;

double AggHandler::targetWorkAmount = 1e10;
double DagHandler::targetWorkAmount = 1e10;
double TranslHandler::targetWorkAmount = 1e10;
double IntpolHandler::targetWorkAmount = 1e10;

// ============================================================================
// TYPEDEFS
// ============================================================================

typedef map<int, int*>::const_iterator intIntPIt;
typedef map<int, int>::const_iterator intIntIt;
typedef map<TranslTemp, int> mapTlTemp;

typedef map<int, InComm>::iterator inCommIt;
typedef map<int, InComm>::const_iterator inCommItC;
typedef map<int, OutComm>::iterator outCommIt;
typedef map<int, OutComm>::const_iterator outCommItC;

// ============================================================================
// LEVELHANDLER CLASS
// ============================================================================

LevelHandler::LevelHandler() : chdLh(NULL), parLh(NULL), groupID(0), lvl(0),
        boxSize(0), ig(NULL), basisSt(NULL), testSt(NULL), basisLevel(NULL),
        testLevel(NULL), thisPartition(0), nPartitions(1), thisOG(0), nOG(0),
        nDivisions(1), oRadPat(NULL), iRadPat(NULL), iRadPatZeroFirst(0),
        iRadPatZeroSize(0), oRadPatZeroFirst(0), oRadPatZeroSize(0),
        nAggPacksDone(0), nAggPacksToDo(0), nDagPacksDone(0), nDagPacksToDo(0),
        nLvlZeroAgg(0), levZeroAgg(NULL), levZeroAggTemp(NULL),
        locLevZeroAggTrain(NULL), nAggregations(0), agg(NULL),
        locAggTrain(NULL), intMetaData(NULL), nTranslations(0), transl(NULL),
        locTranslTrain(NULL), translMetaData(NULL), nDisaggregations(0),
        dag(NULL), antMetaData(NULL), nLvlZeroDag(0), levZeroDag(NULL),
        levZeroDagTemp(NULL), locLevZeroDagTrain(NULL), locDagTrain(NULL),
        nTranslHandlers(0), translHandler(NULL), intHndl(NULL),
        translTemp(NULL)
{

}

LevelHandler::~LevelHandler()
{
        delete [] levZeroAgg;
        delete [] levZeroAggTemp;
        delete [] agg;

        delete [] intMetaData;

        for (intIntPIt e = aggSector.begin(); e != aggSector.end(); e++)
                delete [] e->second;

        if (testLevel != basisLevel)
                for (intIntPIt e = dagSector.begin(); e != dagSector.end(); e++)
                        delete [] e->second;

        delete [] transl;
        delete [] translMetaData;

        delete [] dag;
        delete [] antMetaData;

        delete [] levZeroDag;
        delete [] levZeroDagTemp;

        delete [] translHandler;
        delete [] translTemp;

        // info : Train.package deleted inside Train class

#ifdef HAVE_MPI
        // prepare the outgoing communication structures
        for(outCommIt e = upOutComm.begin(); e != upOutComm.end(); e++) {
                OutComm &comm = e->second;

                delete [] comm.srcOffset;
                delete [] comm.srcSize;

                comm.srcOffset = NULL;
                comm.srcSize = NULL;
        }

        // prepare the outgoing communication structures
        for(outCommIt e = downOutComm.begin(); e != downOutComm.end(); e++) {
                OutComm &comm = e->second;

                delete [] comm.srcOffset;
                delete [] comm.srcSize;

                comm.srcOffset = NULL;
                comm.srcSize = NULL;
        }
#endif
}

void LevelHandler::deleteUserAllocatedMemory()
{
        deleteMemory(iRadPat);
        deleteMemory(oRadPat);

#ifdef HAVE_MPI
        // prepare the outgoing communication structures
        for(outCommIt e = upOutComm.begin(); e != upOutComm.end(); e++) {
                deleteMemory(e->second.buffer);
                e->second.buffer = NULL;
        }

        // prepare the incoming communication structures
        for(inCommIt e = upInComm.begin(); e != upInComm.end(); e++) {
                deleteMemory(e->second.buffer);
                e->second.buffer = NULL;
        }

        // prepare the outgoing communication structures
        for(outCommIt e = downOutComm.begin(); e != downOutComm.end(); e++) {
                deleteMemory(e->second.buffer);
                e->second.buffer = NULL;
        }

        // prepare the incoming communication structures
        for(inCommIt e = downInComm.begin(); e != downInComm.end(); e++) {
                deleteMemory(e->second.buffer);
                e->second.buffer = NULL;
        }
#endif
}

// ============================================================================
// RADIATION PATTERN MEMORY FUNCTIONS
// ============================================================================

cplx* LevelHandler::allocateMemory(int nElements)
{
        return new cplx[nElements];
}

void LevelHandler::deleteMemory(cplx *pointer)
{
        delete [] pointer;
}

void LevelHandler::calcRadPatOffset(Level *level, map<int, int*> &sector)
{
        if (level->gFirstBox == NULL) return;
        int cntr = 0, boxOG = 0, prevOG = level->gFirstBox->getOwnerGroup();
        map<int, int> cntBoxes;
        for(Box *box = level->gFirstBox; box != NULL; box = box->getNext()) {
                boxOG = box->getOwnerGroup();

                // if a change in owner group is detected: reset unknown count
                if (boxOG != prevOG) {
                        prevOG = boxOG;
                        cntr = 0;
                }

                // is the box has no FMM interactions: continue
                if (!box->isFlagged()) continue;
                // if the box is not local, and contains no data to receive
                if ((boxOG != thisOG) && (!box->containsLocalData())) continue;

                box->setOffset(cntr++);
                cntBoxes[boxOG]++;
        }

        // allocate memory for the sectors
        for (intIntIt e = cntBoxes.begin(); e != cntBoxes.end(); e++)
                sector[e->first] = new int[e->second];

        cntBoxes.clear();
        // store the sectors
        for(Box *box = level->gFirstBox; box != NULL; box = box->getNext()) {
                boxOG = box->getOwnerGroup();

                // is the box has no FMM interactions: continue
                if (!box->isFlagged()) continue;
                // if the box is not local, and contains no data to receive
                if ((boxOG != thisOG) && (!box->containsLocalData())) continue;

                sector[boxOG][cntBoxes[boxOG]++] = box->getSector();
        }
}

void LevelHandler::calcRadPatOffset()
{
        calcRadPatOffset(basisLevel, aggSector);
        if (testLevel != basisLevel)
                calcRadPatOffset(testLevel, dagSector);
        else
                dagSector = aggSector;
}

// ============================================================================
// AUXILIARY FUNCTIONS
// ============================================================================

void LevelHandler::setNumPartitions(int nPartitions_)
{
        nPartitions = nPartitions_;
        nOG = nProc / nPartitions;
        thisOG = thisProc / nPartitions;
        thisPartition = proc2part(thisProc);
}

void LevelHandler::allocateRadPatMemory()
{
        assert(basisLevel != NULL);
        assert(testLevel != NULL);

        int lN = getLocalSamplingRate();

        // this tells Nexus to zero the complete radiation patterns
        // these values can be changed later on to more efficient setting
        oRadPatZeroSize = basisLevel->nlFlagged*lN*sizeof(cplx);
        iRadPatZeroSize = testLevel->nlFlagged*lN*sizeof(cplx);

        // allocate radiation pattern memory if not zero
        if (oRadPatZeroSize > 0) {
                oRadPat = allocateMemory(basisLevel->nlFlagged*lN);
                assert(oRadPat != NULL);
        }
        if (iRadPatZeroSize > 0) {
                iRadPat = allocateMemory(testLevel->nlFlagged*lN);
                assert(iRadPat != NULL);
        }
}

// ===========================================================================
// LOWEST LEVEL AGGREGATIONS
// ===========================================================================

void LevelHandler::prepareLowestLevelAggregations()
{
        // count # level zero aggregation handlers
        Box *box = basisLevel->lFirstBox;
        for(uint i = 0; i < basisLevel->nlBoxes; box = box->getNext(), i++)
                if ((box->firstChild == NULL) && (box->isFlagged()))
                        nLvlZeroAgg++;

        // allocate necessary memory
        levZeroAggTemp = new lZAggTemp[nLvlZeroAgg];
        levZeroAgg = new lZAgg[nLvlZeroAgg];

        // second pass to actually store the data
        box = basisLevel->lFirstBox;
        int N = getLocalSamplingRate();
        // radpat offset is calculated on-the-fly
        uint radpatOffset = 0, index = 0;
        for(uint i = 0; i < basisLevel->nlBoxes; box = box->getNext(), i++) {
                // if it is not a lowest level box: continue
                if ((box->firstChild != NULL) || (!box->isFlagged())) {
                        if (box->isFlagged()) radpatOffset++;
                        continue;
                }

                // fill in temporary structures
                levZeroAggTemp[index].centre = basisSt->getBoxCentre(box);
                levZeroAggTemp[index].n = box->getNUnknowns();

                // fill in aggregation structures
                levZeroAgg[index].unknownOffset = box->getOffset();
                levZeroAgg[index].radPatOffset = N*radpatOffset;

                // update counters
                radpatOffset++;
                index++;
        }
}

// ============================================================================
// HIGHER LEVEL AGGREGATIONS
// ============================================================================

void LevelHandler::prepareHigherLevAggregations()
{
        // safety checks
        assert(chdLh != NULL);
        nDivisions = nPartitions/chdLh->nPartitions;

        // count the number of aggregations per source + recv schedule
        for (int chdPart = 0; chdPart < chdLh->nPartitions; chdPart++)
                prepareHigherLevAggregations(chdPart);

        // determine the send schedule for aggregations
        for (int parPart = 0; parPart < nPartitions; parPart++)
                chdLh->prepareSendHigherLevAggregations(parPart);
}

void LevelHandler::prepareHigherLevAggregations(int chdPart)
{
        int chdN = (chdPart == chdLh->thisPartition) ?
                chdLh->getLocalSamplingRate() :
                chdLh->getNumIntBoundaryPoints(chdPart, thisPartition);

        if (chdN <= 0) return;

        Box *par = basisLevel->lFirstBox;
        for (int i = 0; i < basisLevel->nlBoxes; i++, par = par->getNext()) {
                // if there are no far interactions: continue
                if (!par->isFlagged()) continue;

                Box *chd = par->getFirstChild();
                if (chd == NULL) continue;

                int oldSrcProc = -1;
                for ( ; chd != NULL; chd = chd->getNext()) {
                        if (chd->parent != par) break;
                        chd->setContainsLocalData(true);

                        int srcProc = chdLh->getBoxProc(chd, chdPart);

                        if (srcProc != oldSrcProc) {
                                nAggregations++;
                                nAgg[srcProc]++;
                                oldSrcProc = srcProc;
                        }

                        // don't communicate to yourself
                        if (srcProc == thisProc) continue;
                        chdLh->upInComm[srcProc].recvSize += chdN;
                }
        }
}

void LevelHandler::prepareSendHigherLevAggregations(int parPart)
{
        // the send schedule is handled along with the translations
        if ((parPart/parLh->nDivisions) == thisPartition) return;

        int chdN = getNumIntBoundaryPoints(thisPartition, parPart);
        if (chdN <= 0) return;

        Box *chd = basisLevel->lFirstBox;
        for (int i = 0; i < basisLevel->nlBoxes; i++, chd = chd->getNext()) {
                Box *par = chd->getParent();
                if (par == NULL) continue;
                if (!par->isFlagged()) continue;

                int dstProc = parLh->getBoxProc(par, parPart);

                upOutComm[dstProc].numSrc++;
                upOutComm[dstProc].sendSize += chdN;
        }
}

void LevelHandler::storeHigherLevAggregations()
{
        // safety checks
        assert(chdLh != NULL);

        // allocate necessary memory
        agg = new Agg[nAggregations];

        // set the starting postitions for the index vector
        map<int, int> index = nAgg;
        int cumSum = 0;
        for (map<int, int>::iterator e = index.begin(); e != index.end(); e++) {
                int temp = e->second;
                e->second = cumSum;
                cumSum += temp;
        }

        // store the aggregations
        for (int chdPart = 0; chdPart < chdLh->nPartitions; chdPart++)
                storeHigherLevAggregations(chdPart, index);

        index.clear();
        for (int parPart = 0; parPart < nPartitions; parPart++) 
                chdLh->storeSendHigherLevAggregations(parPart, index);
}

void LevelHandler::storeHigherLevAggregations(int chdPart, map<int, int> &index)
{
        int chdN = (chdPart == chdLh->thisPartition) ?
                chdLh->getLocalSamplingRate() :
                chdLh->getNumIntBoundaryPoints(chdPart, thisPartition);

        if (chdN <= 0) return;

        Box *par = basisLevel->lFirstBox; map<int, int> chdInd;
        for (int i = 0; i < basisLevel->nlBoxes; i++, par = par->getNext()) {
                // if there are no far interactions: continue
                if (!par->isFlagged()) continue;

                Box *chd = par->getFirstChild();
                if (chd == NULL) continue;

                int oldSrcProc = -1;
                for ( ; chd != NULL; chd = chd->getNext()) {
                        if (chd->parent != par) break;
                        int srcProc = chdLh->getBoxProc(chd, chdPart);

                        Agg &ag = agg[index[srcProc]];
                        ag.nChildren++;

                        if (srcProc != oldSrcProc) {
                                int thisChdPart = chdLh->thisPartition;
                                ag.chdOffset = (chdPart == thisChdPart) ? 
                                        chd->getOffset() :
                                        chdInd[srcProc];
                                ag.parOffset = par->getOffset();
                                ag.secOffset = chd->getOffset();
                                if (oldSrcProc != -1)
                                        index[oldSrcProc]++;
                                oldSrcProc = srcProc;
                        }

                        chdInd[srcProc]++;
                }

                if (oldSrcProc != -1)
                        index[oldSrcProc]++;
        }
}

void LevelHandler::storeSendHigherLevAggregations(int parPart,
                                                  map<int, int> &index)
{
        // the send schedule is handled along with the translations
        int chdPart = parPart / parLh->nDivisions;
        if (chdPart == thisPartition) return;

        int chdN = getNumIntBoundaryPoints(thisPartition, parPart);
        if (chdN <= 0) return;

        Box *chd = basisLevel->lFirstBox; int thisN = getLocalSamplingRate();
        for (int i = 0; i < basisLevel->nlBoxes; i++, chd = chd->getNext()) {
                Box *par = chd->getParent();
                if (par == NULL) continue;
                if (!par->isFlagged()) continue;

                int dstProc = parLh->getBoxProc(par, parPart);

                int ind = index[dstProc]++;
                upOutComm[dstProc].srcOffset[ind] = chd->getOffset()*thisN;
                upOutComm[dstProc].srcSize[ind] = chdN;
                upOutComm[dstProc].isCompressed = true;
        }
}

// ============================================================================
// TRANSLATIONS
// ============================================================================

void LevelHandler::prepareTranslations()
{
        int N = getLocalSamplingRate();

        // count # translations + receives
        Box *box = testLevel->lFirstBox;
        for (int i = 0; i < testLevel->nlBoxes; i++, box = box->getNext()) {

                // calculate the far list
                vector<Box*> fL;
                ig->calcFarIntList(box, TREE_TEST, fL);

                // count all translations and incoming communication
                for(vector<Box*>::iterator e = fL.begin(); e != fL.end(); e++) {
                        int srcProc = getBoxProc(*e, thisPartition);

                        nTranslations++;
                        nTransl[srcProc]++;

                        // don't recv a box from yourself
                        if (srcProc == thisProc) continue;

                        // check if not already received during the aggregation
                        if ((*e)->containsLocalData()) continue;

                        upInComm[srcProc].recvSize += N;
                        (*e)->setContainsLocalData(true);
                }
        }

        // check which boxes to send
        box = basisLevel->lFirstBox;
        for (int i = 0; i < basisLevel->nlBoxes; i++, box = box->getNext()) {
                // calculate the far list
                vector<Box*> fL;
                ig->calcFarIntList(box, TREE_BASIS, fL);

                // send list
                set<int> sL;

                // send box for aggregation ?
                Box *par = box->getParent();
                if ((par != NULL) && (par->isFlagged())) {
                        for (int i = 0; i < parLh->nDivisions; i++) {
                                int parPart = parLh->nDivisions*thisPartition+i;
                                int dstProc = parLh->getBoxProc(par, parPart);
                                if (dstProc != thisProc)
                                        sL.insert(dstProc);
                        }
                }

                // count outgoing communication
                for(vector<Box*>::iterator e = fL.begin(); e != fL.end(); e++) {
                        int dstProc = getBoxProc(*e, thisPartition);

                        // don't recv a box from yourself
                        if (dstProc == thisProc) continue;

                        // schedule this box for sending
                        sL.insert(dstProc);
                }

                // schedule box for sending
                for(set<int>::iterator e = sL.begin(); e!= sL.end(); e++) {
                        upOutComm[*e].numSrc++;
                        upOutComm[*e].sendSize += N;
                }
        }
}

void LevelHandler::storeTranslations()
{
        int N = getLocalSamplingRate();
        map<TranslTemp, int> tlCache;   // cache for unique tl ops

        // allocate necessary memory
        transl = new Transl[nTranslations];

        // Set the starting positions for the index vector
        map<int, int> index = nTransl;
        int cumSum = 0;
        for (map<int, int>::iterator e = index.begin(); e != index.end(); e++) {
                int temp = e->second;
                e->second = cumSum;
                cumSum += temp;
        }

        map<int, int> cIndex;

        // second pass to actually store the data
        Box *box = testLevel->lFirstBox;
        for (int i = 0; i < testLevel->nlBoxes; i++, box = box->getNext()) {
                // calculate the far list
                vector<Box*> fL;
                ig->calcFarIntList(box, TREE_TEST, fL);

                int dstOffset = box->getOffset();
                for(vector<Box*>::iterator e = fL.begin(); e != fL.end(); e++) {
                        int srcProc = getBoxProc(*e, thisPartition);

                        // get the translation operator offset
                        Point p2 = ig->testSubtree->getBoxCentre(box);
                        Point p1 = ig->basisSubtree->getBoxCentre(*e);
                        TranslTemp key(p2-p1);
                        int handlerIndex = tlCache.size();

                        map<TranslTemp, int>::iterator curr = tlCache.find(key);
                        if (curr == tlCache.end())
                                tlCache[key] = handlerIndex;
                        else
                                handlerIndex = curr->second;

                        Transl &tl = transl[index[srcProc]];

                        tl.srcOffset = N*(*e)->getOffset();
                        tl.dstOffset = N*dstOffset;
                        tl.hndlIndex = handlerIndex;

                        index[srcProc]++;
                }
        }

        // second pass to actually store the send data
        box = basisLevel->lFirstBox;
        for (int i = 0; i < basisLevel->nlBoxes; i++, box = box->getNext()) {
                // calculate the far list
                vector<Box*> fL;
                ig->calcFarIntList(box, TREE_BASIS, fL);

                // send list
                set<int> sL;

                // send box for aggregation
                Box *par = box->getParent();
                if ((par != NULL) && (par->isFlagged())) {
                        for (int i = 0; i < parLh->nDivisions; i++) {
                                int parPart = parLh->nDivisions*thisPartition+i;
                                int dstProc = parLh->getBoxProc(par, parPart);
                                if (dstProc != thisProc)
                                        sL.insert(dstProc);
                        }
                }

                int dstOffset = box->getOffset();
                for(vector<Box*>::iterator e = fL.begin(); e != fL.end(); e++) {
                        int dstProc = getBoxProc(*e, thisPartition);

                        // don't send a box to yourself
                        if (dstProc == thisProc) continue;

                        // schedule this box for sending
                        sL.insert(dstProc);
                }

                for(set<int>::iterator e = sL.begin(); e!= sL.end(); e++) {
                        upOutComm[*e].srcOffset[cIndex[*e]] = N*dstOffset;
                        upOutComm[*e].srcSize[cIndex[*e]++] = N;
                }
        }

        // no talking to yourself :)
        assert(upOutComm.find(thisProc) == upOutComm.end());

        nTranslHandlers = tlCache.size();
        translTemp = new TranslTemp[nTranslHandlers];
        translHandler = new TranslHandler*[nTranslHandlers];

        // copy the TranslTemp data from the stl map to a static vector
        for (mapTlTemp::iterator e = tlCache.begin(); e != tlCache.end(); e++)
                translTemp[e->second].R = e->first.R;
}

// ============================================================================
// SENDING / RECEIVAL
// ============================================================================

#ifdef HAVE_MPI
void LevelHandler::allocateUpRendRecvBuffer()
{
        // prepare the outgoing communication structures
        for(outCommIt e = upOutComm.begin(); e != upOutComm.end(); e++) {
                OutComm &comm = e->second;

                comm.dstProc = e->first;
                comm.buffer = allocateMemory(comm.sendSize);
                comm.srcOffset = new int[comm.numSrc];
                comm.srcSize = new int[comm.numSrc];
                comm.communicator = &ig->upCommunicator;
                comm.tag = lvl;
        }

        // prepare the incoming communication structures
        for(inCommIt e = upInComm.begin(); e != upInComm.end(); e++) {
                InComm &comm = e->second;

                comm.srcProc = e->first;
                comm.buffer = allocateMemory(comm.recvSize);
                comm.communicator = &ig->upCommunicator;
                comm.tag = lvl;
        }
}

void LevelHandler::allocateDownRendRecvBuffer()
{
        // prepare the outgoing communication structures
        for(outCommIt e = downOutComm.begin(); e != downOutComm.end(); e++) {
                OutComm &comm = e->second;

                comm.dstProc = e->first;
                comm.buffer = allocateMemory(comm.sendSize);
                comm.srcOffset = new int[comm.numSrc];
                comm.srcSize = new int[comm.numSrc];
                comm.communicator = &ig->downCommunicator;
                comm.tag = lvl;
        }

        // prepare the incoming communication structures
        for(inCommIt e = downInComm.begin(); e != downInComm.end(); e++) {
                InComm &comm = e->second;

                comm.srcProc = e->first;
                comm.buffer = allocateMemory(comm.recvSize);
                comm.communicator = &ig->downCommunicator;
                comm.tag = lvl;
        }
}
#endif

// ============================================================================
// HIGHER LEVEL DISAGGREGATIONS
// ============================================================================

void LevelHandler::prepareHigherLevDisaggregations()
{
        // safety checks
        assert(parLh != NULL);

        // count the number of disaggregations per source + recv schedule
        for (int parPart = 0; parPart < parLh->nPartitions; parPart++)
                prepareHigherLevDisaggregations(parPart);

        // determine the send schedule for the disaggregations
        for (int chdPart = 0; chdPart < nPartitions; chdPart++) 
                parLh->prepareSendHigherLevDisaggregations(chdPart);
}

void LevelHandler::prepareHigherLevDisaggregations(int parPart)
{
        int parN = ((parPart/parLh->nDivisions) == thisPartition) ? 
                parLh->getSamplingRate(parPart, parLh->nPartitions) :
                parLh->getNumAntBoundaryPoints(parPart, thisPartition);

        if (parN <= 0) return;

        Box *chd = testLevel->lFirstBox;
        for (int i = 0; i < testLevel->nlBoxes; i++, chd = chd->getNext()) {
                Box *par = chd->getParent();
                if (par == NULL) continue;
                if (!par->isFlagged()) continue;

                int srcProc = parLh->getBoxProc(par, parPart);

                nDisaggregations++;
                nDag[srcProc]++;

                // don't communicate to yourself
                if (srcProc != thisProc)
                        parLh->downInComm[srcProc].recvSize += parN;

                // skip to the last child or to a new process
                for (Box *N = chd->getNext(); ; N = N->getNext(), i++) {
                        if ((N == NULL) || (N->parent != par) ||
                            (getBoxProc(N, thisPartition) != thisProc)) break;
                        chd = N;
                }
        }
}

void LevelHandler::prepareSendHigherLevDisaggregations(int chdPart)
{
        int parN = (chdLh->thisPartition == chdPart) ? 
                getLocalSamplingRate() :
                getNumAntBoundaryPoints(thisPartition, chdPart);

        if (parN <= 0) return;

        Box *par = testLevel->lFirstBox;
        for (int i = 0; i < testLevel->nlBoxes; i++, par = par->getNext()) {
                if (!par->isFlagged()) continue;

                // send list
                set<int> sL;

                Box *chd = par->getFirstChild();
                for ( ; chd != NULL; chd = chd->getNext()) {
                        if (chd->parent != par) break;

                        int dstProc = chdLh->getBoxProc(chd, chdPart);
                        if (dstProc != thisProc)
                                sL.insert(dstProc);
                }

                for(set<int>::iterator e = sL.begin(); e!= sL.end(); e++) {
                        downOutComm[*e].numSrc++;
                        downOutComm[*e].sendSize += parN;
                }
        }
}

void LevelHandler::storeHigherLevDisaggregations()
{
        // safety checks
        assert(parLh != NULL);

        // allocate necessary memory
        dag = new Dag[nDisaggregations];

        // set the starting postitions for the index vector
        map<int, int> index = nDag;
        int cumSum = 0;
        for (map<int, int>::iterator e = index.begin(); e != index.end(); e++) {
                int temp = e->second;
                e->second = cumSum;
                cumSum += temp;
        }

        // store the disaggregations
        for (int parPart = 0; parPart < parLh->nPartitions; parPart++)
                storeHigherLevDisaggregations(parPart, index);

        index.clear();
        for (int chdPart = 0; chdPart < nPartitions; chdPart++) 
                parLh->storeSendHigherLevDisaggregations(chdPart, index);
}

void LevelHandler::storeHigherLevDisaggregations(int parPart, 
                                                 map<int, int> &index)
{
        int parN = ((parPart/parLh->nDivisions) == thisPartition) ? 
                parLh->getSamplingRate(parPart, parLh->nPartitions) :
                parLh->getNumAntBoundaryPoints(parPart, thisPartition);

        if (parN <= 0) return;

        Box *chd = testLevel->lFirstBox; map<int, int> parInd;
        for (int i = 0; i < testLevel->nlBoxes; i++, chd = chd->getNext()) {
                Box *par = chd->getParent();
                if (par == NULL) continue;
                if (!par->isFlagged()) continue;

                int srcProc = parLh->getBoxProc(par, parPart);

                Dag &dg = dag[index[srcProc]++];
                dg.chdOffset = chd->getOffset();
                dg.parOffset = (srcProc == thisProc) ? 
                        par->getOffset() :
                        parInd[srcProc]++;
                dg.nChildren++;

                // skip to the last child or to a new process
                for (Box *N = chd->getNext(); ; N = N->getNext(), i++) {
                        if ((N == NULL) || (N->parent != par) ||
                            (getBoxProc(N, thisPartition) != thisProc)) break;
                        dg.nChildren++;
                        chd = N;
                }
        }
}

void LevelHandler::storeSendHigherLevDisaggregations(int chdPart, 
                                                     map<int, int> &index)
{
        int parN = (chdLh->thisPartition == chdPart) ? 
                getLocalSamplingRate() :
                getNumAntBoundaryPoints(thisPartition, chdPart);

        if (parN <= 0) return;

        Box *par = testLevel->lFirstBox; int thisN = getLocalSamplingRate();
        for (int i = 0; i < testLevel->nlBoxes; i++, par = par->getNext()) {
                if (!par->isFlagged()) continue;

                // send list
                set<int> sL;

                Box *chd = par->getFirstChild();
                for ( ; chd != NULL; chd = chd->getNext()) {
                        if (chd->parent != par) break;

                        int dstProc = chdLh->getBoxProc(chd, chdPart);
                        if (dstProc != thisProc)
                                sL.insert(dstProc);
                }

                for(set<int>::iterator e = sL.begin(); e!= sL.end(); e++) {
                        int ind = index[*e]++;
                        downOutComm[*e].srcSize[ind] = parN;
                        downOutComm[*e].srcOffset[ind] = thisN*par->getOffset();
                        if (parN != thisN) downOutComm[*e].isCompressed = true;
                }
        }
}

// ===========================================================================
// LOWEST LEVEL DISAGGREGATIONS
// ===========================================================================

void LevelHandler::prepareLowestLevelDisaggregations()
{
        // count # level zero disaggregation handlers
        Box *box = testLevel->lFirstBox;
        for(uint i = 0; i < testLevel->nlBoxes; box = box->getNext(), i++)
                if ((box->firstChild == NULL) && (box->isFlagged()))
                        nLvlZeroDag++;

        // allocate necessary memory
        levZeroDagTemp = new lZDagTemp[nLvlZeroDag];
        levZeroDag = new lZDag[nLvlZeroDag];

        // second pass to actually store the data
        box = testLevel->lFirstBox;
        int N = getLocalSamplingRate();
        // radpat offset is calculated on-the-fly
        uint radpatOffset = 0, index = 0;
        for(uint i = 0; i < testLevel->nlBoxes; box = box->getNext(), i++) {
                // if it is not a lowest level box: continue
                if ((box->firstChild != NULL) || (!box->isFlagged())) {
                        if (box->isFlagged()) radpatOffset++;
                        continue;
                }

                // fill in temporary structures
                levZeroDagTemp[index].centre = testSt->getBoxCentre(box);
                levZeroDagTemp[index].n = box->getNUnknowns();

                // fill in aggregation structures
                levZeroDag[index].unknownOffset = box->getOffset();
                levZeroDag[index].radPatOffset = N*radpatOffset;

                // update counters
                radpatOffset++;
                index++;
        }
}

// ============================================================================
// PACKAGES
// ============================================================================

void LevelHandler::createLowestLevelAggPackages()
{
        // get out early
        if (nLvlZeroAgg == 0) return;

        double lZAggTargetWorkAmount = AggHandler::targetWorkAmount;
        double lZAggWorkAmount = lZAggTargetWorkAmount+1;
        vector <unsigned int> nlZAggPerPackage;

        lZAggMetaData.lh = this;
        lZAggMetaData.oSrcBase = oRadPat;

        // count the number of packages
        for (int i = 0; i < nLvlZeroAgg; i++) {
                lZAgg &agg = levZeroAgg[i];

                // check if it is necessary to start a new block
                if (lZAggWorkAmount > lZAggTargetWorkAmount) {
                        lZAggWorkAmount = 0;
                        nlZAggPerPackage.push_back(0);
                }

                lZAggWorkAmount += agg.aggtr->getWorkAmount();
                nlZAggPerPackage.back()++;
        }

        Train<lZAggPack> &at = lZAggTrain;
        locLevZeroAggTrain = &lZAggTrain;

        // allocate memory for the level zero aggregation packages
        at.nPackages = nlZAggPerPackage.size();
        at.package = new lZAggPack[at.nPackages];
        at.metaData = &lZAggMetaData;

        nAggPacksToDo += at.nPackages;
        for (int j = 0, index = 0; j < at.nPackages; j++) {
                at.package[j].levZeroAgg = levZeroAgg + index;
                at.package[j].nLevZeroAgg = nlZAggPerPackage[j];
                index += nlZAggPerPackage[j];
        }
}

void LevelHandler::createAggPackages()
{
        int fIndex = 0, mdInd = 0;
        double targetWorkAmount = IntpolHandler::targetWorkAmount;

        intMetaData = new IntMetaData[nAgg.size()];
        for (intIntIt e = nAgg.begin(); e != nAgg.end(); e++, mdInd++) {
                int srcProc = e->first;

                IntMetaData &md = intMetaData[mdInd];

                md.chdLh = chdLh;
                md.chdPart = chdLh->proc2part(srcProc);
                md.chdSize = (md.chdPart == chdLh->thisPartition) ? 
                        chdLh->getLocalSamplingRate() :
                        chdLh->getNumIntBoundaryPoints(md.chdPart,
                                                       thisPartition);
                md.chdBase = (srcProc == thisProc) ? chdLh->oRadPat :
                        chdLh->upInComm[srcProc].buffer;
                int chdOGs = chdLh->proc2OG(srcProc);
                md.chdSect = chdLh->aggSector[chdLh->proc2OG(srcProc)];

                md.parLh = this;
                md.parPart = thisPartition;
                md.parSize = getLocalSamplingRate();
                md.parBase = oRadPat;

                double workAmount = targetWorkAmount+1;
                vector <unsigned int> nAggPerPackage;

                // count the number of packages
                for (int i = fIndex; i < fIndex+e->second; i++) {
                        Agg &ag = agg[i];

                        // check if it is necessary to start a new package
                        if (workAmount > targetWorkAmount) {
                                workAmount = 0;
                                nAggPerPackage.push_back(0);
                        }

                        workAmount += chdLh->intHndl->getWorkAmount();
                        nAggPerPackage.back()++;
                }

                // allocate memory for the aggregation packages
                Train<AggPack> &at = chdLh->aggTrain[srcProc];
                at.nPackages = nAggPerPackage.size();
                at.package = new AggPack[at.nPackages];
                at.metaData = &intMetaData[mdInd];

                nAggPacksToDo += at.nPackages;
                for (int i = 0, index = fIndex; i < at.nPackages; i++) {
                        at.package[i].agg = agg + index;
                        at.package[i].nAgg = nAggPerPackage[i];
                        index += nAggPerPackage[i];
                }

                fIndex += e->second;

                if (srcProc == thisProc)
                        chdLh->locAggTrain = &chdLh->aggTrain[srcProc];
        }
}

void LevelHandler::createTranslPackages()
{
        int fIndex = 0, mdInd = 0;
        double targetWorkAmount = TranslHandler::targetWorkAmount;

        translMetaData = new TranslMetaData[nTransl.size()];
        for (intIntIt e = nTransl.begin(); e != nTransl.end(); e++, mdInd++) {
                int srcProc = e->first;

                TranslMetaData &md = translMetaData[mdInd];

                md.srcBase = (srcProc == thisProc) ? oRadPat : 
                        upInComm[srcProc].buffer;
                md.dstBase = iRadPat;
                md.lh = this;

                double workAmount = targetWorkAmount+1;
                vector <unsigned int> nTranslPerPackage;

                // count the number of packages
                for (int i = fIndex; i < fIndex+e->second; i++) {
                        Transl &tl = transl[i];

                        // check if it is necessary to start a new package
                        if (workAmount > targetWorkAmount) {
                                workAmount = 0;
                                nTranslPerPackage.push_back(0);
                        }

                        workAmount +=
                                translHandler[tl.hndlIndex]->getWorkAmount();
                        nTranslPerPackage.back()++;
                }

                // allocate memory for the near packages
                Train<TranslPack> &tt = translTrain[srcProc];
                tt.nPackages = nTranslPerPackage.size();
                tt.package = new TranslPack[tt.nPackages];
                tt.metaData = &translMetaData[mdInd];

                nDagPacksToDo += tt.nPackages;
                for (int i = 0, index = fIndex; i < tt.nPackages; i++) {
                        tt.package[i].transl = transl + index;
                        tt.package[i].nTransl = nTranslPerPackage[i];
                        index += nTranslPerPackage[i];
                }

                fIndex += e->second;

                if (srcProc == thisProc)
                        locTranslTrain = &translTrain[srcProc];
        }
}

void LevelHandler::createDagPackages()
{
        int fIndex = 0, mdInd = 0;
        double targetWorkAmount = IntpolHandler::targetWorkAmount;

        antMetaData = new IntMetaData[nDag.size()];
        for (intIntIt e = nDag.begin(); e != nDag.end(); e++, mdInd++) {
                int srcProc = e->first;

                IntMetaData &md = antMetaData[mdInd];

                md.parLh = parLh;
                md.parPart = parLh->proc2part(srcProc);
                md.parSize = ((md.parPart/parLh->nDivisions) == thisPartition) ?
                        parLh->getSamplingRate(md.parPart, parLh->nPartitions) :
                        parLh->getNumAntBoundaryPoints(md.parPart,
                                                       thisPartition);
                md.parBase = (srcProc == thisProc) ? parLh->iRadPat :
                        parLh->downInComm[srcProc].buffer;

                md.chdLh = this;
                md.chdPart = thisPartition;
                md.chdSize = getLocalSamplingRate();
                md.chdBase = iRadPat;
                md.chdSect = dagSector[thisOG];

                double workAmount = targetWorkAmount+1;
                vector <unsigned int> nDagPerPackage;

                // count the number of packages
                for (int i = fIndex; i < fIndex+e->second; i++) {
                        Dag &dg = dag[i];

                        // check if it is necessary to start a new package
                        if (workAmount > targetWorkAmount) {
                                workAmount = 0;
                                nDagPerPackage.push_back(0);
                        }

                        workAmount += intHndl->getWorkAmount();
                        nDagPerPackage.back()++;
                }

                // allocate memory for the disaggregation packages
                Train<DagPack> &dt = parLh->dagTrain[srcProc];
                dt.nPackages = nDagPerPackage.size();
                dt.package = new DagPack[dt.nPackages];
                dt.metaData = &antMetaData[mdInd];

                nDagPacksToDo += dt.nPackages;
                for (int i = 0, index = fIndex; i < dt.nPackages; i++) {
                        dt.package[i].dag = dag + index;
                        dt.package[i].nDag = nDagPerPackage[i];
                        index += nDagPerPackage[i];
                }

                fIndex += e->second;

                if (srcProc == thisProc)
                        parLh->locDagTrain = &parLh->dagTrain[srcProc];
        }
}

void LevelHandler::createLowestLevelDagPackages()
{
        // get out early
        if (nLvlZeroDag == 0) return;

        double lZDagTargetWorkAmount = DagHandler::targetWorkAmount;
        double lZDagWorkAmount = lZDagTargetWorkAmount+1;
        vector <unsigned int> nlZDagPerPackage;

        lZDagMetaData.lh = this;
        lZDagMetaData.iSrcBase = iRadPat;

        // count the number of packages
        for (int i = 0; i < nLvlZeroDag; i++) {
                lZDag &dag = levZeroDag[i];

                // check if it is necessary to start a new block
                if (lZDagWorkAmount > lZDagTargetWorkAmount) {
                        lZDagWorkAmount = 0;
                        nlZDagPerPackage.push_back(0);
                }

                lZDagWorkAmount += dag.dagtr->getWorkAmount();
                nlZDagPerPackage.back()++;
        }

        Train<lZDagPack> &dt = lZDagTrain;
        locLevZeroDagTrain = &lZDagTrain;

        // allocate memory for the level zero disaggregation packages
        dt.nPackages = nlZDagPerPackage.size();
        dt.package = new lZDagPack[dt.nPackages];
        dt.metaData = &lZDagMetaData;

        for (int j = 0, index = 0; j < dt.nPackages; j++) {
                dt.package[j].levZeroDag = levZeroDag + index;
                dt.package[j].nLevZeroDag = nlZDagPerPackage[j];
                index += nlZDagPerPackage[j];
        }
}

// ============================================================================
// AUXILIARY FUNCTIONS
// ============================================================================

bool LevelHandler::isLocal(const Box* box) const
{
        int OG = box->getOwnerGroup();
        return (box->getOwnerGroup() == thisOG);
}

#ifdef HAVE_MPI

void LevelHandler::getCommSize(std::map<int, int> &inSize, 
                               std::map<int, int> &outSize) const
{
        // incoming messages
        for(inCommItC e = upInComm.begin(); e != upInComm.end(); e++)
                inSize[e->first] += e->second.recvSize*sizeof(cplx);
        for(inCommItC e = downInComm.begin(); e != downInComm.end(); e++)
                inSize[e->first] += e->second.recvSize*sizeof(cplx);

        // outgoing messages
        for(outCommItC e = upOutComm.begin(); e != upOutComm.end(); e++)
                outSize[e->first] += e->second.sendSize*sizeof(cplx);
        for(outCommItC e = downOutComm.begin(); e != downOutComm.end(); e++)
                outSize[e->first] += e->second.sendSize*sizeof(cplx);
}

void LevelHandler::prepareCommunications(int &nOutComms, int &nInComms)
{
        // incoming messages
        for(inCommIt e = upInComm.begin(); e != upInComm.end(); e++)
                e->second.msgID = nInComms++;
        for(inCommIt e = downInComm.begin(); e != downInComm.end(); e++)
                e->second.msgID = nInComms++;

        // outgoing messages
        for(outCommIt e = upOutComm.begin(); e != upOutComm.end(); e++)
                e->second.msgID = nOutComms++;
        for(outCommIt e = downOutComm.begin(); e != downOutComm.end(); e++)
                e->second.msgID = nOutComms++;
}

void LevelHandler::storeInCommunications(RecvMsg *recvMsg, int &msgInd)
{
        // upward pass
        for(inCommIt e = upInComm.begin(); e != upInComm.end(); e++) {
                int srcProc = e->first;
                recvMsg[msgInd].msgType = AGG_COMM;
                if (aggTrain.find(srcProc) != aggTrain.end())
                        recvMsg[msgInd].aggTrain = &aggTrain[srcProc];
                if (translTrain.find(srcProc) != translTrain.end())
                        recvMsg[msgInd].translTrain = &translTrain[srcProc];
                msgInd++;
        }

        // downward pass
        for(inCommIt e = downInComm.begin(); e != downInComm.end(); e++) {
                int srcProc = e->first;
                recvMsg[msgInd].msgType = DAG_COMM;
                if (dagTrain.find(srcProc) != dagTrain.end())
                        recvMsg[msgInd].dagTrain = &dagTrain[srcProc];
                msgInd++;
        }
}

int LevelHandler::postUpSend()
{
        for(outCommIt e = upOutComm.begin(); e != upOutComm.end(); e++) {
                OutComm &comm = e->second;

                if (comm.isCompressed) {
                        for(uint i = 0, offset = 0; i < comm.numSrc; i++) {
                                intHndl->copyIntBoundaryPoints(oRadPat +
                                        comm.srcOffset[i], comm.buffer + offset,
                                        parLh->proc2part(comm.dstProc));
                                offset += comm.srcSize[i];
                        }
                } else {
                        comm.pack(oRadPat);
                }
                comm.post();
        }

        return upOutComm.size();
}

int LevelHandler::postUpRecv()
{
        for(inCommIt e = upInComm.begin(); e != upInComm.end(); e++)
                e->second.post();

        return upInComm.size();
}

int LevelHandler::postDownSend()
{
        for(outCommIt e = downOutComm.begin(); e != downOutComm.end(); e++) {
                OutComm &comm = e->second;

                if (comm.isCompressed) {
                        for(uint i = 0, offset = 0; i < comm.numSrc; i++) {
                                chdLh->intHndl->copyAntBoundaryPoints(iRadPat +
                                        comm.srcOffset[i], comm.buffer + offset,
                                        chdLh->proc2part(comm.dstProc));
                                offset += comm.srcSize[i];
                        }
                } else {
                        comm.pack(iRadPat);
                }

                comm.post();
        }

        return downOutComm.size();
}

int LevelHandler::postDownRecv()
{
        for(inCommIt e = downInComm.begin(); e != downInComm.end(); e++)
                e->second.post();

        return downInComm.size();
}
#endif

void LevelHandler::prepareMatvec()
{
        nDagPacksDone = nAggPacksDone = 0;
        memset(iRadPat + iRadPatZeroFirst, 0, iRadPatZeroSize);
        memset(oRadPat + oRadPatZeroFirst, 0, oRadPatZeroSize);
}

// ============================================================================
// PROCESS AND PARTION CONVERSION
// ============================================================================

int LevelHandler::getBoxProc(const Box *box, int part) const
{
        return part2proc(part, box->getOwnerGroup());
}

int LevelHandler::part2proc(int part, int OG) const
{
        int proc = 0;
        for (int i = 0; i < (int)round(log(nPartitions)/log(2)); i++)
                proc += (1 << i)*(((part*(1 << (i+1)))/nPartitions) % 2);

        return OG*nPartitions+proc;
}

int LevelHandler::proc2part(int proc) const
{
        int part = 0;
        for (int i = 0; i < (int)round(log(nPartitions)/log(2)); i++)
                part += (1 << i)*(((proc*(1 << (i+1)))/nPartitions) % 2);

        return part;
}

int LevelHandler::proc2OG(int proc) const
{
        return (proc / nPartitions);
}
