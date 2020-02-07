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

#ifndef INTHANDLER2D_H
#define INTHANDLER2D_H

#include "base.h"
#include "nexus/intpolhandler.h"
#include "matrix.h"

#include <map>

class FFTInterpolator2d;
class LevelHandler2d;
class Blif2d;

// ===========================================================================
// 2D FFT INTERPOLATION
// ===========================================================================

class FFTData2d
{
public:
        /**
         * Constructor for 2D FFT interpolation data
         * @param N Number of sampling points
         * @param wrk Work vector to calculate the plan
         * @param fftwFlag FFTW planner flag
         */
        FFTData2d(int N, fft_complex *wrk, int fftwFlag);

        /**
         * Destructor
         */
        ~FFTData2d();

private:
        int N;
        fft_plan fwd;
        fft_plan bwd;

        friend class FFTInterpolator;
        friend class FFTInterpolator2d;
};

class FFTInterpolator
{
public:
        /**
         * Constructor for FFT interpolator
         * @param chdN Pointer to the child level sampling rate
         * @param parN Pointer to the parent level sampling rate
         * @param work Pre-allocated work vector of size 2*parLh->N
         */
        FFTInterpolator(int chdN, int parN, cplx *work);

        /**
         * Interpolate a child radiation pattern
         * @param src Pointer to the child radiation pattern
         * @param dst Destination for the parent pattern (output)
         */
        void interpolate(const cplx *src, cplx *dst) {
                doInterpolate(src, dst, chdData, parData);
        }

        /**
         * Anterpolate a parent radiation pattern
         * @param src Pointer to the parent radiation pattern
         * @param dst Destination for the child pattern (output)
         */
        void anterpolate(const cplx *src, cplx *dst) {
                doInterpolate(src, dst, parData, chdData);
        }

        int chdN, parN;                 // child and parent sampling rates

private:
        /**
         * Zeropad or truncate a certain spectrum
         * @param in Input spectrum
         * @param n1 Number of elements in the input spectrum
         * @param out Output spectrum
         * @param n2 Number of elements in the output spectrum
         */
        void zeroPad(const cplx *in, int n1, cplx *out, int n2);

        /**
         * Do the actual interpolations/anterpolation (child HF, parent HF)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doInterpolate(const cplx *src, cplx *dst,
                           const FFTData2d &srcData, const FFTData2d &dstData);

        FFTData2d parData;              // interpolation data for parent level
        FFTData2d chdData;              // interpolation data for child level
        cplx *wrk1, *wrk2;              // work memory (managed outside class)

        static int fftwFlag;            // fft plan flag
};

class FFTInterpolator2d : public IntpolHandler
{
public:
        /**
         * Constructor for 2D FFT interpolator
         * @param chdLh Pointer to the child level handler
         * @param parLh Pointer to the parent level handler
         * @param work Pre-allocated work vector of size 3*parLh->N
         */
        FFTInterpolator2d(const LevelHandler2d *chdLh,
                          const LevelHandler2d *parLh, cplx *work);

        /**
         * Destructor
         */
        ~FFTInterpolator2d();

        /**
         * Interpolate (a part of) children radiation patterns
         * @param src Pointer to the children radiation patterns
         * @param chdPart Partition of the children patterns
         * @param nChild Number of children radiation patterns
         * @param sect Sector of the children
         * @param dst Destination for the parent pattern
         * @param parPart Partition of the parent pattern
         */
        void interpolate(const cplx *src, int chdPart, int nChild,
                         const int *sect, cplx *dst, int parPart);

        /**
         * Anterpolate (a part of) a parent radiation pattern
         * @param src Pointer to the parent radiation pattern
         * @param parPart Partition of the parent radiation pattern
         * @param dst Destination for the child patterns
         * @param chdPart Partition of the child patterns
         * @param nChild Number of child patterns to generate
         * @param sect Sector of the children
         */
        void anterpolate(const cplx *src, int parPart, cplx *dst,
                         int chdPart, int nChild, const int *sect);

