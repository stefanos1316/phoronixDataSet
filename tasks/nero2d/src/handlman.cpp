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

#include "handlman.h"

#include "nexus/nexus.h"
#include "cnfgfile.h"
#include "nearinthandler2d.h"
#include "levelhandler2d.h"
#include "geometry.h"
#include "agghandler2d.h"
#include "translhandler2d.h"
#include "inthandler2d.h"
#include "object.h"
#include "medium.h"
#include "mathlib.h"

#include <iostream>
#include <fstream>
#include <fftw3.h>

using namespace std;

// ============================================================================
// MEMORY CLASS
// ============================================================================

Memory::Memory() : prec(0.0), nearInt(0.0), aggMat(0.0), translOp(0.0),
        radPat(0.0), workSize(0.0), intMem(0.0)
{

}

double Memory::getTotalMem() const
{
        return prec + nearInt + aggMat + dagMat +
               translOp + radPat + workSize + intMem;
}

// ============================================================================
// HANDLER MANAGER CLASS
// ============================================================================

HandlerManager::HandlerManager() : work(NULL), nNearInt(0), nPrecBJ(0),
        maxNearN(0), maxNearM(0), maxPrecN(0), precBJ(NULL), nLowLevAgg(0),
        maxAggNUnkn(0), maxAggN(0), maxAggNa(0), nLowLevDag(0), maxFFTN(0),
        maxBlifN(0), nIntHndl(0), nTransl(0), maxTranslN(0)
{

}

HandlerManager::~HandlerManager()
{
        fft_free(reinterpret_cast<fft_complex*>(work));
        deleteNearIntHandlers();
        deleteAggHandlers();
        deleteDagHandlers();
        deleteTranslHandlers();
        deleteIntpolHandlers();
}

// ============================================================================
// NEAR INTERACTIONS
// ============================================================================

void HandlerManager::deleteNearIntHandlers()
{
        delete [] precBJ;
        precBJ = NULL;
        for (int i = 0; i < nearIntHandler.size(); i++)
                delete nearIntHandler[i];
        nearIntHandler.clear();
}

void HandlerManager::prepareNearIntHandlers(Nexus *nexus,
                                            const Geometry *geometry,
                                            const ConfigFile *config)
{
        // reset near interaction info
        mem.prec = mem.nearInt = 0;
        nNearInt = nPrecBJ = maxNearN = maxNearM = maxPrecN = 0;

        // count the number of near interaction handlers and the required memory
        NearIntIterator e = nexus->getNearIntBegin();
        for ( ; e != nexus->getNearIntEnd(); e++) {
                // is it a self interaction ?
                bool selfInt = ((e->testStart == e->basisStart) && 
                                (e->testEnd == e->basisEnd));
                // does it need to be LU decomposed ?
                bool needLU = (selfInt && (config->blockJacobiLevel >= 0));

                int m = e->testEnd-e->testStart+1;
                int n = e->basisEnd-e->basisStart+1;
                maxNearN = max(maxNearN, n);
                maxNearM = max(maxNearM, m);

                if (needLU) {
                        mem.prec += m*n*sizeof(cplx);
                        mem.prec += sizeof(LUNearIntHandler2d);
                        mem.prec += n*sizeof(int);
                        maxPrecN = max(maxPrecN, n);
                        nPrecBJ++;
                } else {
                        mem.nearInt += m*n*sizeof(cplx);
                        mem.nearInt += sizeof(NearIntHandler2d);
                }

                nNearInt++;
        }
}

