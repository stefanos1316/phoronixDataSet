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

#include "levelhandler2d.h"
#include "inthandler2d.h"
#include "mathlib.h"
#include <cstring>

#ifdef HAVE_CONFIG_H
        #include <config.h>
#endif

#include <fstream>
using namespace std;

// ============================================================================
// TYPEDEFS
// ============================================================================

typedef map<int, int>::const_iterator IntIntIt;

// ============================================================================
// 2D FFT DATA
// ============================================================================

FFTData2d::FFTData2d(int N_, fft_complex *work, int fftwFlag) : N(N_)
{
        if (N > 10000) fftwFlag = FFTW_ESTIMATE;

        fft_complex *wrk1 = work;
        fft_complex *wrk2 = work+N;

        fwd = fft_plan_dft_1d(N, wrk1, wrk2, FFTW_FORWARD, fftwFlag);
        bwd = fft_plan_dft_1d(N, wrk1, wrk2, FFTW_BACKWARD, fftwFlag);
}

FFTData2d::~FFTData2d()
{
        fft_destroy_plan(fwd);
        fft_destroy_plan(bwd);
}

// ============================================================================
// FFT INTERPOLATION
// ============================================================================

int FFTInterpolator::fftwFlag = FFTW_MEASURE;

FFTInterpolator::FFTInterpolator(int chdN_, int parN_, cplx *work) :
        chdN(chdN_), parN(parN_),
        chdData(chdN, reinterpret_cast<fft_complex*>(work), fftwFlag),
        parData(parN, reinterpret_cast<fft_complex*>(work), fftwFlag)
{
        // save work pointers
        wrk1 = work;
        wrk2 = work+parN;
}

void FFTInterpolator::zeroPad(const cplx *in, int n1, cplx *out, int n2)
{
        int one = 1; cplx cZero = 0;
        if (n2 > n1) {
                int h1 = (int)ceil(0.5*n1); int h2 = n1-h1; int nz = n2-n1;
                copy_f77(&h1, in, &one, out, &one);
                init_f77(&nz, &cZero, out+h1, &one);
                copy_f77(&h2, in+h1, &one, out+h1+nz, &one);
        } else {
                int h1 = (int)ceil(0.5*n2); int h2 = n2-h1; int nz = n1-n2;
                copy_f77(&h1, in, &one, out, &one);
                copy_f77(&h2, in+h1+nz, &one, out+h1, &one);
        }
}

void FFTInterpolator::doInterpolate(const cplx *src, cplx *dst,
                                    const FFTData2d &srcData,
                                    const FFTData2d &dstData)
{
        fft_execute_dft(srcData.fwd,
                        reinterpret_cast<fft_complex*>(const_cast<cplx*>(src)),
                        reinterpret_cast<fft_complex*>(wrk1));
        zeroPad(wrk1, srcData.N, wrk2, dstData.N);
        fft_execute_dft(dstData.bwd, reinterpret_cast<fft_complex*>(wrk2),
                        reinterpret_cast<fft_complex*>(dst));
}

// ============================================================================
// 2D FFT INTERPOLATION
// ============================================================================

int FFTInterpolator2d::fftwFlag = FFTW_MEASURE;
int FFTInterpolator2d::nRadPatComp = 1;

