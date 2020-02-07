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
#include "intgroup.h"
#include "engine.h"
#include "matvec.h"
#include "message.h"
#include "tree.h"

#include "agghandler.h"
#include "intpolhandler.h"
#include "levelhandler.h"
#include "nearinthandler.h"
#include "translhandler.h"

// ========================================================================
// COMMUNICATION
// ========================================================================

#ifdef HAVE_MPI

void Engine::processMessage(const RecvMsg &msg, int srcProc, int msgID)
{
#ifdef USE_MPE
        MPE_Log_event(eventB[9], 0, NULL);
#endif
        canCalculate = true;

        switch (msg.msgType) {

        case AGG_COMM :                 // it's an up communication
                aggQueue.addToFront(msg.aggTrain);
                translQueue.addToFront(msg.translTrain);
                break;

        case DAG_COMM :                 // it's a down communication
                dagQueue.addToFront(msg.dagTrain);
                break;

        case NEAR_COMM :                // it's near interaction comm
                nearQueue.addToBack(msg.nearTrain);
                break;

        }

#ifdef USE_MPE
        MPE_Log_event(eventE[9], 0, NULL);
#endif
}

#endif

// ========================================================================
// WORK PACKAGE CALCULATION
// ========================================================================

void Engine::addTranslation(int lvl, Train<TranslPack>* el, bool front)
{
        idleTranslQueue.addToFront(el);
}

void Engine::processNearIntPackage(const cplx *U, cplx *V, NearPack *nearWP, 
                                    const NearMetaData &md)
{
#ifdef USE_MPE
        MPE_Log_event(eventB[8], 0, NULL);
#endif

        const cplx *srcBase = (md.srcBase == NULL) ? U : md.srcBase;

        for (int i = 0; i < nearWP->nNearInts; i++) {
                NearInt* nearInt = &nearWP->nearInt[i];
                int offsetV = nearInt->dstUnknownOffset;
                int offsetU = nearInt->srcUnknownOffset;

                nearInt->nih->nearInt(srcBase + offsetU, V + offsetV);
        }

#ifdef USE_MPE
        MPE_Log_event(eventE[8], 0, NULL);
#endif
}

void Engine::processlZAggPack(const cplx *U, lZAggPack *aggWP, 
                               const LZAggMetaData &md)
{
#ifdef USE_MPE
        MPE_Log_event(eventB[12], 0, NULL);
#endif

        for (int i = 0; i < aggWP->nLevZeroAgg; i++) {
                lZAgg &agg = aggWP->levZeroAgg[i];
                int offsetU = agg.unknownOffset;
                cplx *oRadPat = md.oSrcBase + agg.radPatOffset;

                agg.aggtr->aggregate(U + offsetU, oRadPat);
        }

#ifdef USE_MPE
        MPE_Log_event(eventE[12], 0, NULL);
#endif
}

void Engine::processHigherLevAggPack(AggPack *aggWP, const IntMetaData &md)
{
#ifdef USE_MPE
        MPE_Log_event(eventB[10], 0, NULL);
#endif

        IntpolHandler *intHndl = md.chdLh->intHndl;

        // process all aggregations in this work package
        for (int i = 0; i < aggWP->nAgg; i++) {
                Agg &agg = aggWP->agg[i];

                cplx *chdSrc = md.chdBase + md.chdSize * agg.chdOffset;
                int *sector = md.chdSect + agg.secOffset;

                cplx *parDst = md.parBase + md.parSize * agg.parOffset;

                intHndl->interpolate(chdSrc, md.chdPart, agg.nChildren,
                                     sector, parDst, md.parPart);
        }

#ifdef USE_MPE
        MPE_Log_event(eventE[10], 0, NULL);
#endif
}

void Engine::processTranslPack(TranslPack *translWP, const TranslMetaData &md)
{
#ifdef USE_MPE
        MPE_Log_event(eventB[9], 0, NULL);
#endif

        for (int i = 0; i < translWP->nTransl; i++) {
                Transl &transl = translWP->transl[i];

                TranslHandler *tlHndl = md.lh->translHandler[transl.hndlIndex];
                cplx *src = md.srcBase + transl.srcOffset;
                cplx *dst = md.dstBase + transl.dstOffset;

                tlHndl->translate(src, dst); 
        }

#ifdef USE_MPE
        MPE_Log_event(eventE[9], 0, NULL);
#endif
}