void HandlerManager::calcNearIntHandlers(Nexus *nexus, const Geometry *geometry,
                                         const ConfigFile *config)
{
        deleteNearIntHandlers();
        if (nNearInt == 0) return;

        // set the segment-segment interaction calculation handler
        SegSegInt segSegInt(geometry, config->qOrder);
        NearIntHandler2d::segSegInt = &segSegInt;
        LUNearIntHandler2d::segSegInt = &segSegInt;

        // allocate memory to store the near interaction handlers
        nearIntHandler.reserve(nNearInt);

        // allocate memory for the Jacobi blocks
        precBJ = new PrecBJ[nPrecBJ];

        NearIntIterator it = nexus->getNearIntBegin();
        for (int i = 1, thisPrec = 0; it != nexus->getNearIntEnd(); it++, i++) {
                if ((i % 113) == 0)
                        cout << "Calculating near interaction handlers ("
                             << i << "/" << nNearInt << ")\r";

                // does it need to be LU decomposed ?
                bool needLU = ((it->testStart == it->basisStart) && 
                                (it->testEnd == it->basisEnd) &&
                                (config->blockJacobiLevel >= 0));

                // allocate the near interaction object accordingly
                NearIntHandler *nih = NULL;
                if (needLU) {
                        assert (it->srcUnknownOffset == it->dstUnknownOffset);
                        nih = new LUNearIntHandler2d(it->testStart, it->testEnd,
                                it->basisStart, it->basisEnd, work);
                        precBJ[thisPrec].unknownOffset = it->dstUnknownOffset;
                        precBJ[thisPrec++].handler = (LUNearIntHandler2d*)nih;
                } else {
                        nih = new NearIntHandler2d(it->testStart, it->testEnd,
                                it->basisStart, it->basisEnd);
                }

                nearIntHandler.push_back(nih);
                it->setHandler(nih);
        }

        cout << "Calculating near interaction handlers ("
             << nNearInt << "/" << nNearInt << ")" << endl;

        cout << "Determining the near interaction package size...";
        cout.flush();

        // determine the average duration of a near interaction package

        Vector<cplx> src(maxNearN, 1.0);
        Vector<cplx> dst(maxNearM, 0.0);

        for (int i = 0; i < nNearInt; i++)
                nearIntHandler[i]->nearInt(src.data, dst.data);

        for (int i = 0; i < dst.size(); i++)
                if (isnan(real(dst(i))) || isnan(imag(dst(i))))
                        cerr << "NaN in near interactions !!!" << endl;

        Util::startChrono();
        for (int i = 0; i < nNearInt; i++)
                nearIntHandler[i]->nearInt(src.data, dst.data);
        double elapsed = Util::stopChrono();

        double packSize = round((double)nNearInt/elapsed*
                                config->packageSize/1e6);

        cout << packSize << endl;
        NearIntHandler::targetWorkAmount = packSize;
}

void HandlerManager::calcNearOutputHandlers(Nexus &nexus,
                                            const Geometry *geometry,
                                            const ConfigFile *config)
{
        deleteNearIntHandlers();
        if (nNearInt == 0) return;

        // allocate memory to store the near interaction handlers
        nearIntHandler.reserve(nNearInt);

        NearIntIterator it = nexus.getNearIntBegin();
        for (int i = 1, thisPrec = 0; it != nexus.getNearIntEnd(); it++, i++) {
                if ((i % 113) == 0)
                        cout << "Setting the near output handlers ("
                             << i << "/" << nNearInt << ")\r";
                // allocate the near interaction object accordingly
                NearIntHandler *nih = new NearOutputHandler2d(it->testStart,
                                it->testEnd, it->basisStart, it->basisEnd);

                nearIntHandler.push_back(nih);
                it->setHandler(nih);
        }

        cout << "Setting the near output handlers ("
             << nNearInt << "/" << nNearInt << ")" << endl;
}

void HandlerManager::blockJacobiPreconl(const cplx *U, cplx *V)
{
        for (int i = 0; i < nPrecBJ; i++) {
                LUNearIntHandler2d *BJ = precBJ[i].handler;
                uint unknownOffset = precBJ[i].unknownOffset;
                BJ->nearIntBwd(U + unknownOffset, V + unknownOffset);
        }
}

// ============================================================================
// LOWEST LEVEL AGGREGATIONS
// ============================================================================

void HandlerManager::deleteAggHandlers()
{
        for (int i = 0; i < aggHandler.size(); i++)
                delete aggHandler[i];
        aggHandler.clear();
}