FFTInterpolator2d::FFTInterpolator2d(const LevelHandler2d *chdLh,
                                     const LevelHandler2d *parLh, cplx *work) :
        parN(parLh->getFullRadPatN()), chdN(chdLh->getFullRadPatN()),
        chdData(chdN, reinterpret_cast<fft_complex*>(work), fftwFlag),
        parData(parN, reinterpret_cast<fft_complex*>(work), fftwFlag)
{
        // save HF-booleans and normalization factors
        chdHF = chdLh->getHF();
        parHF = parLh->getHF();
        chdChi = chdLh->getChi();
        parChi = parLh->getChi();

        if (!chdHF) {
                srcSum = (cplx*)fft_malloc(chdN*sizeof(cplx));

        if (parHF) {
                chdCoshChi = new double [chdN];

                int chdM = ((chdN % 2) == 0) ? chdN/2 : (chdN+1)/2;
                for (int n=0; n<chdM; n++)
                        chdCoshChi[n] = 1.0/(exp(n*chdChi)+exp(-n*chdChi));
                for (int n=chdM; n<chdN; n++)
                        chdCoshChi[n] = 1.0/(exp((n-chdN)*chdChi)+exp(-(n-chdN)*chdChi));
        }

        else {
                factorChiMinus = new double [parN];
                factorChiPlus = new double [parN];

                int parM = ((parN % 2) == 0) ? parN/2 : (parN+1)/2;
                for (int n=0; n<parM; n++) {
                        factorChiMinus[n] = exp(-n*parChi) / (exp(n*chdChi)+exp(-n*chdChi));
                        factorChiPlus[n] = exp(n*parChi) / (exp(n*chdChi)+exp(-n*chdChi));
                }
                for (int n=parM; n<parN; n++) {
                        factorChiMinus[n] = exp(-(n-parN)*parChi) / (exp((n-parN)*chdChi)+exp(-(n-parN)*chdChi));
                        factorChiPlus[n] = exp((n-parN)*parChi) / (exp((n-parN)*chdChi)+exp(-(n-parN)*chdChi));
                }

                wrkParMinus = (cplx*)fft_malloc(parN*sizeof(cplx));
                wrkParPlus = (cplx*)fft_malloc(parN*sizeof(cplx));
        }
        }

        // save work pointers
        wrk1 = work;
        wrk2 = work+parN;
        wrk3 = work+2*parN;

        // Calculate the shifting pattern
        double boxSize = parLh->getBoxSize();
        dcomplex a = exp(2.0*pi/parN*I);
        dcomplex gamma = parLh->getGamma();

        int size;

        // calculate the patterns for the four shift directions
        if (parHF) {
                shiftData = new cplx[8*parN];
                size = 8*parN;
        for (int sector = 0; sector < 4; sector++) {
                aggShift[sector] = shiftData + sector * parN;
                dagShift[sector] = shiftData + (sector + 4) * parN;

                dcomplex b = cplx(1, 0);
                deci x = (sector & 0x1) ? 0.25*boxSize : -0.25*boxSize;
                deci y = (sector & 0x2) ? 0.25*boxSize : -0.25*boxSize;
                Point T(x, y);

                for (int n = 0; n < parN; n++) {
                        double dot = Point(real(b), imag(b)).dot(T);
                        aggShift[sector][n] = exp(I*gamma*dot);
                        dagShift[sector][n] = ((deci)(1.0))/aggShift[sector][n];
                        b *= a;
                }
        }
        }

        else {
                shiftData = new cplx[16*parN];
                size = 16*parN;
        for (int sector = 0; sector < 4; sector++) {
                aggShift[sector] = shiftData + sector *2* parN;
                dagShift[sector] = shiftData + (sector + 4) *2* parN;

                deci x = (sector & 0x1) ? 0.25*boxSize : -0.25*boxSize;
                deci y = (sector & 0x2) ? 0.25*boxSize : -0.25*boxSize;
                Point T(x, y);

                for (int n = 0; n < 2*parN; n++) {
                        dcomplex gnx;
                        dcomplex gny;

                        if (n<parN) {           // minus part
                                gnx = cos(2.0*pi/parN*n + I*parChi);
                                gny = sin(2.0*pi/parN*n + I*parChi);
                        }
                        else {                  // plus part
                                gnx = cos(2.0*pi/parN*(n-parN) - I*parChi);
                                gny = sin(2.0*pi/parN*(n-parN) - I*parChi);
                        }

                        dcomplex dot = gnx*T.getX() + gny*T.getY();

                        aggShift[sector][n] = exp(I*gamma*dot);
                        dagShift[sector][n] = ((deci)(1.0))/aggShift[sector][n];
                }
        }
        }

        cplx alpha = 1.0/double(chdN); int one = 1;
        scal_f77(&size, &alpha, shiftData, &one);

        // Bart: Correct!
}

FFTInterpolator2d::~FFTInterpolator2d()
{
        delete [] shiftData;
}

void FFTInterpolator2d::zeroPad(const cplx *in, int n1, cplx *out, int n2)
{
        int one = 1; cplx cZero = 0;
        if (n2 > n1) {
                int h1 = (int)ceil(0.5*n1); int h2 = n1-h1; int nz = n2-n1;
                copy_f77(&h1, in, &one, out, &one);
                init_f77(&nz, &cZero, out+h1, &one);
                copy_f77(&h2, in+h1, &one, out+h1+nz, &one);
        } else {
                int h1 = (int)ceil(0.5*n2); int h2 = n2-h1; int nz = n1-n2;
                copy_f77(&h1, in, &one, out, &one);
                copy_f77(&h2, in+h1+nz, &one, out+h1, &one);
        }
}

