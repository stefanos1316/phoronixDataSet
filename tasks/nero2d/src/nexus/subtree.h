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

#ifndef SUBTREE_H
#define SUBTREE_H

#include "base.h"
#include <set>

// ===========================================================================
// CLASS PROTOTYPES
// ===========================================================================

class Box;
class Level;
class IntGroup;
class Tree;

// ===========================================================================
// TYPEDEFS
// ===========================================================================

typedef std::set<Box*> setBox;
typedef std::set<Box*>::iterator setBoxIt;

// ===========================================================================
// SUBTREE
// ===========================================================================

class Subtree
{
private:
        Point LL;               // lower left point for this subtree
        Point UR;               // upper right point for this subtree

        Box *root;              // pointer to the root of the tree
        Point rootCentre;       // centre of the root
        deci rootSize;          // size of the tree root

        Level *level;           // level for each level
        int nLevels;            // number of levels in the tree
        int lHighestLeafLvl;    // highest level containing a leaf

        setBox ghostList;       // set with ghostboxes
public:
        /**
         * Default constructor
         * @param LL Lower left point of the bounding box
         * @param UR Upper right point of the bounding box
         */
        Subtree(const Point &LL, const Point &UR);

        /**
         * Destructor
         */
        ~Subtree();

        // ====================================================================
        // TREE CONSTRUCTION
        // ====================================================================

        /**
         * Add a certain box to the ghost list
         * @param box Pointer to the box
         */
        void addToGhostList(Box* box) {
                ghostList.insert(box);
        }

        /**
         * Remove a certain box from the ghost list
         * @param box Pointer to the box
         */
        void removeFromGhostList(Box* box) {
                ghostList.erase(box);
        }

        /**
         * Check whether a box is contained in the ghost list
         * @param box Pointer to the box
         * @return True of false
         */
        bool findInGhostList(Box *box) {
                return (ghostList.find(box) != ghostList.end());
        }

        /**
         * Find a root for the subtree in the fmm tree
         * @param globalRoot Pointer to the root of the fmm tree
         * @param globalRootCentre Centre of the root in the fmm tree
         * @param globalRootSize Size of the root in the fmm tree
         * @param globalRootLevel Level of the root in the fmm tree
         */
        void findRoot(Box *globalRoot, const Point &globalRootCentre,
                      deci globalRootSize, int globalRootLevel);

        /**
         * Mark the boxes that belong to this subtree
         */
        void markSubtreeBoxes();

        /**
         * Remove all markations to the boxes
         */
        void removeAllMarks();

        /**
         * Set the owner groups between [loLvl..hiLvl]
         * @param loLvl Lowest level to consider
         * @param hiLvl Highest level to consider
         * @param nPartitions Number of partitions
         */
        void setOwnerGroup(int loLvl, int hiLvl, int nPartitions);

        // ====================================================================
        // AUXILIARY FUNCTIONS
        // ====================================================================

        /**
         * Get the centre of a certain box
         * @param box Pointer to the box
         * @param lvl Level of the box (optional)
         * @return Centre of the box
         */
        Point getBoxCentre(const Box *box, int lvl = -1) const;

        /**
         * Get the level of a certain box
         * @param box Pointer to the box
         * @return Level of the box
         */
        int getBoxLevel(const Box *box) const;

        /**
         * Check whether this interaction group physically contains a point
         * @param p Point under consideration
         * @return True of false
         */
        bool containsPoint(const Point& p) const;

        /**
         * Get the number of levels in this subtree
         * @return The number of levels in this subtree
         */
        uint getNumLevels() const { return nLevels; }

        /**
         * Get the local highest leaf level
         * @return The local highest leaf level
         */
        uint getLocalHighestLeafLevel() const { return lHighestLeafLvl; }

        friend class Tree;
        friend class IntGroup;
};

#endif
