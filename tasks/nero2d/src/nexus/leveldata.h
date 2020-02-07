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

#ifndef LEVELDATA_H
#define LEVELDATA_H

#include "base.h"

// ============================================================================
// LEVELDATA CLASS
// ============================================================================

class LevelData
{
public:
        uint nPartitions;       // number of partitions

        double boxSize;         // size of the box at this level
        double minDist;         // minimal separation distance
        double maxDist;         // maximal separation distance

        /**
         * Constructor
         */
        LevelData() : nPartitions(1), boxSize(0.0),
                      minDist(0.0), maxDist(-1.0) {}

        /**
         * Check whether two boxes are sufficiently separated
         * @param c1 Centre of the first box
         * @param c2 Centre of the second box
         * @return true of false
         */
        bool isSuffSeparated(const Point& c1, const Point& c2) const;

        /**
         * Check whether two boxes have a non-negligable interaction
         * @param c1 Centre of the first box
         * @param c2 Centre of the second box
         * @return true of false 
         */
        bool isOverSeparated(const Point& c1, const Point& c2) const;

        /**
         * Check wheter two boxes are separated to have FMM interaction
         * @param c1 Centre of the first box
         * @param c2 Centre of the second box
         * @return true of false
         */
        bool isWellSeparated(const Point& c1, const Point& c2) const;
};

#endif
