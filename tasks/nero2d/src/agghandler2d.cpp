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

#include "agghandler2d.h"
#include "inthandler2d.h"
#include "scene2d.h"
#include "levelhandler2d.h"
#include "geometry.h"
#include "object.h"
#include "medium.h"
#include "mathlib.h"
#include "integrations.h"

using namespace std;

// ===========================================================================
// FULL AGGREGATION HANDLER
// ===========================================================================

FullAggHandler::FullAggHandler(const Geometry *geometry,
        const std::map<int, SMP> &smpList, int nUnknowns,
        const Medium *medium, const Point &centre, LevelHandler2d *lvlHandler)
{
        // allocate memory for the matrices
        int nRadPatComp = geometry->getNumRadPatComp();
        int N = lvlHandler->getFullRadPatN();
        bool HF = lvlHandler->getHF();
        double chi = lvlHandler->getChi();

        if (HF) {
                A.setDimensions(nRadPatComp*N, nUnknowns);
                A.allocateMemory(dcomplex(0,0));
                D.setDimensions(nUnknowns, nRadPatComp*N);
                D.allocateMemory(dcomplex(0,0));

                // calculate the interaction matrix M
                AggCalculator::calcAggFull(geometry, smpList, medium, centre,
                                           A, D, chi);
        }

        else {
                Matrix<cplx> Aminus;
                Aminus.setDimensions(nRadPatComp*N, nUnknowns);
                Aminus.allocateMemory(dcomplex(0,0));
                Matrix<cplx> Dminus;
                Dminus.setDimensions(nUnknowns, nRadPatComp*N);
                Dminus.allocateMemory(dcomplex(0,0));

                // calculate the interaction matrix M
                AggCalculator::calcAggFull(geometry, smpList, medium, centre,
                                           Aminus, Dminus, -chi);

                Matrix<cplx> Aplus;
                Aplus.setDimensions(nRadPatComp*N, nUnknowns);
                Aplus.allocateMemory(dcomplex(0,0));
                Matrix<cplx> Dplus;
                Dplus.setDimensions(nUnknowns, nRadPatComp*N);
                Dplus.allocateMemory(dcomplex(0,0));

                // calculate the interaction matrix M
                AggCalculator::calcAggFull(geometry, smpList, medium, centre,
                                           Aplus, Dplus, chi);

                // merge the minus and plus matrices
                A.setDimensions(2*nRadPatComp*N, nUnknowns);
                A.allocateMemory(dcomplex(0,0));
                D.setDimensions(nUnknowns, 2*nRadPatComp*N);
                D.allocateMemory(dcomplex(0,0));

                for (int i=0; i<2*nRadPatComp*N; i++) {
                for (int j=0; j<nUnknowns; j++) {
                        if (i<nRadPatComp*N) {          // the minus part
                                A(i,j) = Aminus(i,j);
                                D(j,i) = Dminus(j,i);
                        }
                        else {                          // the plus part
                                A(i,j) = Aplus(i-nRadPatComp*N,j);
                                D(j,i) = Dplus(j,i-nRadPatComp*N);
                        }
                }
                }
        }

        // Bart: Correct!
}

void FullAggHandler::aggregate(const cplx *src, cplx *dst)
{
        const cplx alpha = 1, beta = 0; const int inc = 1;
        int m = A.nRows();
        int n = A.nCols();

        gemv_f77("N", &m, &n, &alpha, A.data, &m, src, &inc, &beta, dst, &inc);
}

void FullAggHandler::disaggregate(const cplx *src, cplx *dst)
{
        const cplx alpha = 1, beta = 1; const int inc = 1;
        int m = D.nRows();
        int n = D.nCols();

        gemv_f77("N", &m, &n, &alpha, D.data, &m, src, &inc, &beta, dst, &inc);
}

// ===========================================================================
// COMPACT AGGREGATION HANDLER
// ===========================================================================

cplx *CompactAggHandler::work = NULL;
int CompactAggHandler::nRadPatComp = 1;

CompactAggHandler::CompactAggHandler(const Geometry *geometry,
        const std::map<int, SMP> &smpList, int nUnknowns, const Medium *medium,
        const Point &centre, FFTInterpolator *intpl_) : intpl(intpl_)
{
        assert(nRadPatComp == geometry->getNumRadPatComp());

        // allocate memory for the matrices
        int Na = intpl->chdN;

        A.setDimensions(nRadPatComp*Na, nUnknowns);
        A.allocateMemory(dcomplex(0,0));
        D.setDimensions(nUnknowns, nRadPatComp*Na);
        D.allocateMemory(dcomplex(0,0));

        // calculate the interaction matrix M
        double chi = 0.0;                       // Bart: Wat hiermee doen?
        AggCalculator::calcAggFull(geometry, smpList, medium, centre, A, D, chi);

        // scale the aggregation/disaggregation matrices
        cplx alpha = 1.0/Na;
        int one = 1; int size = A.nRows()*A.nCols();
        scal_f77(&size, &alpha, A.data, &one);
        scal_f77(&size, &alpha, D.data, &one);
}