        /**
         * Return the amount of work for this package
         * @return The amount of work for this package
         */
        double getWorkAmount() { return parN; }

        int chdN, parN;                 // child and parent sampling rates
        FFTData2d parData;              // interpolation data for parent level
        FFTData2d chdData;              // interpolation data for child level
        cplx *wrk1, *wrk2, *wrk3;       // work memory (managed outside class)
        cplx *shiftData;
        cplx *aggShift[4], *dagShift[4];

        bool chdHF, parHF;              // Bart: child/parent HF-boolean
        double chdChi, parChi;          // Bart: child/parent normalization factor

        double *chdCoshChi;             // Bart: child list with normalization factors for fft
        double *factorChiMinus;         // Bart: list with normalization factors for fft
        double *factorChiPlus;          // Bart: list with normalization factors for fft

        cplx *srcSum;                   // Bart: sum of the minus and plus src
        cplx *wrkParMinus;              // Bart: work memory for parent minus part
        cplx *wrkParPlus;               // Bart: work memory for parent plus part

        static int fftwFlag;            // fft plan flag
        static int nRadPatComp;         // number of rad pattern components

private:
        /**
         * Zeropad or truncate a certain spectrum
         * @param in Input spectrum
         * @param n1 Number of elements in the input spectrum
         * @param out Output spectrum
         * @param n2 Number of elements in the output spectrum
         */
        void zeroPad(const cplx *in, int n1, cplx *out, int n2);

        /**
         * Do the actual interpolation (one part to one part)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doInterpolate1(const cplx *src, cplx *dst,
                            const FFTData2d &srcData, const FFTData2d &dstData);

        /**
         * Do the actual interpolation (one part to two parts)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doInterpolate2(const cplx *src, cplx *dst,
                            const FFTData2d &srcData, const FFTData2d &dstData);

        /**
         * Do the actual interpolation (two parts to one part)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doInterpolate3(const cplx *src, cplx *dst,
                            const FFTData2d &srcData, const FFTData2d &dstData);

        /**
         * Do the actual interpolation (two parts to two parts)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doInterpolate4(const cplx *src, cplx *dst,
                            const FFTData2d &srcData, const FFTData2d &dstData);

        /**
         * Do the actual anterpolation (one part to one part)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doAnterpolate1(const cplx *src, cplx *dst,
                            const FFTData2d &srcData, const FFTData2d &dstData);

        /**
         * Do the actual anterpolation (one part to two parts)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doAnterpolate2(const cplx *src, cplx *dst,
                            const FFTData2d &srcData, const FFTData2d &dstData);

        /**
         * Do the actual anterpolation (two parts to one part)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doAnterpolate3(const cplx *src, cplx *dst,
                            const FFTData2d &srcData, const FFTData2d &dstData);

        /**
         * Do the actual anterpolation (two parts to two parts)
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         * @param srcData Source level FFT data
         * @param dstData Destination level FFT data
         */
        void doAnterpolate4(const cplx *src, cplx *dst,
                            const FFTData2d &srcData, const FFTData2d &dstData);
};

// ===========================================================================
// 2D BLIF INTERPOLATION
// ===========================================================================

class IntData
{
public:
        uint srcSize;           // size of the source vector
        uint *firstSrc;         // first relevant source
        uint *nSrc;             // number of relevant sources

        uint dstSize;           // size of the destination vector
        uint firstDst;          // first destination that is altered
        uint nDst;              // number of destinations that are altered

        double *data;           // data

        cplx *shift;            // pointer to the shifter

        /**
         * Constructor
         */
        IntData() : srcSize(0), firstSrc(NULL), nSrc(NULL), 
                    dstSize(0), firstDst(0), nDst(0),
                    data(NULL), shift(NULL) {};

        /**
         * Destructor
         */
        ~IntData() { delete [] firstSrc; delete [] nSrc;
                     delete [] data; delete [] shift;};
};

