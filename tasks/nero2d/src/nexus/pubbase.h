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

#ifndef PUBBASE_H
#define PUBBASE_H

#ifdef HAVE_CONFIG_H
        #include <config.h>
#endif

#ifdef HAVE_MPI
        #include <mpi.h>
        #define MAX_PROCESSOR_NAME MPI_MAX_PROCESSOR_NAME
#else
        #define MAX_PROCESSOR_NAME 10
#endif

#include <complex>

// ===========================================================================
// ELEMENTARY TYPES
// ===========================================================================

#ifdef USE_FLOAT
        typedef float deci;
#else
        typedef double deci;
#endif

typedef std::complex<deci> cplx;
typedef unsigned int uint;

// no typedef because MPI_XXX is likely to be defined as well
#ifdef HAVE_MPI
        #ifdef USE_FLOAT
                #define MPI_CPLX MPI_COMPLEX
        #else
                #define MPI_CPLX MPI_DOUBLE_COMPLEX
        #endif
#endif

// ===========================================================================
// POINT CLASS (2D/3D)
// ===========================================================================

#include "point.h"

class Point2d;
class Point3d;

#ifdef NEXUS_3D
        typedef Point3d Point;
#else
        typedef Point2d Point;
#endif

typedef enum { HILBERT, MORTON } Sfc;
typedef enum { TREE_EQUAL, TREE_SEPARATE } SepTree;
typedef enum { TREE_BASIS, TREE_TEST } TreeType;

#endif