void CompactAggHandler::aggregate(const cplx *src, cplx *dst)
{
        const cplx alpha = 1, beta = 0; const int inc = 1;
        int Na = A.nRows();
        int n = A.nCols();

        gemv_f77("N", &Na, &n, &alpha, A.data, &Na,
                 src, &inc, &beta, work, &inc);

        int N = intpl->parN;
        for (int i = 0; i < nRadPatComp; i++)
                intpl->interpolate(work+i*Na, dst+i*N);
}

void CompactAggHandler::disaggregate(const cplx *src, cplx *dst)
{
        const cplx alpha = 1, beta = 1; const int inc = 1;
        int m = D.nRows();
        int Na = D.nCols();

        int N = intpl->parN;
        for (int i = 0; i < nRadPatComp; i++)
                intpl->anterpolate(src+i*N, work+i*Na);

        gemv_f77("N", &m, &Na, &alpha, D.data, &m,
                 work, &inc, &beta, dst, &inc);
}

// ===========================================================================
// COMPRESSED AGGREGATION HANDLER
// ===========================================================================

cplx *ComprAggHandler::work = NULL;

ComprAggHandler::ComprAggHandler(const Geometry *geometry,
                                 const map<int, SMP> &smpList, int nAggElements,
                                 const Medium *medium, const Point &centre,
                                 FFTInterpolator *intpl)
{
        int Na = intpl->chdN;
        assert((Na % 2) == 0);

        el.setDimensions(Na/2, nAggElements);
        el.allocateMemory(dcomplex(0,0));

        // calculate the elements matrix
        AggCalculator::calcAggEl(geometry, smpList, medium, centre, el);

        // scale the aggregation/disaggregation matrices
        cplx alpha = 1.0/Na;
        int one = 1; int size = el.nRows()*el.nCols();
        scal_f77(&size, &alpha, el.data, &one);
}

// ===========================================================================
// COMPRESSED DIELECTRIC TM/TE AGGREGATION HANDLER
// ===========================================================================

ComprAggHandlerDTMTE::ComprAggHandlerDTMTE(const Geometry *geometry,
        const std::map<int, SMP> &smpList, int nUnknowns, const Medium *medium_,
        const Point &centre, FFTInterpolator *intpl_) :
        ComprAggHandler(geometry, smpList, nUnknowns, medium_, centre, intpl_),
        medium(medium_), intpl(intpl_)
{

}

void ComprAggHandlerDTMTE::aggregateTM(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        for (int i = 0, j = 0; i < n; j += 4) {
                wrk[i++] = -0.25*src[j];               // Ex
                wrk[i++] = medium->ggofoez*src[j+3];   // Ht
                wrk[i++] = medium->mibofoez*src[j+1];  // Hx
                wrk[i++] = 0;                          // Et
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, dst, &inc);

        for (int i = 0, j = 0; i < n; ) {
                wrk[i++] = -conj(wrk[i]);              // Ex
                wrk[i++] =  conj(wrk[i]);              // Ht
                wrk[i++] =  conj(wrk[i]);              // Hx
                wrk[i++] =  0;                         // Et
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, dst+m, &inc);

        for (int i = m; i < 2*m; i++)
                dst[i] = conj(dst[i]);
}

void ComprAggHandlerDTMTE::aggregateTE(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        for (int i = 0, j = 0; i < n; j += 4) {
                wrk[i++] = -0.25*src[j+1];             // Hx
                wrk[i++] = medium->mzggofoom*src[j+2]; // Et
                wrk[i++] = medium->izbofom*src[j];     // Ex
                wrk[i++] = 0;                          // Ht
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, dst, &inc);

        for (int i = 0, j = 0; i < n; ) {
                wrk[i++] = -conj(wrk[i]);              // Hx
                wrk[i++] =  conj(wrk[i]);              // Et
                wrk[i++] =  conj(wrk[i]);              // Ex
                wrk[i++] =  0;                         // Ht
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, dst+m, &inc);

        for (int i = m; i < 2*m; i++)
                dst[i] = conj(dst[i]);
}

void ComprAggHandlerDTMTE::aggregate(const cplx *src, cplx *dst)
{
        int N = intpl->parN;

        aggregateTM(src, work);
        intpl->interpolate(work, dst);
        aggregateTE(src, work);
        intpl->interpolate(work, dst+N);
}

void ComprAggHandlerDTMTE::disaggregateTM(cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        gemv_f77("C", &m, &n, &cO, el.data, &m, src, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n; j += 4) {
                dst[i++] += wrk[j+1];                           // Ex
                i++;                                            // Hx
                dst[i++] += medium->bogg*wrk[j+3];              // Et
                dst[i++] += medium->moezogg*wrk[j];             // Ht
        }

        for (int i = 0; i < m; i++)
                src[i] = conj(src[i+m]);

        gemv_f77("C", &m, &n, &cO, el.data, &m, src, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n; j += 4) {
                dst[i++] += conj(wrk[j+1]);                     // Ex
                i++;                                            // Hx
                dst[i++] += -conj(medium->bogg*wrk[j+3]);       // Et
                dst[i++] += -conj(medium->moezogg*wrk[j]);      // Ht
        }
}