void FFTInterpolator2d::doInterpolate1(const cplx *src, cplx *dst,
                                       const FFTData2d &srcData,
                                       const FFTData2d &dstData)
{
        // case: one part to one part

        fft_execute_dft(srcData.fwd,
                        reinterpret_cast<fft_complex*>(const_cast<cplx*>(src)),
                        reinterpret_cast<fft_complex*>(wrk1));
        zeroPad(wrk1, srcData.N, wrk2, dstData.N);
        fft_execute_dft(dstData.bwd, reinterpret_cast<fft_complex*>(wrk2),
                        reinterpret_cast<fft_complex*>(dst));
}

void FFTInterpolator2d::doInterpolate2(const cplx *src, cplx *dst,
                                       const FFTData2d &srcData,
                                       const FFTData2d &dstData)
{
        // case: one part to two parts (minus and plus part)
        // this case is not possible!

        assert(false);

        // Bart: Correct!
}

void FFTInterpolator2d::doInterpolate3(const cplx *src, cplx *dst,
                                       const FFTData2d &srcData,
                                       const FFTData2d &dstData)
{
        // case: two parts (minus and plus part) to one part

        for (int n=0; n<chdN; n++) srcSum[n] = src[n]+src[n+chdN];

        fft_execute_dft(srcData.fwd,
                        reinterpret_cast<fft_complex*>(const_cast<cplx*>(srcSum)),
                        reinterpret_cast<fft_complex*>(wrk1));

        for (int n=0; n<chdN; n++)
                wrk1[n] *= chdCoshChi[n];

        zeroPad(wrk1, srcData.N, wrk2, dstData.N);

        fft_execute_dft(dstData.bwd, reinterpret_cast<fft_complex*>(wrk2),
                        reinterpret_cast<fft_complex*>(dst));

        // Bart: Correct!
}

void FFTInterpolator2d::doInterpolate4(const cplx *src, cplx *dst,
                                       const FFTData2d &srcData,
                                       const FFTData2d &dstData)
{
        // case: two parts (minus and plus part) to two parts (minus and plus part)

        for (int n=0; n<chdN; n++) srcSum[n] = src[n]+src[n+chdN];

        fft_execute_dft(srcData.fwd,
                        reinterpret_cast<fft_complex*>(const_cast<cplx*>(srcSum)),
                        reinterpret_cast<fft_complex*>(wrk1));

        zeroPad(wrk1, srcData.N, wrk2, dstData.N);

        for (int n=0; n<parN; n++) {
                wrkParMinus[n] = wrk2[n]*factorChiMinus[n];
                wrkParPlus[n] = wrk2[n]*factorChiPlus[n];
        }

        fft_execute_dft(dstData.bwd, reinterpret_cast<fft_complex*>(wrkParMinus),
                        reinterpret_cast<fft_complex*>(dst));

        fft_execute_dft(dstData.bwd, reinterpret_cast<fft_complex*>(wrkParPlus),
                        reinterpret_cast<fft_complex*>(dst+parN));

        // Bart: Correct!
}

void FFTInterpolator2d::doAnterpolate1(const cplx *src, cplx *dst,
                                       const FFTData2d &srcData,
                                       const FFTData2d &dstData)
{
        // case: one part to one part

        fft_execute_dft(srcData.bwd,
                        reinterpret_cast<fft_complex*>(const_cast<cplx*>(src)),
                        reinterpret_cast<fft_complex*>(wrk1));
        zeroPad(wrk1, srcData.N, wrk2, dstData.N);
        fft_execute_dft(dstData.fwd, reinterpret_cast<fft_complex*>(wrk2),
                        reinterpret_cast<fft_complex*>(dst));
}

void FFTInterpolator2d::doAnterpolate2(const cplx *src, cplx *dst,
                                       const FFTData2d &srcData,
                                       const FFTData2d &dstData)
{
        // case: one part to two parts (minus and plus part)

        fft_execute_dft(srcData.bwd,
                        reinterpret_cast<fft_complex*>(const_cast<cplx*>(src)),
                        reinterpret_cast<fft_complex*>(wrk1));

        zeroPad(wrk1, srcData.N, wrk2, dstData.N);

        for (int n=0; n<chdN; n++) wrk2[n] *= chdCoshChi[n];

        fft_execute_dft(dstData.fwd, reinterpret_cast<fft_complex*>(wrk2),
                        reinterpret_cast<fft_complex*>(dst));

        for (int n=0; n<chdN; n++) dst[n+chdN] = dst[n];

        // Bart: Correct!
}

