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

#include "segment.h"

Segment* Segment::lSeg = NULL;

void Segment::getMetaData(Point& normal, Point& tangent, double &length,
                          double &hp, double &hn) const
{
        assert(next >= 0);
        Segment &sn = lSeg[next];

        Point diff = sn.p - p;
        Point diffn = (sn.next < 0) ? Point(0, 0) :
                lSeg[sn.next].p - sn.p;
        Point diffp = (prev < 0) ? Point(0, 0) :
                p - lSeg[prev].p;
        length = diff.norm();
        normal = 1.0/length*Point(diff.getY(), -diff.getX());
        tangent = 1.0/length*Point(diff.getX(), diff.getY());
        hp = 2.0/(diffp.norm() + length);
        hn = 2.0/(diffn.norm() + length);
}
