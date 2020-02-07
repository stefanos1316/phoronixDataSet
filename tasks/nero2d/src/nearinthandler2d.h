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

#ifndef NEARINTHANDLER2D_H
#define NEARINTHANDLER2D_H

#include "matrix.h"
#include "nexus/nearinthandler.h"
#include "segment.h"

// ============================================================================
// CLASS PROTOTYPE
// ============================================================================

class SegSegInt;
class SegOutput;
class Medium;
class LUNearIntHandler2d;
class Geometry;
class Int;
template <class T> class SplayTree;

// ============================================================================
// DEFAULT NEAR INTERACTION HANDLER
// ============================================================================

class NearIntHandler2d : public NearIntHandler
{
public:
        /**
         * Constructor for the near interactions
         * @param start1 First unknown index of the test function
         * @param stop1 Last unknown index of the test function
         * @param start2 First unknown index of the basis function
         * @param stop2 Last unknown index of the basis function
         */
        NearIntHandler2d(int start1, int stop1, int start2, int stop2);

        /**
         * Perform a near interaction
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void nearInt(const cplx *src, cplx *dst);

        static SegSegInt* segSegInt;    // segment-segment interactions

private:
        Matrix<cplx> M;                 // near interaction matrix block
};

// ============================================================================
// LU NEAR INTERACTION HANDLER
// ============================================================================

class PrecBJ
{
public:
        /**
         * Constructor
         */
        PrecBJ() : unknownOffset(0), handler(NULL) {}

        uint unknownOffset;             // unknown offset
        LUNearIntHandler2d *handler;    // LU near int handler (pointer)
};

class LUNearIntHandler2d : public NearIntHandler
{
public:
        /**
         * Constructor for the near interactions
         * @param start1 First unknown index of the test function
         * @param stop1 Last unknown index of the test function
         * @param start2 First unknown index of the basis function
         * @param stop2 Last unknown index of the basis function
         * @param work Pointer to a work vector
         */
        LUNearIntHandler2d(int start1, int stop1,
                           int start2, int stop2, cplx *work);

        /**
         * Destructor
         */
        ~LUNearIntHandler2d() { delete [] pivot; }

        /**
         * Perform a (foward) near interaction
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void nearInt(const cplx *src, cplx *dst);

        /**
         * Perform a (backward) matvec multiplication (for BJ preconditioning)
         * @param src Pointer to the unknown (
         * @param dst lal
         */
        void nearIntBwd(const cplx *src, cplx *dst);

        /**
         * Calculate the LU decomposition of the matrix M
         */
        void calculateLU();

        static SegSegInt* segSegInt;    // segment-segment interactions

private:
        cplx *work;                     // pointer to a work vector
        Matrix<cplx> M;                 // near interaction matvec
        int *pivot;                     // pivotation vector
};

// ============================================================================
// OUTPUT NEAR INTERACTION HANDLER
// ============================================================================

class NearOutputHandler2d : public NearIntHandler
{
public:
        /**
         * Default constructor
         * @param pointStart first output point index
         * @param pointEnd final output point index
         * @param segStart first segment index
         * @param segEnd final segment index
         */
        NearOutputHandler2d(int pointStart, int pointEnd,
                            int segStart, int segEnd);

        /**
         * Perform a (foward) near interaction
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        void nearInt(const cplx *src, cplx *dst);

        static SegOutput* segOutput;    // segment output interaction
        static uint nHandlers;          // number of near output handlers
        static uint nHandlersDone;      // number of near output handlers done

private:
        int basisStart;                 // first basis discretization index
        int basisEnd;                   // final basis discretization index
        int testStart;                  // first test discretization index
        int testEnd;                    // final test discretization index

        friend class Nero2d;
};

// ===========================================================================
// SEGMENT SEGMENT INTERACTION CACHING CLASS
// ===========================================================================

class SegSegCacheEl
{
public:
        SegSegCacheEl() {};
        SegSegCacheEl(double r_, double l1_, double l2_, double theta_,
                double psi_, int medium_) : r(r_), l1(l1_), l2(l2_),
                theta(theta_), psi(psi_), medium(medium_) {}

        bool operator==(const SegSegCacheEl &rhs) const;
        bool operator<(const SegSegCacheEl &rhs) const;
        bool operator>(const SegSegCacheEl &rhs) const;

        double r;               // metadata
        double l1, l2;
        double theta, psi;
        int medium;

        dcomplex data[9];       // actual data
};

// ============================================================================
// SEGMENT SEGMENT INTERACTION CALCULATION
// ============================================================================

class SegSegInt
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param qOrder Gaussian quadrature order
         */
        SegSegInt(const Geometry *geometry, int qOrder);