void FFTInterpolator2d::doAnterpolate3(const cplx *src, cplx *dst,
                                       const FFTData2d &srcData,
                                       const FFTData2d &dstData)
{
        // case: two parts (minus and plus part) to one part
        // this case is not possible!

        assert(false);

        // Bart: Correct!
}

void FFTInterpolator2d::doAnterpolate4(const cplx *src, cplx *dst,
                                       const FFTData2d &srcData,
                                       const FFTData2d &dstData)
{
        // case: two parts (minus and plus part) to two parts (minus and plus part)

        fft_execute_dft(srcData.bwd,
                        reinterpret_cast<fft_complex*>(const_cast<cplx*>(src)),
                        reinterpret_cast<fft_complex*>(wrkParMinus));

        fft_execute_dft(srcData.bwd,
                        reinterpret_cast<fft_complex*>(const_cast<cplx*>(src+parN)),
                        reinterpret_cast<fft_complex*>(wrkParPlus));

        for (int n=0; n<parN; n++) {
                wrkParMinus[n] *= factorChiMinus[n];
                wrkParPlus[n] *= factorChiPlus[n];
                wrk1[n] = wrkParMinus[n]+wrkParPlus[n];
        }

        zeroPad(wrk1, srcData.N, wrk2, dstData.N);

        fft_execute_dft(dstData.fwd, reinterpret_cast<fft_complex*>(wrk2),
                        reinterpret_cast<fft_complex*>(dst));

        for (int n=0; n<chdN; n++) dst[n+chdN] = dst[n];

        // Bart: Correct!
}

void FFTInterpolator2d::interpolate(const cplx *src, int chdPart, int nChild,
                                    const int *sect, cplx *dst, int parPart)
{
        assert(chdPart == 0);
        assert(parPart == 0);
        assert(!chdHF || parHF);

        // interpolate the children
        for (int j = 0; j < nRadPatComp; j++) {
        for (int i = 0; i < nChild; i++) {
                int srcInd = i*nRadPatComp+j;

        if (parHF) {
                // interpolate the source
                if (chdHF) doInterpolate1(src+srcInd*chdN, wrk3, chdData, parData);
                else doInterpolate3(src+srcInd*2*chdN, wrk3, chdData, parData);

                // shift the interpolated vector
                avpm(wrk3, aggShift[sect[i]], dst+j*parN, parN);
        }
        else {
                // interpolate the source
                doInterpolate4(src+srcInd*2*chdN, wrk3, chdData, parData);

                // shift the interpolated vector
                avpm(wrk3, aggShift[sect[i]], dst+j*2*parN, 2*parN);
        }
        }
        }

        // Bart: Correct!
}

void FFTInterpolator2d::anterpolate(const cplx *src, int parPart, cplx *dst,
                                    int chdPart, int nChild, const int *sect)
{
        assert(chdPart == 0);
        assert(parPart == 0);
        assert(!chdHF || parHF);
        const cplx alpha = 1; const int one = 1;

        // anterpolate the parents
        for (int j = 0; j < nRadPatComp; j++) {
        for (int i = 0; i < nChild; i++) {
                int dstInd = i*nRadPatComp+j;

        if (parHF) {
                // shift the parent
                vpm(src+j*parN, dagShift[sect[i]], wrk3, parN);

                // anterpolate the source
                if (chdHF) {
                        doAnterpolate1(wrk3, wrk3, parData, chdData);
                        axpy_f77(&chdN, &alpha, wrk3, &one, dst+dstInd*chdN, &one);
                }
                else {
                        doAnterpolate2(wrk3, wrk3, parData, chdData);
                        int N = 2*chdN;
                        axpy_f77(&N, &alpha, wrk3, &one, dst+dstInd*N, &one);
                }
        }
        else {
                // shift the parent
                vpm(src+j*2*parN, dagShift[sect[i]], wrk3, 2*parN);

                // anterpolate the source
                doAnterpolate4(wrk3, wrk3, parData, chdData);

                int N = 2*chdN;
                axpy_f77(&N, &alpha, wrk3, &one, dst+dstInd*N, &one);
        }
        }
        }

        // Bart: Correct!
}

