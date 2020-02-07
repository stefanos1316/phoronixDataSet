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

#ifndef BOX_H
#define BOX_H

#include "pubbase.h"
#include <cassert>

// ===========================================================================
// BOX CLASS
// ===========================================================================

class Box
{
private:
        // boxData1: flag-1 bit | ownergroup-12 bit | owner-12 bit |
        //           nChildren-4 bit | sector-3 bit
        uint boxData1;
        // boxData2: thisIG-1 bit | localData-1 bit | number of unknowns-30 bit
        uint boxData2;
        // unknown/radiation pattern offset
        uint offset;

public:
        Box *next;              // pointer to the next box
        Box *firstChild;        // pointer to the first child box
        Box *parent;            // pointer to the parent box

        // ====================================================================
        // SETTINGS FOR GLOBAL BOX
        // ====================================================================

        /**
         * Default constructor for a box
         */
        Box();
                
        /**
         * Reset the data in the box;
         */
        void reset();

        /**
         * Set the box sector
         * @param sector Target sector
         */
        void setSector(uint sector);

        /**
         * Return the sector of the box
         * @return Sector of the box
         */
        uint getSector() const;

        /**
         * Set the number of children of the box
         * @param nChildren Target number of children
         */
        void setNChildren(uint nChildren);

        /**
         * Return the number of children of the box
         * @return Number of children
         */
        uint getNChildren() const;

        /**
         * Set the owner of the box
         * @param owner Target owner
         */
        void setOwner(uint owner);

        /**
         * Set the owner of this box and a number of child levels
         * @param ownerGroup Target owner
         * @param lvl Level of this box
         * @param lowLvl Lowest level at which to set the owner
         */
        void recSetOwner(int owner, uint lvl, uint lowLvl);

        /**
         * Return the owner of the box
         * @return Owner
         */
        uint getOwner() const;

        /**
         * Set the owner group of the box
         * @param ownerGroup Target owner group
         */
        void setOwnerGroup(uint ownerGroup);

        /**
         * Set the owner group of this box and a number of child levels
         * @param ownerGroup Target owner group
         * @param lvl Level of this box
         * @param lowLvl Lowest level at which to set the owner group
         */
        void recSetOwnerGroup(int ownerGroup, uint lvl, uint lowLvl);

        /**
         * Return the ownerGroup of the box
         * @return OwnerGroup
         */
        uint getOwnerGroup() const;

        /**
         * Set the box flag
         * @param flag True of false
         */
        void setFlag(bool flag);

        /**
         * Set the box flag for this box and all of the children
         * @param flag Target value
         */
        void recSetFlag(bool flag);

        /**
         * Set the box flag for this box and all of the children (fast)
         * @param flag Target value
         */
        void recSetFlagFast(bool flag);

        /**
         * Check whether this box is flagged
         * @return True of false
         */
        bool isFlagged() const;

        /**
         * Set the number of unknowns
         * @param boxData2 Number of unknowns
         */
        void setNUnknowns(uint nUnknowns);

        /**
         * Increase the number of unknowns by one
         */
        void increaseNUnknowns();

        /**
         * Get the number of unknowns in this box
         * @return Number of unknowns
         */
        uint getNUnknowns() const;

        /**
         * Set the contains local data flag
         * @param flag Target value
         */
        void setContainsLocalData(bool flag);

        /**
         * Set the contains local data flag for this box and all children
         * @param flag Target value
         */
        void recSetContainsLocalData(bool flag);

        /**
         * Set the contains local data flag for this box and all children (fast)
         * @param flag Target value
         */
        void recSetContainsLocalDataFast(bool flag);

        /**
         * Check whether this box contains local data
         * @return True or false
         */
        bool containsLocalData() const;

        /**
         * Set the intgroup flag
         * @param flag True or false
         */
        void setBelongsToThisIntGroup(bool flag);

        /**
         * Recursively set the intgroup flag for this box and all children
         * @param flag True or false
         */
        void recSetBelongsToThisIntGroup(bool flag);

        /**
         * Check whether this box belongs to this interaction group
         * @return True of false
         */
        bool belongsToThisIntGroup() const;

        /**
         * Set the unknown/radiation pattern offset
         * @param offset Unknown/radiation pattern offset
         */
        void setOffset(uint offset);

        /**
         * Get the unknown/radiation pattern offset
         * @return Offset
         */
        uint getOffset() const;

        /**
         * Get the weight associated with this box
         * @return The weight associated with this box
         */
        double getWeight() const;

        /**
         * Find a child given the sector
         * @param sector Sector of the child
         * @return Pointer to child box, NULL if it doesn't exist
         */
        Box* getChild(uint sector) const;

        /**
         * Search the sector of a point with respect to a centre point
         * @param c Centre point
         * @param p Point p
         * @return Sector of p with respect to c
         */
        static uint searchSector(const Point &c, const Point &p);

