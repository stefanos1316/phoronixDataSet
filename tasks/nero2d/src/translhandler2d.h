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

#ifndef TRANSLHANDLER2D_H
#define TRANSLHANDLER2D_H

#include "nexus/translhandler.h"
#include "matrix.h"

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Medium;
class LevelHandler2d;

// ============================================================================
// FULL TRANSLATION OPERATOR HANDLER
// ============================================================================

class FullTranslHandler : public TranslHandler
{
public:
        /**
         * Default constructor
         * @param lvlHndl Pointer to the level handler
         * @param T Translation vector
         * @param gamma Gamma of the interaction medium
         */
        FullTranslHandler(const LevelHandler2d *lvlHndl, const Medium *medium,
                          const Point &T);

        /**
         * Translate a radiation pattern
         * @param src Pointer to the outgoing radiation pattern
         * @param dst Pointer to the incoming radiation pattern (output)
         */
        void translate(cplx *src, cplx *dst);

        /**
         * Return the amount of work for this package
         * @return The amount of work for this package
         */
        double getWorkAmount() {
                return nRadPatComp*translOperator.size();
        }

        static int nRadPatComp;         // number of rad pattern components

private:
        Vector<cplx> translOperator;    // actual translation operator
};

// ============================================================================
// TRANSLATION OPERATOR HANDLER LF
// ============================================================================

class TranslHandlerLF : public TranslHandler
{
public:
        /**
         * Default constructor
         * @param lvlHndl Pointer to the level handler
         * @param T Translation vector
         * @param gamma Gamma of the interaction medium
         */
        TranslHandlerLF(const LevelHandler2d *lvlHndl, const Medium *medium,
                        const Point &T);

        /**
         * Translate a radiation pattern
         * @param src Pointer to the outgoing radiation pattern
         * @param dst Pointer to the incoming radiation pattern (output)
         */
        void translate(cplx *src, cplx *dst);

        /**
         * Return the amount of work for this package
         * @return The amount of work for this package
         */
        double getWorkAmount() {
                return nRadPatComp*translOperator.size();
        }

        static int nRadPatComp;         // number of rad pattern components

private:
        Vector<cplx> translOperator;    // actual translation operator
};

// ============================================================================
// TRANSLATION OPERATOR CALCULATION
// ============================================================================

class CalcTranslator
{
public:

        /**
         * Get the precision for a translation operation
         * @param boxSize Absolute box size
         * @param xDist Box separation distance (relative to box size)
         * @param gamma Gamma for the medium
         * @param N Number of sampling points
         * @return The precision
         */
        static double getTranslPrecision(double boxSize, double xDist,
                                         cplx gamma, int N);

        /**
         * Calculate a translation operator
         * @param gamma Medium wave vector
         * @param Q Sampling rate at this level
         * @param R Translation vector
         * @param data Pre-allocated vector to store the operator (ouput)
         */
        static void calcTranslOperator(cplx gamma, int Q, const Point &R,
                                       Vector<cplx> &data);

        /**
         * Calculate a translation operator
         * @param lvlHndl Pointer to the levelhandler
         * @param gamma Medium wave vector
         * @param Q Sampling rate at this level
         * @param R Translation vector
         * @param data Pre-allocated vector to store the operator (ouput)
         */
        static void calcTranslOperatorLF(cplx gamma, int Q, const Point &R,
                                         double chi, Vector<cplx> &data);
};

#endif