void HandlerManager::prepareAggHandlers(Nexus *nexus, const Geometry *geometry,
                                        const ConfigFile *config)
{
        // reset lowest level aggregation info
        mem.aggMat = 0;
        nLowLevAgg = maxAggNUnkn = maxAggN = maxAggNa = 0;

        int nRadPatComp = geometry->getNumRadPatComp();

        // count the number of lowest level agg handlers and the required memory
        LevZeroAggIterator e = nexus->getLevZeroAggBegin();
        for ( ; e != nexus->getLevZeroAggEnd(); e++) {
                unsigned int n = e->stop-e->start+1;
                LevelHandler2d *lvlHndl =
                        reinterpret_cast<LevelHandler2d*>(e->lvlHndl);
                int Na = lvlHndl->getNyqSamplingRate();
                int N  = lvlHndl->getFullRadPatN();
                maxAggN  = max(maxAggN, N);
                maxAggNa = max(maxAggNa, Na);
                maxAggNUnkn = max(maxAggNUnkn, n);

                // update memory usage statistics
                if (!lvlHndl->getHF()) {
                        mem.aggMat += 2*nRadPatComp*N*n*sizeof(cplx); // Bart: Correct!
                        mem.aggMat += 2*sizeof(FullAggHandler); // Bart: Correct!
                }
                else {
                switch (config->aggMethod) {
                        case FULL :
                                mem.aggMat += nRadPatComp*N*n*sizeof(cplx);
                                mem.aggMat += sizeof(FullAggHandler);
                                break;
                        case COMPACT :
                                mem.aggMat += nRadPatComp*Na*n*sizeof(cplx);
                                mem.aggMat += sizeof(CompactAggHandler);
                                break;
                        case COMPRESSED :
                                // WARNING: in case of PTETM compressed agg
                                // the actual memory is double of this:
                                mem.aggMat += Na/2*n*sizeof(cplx);
                                mem.aggMat += sizeof(ComprAggHandlerDTMTE);
                                break;
                }
                }

                nLowLevAgg++;
        }
}

