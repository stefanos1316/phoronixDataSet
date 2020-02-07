/***************************************************************************
 *   Copyright (C) 2006, 2007, 2008, 2009 by Jan Fostier                   *
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

#ifndef BOXMEMH_H
#define BOXMEMH_H

#define BLOCK_SIZE 100

#include <vector>

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Box;

// ============================================================================
// BOX CLASS
// ============================================================================

class BoxMemHandler
{
private:
        static std::vector<Box*> boxMem;
        static std::vector<Box*> delBoxes;
        static unsigned int top;

public:
        // ====================================================================
        // STATIC ROUTINES FOR BOX MEMORY MANAGEMENT
        // ====================================================================

        /**
         * Allocate memory for a new box
         * @return Pointer to the new box
         */
        static Box *allocateBox();

        /**
         * Delete a box
         * @param box Pointer to the box to be deleted
         */
        static void deleteBox(Box *box);

        /**
         * Delete all memory
         */
        static void deleteAllBoxes();
};

#endif
