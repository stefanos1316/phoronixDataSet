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

#include "workpack.h"
#include "base.h"

// ===========================================================================
// TRANSLATION OPERATOR CACHING CLASS
// ===========================================================================

bool TranslTemp::operator==(const TranslTemp &rhs) const
{
        Point R1 = R, R2 = rhs.R;

        if (!dZero(R1.getX()-R2.getX())) return false;
        if (!dZero(R1.getY()-R2.getY())) return false;
#ifdef NEXUS_3D
        if (!dZero(R1.getZ()-R2.getZ())) return false;
#endif

        return true;
}

bool TranslTemp::operator<(const TranslTemp &rhs) const
{
        Point R1 = R, R2 = rhs.R;

        if (!dZero(R1.getX()-R2.getX())) return (R1.getX()-R2.getX() < 0);
        if (!dZero(R1.getY()-R2.getY())) return (R1.getY()-R2.getY() < 0);
#ifdef NEXUS_3D
        if (!dZero(R1.getZ()-R2.getZ())) return (R1.getZ()-R2.getZ() < 0);
#endif

        return false;   // they equal
}

bool TranslTemp::operator>(const TranslTemp &rhs) const
{
        Point R1 = R, R2 = rhs.R;

        if (!dZero(R1.getX()-R2.getX())) return (R1.getX()-R2.getX() > 0);
        if (!dZero(R1.getY()-R2.getY())) return (R1.getY()-R2.getY() > 0);
#ifdef NEXUS_3D
        if (!dZero(R1.getZ()-R2.getZ())) return (R1.getZ()-R2.getZ() > 0);
#endif

        return false;   // they equal
}
