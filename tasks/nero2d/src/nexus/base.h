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

#ifndef BASE_H
#define BASE_H

#include "pubbase.h"
#include <cassert>
#include <cstring>
#include <climits>

#ifdef USE_MPE
        #include <mpe.h>
#endif

// ============================================================================
// PROCESSOR INFORMATION
// ============================================================================

extern int nProc;               // number of processes
extern int thisProc;            // identifier for this process

// ============================================================================
// ZERO THRESHOLD
// ============================================================================

#ifdef USE_FLOAT
        #define ZERO_THRESHOLD (1e-5)
#else
        #define ZERO_THRESHOLD (1e-14)
#endif

// ============================================================================
// ZERO CHECKING
// ============================================================================

/**
 * Checks whether a deci is small enough to be considered 0
 * @param d Argument
 * @return True of false
 */
static bool dZero(deci d)
{
        return (fabs(d) < ZERO_THRESHOLD);
}

/**
 * Checks whether a cplx is small enough to be considered 0
 * @param c Argument
 * @return True of false
 */
static bool cZero(cplx c)
{
        return (abs(c) < ZERO_THRESHOLD);
}

#endif