// ===========================================================================
// BLIF INTERPOLATOR
// ===========================================================================

int BlifInterpolator::nRadPatComp = 1;

double BlifInterpolator::getDampingValue(int Na, int N, double precision)
{
        // make sure the radiation pattern is oversampled
        //assert(N >= Na); // Bart

        double O = (N-Na)/2.0;
        return sqrt(2.0)/(O+0.5)*erfinv(1.0-2.0*precision);
}

int BlifInterpolator::getNumIntpolPoint(int Na, int N, double precision)
{
        // make sure the radiation pattern is oversampled
        //if (N <= Na) return 1;
        //assert(N >= Na); // Bart

        double b = getDampingValue(Na, N, precision);

        double deltaTheta = 2.0*pi/N;
        double theta = deltaTheta;
        while (exp(-theta*theta/(2.0*b*b))/(N*sin(0.5*theta)) > precision)
                theta += deltaTheta;

        return (int)ceil(theta/deltaTheta);
}

void BlifInterpolator::calcAggShiftPatterns(IntData &id, int dstPart)
{
        // shortcuts
        int N = dstLh->N;
        double boxSize = dstLh->getBoxSize();
        int firstN = dstLh->getPartStartPos(dstPart, nDstPart) + id.firstDst;
        dcomplex a = exp(2.0*pi/N*I);
        dcomplex gamma = dstLh->gamma;

        // allocate memory for the patterns
        id.shift = new cplx[4*id.nDst];

        // calculate the patterns for the four shift directions
        for (int sector = 0; sector < 4; sector++) {
                dcomplex b = exp(2.0*firstN*pi/N*I);
                deci x = (sector & 0x1) ? 0.25*boxSize : -0.25*boxSize;
                deci y = (sector & 0x2) ? 0.25*boxSize : -0.25*boxSize;
                int offset = sector*id.nDst;
                Point T(x, y);

                for (int n = 0; n < id.nDst; n++) {
                        double dot = Point(real(b), imag(b)).dot(T);
                        id.shift[n+offset] = exp(I*gamma*dot);
                        b *= a;
                }
        }
}

void BlifInterpolator::calcDagShiftPatterns(IntData &id,
                                            map<int, int> &srcPoints)
{
        // shortcuts
        int N = srcLh->N;
        double boxSize = srcLh->getBoxSize();
        dcomplex gamma = srcLh->gamma;

        // allocate memory for the patterns
        id.shift = new cplx[4*srcPoints.size()];
        double scale = double(srcLh->N) / double(dstLh->N);

        // calculate the patterns for the four shift directions
        for (int sector = 0; sector < 4; sector++) {
                deci x = (sector & 0x1) ? 0.25*boxSize : -0.25*boxSize;
                deci y = (sector & 0x2) ? 0.25*boxSize : -0.25*boxSize;
                int offset = sector*srcPoints.size();
                Point T(x, y);

                for (IntIntIt e = srcPoints.begin(); e != srcPoints.end(); e++){
                        cplx b = exp(2.0*e->first*pi/N*I);
                        double dot = Point(real(b), imag(b)).dot(T);
                        int tmp = e->first;
                        id.shift[e->second+offset] = scale*1.0/exp(I*gamma*dot);
                }
        }
}

void BlifInterpolator::calcSourcePoints(int srcPart, int dstPart,
                                        map<int, int> &sourcePoints)
{
        int srcN = srcLh->N;

        // check if the src and dst partitions correspond to each other
        bool srcDstCorr = false;
        if (nDstPart >= nSrcPart) {     // a) interpolation
                int ar = nDstPart / nSrcPart;
                int tmp = dstPart-ar*srcPart;
                if ((tmp >= 0) && (tmp < ar)) srcDstCorr = true;
        } else {                        // b) anterpolation
                int ar = nSrcPart / nDstPart;
                int tmp = srcPart-ar*dstPart;
                if ((tmp >= 0) && (tmp < ar)) srcDstCorr = true;
        }

        // we are interpolating from a corresponding partition
        if (srcDstCorr) {
                uint gFirstSrc = srcLh->getPartStartPos(srcPart, nSrcPart);
                uint srcSize = srcLh->getPartitionN(srcPart, nSrcPart);

                for (int i = 0; i < srcSize; i++)
                        sourcePoints[(i+gFirstSrc) % srcN] = i;
                return;
        }

        // we are anterpolating from and adjacent partition
        int index = 0;

        // we need the first points
        if (srcPart == nextBoundSrc) {
                uint gFirstSrc = srcLh->getPartStartPos(srcPart, nSrcPart);
                for (int i = 0; i < nPoints; i++)
                        sourcePoints[(i+gFirstSrc) % srcN] = index++;
        }

        // we need the last points
        if (srcPart == prevBoundSrc) {
                uint gFirstSrc = srcLh->getPartStartPos(srcPart, nSrcPart) +
                                 srcLh->getPartitionN(srcPart, nSrcPart) - 
                                 nPoints;
                for (int i = 0; i < nPoints; i++)
                        sourcePoints[(i+gFirstSrc) % srcN] = index++;
        }
}