class BlifInterpolator
{
public:
        /**
         * Constructor for BLIFInterpolator
         * @param srcLh Pointer to the source level handler
         * @param dstLh Pointer to the parent level handler
         * @param work Pointer to the work vector
         * @param precision Desired precision
         */
        BlifInterpolator(const LevelHandler2d *srcLh,
                         const LevelHandler2d *dstLh,
                         cplx *work, double precision);

        /**
         * Destructor
         */
        ~BlifInterpolator() { delete [] intData; };

        /**
         * Interpolate (a part of) children radiation patterns
         * @param chd Pointer to the children radiation patterns
         * @param chdPart Partition of the children patterns
         * @param nChild Number of children radiation patterns
         * @param sect Sector of the children
         * @param par Destination for the parent pattern
         * @param parPart Partition of the parent pattern
         */
        void interpolate(const cplx *chd, int chdPart, int nChild,
                         const int *sect, cplx *par, int parPart) const;

        /**
         * Anterpolate (a part of) a parent radiation pattern
         * @param src Pointer to the parent radiation pattern
         * @param parPart Partition of the parent radiation pattern
         * @param dst Destination for the child patterns
         * @param chdPart Partition of the child patterns
         * @param nChild Number of child patterns to generate
         * @param sect Sector of the children
         */
        void anterpolate(const cplx *src, int parPart, cplx *dst,
                         int chdPart, int nChild, const int *sect) const;

        /**
         * Get the damping value for BLIF interpolation
         * @param Na Nyquist sampling rate for the pattern
         * @param N Actual sampling rate for the pattern
         * @param precision Desired precision
         * @return Damping value b
         */
        static double getDampingValue(int Na, int N, double precision);

        /**
         * Get the number of interpolation points (one sided)
         * @param Na Nyquist sampling rate for the pattern
         * @param N Actual sampling rate for the pattern
         * @param precision Desired precision
         * @return The number of interpolation points
         */
        static int getNumIntpolPoint(int Na, int N, double precision);

        /**
         * Copy integration points for interpolation
         * @param src Pointer to a source radiation pattern (child)
         * @param dst Pointer to for the integration points (output)
         * @param dstPart Identifier for the target partition
         */
        void copyIntBoundaryPoints(cplx *src, cplx *dst, int dstPart);

        /**
         * Copy integration points for anterpolation
         * @param src Pointer to a source radiation pattern (parent)
         * @param dst Pointer to for the integration points (output)
         * @param dstPart Identifier for the target partition
         */
        void copyAntBoundaryPoints(cplx *src, cplx *dst, int dstPart);

        /**
         * Return the amount of work for this package
         * @return The amount of work for this package
         */
        double getWorkAmount();

        static int nRadPatComp;         // number of rad pattern components

private:
        const LevelHandler2d *srcLh;    // pointers to the chd level handler
        const LevelHandler2d *dstLh;    // pointers to the par level handler

        int nSrcPart;                   // number of child partitions
        int nDstPart;                   // number of parent partitions
        int nDiv;                       // number of divisions

        int prevBoundSrc;               // previous source partition (if any)
        int nextBoundSrc;               // next source partition (if any)

        int dstNeedingFirstP;
        int dstNeedingLastP;

        int firstSrcPart;               // first child partition
        int nSrcInd;                    // number of child part to consider

        int nPoints;                    // number of interpolation points
        IntData *intData;               // interpolator data

        cplx *work;                     // pointer to a work vector

        /**
         * Initialize an interpolation
         */
        void initInterpolation();

        /**
         * Initialize an anterpolation
         */
        void initAnterpolation();

        /**
         * Calculate the shift patterns for this aggregation
         * @param id Interpolation data for this aggregation
         * @param dstPart Target partition
         */
        void calcAggShiftPatterns(IntData &id, int dstPart);