void ComprAggHandlerDTMTE::disaggregateTE(cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        gemv_f77("C", &m, &n, &cO, el.data, &m, src, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n; j += 4) {
                i++;                                            // Ex
                dst[i++] += wrk[j+1];                           // Hx
                dst[i++] += medium->omozgg*wrk[j];              // Et
                dst[i++] += medium->bogg*wrk[j+3];              // Ht
        }

        for (int i = 0; i < m; i ++)
                src[i] = conj(src[i+m]);

        gemv_f77("C", &m, &n, &cO, el.data, &m, src, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n; j += 4) {
                i++;                                            // Ex
                dst[i++] += conj(wrk[j+1]);                     // Hx
                dst[i++] += -conj(medium->omozgg*wrk[j]);       // Et
                dst[i++] += -conj(medium->bogg*wrk[j+3]);       // Ht
        }
}

void ComprAggHandlerDTMTE::disaggregate(const cplx *src, cplx *dst)
{
        int N = intpl->parN;

        intpl->anterpolate(src, work);
        disaggregateTM(work, dst);
        intpl->anterpolate(src+N, work);
        disaggregateTE(work, dst);
}

// ===========================================================================
// COMPRESSED PEC TM/TE AGGREGATION HANDLER
// ===========================================================================

ComprAggHandlerPTMTE::ComprAggHandlerPTMTE(const Geometry *geometry,
        const std::map<int, SMP> &smpList, int nUnknowns, const Medium *medium_,
        const Point &centre, FFTInterpolator *intpl_) :
        ComprAggHandler(geometry, smpList, 2*nUnknowns, medium_, centre,
        intpl_), medium(medium_), intpl(intpl_)
{

}

void ComprAggHandlerPTMTE::aggregateTM(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nAggElements
        cplx *wrk = work+2*m;

        for (int i = 0, j = 0; i < n; j += 2) {
                wrk[i++] = 0;                          // Ex
                wrk[i++] = medium->ggofoez*src[j+1];   // Ht
                wrk[i++] = medium->mibofoez*src[j];    // Hx
                wrk[i++] = 0;                          // Et
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, dst, &inc);

        for (int i = 0; i < n; ) {
                wrk[i++] = 0;                          // Ex
                wrk[i++] = conj(wrk[i]);               // Ht
                wrk[i++] = conj(wrk[i]);               // Hx
                wrk[i++] = 0;                          // Et
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, dst+m, &inc);

        for (int i = m; i < 2*m; i++)
                dst[i] = conj(dst[i]);
}

void ComprAggHandlerPTMTE::aggregateTE(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        for (int i = 0, j = 0; i < n; j += 2) {
                wrk[i++] = -0.25*src[j];               // Hx
                wrk[i++] = 0;                          // Et
                wrk[i++] = 0;                          // Ex
                wrk[i++] = 0;                          // Ht
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, dst, &inc);

        for (int i = 0; i < n; ) {
                wrk[i++] = -conj(wrk[i]);              // Hx
                wrk[i++] = 0;                          // Et
                wrk[i++] = 0;                          // Ex
                wrk[i++] = 0;                          // Ht
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, dst+m, &inc);

        for (int i = m; i < 2*m; i++)
                dst[i] = conj(dst[i]);
}

void ComprAggHandlerPTMTE::aggregate(const cplx *src, cplx *dst)
{
        aggregateTM(src, work);
        intpl->interpolate(work, dst);
        aggregateTE(src, work);
        intpl->interpolate(work, dst+intpl->parN);
}

void ComprAggHandlerPTMTE::disaggregateTM(cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        gemv_f77("C", &m, &n, &cO, el.data, &m, src, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n/2; j += 4) {
                dst[i++] += wrk[j+1];                           // Ex
                dst[i++] += medium->bogg*wrk[j+3];              // Et
        }

        for (int i = 0; i < m; i ++)
                src[i] = conj(src[i+m]);

        gemv_f77("C", &m, &n, &cO, el.data, &m, src, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n/2; j += 4) {
                dst[i++] += conj(wrk[j+1]);                     // Ex
                dst[i++] += -conj(medium->bogg*wrk[j+3]);       // Et
        }
}

void ComprAggHandlerPTMTE::disaggregateTE(cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        gemv_f77("C", &m, &n, &cO, el.data, &m, src, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n/2; j += 4) {
                i++;                                            // Ex
                dst[i++] += medium->omozgg*wrk[j];              // Et
        }

        for (int i = 0; i < m; i ++)
                src[i] = conj(src[i+m]);

        gemv_f77("C", &m, &n, &cO, el.data, &m, src, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n/2; j += 4) {
                i++;                                            // Ex
                dst[i++] += -conj(medium->omozgg*wrk[j]);       // Et
        }
}

void ComprAggHandlerPTMTE::disaggregate(const cplx *src, cplx *dst)
{
        intpl->anterpolate(src, work);
        disaggregateTM(work, dst);
        intpl->anterpolate(src+intpl->parN, work);
        disaggregateTE(work, dst);
}

// ===========================================================================
// COMPRESSED DIELECTRIC TM AGGREGATION HANDLER
// ===========================================================================

ComprAggHandlerDTM::ComprAggHandlerDTM(const Geometry *geometry,
        const std::map<int, SMP> &smpList, int nUnknowns, const Medium *medium_,
        const Point &centre, FFTInterpolator *intpl_) :
        ComprAggHandler(geometry, smpList, nUnknowns, medium_, centre, intpl_),
        medium(medium_), intpl(intpl_)
{

}