void HandlerManager::doCalcAggHandlers(Nexus *nexus, const Geometry *geometry,
                                       const ConfigFile *config,
                                       bool sameAggDag)
{
        // safety check
        if (sameAggDag) assert(nLowLevAgg == nLowLevDag);

        // set the work vector
        CompactAggHandler::nRadPatComp = geometry->getNumRadPatComp();
        CompactAggHandler::work = work+2*maxAggN;
        ComprAggHandler::work = work+2*maxAggN;

        // allocate memory to store the aggregation handlers
        deleteAggHandlers();
        aggHandler.reserve(nLowLevAgg);

        // shortcuts
        bool TE = geometry->haveTE();
        bool TM = geometry->haveTM();

        // get the aggregation handler for each box
        LevZeroAggIterator e1 = nexus->getLevZeroAggBegin();
        LevZeroDagIterator e2 = nexus->getLevZeroDagBegin();
        for (int i = 1; e1 != nexus->getLevZeroAggEnd(); e1++, i++) {
                cout << "Calculating lowest level aggregation handlers ("
                     << i << "/" << nLowLevAgg << ")\r";

                // shortcuts
                LevelHandler2d *lvlHndl =
                        reinterpret_cast<LevelHandler2d*>(e1->lvlHndl);
                Medium *medium = geometry->getMedium(e1->lvlHndl->getGroupID());
                Point centre = e1->boxCentre;
                int nUnknowns = e1->stop-e1->start+1;
                int N = lvlHndl->getFullRadPatN();

                // create a list of participating segments
                map<int, SMP> smpList;
                geometry->getInteractingSegments(smpList, e1->start, e1->stop);

                // check whether the box is pec, dielectric or mixed
                bool hasPec = false, hasDiel = false;
                map<int, SMP>::iterator e = smpList.begin();
                for( ; e != smpList.end(); e++) {
                        Segment &s = geometry->getSegment((*e).first);
                        if (s.obj->getMaterial() == DIEL)
                                hasDiel = true;
                        else if (s.obj->getMaterial() == PEC)
                                hasPec = true;
                }

                // determine the aggregation method
                AggMethod aggMethod = config->aggMethod;
                if (!lvlHndl->getHF()) // Bart: Correct!
                        aggMethod = FULL;
                if ((aggMethod == COMPRESSED) && hasDiel && hasPec)
                        aggMethod = COMPACT;
                if ((aggMethod == COMPRESSED) && (!medium->isLossless()))
                        aggMethod = COMPACT;

                AggHandler *aggtr = NULL;
                DagHandler *dagtr = NULL;

                if (aggMethod == FULL) {

                        FullAggHandler *aggDag = new FullAggHandler(geometry,
                                smpList, nUnknowns, medium, centre, lvlHndl);
                        aggtr = aggDag;
                        dagtr = aggDag;

                } else if (aggMethod == COMPACT) {

                        FFTInterpolator *intpl = lvlHndl->getAggIntpl(work);
                        CompactAggHandler *aggDag = new CompactAggHandler(
                                geometry, smpList, nUnknowns, medium,
                                centre, intpl);
                        aggtr = aggDag;
                        dagtr = aggDag;

                } else if (aggMethod == COMPRESSED) {

                        FFTInterpolator *intpl = lvlHndl->getAggIntpl(work);
                        ComprAggHandler *agg = NULL;
                        if (TE && TM) {
                                if (hasDiel)
                                        agg = new ComprAggHandlerDTMTE(geometry,
                                                smpList, nUnknowns, medium,
                                                centre, intpl);
                                else
                                        agg = new ComprAggHandlerPTMTE(geometry,
                                                smpList, nUnknowns, medium,
                                                centre, intpl);
                        } else if (TM) {
                                if (hasDiel)
                                        agg = new ComprAggHandlerDTM(geometry,
                                                smpList, nUnknowns, medium,
                                                centre, intpl);
                                else
                                        agg = new ComprAggHandlerPTM(geometry,
                                                smpList, nUnknowns, medium,
                                                centre, intpl);
                        } else if (TE) {
                                if (hasDiel)
                                        agg = new ComprAggHandlerDTE(geometry,
                                                smpList, nUnknowns, medium,
                                                centre, intpl);
                                else
                                        agg = new ComprAggHandlerPTE(geometry,
                                                smpList, nUnknowns, medium,
                                                centre, intpl);
                        }
                        aggtr = agg;
                        dagtr = agg;
                }

                aggHandler.push_back(aggtr);
                e1->setHandler(aggtr);

                // if the aggregation handler also implements the disaggregation
                if (sameAggDag)
                        (e2++)->setHandler(dagtr);
        }

        cout << "Calculating lowest level aggregation handlers ("
             << nLowLevAgg << "/" << nLowLevAgg << ")" << endl;

        cout << "Determining the lowest level aggregation package size...";
        cout.flush();

        // determine the average duration of a low level agg package
        Vector<cplx> src(maxAggNUnkn, 1.0);
        Vector<cplx> dst(geometry->getNumRadPatComp()*2*maxAggN, 0.0);

        for (int i = 0; i < nLowLevAgg; i++)
                aggHandler[i]->aggregate(src.data, dst.data);

        for (int i = 0; i < dst.size(); i++)
                if (isnan(real(dst(i))) || isnan(imag(dst(i))))
                        cerr << "NaN in Aggregations !!!" << endl;

        Util::startChrono();
        for (int i = 0; i < nLowLevAgg; i++)
                aggHandler[i]->aggregate(src.data, dst.data);
        double elapsed = Util::stopChrono();

        double packSize = round((double)nLowLevAgg/elapsed*
                                config->packageSize/1e6);

        cout << packSize << endl;
        AggHandler::targetWorkAmount = packSize;
        DagHandler::targetWorkAmount = packSize;
}

void HandlerManager::calcAggFromCache(Nexus *nexus)
{
        assert(nLowLevAgg == aggHandler.size());
        cout << "Setting the aggregation handlers (cached)" << endl;

        LevZeroAggIterator e = nexus->getLevZeroAggBegin();
        for (int i = 0; e != nexus->getLevZeroAggEnd(); e++, i++)
                e->setHandler(aggHandler[i]);
}

void HandlerManager::calcAggHandlers(Nexus *nexus, Geometry *geometry,
                                     const ConfigFile *config, bool sameAggDag)
{
        if (nLowLevAgg == 0) return;
      /*  if (nLowLevAgg == aggHandler.size()) {
                // we cannot restore dag handlers from the cached agg
                assert(sameAggDag == false);
                calcAggFromCache(nexus);
        } else {*/
                doCalcAggHandlers(nexus, geometry, config, sameAggDag);
      /*  }*/
}

// ============================================================================
// LOWEST LEVEL DISAGGREGATIONS
// ============================================================================

void HandlerManager::deleteDagHandlers()
{
        for (int i = 0; i < dagHandler.size(); i++)
                delete dagHandler[i];
        dagHandler.clear();
}

