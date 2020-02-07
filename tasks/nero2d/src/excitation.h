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

#ifndef EXCITATION_H
#define EXCITATION_H

#include "base.h"
#include "segment.h"
#include "matrix.h"

#include <fstream>

// ============================================================================
// TYPEDEFS
// ============================================================================

typedef enum { POINTSOURCE = 'P', GAUSSBUNDLE = 'G', PLANEWAVE = 'W' } ExcType;

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Int;
class Medium;
class Geometry;
class Excitation;

// ============================================================================
// EXCITATION CLASS
// ============================================================================

class Source
{
private:
        ExcType source;         // type of excitation
        dcomplex I0;            // current intensity of excitation (pointsource)
        dcomplex Fx0;           // field intensity
        Point orig;             // origin of excitation
        double gaussW;          // width of the gaussian bundle
        double angle;           // angle of excitation
        Medium *medium;         // medium of the excitation
        int order;              // order of the gaussian beam

        /**
         * Calculate the electrical field due to a line current excitation
         * @param r Point in which the field is evaluated
         * @return Electric field in r
         */
        dcomplex lineSourceEzField(const Point& r) const;

        /**
         * Calculate the magnetic field Ht due to a line current excitation
         * @param r Point in which the field is evaluated
         * @param t Unity vector along desired field direction
         * @return Magnetic field component along t, evaluated in r
         */
        dcomplex lineSourceHtField(const Point& r, const Point& t) const;

        /**
         * Calculate the magnetic field due to a line current excitation
         * @param r Point in which the field is evaluated
         * @return Magnetic field in r
         */
        dcomplex lineSourceHzField(const Point& r) const;

        /**
         * Calculate the electrical field Et due to a line current excitation
         * @param r Point in which the field is evaluated
         * @param t Unity vector along desired field direction
         * @return Electric field component along t, evaluated in r
         */
        dcomplex lineSourceEtField(const Point& r, const Point& t) const;

        /**
         * Calculate the electrical field due to a TM polarized plane wave
         * @param r Point in which the field is evaluated
         * @return Electric field in r
         */
        dcomplex planeWaveTMEzField(const Point& r) const;

        /**
         * Calculate the magnetic field due to a TM polarized plane wave
         * @param r Point in which the field is evaluated
         * @param t Unity vector along desired field direction
         * @return Magnetic field component along t, evaluated in r
         */
        dcomplex planeWaveTMHtField(const Point& r, const Point& t) const;

        /**
         * Calculate the magnetic field due to a TE polarized plane wave
         * @param r Point in which the field is evaluated
         * @return Magnetic field in r
         */
        dcomplex planeWaveTEHzField(const Point& r) const;

        /**
         * Calculate the electrical field due to a TE polarized plane wave
         * @param r Point in which the field is evaluated
         * @param t Unity vector along desired field direction
         * @return Electric field component along t, evaluated in r
         */
        dcomplex planeWaveTEEtField(const Point& r, const Point& t) const;

        /**
         * Calculate the electrical field due to a TM polarized gaussian bundle
         * @param r Point in which the field is evaluated
         * @return Electric field in r
         */
        dcomplex gaussBundleTMEzField(const Point& r) const;

        /**
         * Calculate the magnetic field due to a TM polarized gaussian bundle
         * @param r Point in which the field is evaluated
         * @param t Unity vector along desired field direction
         * @return Magnetic field component along t, evaluated in r
         */
        dcomplex gaussBundleTMHtField(const Point& r, const Point& t) const;

        /**
         * Calculate the magnetic field due to a TE polarized gaussian bundle
         * @param r Point in which the field is evaluated
         * @return Magnetic field in r
         */
        dcomplex gaussBundleTEHzField(const Point& r) const;

        /**
         * Calculate the electric field due to a TE polarized gaussian bundle
         * @param r Point in which the field is evaluated
         * @param t Unity vector along desired field direction
         * @return Electric field component along t, evaluated in r
         */
        dcomplex gaussBundleTEEtField(const Point& r, const Point& t) const;

public:
        /**
         * Calculate the electrical longitudinal field in a point
         * @param r Point in which the field is evaluated
         * @return Electric field in r
         */
        dcomplex calcEzField(const Point& r) const;

        /**
         * Calculate the transversal H-field in a point along a direction
         * @param r Point in which the field is evaluated
         * @param t Unity vector along desired field direction
         * @return Magnetic field component along t, evaluated in r
         */
        dcomplex calcHtField(const Point& r, const Point& t) const;

        /**
         * Calculate the magnetic longitudinal field in a point
         * @param r Point in which the field is evaluated
         * @return Magnetic field in r
         */
        dcomplex calcHzField(const Point& r) const;

        /**
         * Calculate the transversal E-field in a point along a direction
         * @param r Point in which the field is evaluated
         * @param t Unity vector along desired field direction
         * @return Electric field component along t, evaluated in r
         */
        dcomplex calcEtField(const Point& r, const Point& t) const;

        /**
         * Print excitation to the output stream
         * @param os Output stream to add to
         * @param E Source to print
         * @return Output stream with the excitation added to it
         */
        friend std::ostream& operator<<(std::ostream& os, const Source& E);

        friend class Excitation;
};

// ============================================================================
// EXCITATION CLASS
// ============================================================================

class Excitation
{
public:
        /**
         * Default constructor
         * @param geometry Pointer to the geometry
         * @param qOrder Order of gaussian quadrature
         */
        Excitation(Geometry *geometry, int qOrder);

        /**
         * Destructor
         */
        ~Excitation();

        /**
         * Load the excitations from disc
         * @param ifs Pre-opened file stream pointing to the excitation section
         */
        void loadExcitation(std::ifstream &ifs);

        /**
         * Calculate an excitation vector
         * @param V Pre-allocated vector to store the results (output)
         */
        void calcExcitationVector(Vector<cplx> &V);

        /**
         * Calculate the incoming field in a number of points
         * @param r List of points
         * @param groupID List of groupIDs
         * @param n Number of points
         * @param result Vector to store the results
         */
        void calcIncomingField(const Point *r, const int *groupID,
                               int n, Vector<cplx> &result);

        /**
         * Print excitation to the output stream
         * @param os Output stream to add to
         * @param E Object to print
         * @return Output stream with the object added to it
         */
        friend std::ostream& operator<<(std::ostream& os, const Excitation& E);

private:
        Geometry *geometry;     // pointer to the geometry

        int nSources;           // the number of sources in the excitation
        Source *source;         // the sources in the excitation

        int qOrder;             // gauss quadrature order
        bool TM, TE;            // transversal magnetic, electric

        double *gaussQP;        // gaussian quadrature points
        dcomplex **hf[6];       // temporary variable for various usage
        Int *itg;               // integration object

        /**
         * Add the fields from an excitation to the vector V
         * @param sPair Pair of (segmentIndex, SMP) for segment
         * @param exc Reference to the excitation
         * @param sign Sign for inner or outer medium
         * @param V Vector to store the results (output)
         */
        void addSource(std::pair<const int, SMP> &sPair,
                           Source &exc, int sign, Vector<cplx> &V);

        /**
         * Calculate the excitations for one segment
         * @param sPair Pair of (segmentIndex, SMP) for segment
         * @param V Vector to store the results (output)
         */
        void calculateSegSources(std::pair<const int, SMP> &sPair,
                                     Vector<cplx> &V);
};

#endif