void BlifInterpolator::calcIntData(int srcPart, int dstPart,
                                   IntData &id, double precision)
{
        // shortcuts
        int srcN = srcLh->N;
        int srcNa = srcLh->Na;
        int dstN = dstLh->N;
        assert(srcN > srcNa); // make sure the radiation pattern is oversampled

        double b = getDampingValue(srcNa, srcN, precision);
        nPoints = getNumIntpolPoint(srcNa, srcN, precision);
        assert(nPoints < srcN); // you should use FFT interpolation

        // source information
        map<int, int> srcPoints;
        calcSourcePoints(srcPart, dstPart, srcPoints);
        id.srcSize = srcPoints.size();
        uint gFirstSrc = srcPoints.begin()->first;

        map<int, int> srcToGlob;
        for (IntIntIt e = srcPoints.begin(); e != srcPoints.end(); e++)
                srcToGlob[e->second] = e->first;

        // destination information
        id.dstSize = dstLh->getPartitionN(dstPart, nDstPart);
        uint gFirstPar = dstLh->getPartStartPos(dstPart, nDstPart);

        // count the number of relevant destination points
        for (int i = 0; i < id.dstSize; i++) {
                int m = i + gFirstPar;

                // find the relevant input points
                double ar = double(srcN)/double(dstN);
                int firstSrc = int(floor(ar*m-nPoints));
                int lastSrc = int(ceil(ar*m+nPoints));

                for (int j = firstSrc; j <= lastSrc; j++) {
                        int n = (j + srcN) % srcN;
                        if (srcPoints.find(n) != srcPoints.end()) {
                                if (id.nDst == 0) id.firstDst = i;
                                id.nDst = i - id.firstDst + 1;
                                break;
                        }
                }
        }

        // for each relevant dst point, calculate the relevant source points
        id.firstSrc = new uint[id.nDst];
        id.nSrc = new uint[id.nDst];

        uint dataInd = 0;
        // count the number of relevant data points
        for (int i = 0; i < id.nDst; i++) {
                int m = gFirstPar + id.firstDst + i;

                // find the relevant input points
                double ar = double(srcN)/double(dstN);
                int firstSrc = int(floor(ar*m-nPoints));
                int lastSrc = int(ceil(ar*m+nPoints));
                id.firstSrc[i] = id.nSrc[i] = 0;

                for (int j = firstSrc; j <= lastSrc; j++) {
                        int n = (j + srcN) % srcN;
                        if (srcPoints.find(n) == srcPoints.end()) continue;
                        if (id.nSrc[i] == 0) 
                                id.firstSrc[i] =  srcPoints.find(n)->second;
                        id.nSrc[i]++;
                        dataInd++;
                }
        }

        // count the number of data points
        id.data = new double[dataInd];

        int minN = (srcN > dstN) ? dstN : srcN;
        for (int i = 0, dataInd = 0; i < id.nDst; i++) {
                int m = i + id.firstDst + gFirstPar;

                for (int j = 0; j < id.nSrc[i]; j++) {
                        int n = srcToGlob[(id.firstSrc[i] + j + srcN) % srcN];
                        double nTheta = 2.0*pi*(((double)n)/((double)srcN));
                        double mTheta = 2.0*pi*(((double)m)/((double)dstN));
                        id.data[dataInd++] = 1.0/srcN*ddiric(mTheta-nTheta, b,
                                                             minN);
                }
        }

        if (srcN < dstN)
                calcAggShiftPatterns(id, dstPart);
        else
                calcDagShiftPatterns(id, srcPoints);
}

