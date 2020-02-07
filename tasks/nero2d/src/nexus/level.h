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

#ifndef LEVEL_H
#define LEVEL_H

#include "pubbase.h"
#include <map>
#include <set>

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Box;

// ============================================================================
// LEVEL CLASS
// ============================================================================

class Level
{
public:
        /**
         * Default constructor
         */
        Level() : lvl(0), gFirstBox(NULL), ngBoxes(0),
                  lFirstBox(NULL), nlBoxes(0), minNumPart(0) {}

        /**
         * Set the owners for the level [lowLvl..thisLevel]
         * @param nOwners Number of owners
         * @param lowLvl Lowest level to set the owners
         */
        void doLoadBalance(int nOwners, int lowLvl);

        /**
         * Find the lFirstBox and the number of local boxes
         */
        void postLoadBalancing();

        /**
         * Count the local number of unknowns at this level
         * @return The local number of unknowns
         */
        uint getNumLocalUnknowns() const;

        /**
         * Return the misbalance for this level for a certain partitioning
         * @param nPartitions Number of owner groups
         * @return The misbalance at this level
         */
        double getMisBalance(int nOG);

        /**
         * Remove a box, groupID pair from the ghostlist
         * @param box Pointer to the box
         * @param groupID groupID
         * @return True if the element existed, false otherwise
         */
        bool removeFromGhostList(Box *box, int groupID) {
                std::map<Box*, std::set<int> >::iterator 
                        e = ghostList.find(box);
                if (e == ghostList.end()) return false;
                if (!e->second.erase(groupID)) return false;
                if (e->second.empty())
                        ghostList.erase(box);
                return true;
        }

        /**
         * Add a box, groupID pair to the ghostlist
         * @param box Pointer to the box
         * @param groupID groupID
         */
        void addToGhostList(Box *box, int groupID) {
                ghostList[box].insert(groupID);
        }

        uint lvl;               // level identifier
        Box *gFirstBox;         // pointer to the global first box
        uint ngBoxes;           // number of global boxes
        Box *lFirstBox;         // pointer to the local first box
        uint nlBoxes;           // number of local boxes
        uint nlFlagged;         // number of local, flagged boxes

        uint minNumPart;        // minimum number of partitions for good balance

        std::map<Box*, std::set<int> > ghostList;       // ghostlist
};

#endif
