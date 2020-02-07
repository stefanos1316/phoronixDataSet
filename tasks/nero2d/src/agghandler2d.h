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

#ifndef AGGHANDLER2D_H
#define AGGHANDLER2D_H

#include "base.h"
#include "matrix.h"
#include "nexus/agghandler.h"
#include "segment.h"

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class AggCalculator;
class Geometry;
class Int;
class LevelHandler2d;
class Medium;
class FFTInterpolator;

// ============================================================================
// FULL AGGREGATION HANDLER
// ============================================================================

class FullAggHandler : public AggHandler, public DagHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nUnknowns Number of unknowns
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param lvlHandler Pointer to the level handler
         */
        FullAggHandler(const Geometry *geometry,
                       const std::map<int, SMP> &smpList, int nUnknowns,
                       const Medium *medium, const Point &centre,
                       LevelHandler2d *lvlHandler);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregate(const cplx *src, cplx *dst);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

private:
        Matrix<cplx> A;                         // aggregation matrix
        Matrix<cplx> D;                         // disaggregation matrix
};

// ===========================================================================
// COMPACT AGGREGATION HANDLER
// ===========================================================================

class CompactAggHandler : public AggHandler, public DagHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nUnknowns Number of unknowns
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param intpl Pointer to the interpolator
         */
        CompactAggHandler(const Geometry *geometry,
                          const std::map<int, SMP> &smpList, int nUnknowns,
                          const Medium *medium, const Point &centre,
                          FFTInterpolator *intpl);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregate(const cplx *src, cplx *dst);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

        static cplx* work;                      // work vector
        static int nRadPatComp;                 // number of radpat components

private:
        Matrix<cplx> A;                         // aggregation matrix
        Matrix<cplx> D;                         // disaggregation matrix
        FFTInterpolator *intpl;                 // pointer to FFT interpolator
};

// ===========================================================================
// COMPRESSED AGGREGATION HANDLER
// ===========================================================================

class ComprAggHandler : public AggHandler, public DagHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nAggElements Number of aggregation elements
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param intpl Pointer to the interpolator
         */
        ComprAggHandler(const Geometry *geometry,
                        const std::map<int, SMP> &smpList, int nAggElements,
                        const Medium *medium, const Point &centre,
                        FFTInterpolator *intpl);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        virtual void aggregate(const cplx *src, cplx *dst) = 0;

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        virtual void disaggregate(const cplx *src, cplx *dst) = 0;

        static cplx* work;                      // work vector

protected:
        Matrix<cplx> el;                        // basis function elements
};

// ===========================================================================
// COMPRESSED DIELECTRIC TM/TE AGGREGATION HANDLER
// ===========================================================================

class ComprAggHandlerDTMTE : public ComprAggHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nUnknowns Number of unknowns
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param intpl Pointer to the interpolator
         */
        ComprAggHandlerDTMTE(const Geometry *geometry,
                             const std::map<int, SMP> &smpList, int nUnknowns,
                             const Medium *medium, const Point &centre,
                             FFTInterpolator *intpl);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregate(const cplx *src, cplx *dst);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

private:
        const Medium *medium;           // Pointer to the medium class
        FFTInterpolator *intpl;         // pointer to FFT interpolator

        /**
         * Calculate the TM radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregateTM(const cplx *src, cplx *dst);

        /**
         * Calculate the TE radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregateTE(const cplx *src, cplx *dst);

        /**
         * Disaggregate the TM radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void disaggregateTM(cplx *src, cplx *dst);

        /**
         * Disaggregate the TE radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void disaggregateTE(cplx *src, cplx *dst);
};

// ===========================================================================
// COMPRESSED PEC TM/TE MATVEC AGGREGATION HANDLER
// ===========================================================================

class ComprAggHandlerPTMTE : public ComprAggHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nUnknowns Number of unknowns
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param intpl Pointer to the interpolator
         */
        ComprAggHandlerPTMTE(const Geometry *geometry,
                             const std::map<int, SMP> &smpList, int nUnknowns,
                             const Medium *medium, const Point &centre,
                             FFTInterpolator *intpl);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregate(const cplx *src, cplx *dst);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

private:
        const Medium *medium;           // Pointer to the medium class
        FFTInterpolator *intpl;         // pointer to FFT interpolator

        /**
         * Calculate the TM radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregateTM(const cplx *src, cplx *dst);

        /**
         * Calculate the TE radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregateTE(const cplx *src, cplx *dst);

        /**
         * Disaggregate the TM radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void disaggregateTM(cplx *src, cplx *dst);

        /**
         * Disaggregate the TE radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void disaggregateTE(cplx *src, cplx *dst);
};

// ===========================================================================
// COMPRESSED DIELECTRIC TM AGGREGATION HANDLER
// ===========================================================================

class ComprAggHandlerDTM : public ComprAggHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nUnknowns Number of unknowns
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param intpl Pointer to the interpolator
         */
        ComprAggHandlerDTM(const Geometry *geometry,
                           const std::map<int, SMP> &smpList, int nUnknowns,
                           const Medium *medium, const Point &centre,
                           FFTInterpolator *intpl);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregate(const cplx *src, cplx *dst);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

private:
        const Medium *medium;           // Pointer to the medium class
        FFTInterpolator *intpl;         // pointer to FFT interpolator
};

// ===========================================================================
// COMPRESSED PEC TM AGGREGATION HANDLER
// ===========================================================================

