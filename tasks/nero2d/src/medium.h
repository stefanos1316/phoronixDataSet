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

#ifndef MEDIUM_H
#define MEDIUM_H

#include "base.h"
#include <vector>

// ============================================================================
// MATERIAL DEFINITIONS
// ============================================================================

// definition of the speed of light in vacuum
static const double c = 2.99792458e8;
// permeability of free space mu0, per definition
static const double mu0 = 1.25663706143591729539e-6;
// permittivity of free space epsilon0, per definition
static const double eps0 = 8.85418781762038985054e-12;
// impedance of vacuum
static const double Z0 = 3.76730313461770655468e2;

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class LevelHandler2d;

// ============================================================================
// MEDIUM CLASS
// ============================================================================

class Medium
{
public:
        /**
         * Constructor for medium
         * @param eps Effective permittivity for this medium
         * @param mu Effective permeability for this medium
         */
        Medium(dcomplex eps, dcomplex mu);

        /**
         * Destructor
         */
        ~Medium();

        /**
         * Check whether the medium is lossless
         * @return True if the medium is lossless, false otherwise
         */
        bool isLossless();

        static double frequency;        // frequency of the incident field(s)
        static dcomplex beta;           // beta

        dcomplex eps;                   // contains effective epsilon
        dcomplex mu;                    // contains effective mu

        int ID;                         // unique identifier for the medium
        double maxDist;                 // distance at which ints are negligable

        // Derived constants
        dcomplex Z;                     // characteric impedance of medium
        dcomplex gamma;                 // object gamma
        double lambda;                  // wavelenght inside this medium
        dcomplex k;                     // k object
        dcomplex ggofoez;               // 0.25*gamma*gamma/epsilon/Z0
        dcomplex mibofoez;              // -0.25*I*beta/omega/eps/Z0
        dcomplex izbofom;               // 0.25*I*Z0*beta/(omega*mu)
        dcomplex mzggofoom;             // -0.25*Z0*gamma*gamma/(omega*mu)
        dcomplex bogg;                  // beta/(gamma*gamma)
        dcomplex moezogg;               // -omega*eps*Z0*(gamma*gamma)
        dcomplex omozgg;                // omega*mu/(Z0*gamma*gamma)

        std::vector<LevelHandler2d*> lvlHndl;       // level handlers

        /**
         * Print medium to the output stream
         * @param os Output stream to add to
         * @param M Medium to print
         * @return Output stream with the medium added to it
         */
        friend std::ostream& operator<<(std::ostream& os, const Medium& M);
};

#endif