void ComprAggHandlerDTM::aggregate(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        for (int i = 0, j = 0; i < n; j += 2) {
                wrk[i++] = -0.25*src[j];               // Ex
                wrk[i++] = medium->ggofoez*src[j+1];   // Ht
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, work, &inc);

        for (int i = 0, j = 0; i < n; ) {
                wrk[i++] = -conj(wrk[i]);              // Ex
                wrk[i++] =  conj(wrk[i]);              // Ht
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, work+m, &inc);

        for (int i = m; i < 2*m; i++)
                work[i] = conj(work[i]);

        intpl->interpolate(work, dst);
}

void ComprAggHandlerDTM::disaggregate(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        intpl->anterpolate(src, work);

        gemv_f77("C", &m, &n, &cO, el.data, &m, work, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n; j += 2) {
                dst[i++] += wrk[j+1];                           // Ex
                dst[i++] += medium->moezogg*wrk[j];             // Ht
        }

        for (int i = 0; i < m; i ++)
                work[i] = conj(work[i+m]);

        gemv_f77("C", &m, &n, &cO, el.data, &m, work, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n; j += 2) {
                dst[i++] += conj(wrk[j+1]);                     // Ex
                dst[i++] += -conj(medium->moezogg*wrk[j]);      // Ht
        }
}

// ===========================================================================
// COMPRESSED PEC TM AGGREGATION HANDLER
// ===========================================================================

ComprAggHandlerPTM::ComprAggHandlerPTM(const Geometry *geometry,
        const std::map<int, SMP> &smpList, int nUnknowns, const Medium *medium_,
        const Point &centre, FFTInterpolator *intpl_) :
        ComprAggHandler(geometry, smpList, nUnknowns, medium_, centre, intpl_),
        medium(medium_), intpl(intpl_)
{

}

void ComprAggHandlerPTM::aggregate(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        gemv_f77("N", &m, &n, &medium->ggofoez, el.data, &m, src,
                 &inc, &cZ, work, &inc);

        for (int i = 0, j = 0; i < n; i++)
                wrk[i] = conj(src[i]);              // Ht

        gemv_f77("N", &m, &n, &medium->ggofoez, el.data, &m, wrk,
                 &inc, &cZ, work+m, &inc);

        for (int i = m; i < 2*m; i++)
                work[i] = conj(work[i]);

        intpl->interpolate(work, dst);
}

void ComprAggHandlerPTM::disaggregate(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        intpl->anterpolate(src, work);

        gemv_f77("C", &m, &n, &cO, el.data, &m, work, &inc, &cO, dst, &inc);

        for (int i = 0; i < m; i++)
                work[i] = conj(work[i+m]);

        gemv_f77("C", &m, &n, &cO, el.data, &m, work, &inc, &cZ, wrk, &inc);

        for (int i = 0; i < n; i++)
                dst[i] += conj(wrk[i]);                     // Ex
}

// ===========================================================================
// COMPRESSED DIELECTRIC TE AGGREGATION HANDLER
// ===========================================================================

ComprAggHandlerDTE::ComprAggHandlerDTE(const Geometry *geometry,
        const std::map<int, SMP> &smpList, int nUnknowns, const Medium *medium_,
        const Point &centre, FFTInterpolator *intpl_) :
        ComprAggHandler(geometry, smpList, nUnknowns, medium_, centre, intpl_),
        medium(medium_), intpl(intpl_)
{

}

void ComprAggHandlerDTE::aggregate(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        for (int i = 0, j = 0; i < n; j += 2) {
                wrk[i++] = -0.25*src[j];               // Hx
                wrk[i++] = medium->mzggofoom*src[j+1]; // Et
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, work, &inc);

        for (int i = 0, j = 0; i < n; ) {
                wrk[i++] = -conj(wrk[i]);              // Hx
                wrk[i++] =  conj(wrk[i]);              // Et
        }

        gemv_f77("N", &m, &n, &cO, el.data, &m, wrk, &inc, &cZ, work+m, &inc);

        for (int i = m; i < 2*m; i++)
                work[i] = conj(work[i]);

        intpl->interpolate(work, dst);
}

void ComprAggHandlerDTE::disaggregate(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        intpl->anterpolate(src, work);

        gemv_f77("C", &m, &n, &cO, el.data, &m, work, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n; j += 2) {
                dst[i++] += wrk[j+1];                           // Hx
                dst[i++] += medium->omozgg*wrk[j];              // Et
        }

        for (int i = 0; i < m; i ++)
                work[i] = conj(work[i+m]);

        gemv_f77("C", &m, &n, &cO, el.data, &m, work, &inc, &cZ, wrk, &inc);

        for (int i = 0, j = 0; i < n; j += 2) {
                dst[i++] += conj(wrk[j+1]);                     // Hx
                dst[i++] += -conj(medium->omozgg*wrk[j]);       // Et
        }
}

// ===========================================================================
// COMPRESSED PEC TE AGGREGATION HANDLER
// ===========================================================================

ComprAggHandlerPTE::ComprAggHandlerPTE(const Geometry *geometry,
        const std::map<int, SMP> &smpList, int nUnknowns, const Medium *medium_,
        const Point &centre, FFTInterpolator *intpl_) :
        ComprAggHandler(geometry, smpList, nUnknowns, medium_, centre, intpl_),
        medium(medium_), intpl(intpl_)
{

}