void HandlerManager::prepareDagHandlers(Nexus *nexus, const Geometry *geometry,
                                        const ConfigFile *config)
{
        // reset lowest level aggregation info
        mem.dagMat = 0;
        nLowLevDag = 0;

        int nRadPatComp = geometry->getNumRadPatComp();

        // count the number of disaggregation handlers and the required memory
        LevZeroDagIterator e = nexus->getLevZeroDagBegin();
        for ( ; e != nexus->getLevZeroDagEnd(); e++) {
                int n = e->stop-e->start+1;
                LevelHandler2d *lvlHndl =
                        reinterpret_cast<LevelHandler2d*>(e->lvlHndl);
                int Na = lvlHndl->getNyqSamplingRate();
                int N  = lvlHndl->getFullRadPatN();
                maxAggN  = max(maxAggN, N);
                maxAggNa = max(maxAggNa, Na);
                maxAggNUnkn = max(maxAggNUnkn, n);

                switch (config->aggMethod) {
                        case FULL :
                                mem.dagMat += nRadPatComp*N*n*sizeof(cplx);
                                break;
                        case COMPACT :
                                mem.dagMat += nRadPatComp*Na*n*sizeof(cplx);
                                break;
                        case COMPRESSED :
                                break;
                }
                nLowLevDag++;
        }
}

void HandlerManager::calcDagOutputHandlers(Nexus &nexus,
                                           const Geometry *geometry,
                                           const ConfigFile *config)
{
        deleteDagHandlers();
        if (nLowLevDag == 0) return;

        OutputDag::TM = geometry->haveTM();
        OutputDag::TE = geometry->haveTE();
        OutputDag::omega = 2.0*pi*geometry->getFrequency();

        // allocate memory to store the near interaction handlers
        dagHandler.reserve(nLowLevDag);

        // get the output disaggregation handler for each box
        LevZeroDagIterator it = nexus.getLevZeroDagBegin();
        for (unsigned int i = 1; it != nexus.getLevZeroDagEnd(); it++, i++) {
                cout << "Setting lowest level output disaggregation handler ("
                     << i << "/" << nLowLevDag << ")\r";

                LevelHandler2d *lvlHndl =
                        reinterpret_cast<LevelHandler2d*>(it->lvlHndl);
                int groupID = lvlHndl->getGroupID();
                Medium *medium = geometry->getMedium(groupID);

                OutputDag *dag = new OutputDag(lvlHndl, it->boxCentre, medium,
                                               it->start, it->stop);

                dagHandler.push_back(dag);
                it->setHandler(dag);
        }

        cout << "Setting lowest level output disaggregation handler ("
             << nLowLevDag << "/" << nLowLevDag << endl;
}

// ============================================================================
// TRANSLATIONS
// ============================================================================

void HandlerManager::deleteTranslHandlers()
{
        for (int i = 0; i < translHandler.size(); i++)
                delete translHandler[i];
        translHandler.clear();
}

void HandlerManager::prepareTranslHandlers(Nexus *nexus,
                                           const Geometry *geometry,
                                           const ConfigFile *config)
{
        mem.translOp = 0;
        nTransl = maxTranslN = 0;

        // count the number of translation handlers and the required memory
        TranslIterator it = nexus->getTranslBegin();
        for ( ; it != nexus->getTranslEnd(); it++) {
                LevelHandler2d *lvlHndl = (LevelHandler2d*)it->lvlHndl;
                int Nl = lvlHndl->getLocalRadPatN();
                maxTranslN = max(maxTranslN, Nl);

                mem.translOp += Nl*sizeof(cplx);
                mem.translOp += sizeof(FullTranslHandler);
                nTransl++;
        }
}