        /**
         * Recursively free the memory associated with this box
         * @param box Parent/first sibling box to delete
         */
        static void recDeleteNonConnectedBoxes(Box *box);

        /**
         * Recursively free the memory associated with this box
         * @param box Parent/first sibling box to delete
         */
        static void recDeleteConnectedBoxes(Box *box);

        // ====================================================================
        // SETTINGS PER OWNER GROUP
        // ====================================================================

        /**
         * Get the first child that is non-empty for this groupID
         * @return The first child belonging to this interaction group
         */
        Box *getFirstChild() const;

        /**
         * Get the parent box that is non-empty for this groupID
         * @return The parent box belonging to this interaction group
         */
        Box *getParent() const;

        /**
         * Get the next box that is non-empty for this groupID
         * @return The next box belonging to this interaction group
         */
        Box *getNext() const;
};

// ============================================================================
// SETTINGS FOR GLOBAL BOX
// ============================================================================

inline Box::Box() : boxData1(0), boxData2(0), offset(0),
                    next(NULL), firstChild(NULL), parent(NULL)
{

}

inline void Box::reset()
{
        boxData1 = boxData2 = offset = 0;
        next = firstChild = parent = NULL;
}

inline void Box::setSector(uint sector)
{
        // sector [0..7] (8 numbers = 3 bit)
        assert(sector <= 7);
        boxData1 = ((boxData1 >> 3) << 3) + sector;
}

inline uint Box::getSector() const
{
        return boxData1 % 8;
}

inline void Box::setNChildren(uint nChildren)
{
        // nChildren [0..8] (9 numbers = 4 bit)
        assert(nChildren <= 8);
        uint tail = boxData1 % 8;
        uint head = boxData1 >> 7;
        boxData1 = (head << 7) + (nChildren << 3) + tail;
}

inline uint Box::getNChildren() const
{
        return (boxData1 >> 3) % 16;
}

inline void Box::setOwner(uint owner)
{
        uint tail = boxData1 % 128;
        uint head = boxData1 >> 19;
        boxData1 = (head << 19) + (owner << 7) + tail;
}

inline uint Box::getOwner() const
{
        return (boxData1 >> 7) % (1 << 12);
}

inline void Box::setOwnerGroup(uint ownerGroup)
{
        uint tail = boxData1 % (1 << 19);
        uint head = boxData1 >> 31;
        boxData1 = (head << 31) + (ownerGroup << 19) + tail;
}

inline uint Box::getOwnerGroup() const
{
        return (boxData1 >> 19) % (1 << 12);
}

inline void Box::setFlag(bool flag)
{
        uint i = (flag) ? 1 : 0;
        uint tail = boxData1 % (1 << 31);
        boxData1 = (i << 31) + tail;
}

inline bool Box::isFlagged() const
{
        return (boxData1 >> 31);
}

inline void Box::setNUnknowns(uint nUnknowns)
{
        uint head = boxData2 >> 30;
        boxData2 = (head << 30) + nUnknowns;
}

inline void Box::increaseNUnknowns()
{
        boxData2++;
}

inline uint Box::getNUnknowns() const
{
        return boxData2 % (1 << 30);
}

inline void Box::setContainsLocalData(bool flag)
{
        uint i = (flag) ? 1 : 0;
        uint head = boxData2 >> 31;
        uint tail = boxData2 % (1 << 30);
        boxData2 = (head << 31) + (flag << 30) + tail;
}

inline bool Box::containsLocalData() const
{
        return ((boxData2 >> 30) % 2);
}

inline void Box::setBelongsToThisIntGroup(bool flag)
{
        uint i = (flag) ? 1 : 0;
        uint tail = boxData2 % (1 << 31);
        boxData2 = (i << 31) + tail;
}

inline bool Box::belongsToThisIntGroup() const
{
        return (boxData2 >> 31);
}

inline void Box::setOffset(uint offset_)
{
        offset = offset_;
}

inline uint Box::getOffset() const
{
        return offset;
}

inline double Box::getWeight() const
{
        return getNUnknowns();
}

inline Box* Box::getChild(uint sector) const
{
        // check if the child already exists
        Box *chd = firstChild;
        for(uint i = 0; i < getNChildren(); chd = chd->next, i++)
                if (chd->getSector() == sector) return chd;

        return NULL;
}

// ============================================================================
// SETTINGS PER OWNER GROUP
// ============================================================================

inline Box *Box::getFirstChild() const
{
        Box *chd = firstChild;
        for (int i = 0; chd != NULL, i < getNChildren(); i++, chd = chd->next)
                if (chd->belongsToThisIntGroup()) return chd;
        return NULL;
}

inline Box *Box::getParent() const
{
        if (parent == NULL) return NULL;
        return (parent->belongsToThisIntGroup()) ? parent : NULL;
}

inline Box *Box::getNext() const
{
        for (Box *box = next; box != NULL; box = box->next)
                if (box->belongsToThisIntGroup()) return box;
        return NULL;
}

#endif
