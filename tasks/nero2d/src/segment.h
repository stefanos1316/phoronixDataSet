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

#ifndef SEGMENT_H
#define SEGMENT_H

#include "base.h"
#include "nexus/nexus.h"

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Object;

// ============================================================================
// SEGMENT CLASS
// ============================================================================

class Segment
{
public:
        Segment() : obj(NULL), prev(-1), next(-1) {};

        Point p;                // the first point of the segment
        int next;               // index to the next segment in lSeg
        int prev;               // index to the previous segment
        Object* obj;            // object to which the segments belongs

        static Segment *lSeg;   // list of all locale segments

        /**
         * Calculate the meta-data for a segment (length, normal and tangent)
         * @param normal Normal to the segment (output)
         * @param tangent Tangent to the segment (output)
         * @param length Length of the segment (output)
         * @param hp Height of the hat function (previous-current)
         * @param hn Height of the hat function (current-next)
         */
        void getMetaData(Point& normal, Point& tangent,
                         double &length, double &hp, double &hn) const;
};

// ============================================================================
// SEGMENT MATRIX POSITION CLASS
// ============================================================================

class SMP
{
public:
        SMP() : unknPos(-1), prev(NULL) {}
        SMP(int unknPos_, SMP* prev_) : unknPos(unknPos_), prev(prev_) {}

        int unknPos;            // segment first unknown position (local)
        SMP* prev;              // pointer to the previous segment
};

#endif