void HandlerManager::calcTranslHandlers(Nexus *nexus, const Geometry *geometry,
                                        const ConfigFile *config)
{
        deleteTranslHandlers();
        if (nTransl == 0) return;

        FullTranslHandler::nRadPatComp = geometry->getNumRadPatComp();

        // allocate memory to store the translation handlers
        translHandler.reserve(nTransl);

        double totalTranslN = 0;
        TranslIterator it = nexus->getTranslBegin();
        for (unsigned i = 1; it != nexus->getTranslEnd(); it++, i++) {
                cout << "Calculating translation handler ("
                     << i << "/" << nTransl << ")\r";

                LevelHandler2d *lvlHndl =
                        reinterpret_cast<LevelHandler2d*>(it->lvlHndl);
                Medium *medium = geometry->getMedium(lvlHndl->getGroupID());

                // allocate the translation handler object
                TranslHandler *transl = NULL;
                if (lvlHndl->getHF()) {
                        transl = new FullTranslHandler(lvlHndl, medium, it->T);
                }
                else {
                        transl = new TranslHandlerLF(lvlHndl, medium, it->T);
                }

                translHandler.push_back(transl);
                it->setHandler(transl);
                totalTranslN += lvlHndl->getLocalSamplingRate();

                // Bart: Correct!
        }

        cout << "Calculating translation handler ("
             << nTransl << "/" << nTransl << ")" << endl;

        cout << "Determining the translation package size...";
        cout.flush();

        // determine the average duration of a low level agg package
        // FIXME
        Vector<cplx> src(geometry->getNumRadPatComp()*2*maxTranslN, 1.0);
        Vector<cplx> dst(geometry->getNumRadPatComp()*2*maxTranslN, 0.0);

        for (int i = 0; i < nTransl; i++)
                translHandler[i]->translate(src.data, dst.data);
        for (int i = 0; i < dst.size(); i++)
                if (isnan(real(dst(i))) || isnan(imag(dst(i))))
                        cerr << "NaN in Translations !!!" << endl;

        Util::startChrono();
        for (int i = 0; i < nTransl; i++)
                translHandler[i]->translate(src.data, dst.data);
        double elapsed = Util::stopChrono();
        double timePerN = elapsed/totalTranslN;

        double packSize = round(config->packageSize/1e6/timePerN);

        cout << packSize << endl;
        TranslHandler::targetWorkAmount = packSize;
}

// ============================================================================
// INTERPOLATIONS
// ============================================================================

void HandlerManager::deleteIntpolHandlers()
{
        for (int i = 0; i < intpolHandler.size(); i++)
                delete intpolHandler[i];
        intpolHandler.clear();
}

void HandlerManager::prepareIntpolHandlers(Nexus *nexus,
                                           const Geometry *geometry,
                                           const ConfigFile *config)
{
        mem.intMem = 0;
        nIntHndl = maxFFTN = maxBlifN = 0;

        // count the number of interpolation handlers and the required memory
        IntpolIterator it = nexus->getIntpolBegin();
        for ( ; it != nexus->getIntpolEnd(); it++) {
                // shortcuts
                LevelHandler2d* chdLh = (LevelHandler2d*)it->chdLvlHndl;
                LevelHandler2d* parLh = (LevelHandler2d*)it->parLvlHndl;
                int chdN = chdLh->getFullRadPatN();
                int parN = parLh->getFullRadPatN();
                int chdNa = chdLh->getNyqSamplingRate();
                int parNa = parLh->getNyqSamplingRate();
                int lChdN = chdLh->getLocalRadPatN();
                int lParN = parLh->getLocalRadPatN();
                int chdBP = BlifInterpolator::getNumIntpolPoint(chdNa, chdN,
                                config->fmmPrecision);
                int parBP = BlifInterpolator::getNumIntpolPoint(parNa, parN,
                                config->fmmPrecision);

                switch (parLh->getIntMethod()) {
                case FFT:
                        mem.intMem += sizeof(FFTInterpolator2d);
                        mem.intMem += 8*parN*sizeof(cplx);     // shifters
                        maxFFTN = max(maxFFTN, parN);
                        break;
                case BLIF:
                        mem.intMem += sizeof(Blif2d);
                        mem.intMem += 12*lParN*sizeof(cplx); // shifters
                        mem.intMem += lChdN*chdBP*sizeof(double);
                        mem.intMem += lParN*parBP*sizeof(double);
                        maxBlifN = max(maxBlifN, lParN);
                        break;
                }

                nIntHndl++;
        }
}

