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

#ifndef NEARINTHANDLER_H
#define NEARINTHANDLER_H

#include "pubbase.h"

class NearIntHandler
{
public:
        /**
         * Virtual destructor for your convenience
         */
        virtual ~NearIntHandler() {};

        /**
         * Perform a near interaction
         * @param src Pointer to the unknown (solution) vector
         * @param dst Pointer to destination radiation pattern (output)
         */
        virtual void nearInt(const cplx *src, cplx *dst) = 0;

        /**
         * Return the amount of work for this package
         * @return The amount of work for this package
         */
        virtual double getWorkAmount() { return 1.0; }

        static double targetWorkAmount;
private:

};

#endif