void BlifInterpolator::initInterpolation()
{
        nDiv = nDstPart / nSrcPart;

        // source info
        int srcPart = srcLh->getThisPartition();
        int nextSrcPart = (srcPart + 1 + nSrcPart) % nSrcPart;
        int prevSrcPart = (srcPart - 1 + nSrcPart) % nSrcPart;

        // destination info
        int dstPart = dstLh->getThisPartition();
        int nextDstPart = (dstPart + 1 + nDstPart) % nDstPart;
        int prevDstPart = (dstPart - 1 + nDstPart) % nDstPart;

        // inbound boundary partitions
        nextBoundSrc = nextDstPart/nDiv;
        prevBoundSrc = prevDstPart/nDiv;
        if (nextBoundSrc == srcPart) nextBoundSrc = -1;
        if (prevBoundSrc == srcPart) prevBoundSrc = -1;

        // outbound boundary partitions
        dstNeedingLastP = (nDstPart == 1) ? -1 : nextSrcPart * nDiv;
        dstNeedingFirstP = (nDstPart == 1) ? -1 : prevSrcPart * nDiv + nDiv - 1;

        nSrcInd = 1;
        if (prevBoundSrc != -1) nSrcInd++;
        if ((nextBoundSrc != -1) && (nextBoundSrc != prevBoundSrc)) nSrcInd++;

        firstSrcPart = (prevBoundSrc != -1) ? prevBoundSrc : srcPart;
}

void BlifInterpolator::initAnterpolation()
{
        nDiv = nSrcPart / nDstPart;

        // source info
        int srcPart = srcLh->getThisPartition();
        int nextSrcPart = (srcPart + 1 + nSrcPart) % nSrcPart;
        int prevSrcPart = (srcPart - 1 + nSrcPart) % nSrcPart;

        // destination info
        int dstPart = dstLh->getThisPartition();
        int nextDstPart = (dstPart + 1 + nDstPart) % nDstPart;
        int prevDstPart = (dstPart - 1 + nDstPart) % nDstPart;

        // inbound boundary partitions
        nextBoundSrc = (nDstPart == 1) ? -1 : nextDstPart * nDiv;
        prevBoundSrc = (nDstPart == 1) ? -1 : prevDstPart * nDiv + nDiv - 1;

        // outbound boundary partitions
        dstNeedingLastP = nextSrcPart/nDiv;
        dstNeedingFirstP = prevSrcPart/nDiv;
        if (dstNeedingLastP == dstPart) dstNeedingLastP = -1;
        if (dstNeedingFirstP == dstPart) dstNeedingFirstP = -1;

        nSrcInd = nDiv;
        if (prevBoundSrc != -1) nSrcInd++;
        if ((nextBoundSrc != -1) && (nextBoundSrc != prevBoundSrc)) nSrcInd++;

        firstSrcPart = (prevBoundSrc != -1) ? prevBoundSrc : nDiv * dstPart;
}

BlifInterpolator::BlifInterpolator(const LevelHandler2d *srcLh_,
                                   const LevelHandler2d *dstLh_,
                                   cplx *wrk, double precision) :
        srcLh(srcLh_), dstLh(dstLh_), intData(NULL), work(wrk)
{
        nSrcPart = srcLh->getNumPartitions();
        nDstPart = dstLh->getNumPartitions();

        if (srcLh->N <= dstLh->N)
                initInterpolation();
        else
                initAnterpolation();

        intData = new IntData[nSrcInd];

        for (int srcInd = 0; srcInd < nSrcInd; srcInd++) {
                int srcPart = (srcInd + firstSrcPart) % nSrcPart;
                int dstPart = dstLh->getThisPartition();

                IntData &id = intData[srcInd];
                calcIntData(srcPart, dstPart, id, precision);
        }
}

void BlifInterpolator::doInterpolate(const IntData& intData,
                                     const cplx *src, cplx *dst) const
{
        double *data = intData.data;
        cplx *dstPtr = dst + intData.firstDst;
        cplx *dstEnd = dstPtr + intData.nDst;
        uint *firstSrc = intData.firstSrc;
        uint *nSrc = intData.nSrc;
        const cplx *maxSrc = src + intData.srcSize;

        for (int j = 0 ; dstPtr < dstEnd; dstPtr++, firstSrc++, j++, nSrc++) {
                const cplx *srcPtr = src + (*firstSrc);
                for (int i = 0; i < *nSrc; i++, srcPtr++, data++) {
                        if (srcPtr == maxSrc) srcPtr = src;
                        *dstPtr += (*data) * (*srcPtr);
                }
        }
}