void HandlerManager::calcIntpolHandlers(Nexus *nexus, const Geometry *geometry,
                                        const ConfigFile *config)
{
        deleteIntpolHandlers();
        if (nIntHndl == 0) return;

        FFTInterpolator2d::nRadPatComp = geometry->getNumRadPatComp();
        BlifInterpolator::nRadPatComp = geometry->getNumRadPatComp();

        // allocate memory to store the translation handlers
        intpolHandler.reserve(nIntHndl);

        vector<LevelHandler2d*> chdLhCache;
        vector<LevelHandler2d*> parLhCache;

        IntpolIterator it = nexus->getIntpolBegin();
        for (unsigned int i = 1; it != nexus->getIntpolEnd(); it++, i++) {
                cout << "Calculating interpolation handler ("
                     << i << "/" << nIntHndl << ")\r";

                LevelHandler2d* chdLh = (LevelHandler2d*)it->chdLvlHndl;
                LevelHandler2d* parLh = (LevelHandler2d*)it->parLvlHndl;

                IntpolHandler *intHndl;
                switch (parLh->getIntMethod()) {
                case FFT:
                        intHndl = new FFTInterpolator2d(chdLh, parLh, work);
                        break;
                case BLIF:
                        intHndl = new Blif2d(chdLh, parLh, work,
                                             config->fmmPrecision);
                        break;
                }

                intpolHandler.push_back(intHndl);
                it->setHandler(intHndl);

                chdLhCache.push_back(chdLh);
                parLhCache.push_back(parLh);
        }

        cout << "Calculating interpolation handler ("
             << nIntHndl << "/" << nIntHndl << ")" << endl;

        cout << "Determining the interpolation package size...";
        cout.flush();

        // determine the average duration of a low level agg package
        int avgNChd = 2;
        int size = 2*geometry->getNumRadPatComp()*avgNChd*max(maxBlifN, maxFFTN); // FIXME

        cplx *src = reinterpret_cast<cplx*>(fft_malloc(size*sizeof(cplx)));
        cplx *dst = reinterpret_cast<cplx*>(fft_malloc(size*sizeof(cplx)));
        for (int i = 0; i < size; i++) {
                src[i] = 1.0;
                dst[i] = 0;
        }

        int sector[2] = { 0, 1 };

        double totalIntN = 0.0;
        for (int i = 0; i < nIntHndl; i++) {
                intpolHandler[i]->interpolate(src,
                        chdLhCache[i]->getThisPartition(), avgNChd, sector,
                        dst, parLhCache[i]->getThisPartition());
                totalIntN += parLhCache[i]->getLocalSamplingRate();
        }

        for (int i = 0; i < size; i++)
                if (isnan(real(dst[i])) || isnan(imag(dst[i])))
                        cerr << "NaN in Interpolations !!!" << endl;

        Util::startChrono();
        for (int i = 0; i < nIntHndl; i++) {
                intpolHandler[i]->interpolate(src,
                        chdLhCache[i]->getThisPartition(), avgNChd, sector,
                        dst, parLhCache[i]->getThisPartition());
        }

        double elapsed = Util::stopChrono();
        double timePerN = elapsed/totalIntN;

        double packSize = round(config->packageSize/1e6/timePerN);

        cout << packSize << endl;
        IntpolHandler::targetWorkAmount = packSize;

        fft_free(reinterpret_cast<fft_complex*>(src));
        fft_free(reinterpret_cast<fft_complex*>(dst));
}

// ============================================================================
// MEMORY ROUTINES
// ============================================================================

double HandlerManager::getTotalMem() const
{
        return mem.getTotalMem();
}

void HandlerManager::allocateWorkMemory()
{
        fft_free(work);

        // FIXME kijken naar die 2
        unsigned int size = 2*(unsigned int)mem.workSize*sizeof(fft_complex);
        work = reinterpret_cast<cplx*>(fft_malloc(size));
}

void HandlerManager::gatherStatistics(Nexus *nexus, Geometry *geometry,
                                      const ConfigFile *config)
{
        int nRadPatComp = geometry->getNumRadPatComp();

        prepareNearIntHandlers(nexus, geometry, config);
        prepareAggHandlers(nexus, geometry, config);
        prepareDagHandlers(nexus, geometry, config);
        prepareTranslHandlers(nexus, geometry, config);
        prepareIntpolHandlers(nexus, geometry, config);

        // determinte the work size for aggregation
        int aggWorkSize = 2*maxAggN + nRadPatComp*maxAggNa + maxAggNUnkn;
        int intWorkSize = max(3*maxFFTN, maxBlifN);
        int precWorkSize = maxPrecN;

        mem.workSize = 0;
        mem.workSize = max(mem.workSize, aggWorkSize);
        mem.workSize = max(mem.workSize, intWorkSize);
        mem.workSize = max(mem.workSize, precWorkSize);
}
