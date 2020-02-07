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

#ifndef LOADHANDLER_H
#define LOADHANDLER_H

#include "pubbase.h"

// ===========================================================================
// CLASS PROTOTYPES
// ===========================================================================

class Box;
class Level;
class LevelData;
class Tree;

// ===========================================================================
// LOAD HANDLER
// ===========================================================================

class LoadHandler
{
private:

        /**
         * Set some data relevant to load balancing
         * @param rootPtr Pointer to the root of the box
         * @param levelPtr Pointer to the level structure
         * @param ldPtr Pointer to the level data structure
         * @param nLevels Number of levels in the tree
         * @param nNearLevels Number of near levels
         */
        void setTreeData(Box *rootPtr, Level *levelPtr, LevelData *ldPtr,
                         int nLevels, int nNearLevels);

public:
        Box *root;              // pointer to the root box
        Level *level;           // pointer to the level structures
        LevelData *ld;          // pointer to the level data
        int nLevels;            // number of levels
        int nNearLevels;        // number of near interaction levels

        /**
         * Order the boxes in the tree according a certain space filling curve
         */
        virtual void orderBoxes() = 0;

        /**
         * Set an owner for each box in the FMM tree
         */
        virtual void loadDivision() = 0;

        friend class Tree;
};

#endif