void BlifInterpolator::interpolate(const cplx *chd, int srcPart,
                                   int nChild, const int *sect,
                                   cplx *par, int dstPart) const
{
        // select the correct interpolator based on the src and dst partition
        int srcInd = (srcPart - firstSrcPart + nSrcPart) % nSrcPart;
        IntData &id = intData[srcInd];

        assert (srcInd < nSrcInd);

        // interpolate the children
        for (int j = 0; j < nRadPatComp; j++) {
                for (int i = 0; i < nChild; i++) {
                        int srcInd = i*nRadPatComp+j;
                        // set work vector to zero
                        memset(work+id.firstDst, 0, sizeof(cplx)*id.nDst);
                        // interpolate the source
                        doInterpolate(id, chd+srcInd*id.srcSize, work);
                        // shift only the relevant parent of the work vector
                        avpm(work+id.firstDst, id.shift+sect[i]*id.nDst,
                             par+id.firstDst+j*id.dstSize, id.nDst);
                }
        }
}

void BlifInterpolator::anterpolate(const cplx *par, int srcPart,
                                   cplx *chd, int dstPart,
                                   int nChild, const int *sect) const
{
        // select the correct anterpolator based on the src and dst partition
        int srcInd = (srcPart - firstSrcPart + nSrcPart) % nSrcPart;
        IntData &id = intData[srcInd];

        assert (srcInd < nSrcInd);

        // anterpolate the children
        for (int j = 0; j < nRadPatComp; j++) {
                for (int i = 0; i < nChild; i++) {
                        int dstInd = i*nRadPatComp+j;
                        // shift the entire source vector
                        vpm(par+j*id.srcSize, id.shift+sect[i]*id.srcSize,
                            work, id.srcSize);
                        // anterpolate the shifted input vector
                        doInterpolate(id, work, chd + dstInd*id.dstSize);
                }
        }
}

void BlifInterpolator::copyIntBoundaryPoints(cplx *src, cplx *dst, int dstPart)
{
        int index = 0;
        int lN = srcLh->getLocalRadPatN();

        for (int j = 0; j < nRadPatComp; j++) {
                // copy the first points
                if (dstPart == dstNeedingFirstP) {
                        for (int i = 0; i < nPoints; i++)
                                dst[index++] = src[i+j*lN];
                }

                // copy the last points
                if (dstPart == dstNeedingLastP) {
                        for (int i = 0; i < nPoints; i++)
                                dst[index++] = src[lN-nPoints+i+j*lN];
                }
        }
}

void BlifInterpolator::copyAntBoundaryPoints(cplx *src, cplx *dst, int dstPart)
{
        int index = 0;
        int lN = srcLh->getLocalRadPatN();

        for (int j = 0; j < nRadPatComp; j++) {
                // copy the first points
                if (dstPart == dstNeedingFirstP) {
                        for (int i = 0; i < nPoints; i++)
                                dst[index++] = src[i+j*lN];
                }

                // copy the last points
                if (dstPart == dstNeedingLastP) {
                        for (int i = 0; i < nPoints; i++)
                                dst[index++] = src[lN-nPoints+i+j*lN];
                }
        }
}

double BlifInterpolator::getWorkAmount()
{
        return dstLh->getLocalRadPatN();
}

double BlifInterpolator::ddiric(double x, double b, int N)
{
        double dir = 0;
        double st = sin(0.5*x);

        // calculate Dirichlet function
        if ((N % 2) == 0) {
                if (dZero(st)) {
                        int hN = N/2;
                        for (int i = 1; i < hN; i++)
                                dir += cos(i*x);
                        dir = 1.0+cos(hN*x)+2.0*dir;
                } else
                        dir = sin(0.5*N*x)*cos(0.5*x)/st;
        } else {
                if (dZero(st)) {
                        for (int i = 1; i < (N+1)/2; i++)
                                dir += cos(i*x);
                        dir = 1.0+2.0*dir;
                } else
                        dir = sin(N*0.5*x)/st;
        }

        // make argument within [-Pi..Pi]
        x = fmod(x, 2.0*pi);
        if (x > pi) x -= 2.0*pi;
        if (x < -pi) x += 2.0*pi;

        assert((x <= pi) && (x >= -pi));

        // calculate Gaussian function
        double gauss = exp(-0.5*(x*x)/(b*b));

        return dir*gauss;
}