void Engine::processHigherLevDagPack(DagPack *dagWP, const IntMetaData &md)
{
#ifdef USE_MPE
        MPE_Log_event(eventB[10], 0, NULL);
#endif

        IntpolHandler *intHndl = md.chdLh->intHndl;

        // process all disaggregations in this work package
        for (int i = 0; i < dagWP->nDag; i++) {
                Dag &dag = dagWP->dag[i];

                cplx *chdDst = md.chdBase + md.chdSize * dag.chdOffset;
                int *sector = md.chdSect + dag.chdOffset;

                cplx *parSrc = md.parBase + md.parSize * dag.parOffset;

                intHndl->anterpolate(parSrc, md.parPart, chdDst, md.chdPart,
                                     dag.nChildren, sector);
        }

#ifdef USE_MPE
        MPE_Log_event(eventE[10], 0, NULL);
#endif
}

void Engine::processlZDagPack(cplx *V, lZDagPack *dagWP,
                              const LZDagMetaData &md)
{
#ifdef USE_MPE
        MPE_Log_event(eventB[13], 0, NULL);
#endif

        cplx alpha = 1, beta = 1; int inc = 1;

        for (int i = 0; i < dagWP->nLevZeroDag; i++) {
                lZDag &dag = dagWP->levZeroDag[i];
                int offsetV = dag.unknownOffset;
                cplx *iRadPat = md.iSrcBase + dag.radPatOffset;

                dag.dagtr->disaggregate(iRadPat, V+offsetV);
        }

#ifdef USE_MPE
        MPE_Log_event(eventE[13], 0, NULL);
#endif
}

// ========================================================================
// MATVEC
// ========================================================================

void Engine::prepareMatvec(const cplx *U, cplx *V)
{
#ifdef HAVE_MPI
        nPendingRecvs += postNearIntRecv();
        nPendingSends += postNearIntSend(U);
#endif

        for (MapIGIt e = intGroup.begin(); e != intGroup.end(); e++) {
                IntGroup *ig = e->second;
#ifdef HAVE_MPI
                for (int lvl = 0; lvl < ig->nlFarLevels; lvl++) {
                        nPendingRecvs += ig->lh[lvl]->postUpRecv();
                        nPendingRecvs += ig->lh[lvl]->postDownRecv();
                }
#endif
                for (int lvl = 0; lvl < ig->nlFarLevels; lvl++)
                        ig->lh[lvl]->prepareMatvec();
                for (int lvl = 0; lvl < ig->nlAggLevels; lvl++)
                        levZeroAggQueue.addToBack(ig->lh[lvl]->locLevZeroAggTrain);
        }

#ifdef HAVE_MPI
        // make sure all receives have been posted
        assert(nPendingRecvs == nInComms);
#endif

        // set the unknown vector to zero
        memset(V, 0, testTree->nlUnknowns*sizeof(cplx));

        // add the local near interactions to the queue
        nearQueue.addToBack(locNearTrain);

        // doesn't matter if the packages were empty
        canCalculate = true;
}