        /**
         * Destructor
         */
        ~SegSegInt();

        /**
         * Calculate a near interaction block
         * @param start1 First unknown index of the test function
         * @param stop1 Last unknown index of the test function
         * @param start2 First unknown index of the basis function
         * @param stop2 Last unknown index of the basis function
         * @param M Pre-allocated matrix to store the results (output)
         */
        void calcNearIntBlock(int start1, int stop1, int start2,
                              int stop2, Matrix<cplx> &M);

private:
        const Geometry *geometry;       // pointer to the geometry
        int qOrder;                     // gauss quadrature order

        bool TM, TE;                    // transversal magnetic, electric
        double omega;                   // pulsation
        dcomplex beta;                  // beta

        double *gaussQP;                // gaussian quadrature points
        dcomplex **hf[6];               // temporary variable for various usage
        Int *itg;                       // integration object
        SplayTree<SegSegCacheEl> *st;   // splaytree for seg-seg int cache

        /**
         * Calculate the interaction between 2 segments
         * @param s2 Reference to the test function segment
         * @param s1 Reference to the basis function segment
         * @param out Buffer to store the output (output)
         * @param intMedium Medium in which the segments interactions
         */
        void calcSegSegInteraction(const Segment &s2, const Segment &s1,
                                   dcomplex *out, Medium *intMedium);

        /**
         * Calculate an interaction between two segs and store the results in M
         * @param smp2 Pair of (segmentIndex, SMP) for test segment
         * @param smp1 Pair of (segmentIndex, SMP) for basis segment
         * @param M Matrix to store the results
         */
        void segSegInteraction(std::pair<const int, SMP> &smp2,
                               std::pair<const int, SMP> &smp1,
                               Matrix<cplx> &M);

        /**
         * Calculate an interaction between two segs and store the results in M
         * @param sPair2 Pair of (segmentIndex, SMP) for test segment
         * @param sPair1 Pair of (segmentIndex, SMP) for basis segment
         * @param M Matrix to store the results
         * @param intMedium Medium in which the segments interactions
         * @param sign Sign for medium
         */
        void segSegInteractionForMedium(std::pair<const int, SMP> &sPair2,
                                        std::pair<const int, SMP> &sPair1,
                                        Matrix<cplx> &M, Medium *intMedium,
                                        double sign);
};

// ============================================================================
// SEGMENT OUTPUT CLASS
// ============================================================================

class SegOutput
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param qOrder Gaussian quadrature order
         * @param outputPoints List of output points
         * @param pointGroupID List of corresponding groupIDs
         */
        SegOutput(Geometry *geometry, int qOrder,
                  Point *outputPoints, int *pointGroupID);

        /**
         * Destructor
         */
        ~SegOutput();

        /**
         * Calculate the output in a number of points due to some segments
         * @param pointStart first output point index
         * @param pointEnd final output point index
         * @param segStart first segment index
         * @param segEnd final segment index
         * @param src Basis function expansions for the segments
         * @param dst Pre-allocated vector to store the outputs (output)
         */
        void calcOutput(int pointStart, int pointEnd, int segStart,
                        int segEnd,  const cplx *src, cplx *dst);

private:
        Geometry *geometry;     // pointer to the geometry
        int qOrder;             // gauss quadrature order

        Point *outputPoints;    // pointer to the output points
        int *pointGroupID;      // pointer to the corresponding groupIDs

        bool TM, TE;            // transversal magnetic, electric
        double omega;           // pulsation
        dcomplex beta;          // beta

        double *gaussQP;        // gaussian quadrature points
        dcomplex **hf[6];       // temporary variable for various usage
        Int *itg;               // integration object

        /**
         * Aux routine: calculate the singular part for the output integrals
         * @param r First polar coordinate
         * @param l Length of the segment
         * @param theta Angle between tangent en r (second polar coordinate)
         * @param result Vector to store result (output)
         */
        static void calcSingularPart(double r, double l, double theta,
                                     cplx gamma, cplx *result);

        /**
         * Calculate the scattered fields (6 components) in r due to one segment
         * @param sPair Pair of (segmentIndex, SMP) for segment
         * @param r Point r in which to calculate the fields
         * @param medium Pointer to the medium of r
         * @param X Unknown vector
         * @param result Vector in which to store the results (output)
         * @param sign Sign for medium
         */
        void calcSegScatField(std::pair<const int, SMP> &sPair, const Point &r,
                              const Medium *medium, const cplx *X,
                              Vector<cplx> &result, double sign);
};

#endif