class ComprAggHandlerPTM : public ComprAggHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nUnknowns Number of unknowns
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param intpl Pointer to the interpolator
         */
        ComprAggHandlerPTM(const Geometry *geometry,
                           const std::map<int, SMP> &smpList, int nUnknowns,
                           const Medium *medium, const Point &centre,
                           FFTInterpolator *intpl);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregate(const cplx *src, cplx *dst);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

private:
        const Medium *medium;           // Pointer to the medium class
        FFTInterpolator *intpl;         // pointer to FFT interpolator
};

// ===========================================================================
// COMPRESSED DIELECTRIC TE AGGREGATION HANDLER
// ===========================================================================

class ComprAggHandlerDTE : public ComprAggHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nUnknowns Number of unknowns
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param intpl Pointer to the interpolator
         */
        ComprAggHandlerDTE(const Geometry *geometry,
                           const std::map<int, SMP> &smpList, int nUnknowns,
                           const Medium *medium, const Point &centre,
                           FFTInterpolator *intpl);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregate(const cplx *src, cplx *dst);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

private:
        const Medium *medium;           // Pointer to the medium class
        FFTInterpolator *intpl;         // pointer to FFT interpolator
};

// ===========================================================================
// COMPRESSED PEC TE AGGREGATION HANDLER
// ===========================================================================

class ComprAggHandlerPTE : public ComprAggHandler
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param smpList List of segments
         * @param nUnknowns Number of unknowns
         * @param medium Pointer to the medium
         * @param centre Centre of the aggregation box
         * @param intpl Pointer to the interpolator
         */
        ComprAggHandlerPTE(const Geometry *geometry,
                           const std::map<int, SMP> &smpList, int nUnknowns,
                           const Medium *medium, const Point &centre,
                           FFTInterpolator *intpl);

        /**
         * Aggregate a radiation pattern
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void aggregate(const cplx *src, cplx *dst);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

private:
        const Medium *medium;           // Pointer to the medium class
        FFTInterpolator *intpl;         // pointer to FFT interpolator
};

// ============================================================================
// OUTPUT DISAGGREGATION
// ============================================================================

class OutputDag : public DagHandler
{
public:
        /**
         * Default constructor
         * @param lvlHndl Pointer to the level handler
         * @param centre Centre of the radiation pattern
         * @param medium Medium of the radiation pattern
         * @param pointStart First test discretization index
         * @param pointEnd Final test discretization index
         */
        OutputDag(const LevelHandler2d *lvlHndl, const Point &centre,
                  Medium *medium, int pointStart, int pointEnd);

        /**
         * Disaggregate a radation pattern to an unknown vector
         * @param src Pointer to source radiation pattern
         * @param dst Pointer to destination (right hand side) vector (output)
         */
        void disaggregate(const cplx *src, cplx *dst);

        static Point *outputPoints;    // pointer to the output points
        static int *pointGroupID;      // pointer to the corresponding groupIDs

        static bool TM, TE;            // transversal magnetic, electric
        static double omega;           // pulsation

private:
        int N;                          // sampling rate of radiation pattern
        bool HF;                        // Bart: HF or LF (true -> HF)
        double chi;                     // Bart: normalization factor
        Point centre;                   // centre of the radiation pattern
        Medium *medium;                 // medium of the radiation pattern

        int pointStart;                 // first test discretization index
        int pointEnd;                   // final test discretization index
};

// ============================================================================
// FULL AGGREGATION HANDLER
// ============================================================================

class AggCalculator
{
public:
        /**
         * Calculate the full aggregation and disaggregation matrices
         * @param geometry Pointer to the geometry
         * @param smpList List of segments under consideration
         * @param medium Pointer to the aggregation medium
         * @param centre Centre of the radiation pattern
         * @param A Pre-allocated aggregation matrix (output)
         * @param D Pre-allocated disaggregation matrix (output)
         * @param chi Normalization factor
         */
        static void calcAggFull(const Geometry *geometry,
                                const std::map<int, SMP> &smpList,
                                const Medium *medium, const Point &centre,
                                Matrix<cplx> &A, Matrix<cplx> &D, double chi);

        /**
         * Calculate the compressed aggregation elements
         * @param geometry Pointer to the geometry
         * @param smpList List of segments under consideration
         * @param medium Pointer to the aggregation medium
         * @param centre Centre of the radiation pattern
         * @param el Pre-allocated elements matrix (output)
         */
        static void calcAggEl(const Geometry *geometry,
                              const std::map<int, SMP> &smpList,
                              const Medium *medium,
                              const Point &centre, Matrix<cplx> &el);

private:
        /**
         * Construct the full (dis)aggregation matrices due to one segment
         * @param geometry Pointer to the geometry
         * @param sPair Segment pair
         * @param medium Pointer to the interacting medium
         * @param centre Centre of the radiation pattern
         * @param A Pre-allocated agg matrix for the radpats (output)
         * @param D Pre-allocated dag matrix for the radpats (output)
         * @param chi Normalization factor
         */
        static void addSegAggFull(const Geometry *geometry,
                                  const std::pair<const int, SMP> &sPair,
                                  const Medium *medium, const Point &centre,
                                  Matrix<cplx> &A, Matrix<cplx> &D, double chi);

        /**
         * Construct the compressed aggregation elements due to one segment
         * @param geometry Pointer to the geometry
         * @param sPair Segment pair
         * @param medium Pointer to the interacting medium
         * @param centre Centre of the radiation pattern
         * @param el Pre-allocated matrix for the elements (output)
         */
        static void addSegAggCompr(const Geometry *geometry,
                                   const std::pair<const int, SMP> &sPair,
                                   const Medium* medium, const Point &centre,
                                   Matrix<cplx> &el);
};

#endif