void ComprAggHandlerPTE::aggregate(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0, mof = -0.25; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        gemv_f77("N", &m, &n, &mof, el.data, &m, src, &inc, &cZ, work, &inc);

        for (int i = 0, j = 0; i < n; i++)
                wrk[i] = -conj(src[i]);              // Hx

        gemv_f77("N", &m, &n, &mof, el.data, &m, wrk, &inc, &cZ, work+m, &inc);

        for (int i = m; i < 2*m; i++)
                work[i] = conj(work[i]);

        intpl->interpolate(work, dst);
}

void ComprAggHandlerPTE::disaggregate(const cplx *src, cplx *dst)
{
        const cplx cO = 1, cZ = 0; const int inc = 1;
        int m = el.nRows(); // Na/2
        int n = el.nCols(); // nUnknowns
        cplx *wrk = work+2*m;

        intpl->anterpolate(src, work);

        gemv_f77("C", &m, &n, &medium->omozgg, el.data, &m,
                 work, &inc, &cO, dst, &inc);

        for (int i = 0; i < m; i++)
                work[i] = conj(work[i+m]);

        gemv_f77("C", &m, &n, &cO, el.data, &m, work, &inc, &cZ, wrk, &inc);

        for (int i = 0; i < n; i++)
                dst[i] += -conj(medium->omozgg*wrk[i]);        // Et
}

// ============================================================================
// LEVEL ZERO AGGREGATIONS
// ============================================================================

Point *OutputDag::outputPoints = NULL;
int *OutputDag::pointGroupID = NULL;

bool OutputDag::TM = true;
bool OutputDag::TE = false;
double OutputDag::omega = 0;

OutputDag::OutputDag(const LevelHandler2d* lvlHndl, const Point &centre_,
        Medium *medium_, int pointStart_, int pointEnd_) : centre(centre_),
        medium(medium_), pointStart(pointStart_), pointEnd(pointEnd_)
{
        N = lvlHndl->getFullRadPatN();
        HF = lvlHndl->getHF();
        chi = lvlHndl->getChi();
}

void OutputDag::disaggregate(const cplx *src, cplx *dst)
{
        dcomplex gamma = medium->gamma;
        dcomplex eps = medium->eps;
        dcomplex mu = medium->mu;
        Point tx(1, 0); Point ty(0, 1);
        Point tx2(tx.getY(), -tx.getX());
        Point ty2(ty.getY(), -ty.getX());
        int Nofs = 0;

        for (int i = pointStart; i <= pointEnd; i += 6) {
                int groupID = pointGroupID[i/6];
                Point r = outputPoints[i/6];
                int index = i - pointStart;

                // if the point doesn't lie in the rad pat medium: get out
                if (groupID != medium->ID) continue;

                if (TM) {
                        dcomplex Fx(0, 0); dcomplex Fy(0,0); dcomplex Fz(0,0);
                        if (HF) {
                        for (int j = 0; j < N; j++) {
                                Point k_i(cos(j*2.0*pi/N), sin(j*2.0*pi/N));
                                Point diff = r - centre;
                                double dot = k_i.dot(diff);
                                cplx tmp = src[j]*exp(-I*gamma*dot);
                                double dotx = k_i.dot(tx2);
                                double doty = k_i.dot(ty2);
                                Fx += dotx*tmp;
                                Fy += doty*tmp;
                                Fz += tmp;
                        }
                        Nofs = N;
                        }

                        else {
                        for (int j = 0; j < N; j++) { // the minus part
                                cplx kx = cos(j*2.0*pi/N + I*chi);
                                cplx ky = sin(j*2.0*pi/N + I*chi);
                                Point diff = r - centre;
                                cplx dot = kx*diff.getX() + ky*diff.getY();
                                cplx tmp = src[j]*exp(-I*gamma*dot);
                                cplx dotx = kx*tx2.getX() + ky*tx2.getY();
                                cplx doty = kx*ty2.getX() + ky*ty2.getY();
                                Fx += dotx*tmp;
                                Fy += doty*tmp;
                                Fz += tmp;
                        }
                        for (int j = N; j < 2*N; j++) { // the plus part
                                cplx kx = cos(j*2.0*pi/N - I*chi);
                                cplx ky = sin(j*2.0*pi/N - I*chi);
                                Point diff = r - centre;
                                cplx dot = kx*diff.getX() + ky*diff.getY();
                                cplx tmp = src[j]*exp(-I*gamma*dot);
                                cplx dotx = kx*tx2.getX() + ky*tx2.getY();
                                cplx doty = kx*ty2.getX() + ky*ty2.getY();
                                Fx += dotx*tmp;
                                Fy += doty*tmp;
                                Fz += tmp;
                        }
                        Nofs = 2*N;
                        }

                        dst[index+3] += -gamma/omega/mu*Fx;
                        dst[index+4] += -gamma/omega/mu*Fy;
                        dst[index+2] += Fz;
                }
                if (TE) {
                        dcomplex Fx(0, 0); dcomplex Fy(0,0); dcomplex Fz(0,0);
                        if (HF) {
                        for (int j = 0; j < N; j++) {
                                Point k_i(cos(j*2.0*pi/N), sin(j*2.0*pi/N));
                                Point diff = r - centre;
                                double dot = k_i.dot(diff);
                                cplx tmp = src[j+Nofs]*exp(-I*gamma*dot);
                                double dotx = k_i.dot(tx2);
                                double doty = k_i.dot(ty2);
                                Fx += dotx*tmp;
                                Fy += doty*tmp;
                                Fz += tmp;
                        }
                        }

                        else {
                        for (int j = 0; j < N; j++) { // the minus part
                                cplx kx = cos(j*2.0*pi/N + I*chi);
                                cplx ky = sin(j*2.0*pi/N + I*chi);
                                Point diff = r - centre;
                                cplx dot = kx*diff.getX() + ky*diff.getY();
                                cplx tmp = src[j+Nofs]*exp(-I*gamma*dot);
                                cplx dotx = kx*tx2.getX() + ky*tx2.getY();
                                cplx doty = kx*ty2.getX() + ky*ty2.getY();
                                Fx += dotx*tmp;
                                Fy += doty*tmp;
                                Fz += tmp;
                        }
                        for (int j = N; j < 2*N; j++) { // the plus part
                                cplx kx = cos(j*2.0*pi/N - I*chi);
                                cplx ky = sin(j*2.0*pi/N - I*chi);
                                Point diff = r - centre;
                                cplx dot = kx*diff.getX() + ky*diff.getY();
                                cplx tmp = src[j+Nofs]*exp(-I*gamma*dot);
                                cplx dotx = kx*tx2.getX() + ky*tx2.getY();
                                cplx doty = kx*ty2.getX() + ky*ty2.getY();
                                Fx += dotx*tmp;
                                Fy += doty*tmp;
                                Fz += tmp;
                        }
                        }

                        dst[index] += gamma/omega/eps*Fx/Z0;
                        dst[index+1] += gamma/omega/eps*Fy/Z0;
                        dst[index+5] += Fz/Z0;
                }
        }

        // Bart: Correct!
}