        /**
         * Calculate the shift patterns for this disaggregation
         * @param id Interpolation data for this disaggregation
         * @param sourcePoints Map containing the source points
         */
        void calcDagShiftPatterns(IntData &id, 
                                  std::map<int, int> &sourcePoints);

        /**
         * Calculate the participating source points
         * @param srcPart Source partition
         * @param dstPart Destitination partition
         * @param sourcePoints Map containing the source points (output)
         */
        void calcSourcePoints(int srcPart, int dstPart,
                              std::map<int, int> &sourcePoints);

        /**
         * Calculate the interpolation data
         * @param srcPart Source partition identifier
         * @param dstPart Destination partition identifier
         * @param id Interpolation data (output)
         * @param precision Desired precision
         */
        void calcIntData(int srcPart, int dstPart,
                         IntData &id, double precision);

        /**
         * Do the actual int/anterpolations
         * @param intData Interpolation data
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination radiation pattern (output)
         */
        void doInterpolate(const IntData& intData,
                           const cplx *src, cplx *dst) const;

        /**
         * Calculate the damped Dirichlet kernel
         * @param x Argument x
         * @param b Damping parameter
         * @param N Period of samples
         * @return Damped Dirichlet kernel
         */
        static double ddiric(double x, double b, int N);
};

class Blif2d : public IntpolHandler
{
public:
        /**
         * Constructor for 2D BLIF interpolation
         * @param chdLh Pointer to the child level handler
         * @param parLh Pointer to the parent level handler
         * @param work Pointer to a work vector
         * @param precision Desired precision
         */
        Blif2d(const LevelHandler2d *chdLh,
               const LevelHandler2d *parLh, cplx *work, double precision) :
               intpl(chdLh, parLh, work, precision),
               antpl(parLh, chdLh, work, precision) {};

        /**
         * Interpolate (a part of) children radiation patterns
         * @param src Pointer to the children radiation patterns
         * @param chdPart Partition of the children patterns
         * @param nChild Number of children radiation patterns
         * @param sect Sector of the children
         * @param dst Destination for the parent pattern
         * @param parPart Partition of the parent pattern
         */
        void interpolate(const cplx *src, int chdPart, int nChild,
                         const int *sect, cplx *dst, int parPart) {
                intpl.interpolate(src, chdPart, nChild, sect, dst, parPart);
        }

        /**
         * Anterpolate (a part of) a parent radiation pattern
         * @param src Pointer to the parent radiation pattern
         * @param parPart Partition of the parent radiation pattern
         * @param dst Destination for the child patterns
         * @param chdPart Partition of the child patterns
         * @param nChild Number of child patterns to generate
         * @param sect Sector of the children
         */
        void anterpolate(const cplx *src, int parPart, cplx *dst,
                         int chdPart, int nChild, const int *sect) {
                antpl.anterpolate(src, parPart, dst, chdPart, nChild, sect);
        }

        /**
         * Copy integration points for interpolation
         * @param src Pointer to a source radiation pattern (child)
         * @param dst Pointer to for the integration points (output)
         * @param dstPart Identifier for the target partition
         */
        void copyIntBoundaryPoints(cplx *src, cplx *dst, int dstPart) {
                intpl.copyIntBoundaryPoints(src, dst, dstPart);
        }

        /**
         * Copy integration points for anterpolation
         * @param src Pointer to a source radiation pattern (parent)
         * @param dst Pointer to for the integration points (output)
         * @param dstPart Identifier for the target partition
         */
        void copyAntBoundaryPoints(cplx *src, cplx *dst, int dstPart) {
                antpl.copyAntBoundaryPoints(src, dst, dstPart);
        }

        /**
         * Return the amount of work for this package
         * @return The amount of work for this package
         */
        double getWorkAmount() { return intpl.getWorkAmount(); }

private:
        BlifInterpolator intpl;         // interpolator from parent to child
        BlifInterpolator antpl;         // interpolator from child to parent
};

#endif
