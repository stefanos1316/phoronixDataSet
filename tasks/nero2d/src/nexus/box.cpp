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

#include "box.h"
#include "boxmemh.h"

// ============================================================================
// BOX CLASS
// ============================================================================

void Box::recSetOwner(int owner, uint lvl, uint lowLvl)
{
        setOwner(owner);
        if (lvl == lowLvl) return;

        Box *chd = firstChild;
        for (uint i = 0; i < getNChildren(); i++, chd = chd->next)
                chd->recSetOwner(owner, lvl-1, lowLvl);
}

void Box::recSetOwnerGroup(int ownerGroup, uint lvl, uint lowLvl)
{
        setOwnerGroup(ownerGroup);
        if (lvl == lowLvl) return;

        Box *chd = firstChild;
        for (uint i = 0; i < getNChildren(); i++, chd = chd->next)
                chd->recSetOwnerGroup(ownerGroup, lvl-1, lowLvl);
}

void Box::recSetFlag(bool flag)
{
        setFlag(flag);

        Box *chd = firstChild;
        for (uint i = 0; i < getNChildren(); i++, chd = chd->next)
                chd->recSetFlag(flag);
}

void Box::recSetFlagFast(bool flag)
{
        if (isFlagged() == flag) return;
        setFlag(flag);

        Box *chd = firstChild;
        for (uint i = 0; i < getNChildren(); i++, chd = chd->next)
                chd->recSetFlagFast(flag);
}

void Box::recSetContainsLocalData(bool flag)
{
        setContainsLocalData(flag);

        Box *chd = firstChild;
        for (uint i = 0; i < getNChildren(); i++, chd = chd->next)
                chd->recSetContainsLocalData(flag);
}

void Box::recSetContainsLocalDataFast(bool flag)
{
        if (containsLocalData() == flag) return;
        setContainsLocalData(flag);

        Box *chd = firstChild;
        for (uint i = 0; i < getNChildren(); i++, chd = chd->next)
                chd->recSetContainsLocalDataFast(flag);
}

void Box::recSetBelongsToThisIntGroup(bool flag)
{
        setBelongsToThisIntGroup(flag);

        Box *chd = firstChild;
        for (uint i = 0; i < getNChildren(); i++, chd = chd->next)
                chd->recSetBelongsToThisIntGroup(flag);
}

uint Box::searchSector(const Point &c, const Point &p)
{
        int sector = 0;
        if (p.getX() > c.getX()) sector |= 0x1;
        if (p.getY() > c.getY()) sector |= 0x2;
#ifdef NEXUS_3D
        if (p.getZ() > c.getZ()) sector |= 0x4;
#endif

        return sector;
}

void Box::recDeleteNonConnectedBoxes(Box *box)
{
        if (box == NULL) return;

        for(Box *next = NULL; box != NULL; box = next) {
                next = box->next;
                recDeleteNonConnectedBoxes(box->firstChild);
                BoxMemHandler::deleteBox(box);
        }
}

void Box::recDeleteConnectedBoxes(Box *box)
{
        if (box == NULL) return;
        recDeleteConnectedBoxes(box->firstChild);

        for(Box *next = NULL; box != NULL; box = next) {
                next = box->next;
                BoxMemHandler::deleteBox(box);
        }
}