// ============================================================================
// FULL AGGREGATION HANDLER
// ============================================================================

void AggCalculator::calcAggFull(const Geometry *geometry,
                                const map<int, SMP> &smpList,
                                const Medium *medium, const Point &centre,
                                Matrix<cplx> &A, Matrix<cplx> &D, double chi)
{
        map<int, SMP>::const_iterator e = smpList.begin();
        for( ; e != smpList.end(); e++)
                addSegAggFull(geometry, *e, medium, centre, A, D, chi);
}

void AggCalculator::calcAggEl(const Geometry *geometry,
                              const map<int, SMP> &smpList,
                              const Medium *medium, const Point &centre,
                              Matrix<cplx> &el)
{
        map<int, SMP>::const_iterator e = smpList.begin();
        for( ; e != smpList.end(); e++)
                addSegAggCompr(geometry, *e, medium, centre, el);
}

void AggCalculator::addSegAggFull(const Geometry *geometry,
                                  const pair<const int, SMP> &sPair,
                                  const Medium* medium, const Point &centre,
                                  Matrix<cplx> &A, Matrix<cplx> &D, double chi)
{
        // extra the data from the pair
        Segment &s = geometry->getSegment(sPair.first);
        SMP smp = sPair.second;

        // inner medium or outer medium (bail out if none)
        double sign = 0;
        if (s.obj->getInnerMedium() == medium) sign = 1;
        if (s.obj->getOuterMedium() == medium) sign = -1;
        if (sign == 0) return;  // if the segment is not a part of the
                                // interaction group: quit here

        // get the segment meta data
        double l, hp, hn; Point n, t;
        s.getMetaData(n, t, l, hp, hn);

        // shortcuts
        bool TM = geometry->haveTM();
        bool TE = geometry->haveTE();
        double omega = 2.0*pi*geometry->getFrequency();
        cplx beta = geometry->getBeta();

        dcomplex gamma = medium->gamma;
        dcomplex oogamma = 1.0/gamma;
        dcomplex eps = medium->eps;
        dcomplex mu = medium->mu;

        dcomplex gg_ofoe = gamma*gamma/(eps*Z0*omega);
        dcomplex gg_ofom = gamma*gamma*Z0/(mu*omega);
        dcomplex iomozgg = I*omega*mu/Z0*oogamma*oogamma;
        dcomplex mioezogg = -I*omega*eps*Z0*oogamma*oogamma;
        dcomplex mbooez = -beta/(omega*eps*Z0);
        dcomplex zboom = Z0*beta/(omega*mu);
        dcomplex ibogg = I*beta/(gamma*gamma);

        // get the number of sampling points
        int Q = A.nRows();
        if (TE && TM) {
                assert((Q % 2) == 0);
                Q /= 2;
        }

        bool isDiel = (s.obj->getMaterial() == DIEL);
        int Qofs = (TE && TM) ? Q : 0;

        Point r = s.p - centre;
        //dcomplex a = exp(2.0*pi/Q*I);
        //dcomplex b = exp(chi);

        for(int i = 0; i < Q; i++) {
                //Point gn(real(b), imag(b));
                //b *= a;

                dcomplex gnx = cos(2.0*pi/Q*i - I*chi);
                dcomplex gny = sin(2.0*pi/Q*i - I*chi);

                //double gndotr = gn.dot(r);
                //double ndotgn = n.dot(gn);
                //double gndott = gn.dot(t);

                dcomplex gndotr = gnx*r.getX() + gny*r.getY();
                dcomplex ndotgn = gnx*n.getX() + gny*n.getY();
                dcomplex gndott = gnx*t.getX() + gny*t.getY();

                dcomplex dgr = gamma*gndotr;
                dcomplex vexp = exp(I*dgr);
                dcomplex oovexp = 1.0/vexp;
                dcomplex dng = ndotgn*gamma;
                dcomplex dgt = gndott*gamma;
                dcomplex texp = exp(I*l*dgt);
                dcomplex ootexp = 1.0/texp;
                dcomplex ooldgt = 1.0/(l*dgt);
                dcomplex ooldgtdgt = ooldgt/dgt;

                dcomplex PAG, UAG, DAG, PDG, UDG, DDG;
                dcomplex UDGt, DDGt, UDGn, DDGn;
                if (dZero(abs(gndott))) {
                         PAG = vexp;
                         UAG = 0.5*dng*l*vexp;
                         DAG = dng*l*PAG-UAG;

                         PDG = oovexp;
                         UDG = 0.5*l*oovexp;
                         DDG = l*PDG-UDG;
                } else {
                         PAG = -I*ooldgt*vexp*(texp-1.0);
                         UAG = -dng*ooldgtdgt*vexp*(1.0-texp*(1.0-dgt*l*I));
                         DAG = dng*l*PAG-UAG;

                         PDG = I*ooldgt*oovexp*(ootexp-1.0);
                         UDG = -ooldgtdgt*oovexp*(1.0-ootexp*(1.0+dgt*l*I));
                         DDG = l*PDG-UDG;
                }

                PAG *= 0.25*I*sign;
                PDG *= sign;
                UAG *= -0.25*sign*hn;
                DAG *= -0.25*sign*hp;
                UDGn = -UDG*I*dng*sign*hn;
                DDGn = -DDG*I*dng*sign*hp;
                UDGt = -UDG*I*dgt*sign*hn;
                DDGt = -DDG*I*dgt*sign*hp;

        // Bart: Correct!

                // ==========================================
                // AGGREGATION MATRIX FOR Ez RADIATON PATTERN
                // ==========================================
                int ofs = 0;

                // Ez contribution to Ez radiation pattern
                if (TM && isDiel) {
                        if (smp.unknPos >= 0)
                                A(i, smp.unknPos+ofs) += UAG;
                        if (smp.prev != NULL)
                                A(i, smp.prev->unknPos+ofs) += DAG;
                        ofs++;
                }

                // Hz contribution to Ez radiation pattern
                if (TM && TE) {
                        if (smp.unknPos >= 0)
                                A(i, smp.unknPos+ofs) += mbooez*PAG*hn;
                        if (smp.prev != NULL)
                                A(i, smp.prev->unknPos+ofs) += -mbooez*PAG*hp;
                        ofs++;
                }

                // Et contribution to Ez radiation pattern
                if (TM && TE && isDiel)
                        ofs++;

                // Ht contribution to Ez radiation pattern
                if (TM) {
                        if (smp.unknPos >= 0)
                                A(i, smp.unknPos+ofs) += -I*gg_ofoe*PAG;
                }

                // =============================================
                // DISAGGREGATION MATRIX FOR Ez RADIATON PATTERN
                // =============================================
                ofs = 0;

                // Ez radation pattern Ez test
                if (TM) {
                        if (smp.unknPos >= 0)
                                D(smp.unknPos+ofs, i) += PDG;
                        ofs++;
                }

                // Ez radation pattern Hz test
                if (TM && TE && (s.obj->getMaterial() == DIEL)) {
                        ofs++;
                }

                // Ez radation pattern Et test
                if (TM && TE) {
                        if (smp.unknPos >= 0)
                                D(smp.unknPos+ofs, i) += ibogg*UDGt;
                        if (smp.prev != NULL)
                                D(smp.prev->unknPos+ofs, i) += ibogg*DDGt;
                        ofs++;
                }

                // Ez radation pattern Ht test
                if (TM && isDiel) {
                        if (smp.unknPos >= 0)
                                D(smp.unknPos+ofs, i) += mioezogg*UDGn;
                        if (smp.prev != NULL)
                                D(smp.prev->unknPos+ofs, i) += mioezogg*DDGn;
                }

                // ==========================================
                // AGGREGATION MATRIX FOR Hz RADIATON PATTERN
                // ==========================================
                ofs = 0;

                // Ez contribution to Hz radiation pattern
                if (TE && TM && isDiel) {
                        if (smp.unknPos >= 0)
                                A(i+Qofs, smp.unknPos+ofs) += zboom*PAG*hn;
                        if (smp.prev != NULL)
                                A(i+Qofs, smp.prev->unknPos+ofs) += -zboom*PAG*hp;
                        ofs++;
                }

                // Hz contribution to Hz radiation pattern
                if (TE) {
                        if (smp.unknPos >= 0)
                                A(i+Qofs, smp.unknPos+ofs) += UAG;
                        if (smp.prev != NULL)
                                A(i+Qofs, smp.prev->unknPos+ofs) += DAG;
                        ofs++;
                }

                // Et contribution to Hz radiation pattern
                if (TE && isDiel) {
                        if (smp.unknPos >= 0)
                                A(i+Qofs, smp.unknPos+ofs) += I*gg_ofom*PAG;
                        ofs++;
                }

                // Ht contribution to Hz radiation pattern:
                // No contribution

                // =============================================
                // DISAGGREGATION MATRIX FOR Hz RADIATON PATTERN
                // =============================================
                ofs = 0;

                // Hz radation pattern Ez test
                if (TE && TM)
                        ofs++;

                // Hz radation pattern Hz test
                if (TE && isDiel) {
                        if (smp.unknPos >= 0)
                                D(smp.unknPos+ofs, i+Qofs) += PDG;
                        ofs++;
                }

                // Hz radation pattern Et test
                if (TE) {
                        if (smp.unknPos >= 0)
                                D(smp.unknPos+ofs, i+Qofs) += iomozgg*UDGn;
                        if (smp.prev != NULL)
                                D(smp.prev->unknPos+ofs, i+Qofs) += iomozgg*DDGn;
                        ofs++;
                }

                // Hz radation pattern Ht test
                if (TE && TM && isDiel) {
                        if (smp.unknPos >= 0)
                                D(smp.unknPos+ofs, i+Qofs) += ibogg*UDGt;
                        if (smp.prev != NULL)
                                D(smp.prev->unknPos+ofs, i+Qofs) += ibogg*DDGt;

                }
        }
}

