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

#ifndef INTERPOL_H
#define INTERPOL_H

#include "pubbase.h"

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class IntpolHandler
{
public:
        /**
         * Virtual destructor for your convenience
         */
        virtual ~IntpolHandler() {};

        /**
         * Interpolate (a part of) children radiation patterns
         * @param src Pointer to the children radiation patterns
         * @param chdPart Partition of the children patterns
         * @param nChild Number of children radiation patterns
         * @param sect Sector of the children
         * @param dst Destination for the parent pattern
         * @param parPart Partition of the parent pattern
         */
        virtual void interpolate(const cplx *src, int chdPart, int nChild,
                                 const int *sect, cplx *dst, int parPart) = 0;

        /**
         * Anterpolate (a part of) a parent radiation pattern
         * @param src Pointer to the parent radiation pattern
         * @param parPart Partition of the parent radiation pattern
         * @param dst Destination for the child patterns
         * @param chdPart Partition of the child patterns
         * @param nChild Number of child patterns to generate
         * @param sect Sector of the children
         */
        virtual void anterpolate(const cplx *src, int parPart, cplx *dst, 
                                 int chdPart, int nChild, const int *sect) = 0;

        /**
         * Copy integration points for interpolation
         * @param src Pointer to a source radiation pattern (child)
         * @param dst Pointer to for the integration points (output)
         * @param dstPart Identifier for the target partition
         */
        virtual void copyIntBoundaryPoints(cplx *src, cplx *dst, 
                                           int dstPart) {};

        /**
         * Copy integration points for anterpolation
         * @param src Pointer to a source radiation pattern (parent)
         * @param dst Pointer to for the integration points (output)
         * @param dstPart Identifier for the target partition
         */
        virtual void copyAntBoundaryPoints(cplx *src, cplx *dst, 
                                           int dstPart) {};

        /**
         * Return the amount of work for this package
         * @return The amount of work for this package
         */
        virtual double getWorkAmount() { return 1.0; }

        static double targetWorkAmount;
private:

};

#endif