void Engine::processWorkPackage(const cplx *U, cplx *V)
{
        void *metaData;         // temporary pointer

        // 1) try to perform higher level disaggregations
        DagPack *dagPackage = dagQueue.getNextPackage(metaData);
        if (dagPackage != NULL) {
                IntMetaData &imd = *reinterpret_cast<IntMetaData*>(metaData);
                LevelHandler *lh = imd.chdLh;

                // perform a higher level disaggregation
                processHigherLevDagPack(dagPackage, imd);

                // if the disaggregation train is not yet completed: get out
                if (++lh->nDagPacksDone != lh->nDagPacksToDo) return;

#ifdef HAVE_MPI
                nPendingSends += lh->postDownSend();
#endif

                dagQueue.addToFront(lh->locDagTrain);
                levZeroDagQueue.addToFront(lh->locLevZeroDagTrain);

                return;
        }

        // 2) try to perform level zero aggregations
        lZAggPack *lZAggPack = levZeroAggQueue.getNextPackage(metaData);
        if (lZAggPack != NULL) {
                LZAggMetaData &md = *reinterpret_cast<LZAggMetaData*>(metaData);
                LevelHandler *lh = md.lh;

                // perform a level zero aggregation
                processlZAggPack(U, lZAggPack, md);

                // if the aggregation train is not yet completed: get out
                assert (lh->nAggPacksDone != lh->nAggPacksToDo);
                if (++lh->nAggPacksDone != lh->nAggPacksToDo) return;

#ifdef HAVE_MPI
                nPendingSends += lh->postUpSend();
#endif

                aggQueue.addToFront(lh->locAggTrain);
                translQueue.addToFront(lh->locTranslTrain);

                return;
        }

        // 3) try to perform higher level aggregations
        AggPack *aggPackage = aggQueue.getNextPackage(metaData);
        if (aggPackage != NULL) {
                IntMetaData &imd = *reinterpret_cast<IntMetaData*>(metaData);
                LevelHandler *lh = imd.parLh;

                // perform a higher level aggregation
                processHigherLevAggPack(aggPackage, imd);

                // if the aggregation train is not yet completed: get out
                if (++lh->nAggPacksDone != lh->nAggPacksToDo) return;

#ifdef HAVE_MPI
                nPendingSends += lh->postUpSend();
#endif

                aggQueue.addToFront(lh->locAggTrain);
                translQueue.addToFront(lh->locTranslTrain);

                return;
        }

        // 4) try to perform translations
        TranslPack *translWP = translQueue.getNextPackage(metaData);
        // ================== IDLE TIME ================
        // 5) try to perform idle time translations
        if (translWP == NULL) translWP = idleTranslQueue.getNextPackage(metaData);
        if (translWP != NULL) {
                TranslMetaData &tmd = *reinterpret_cast<TranslMetaData*>(metaData);
                LevelHandler* lh = tmd.lh;

                // perform translation interactions
                processTranslPack(translWP, tmd);

                if (++lh->nDagPacksDone != lh->nDagPacksToDo) return;

#ifdef HAVE_MPI
                nPendingSends += lh->postDownSend();
#endif

                dagQueue.addToFront(lh->locDagTrain);
                levZeroDagQueue.addToFront(lh->locLevZeroDagTrain);

                return;
        }

        // 5) try to perform near interactions
        NearPack *nearPackage = nearQueue.getNextPackage(metaData);
        if (nearPackage != NULL) {
                NearMetaData &md = *reinterpret_cast<NearMetaData*>(metaData);

                // perform the near interactions
                processNearIntPackage(U, V, nearPackage, md);
                return;
        }

        // 6) try to perform level zero disaggregations
        lZDagPack *lZDagPack = levZeroDagQueue.getNextPackage(metaData);
        if (lZDagPack != NULL) {
                LZDagMetaData &md = *reinterpret_cast<LZDagMetaData*>(metaData);

                // perform a level zero disaggregation
                processlZDagPack(V, lZDagPack, md);
                return;
        }

        // if this point is reached, the queue is empty: too bad :-(
        canCalculate = false;
}

void Engine::parallelMatrixVector(const cplx *U, cplx *V)
{
#ifdef USE_MPE
        MPE_Log_event(eventB[4], 0, NULL);
#endif
        prepareMatvec(U, V);

#ifdef HAVE_MPI
        while (nPendingRecvs || canCalculate || nPendingSends) {
#else
        while (canCalculate) {
#endif

#ifdef HAVE_MPI
                int count = 0;

                // try and progress some send messages
                if (nPendingSends > 0)
                        MPI_Testsome(nOutComms, OutComm::sendReq, &count,
                                     indices, status);
                if (count > 0) nPendingSends -= count;

                // try and progress some recv messages
#ifdef USE_MPE
                MPE_Log_event(eventB[5], 0, NULL);
#endif
                if (nPendingRecvs) {
                        if (canCalculate)
                                MPI_Testsome(nInComms, InComm::recvReq, &count,
                                             indices, status);
                        else
                                MPI_Waitsome(nInComms, InComm::recvReq, &count,
                                             indices, status);

                        if (count > 0) {
                                nPendingRecvs -= count;
                                for (int i = 0; i < count; i++)
                                        processMessage(recvMsg[indices[i]],
                                                       status[i].MPI_SOURCE,
                                                       indices[i]);
                        }
                }
#ifdef USE_MPE
                MPE_Log_event(eventE[5], 0, NULL);
                MPE_Log_event(eventB[2], 0, NULL);
#endif
#endif // HAVE_MPI
                processWorkPackage(U, V);
#ifdef USE_MPE
                MPE_Log_event(eventE[2], 0, NULL);
#endif
        }

#ifdef USE_MPE
        MPE_Log_event(eventE[4], 0, NULL);
        MPE_Log_sync_clocks();
#endif
}