void AggCalculator::addSegAggCompr(const Geometry *geometry,
                                   const pair<const int, SMP> &sPair,
                                   const Medium* medium, const Point &centre,
                                   Matrix<cplx> &el)
{
        // extra the data from the pair
        Segment &s = geometry->getSegment(sPair.first);
        SMP smp = sPair.second;

        // inner medium or outer medium (bail out if none)
        double sign = 0;
        if (s.obj->getInnerMedium() == medium) sign = 1;
        if (s.obj->getOuterMedium() == medium) sign = -1;
        if (sign == 0) return;  // if the segment is not a part of the
                                // interaction group: quit here

        // get the segment meta data
        double l, hp, hn; Point n, t;
        s.getMetaData(n, t, l, hp, hn);

        // shortcuts
        bool TM = geometry->haveTM();
        bool TE = geometry->haveTE();
        double omega = 2.0*pi*geometry->getFrequency();
        cplx beta = geometry->getBeta();

        int Q = 2*el.nRows();
        dcomplex gamma = medium->gamma;
        bool isDiel = (s.obj->getMaterial() == DIEL);
        int f = ((TE && TM) && (!isDiel)) ? 2 : 1;

        Point r = s.p - centre;
        dcomplex a = exp(2.0*pi/Q*I);
        dcomplex b = 1.0;
        for(int i = 0; i < Q/2; i++) {
                Point gn(real(b), imag(b));
                b *= a;

                double gndotr = gn.dot(r);
                double ndotgn = n.dot(gn);
                double gndott = gn.dot(t);

                dcomplex dgr = gamma*gndotr;
                dcomplex vexp = exp(I*dgr);
                dcomplex dng = ndotgn*gamma;
                dcomplex dgt = gndott*gamma;
                dcomplex texp = exp(I*l*dgt);
                dcomplex ooldgt = 1.0/(l*dgt);
                dcomplex ooldgtdgt = ooldgt/dgt;

                dcomplex PAG, UAG, DAG, UAGn, DAGn, UAGt, DAGt;
                if (dZero(gndott)) {
                         PAG = vexp;
                         UAG = 0.5*l*vexp;
                         DAG = l*PAG-UAG;
                } else {
                         PAG = -I*ooldgt*vexp*(texp-1.0);
                         UAG = -ooldgtdgt*vexp*(1.0-texp*(1.0-dgt*l*I));
                         DAG = l*PAG-UAG;
                }

                PAG *= sign;
                UAGn = UAG*dng*sign*hn;
                DAGn = DAG*dng*sign*hp;
                UAGt = UAG*dgt*sign*hn;
                DAGt = DAG*dgt*sign*hp;

                int ofs = 0;
                if (isDiel || TE) {     // HAGn
                        if (smp.unknPos >= 0)
                                el(i, f*smp.unknPos+ofs) += UAGn;
                        if (smp.prev != NULL)
                                el(i, f*smp.prev->unknPos+ofs) += DAGn;
                        ofs++;
                }
                if (isDiel || TM) {     // PAG
                        if (smp.unknPos >= 0)
                                el(i, f*smp.unknPos+ofs) += PAG;
                        ofs++;
                }
                if (TE && TM) {         // HAG'
                        if (smp.unknPos >= 0)
                                el(i, f*smp.unknPos+ofs) += PAG*hn;
                        if (smp.prev != NULL)
                                el(i, f*smp.prev->unknPos+ofs) += -PAG*hp;
                        ofs++;
                }
                if (TE && TM) {         // HDGt
                        if (smp.unknPos >= 0)
                                el(i, f*smp.unknPos+ofs) += UAGt;
                        if (smp.prev != NULL)
                                el(i, f*smp.prev->unknPos+ofs) += DAGt;
                }
        }
}
