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

#ifndef SCENE2D_H
#define SCENE2D_H

#include "base.h"

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Object;
class Medium;
class Source;
class Output;

class FFTInterpolator2d;
class LevelHandler2d;
class Nero2d;

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class SRCacheEl {

public:
        /**
         * Default constructor
         */
        SRCacheEl() : gamma(0.0), boxSize(0.0), xDist(0.0) {};

        /**
         * Default constructor
         * @param gamma_ Wavenumber of the medium
         * @param boxSize_ Size of the box
         * @param xDist_ Distance between the boxes
         */
        SRCacheEl(cplx gamma_, double boxSize_, double xDist_) : gamma(gamma_),
                boxSize(boxSize_), xDist(xDist_) {}

        /**
         * Get the sampling rate
         * @return The sampling rate
         */
        int getN() const { return N; }

        /**
         * Get the aggregation sampling rate
         * @return The aggregation sampling rate
         */
        int getNa() const { return Na; }

        /**
         * Is the level high frequent
         * @return True of false
         */
        bool isHF() const { return HF; }

        /**
         * Return the normalization factor chi
         * @return The normalization factor
         */
        double getChi() const { return chi; }

        /**
         * Set the data fields
         * @param N_ The sampling rate
         * @param Na_ The aggregation sampling rate
         * @param HF_ High frequent
         * @param chi_ Normalization factor
         */
        void setData(int N_, int Na_, bool HF_, double chi_) { N = N_; Na = Na_;
                HF = HF_; chi = chi_; }

        bool operator==(const SRCacheEl &rhs) const;
        bool operator<(const SRCacheEl &rhs) const;
        bool operator>(const SRCacheEl &rhs) const;

private:
        cplx gamma;
        double boxSize;
        double xDist;

        int N, Na;
        bool HF;
        double chi;
};

#endif
