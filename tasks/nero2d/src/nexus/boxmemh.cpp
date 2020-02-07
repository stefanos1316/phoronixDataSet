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

#include "box.h"
#include "boxmemh.h"

using namespace std;

vector<Box*> BoxMemHandler::boxMem;
std::vector<Box*> BoxMemHandler::delBoxes;
unsigned int BoxMemHandler::top = BLOCK_SIZE;

// ============================================================================
// STATIC ROUTINES FOR BOX MEMORY MANAGEMENT
// ============================================================================

Box *BoxMemHandler::allocateBox()
{
        // if we have 'deleted' boxes
        if (!delBoxes.empty()) {
                Box *back = delBoxes.back();
                delBoxes.pop_back();
                back->reset();
                return back;
        }

        // check if we need to allocate a new box block
        if (top >= BLOCK_SIZE) {
                boxMem.push_back(new Box[BLOCK_SIZE]);
                top = 0;
        }

        return &boxMem.back()[top++];
}

void BoxMemHandler::deleteBox(Box *box)
{
        // don't actually delete the box
        delBoxes.push_back(box);
}

void BoxMemHandler::deleteAllBoxes()
{
        vector<Box*>::iterator e;

        for (e = boxMem.begin(); e != boxMem.end(); e++)
                delete [] *e;
        boxMem.clear();

        delBoxes.clear();

        top = BLOCK_SIZE;
}
