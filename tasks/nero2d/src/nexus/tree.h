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

#ifndef TREE_H
#define TREE_H

#include "base.h"
#include <map>
#include <set>

// ===========================================================================
// CLASS PROTOTYPES
// ===========================================================================

class Box;
class Level;
class LevelData;
class LoadHandler;
class Subtree;

// ===========================================================================
// TYPE DEFINITIONS
// ===========================================================================

typedef std::map<int, Subtree*> MapST;
typedef std::map<int, Subtree*>::iterator MapSTIt;
typedef std::map<int, Subtree*>::const_iterator MapSTItC;

// ============================================================================
// TREE CLASS
// ============================================================================

class Tree
{
public:
        Box *root;                      // pointer to the root of the tree
        Point rootCentre;               // centre of the root
        deci rootSize;                  // size of the tree root

        MapST subTree;                  // map containing all subtrees

        Level *level;                   // level info for each level
        int nLevels;                    // number of levels in the tree

        int nUnknowns;                  // total number of unknowns
        int nlUnknowns;                 // local number of unknowns

        int *procOffset;                // unknown offset for a processor

        /**
         * Default constructor
         */
        Tree() : root(NULL), rootSize(0), level(NULL), nLevels(0),
                nUnknowns(0), nlUnknowns(0), procOffset(NULL) {}

        /**
         * Create a tree
         * @param rootCentre Centre of the root box
         * @param rootSize Size of the root box
         * @param nLevels Number of levels in the tree
         */
        Tree(const Point &rootCentre, deci rootSize, int nLevels);

        /**
         * Destructor
         */
        ~Tree();

        // ====================================================================
        // TREE CONSTRUCTION
        // ====================================================================

        /**
         * Create a new subtree inside the FMM tree
         * @param groupID Identifier for the interaction group
         * @param LL Lower left point of the boundary box
         * @param UR Upper right point of the boundary box
         * @return Pointer to the subtree corresponding with the intgroup
         */
        Subtree* createSubtree(int groupID, const Point &LL, const Point &UR);

        /**
         * Delete a subtree from the tree structure
         * @param groupID Identifier for the interaction group
         */
        void deleteSubtree(int groupID);

        /**
         * Delete a non-connected subtree from the ghostlist
         * @param box Pointer to the subtree
         * @param lvl Level of the box
         */
        void recPruneGhostList(Box *box, int lvl);

        /**
         * Recursively add an unknown to a parent box
         * @param par Pointer to the parent box
         * @param pCentre Centre of the parent box
         * @param pSize Size of the parent box
         * @param lvl Level of the parent box
         * @param p Centre of the unknown
         * @param targetLvl Target level to place the unknown
         * @param intGroupSet Set of groupID's which associated with the unknown
         */
        void recAddUnknown(Box* par, const Point& pCentre, deci pSize, int lvl,
                           const Point& p, int targetLvl,
                           std::set<int> &intGroupSet);

        /**
         * Add an unknown to the tree
         * @param r Centre of the unknown
         * @param nID Number of interaction groups to add unknown to
         * @param listID List of identifiers for the interaction group
         * @param targetLvl Target level to place the unknown
         */
        void addUnknown(const Point& r, int nID, const int *listID,
                        int targetLvl);

        /**
         * Check whether a certain unknown is local or not
         * @param r Centre of basis function of unknown
         * @return True of false
         */
        bool isLocal(const Point& r) const;

        /**
         * Get the owner of a certain unknown
         * @param r Centre of the basis function of the unknown
         * @return The owner of this unknown [0..nProc-1]
         */
        int getOwner(const Point&r) const;

        /**
         * Get the index to which a certain unknown is referred
         * @param r Centre of basis function of unknown
         * @return The index to which a certain support is referred. Negative
         *         if the support is not local
         */
        int getUnknownIndex(const Point &r);

        /**
         * Post adding unknowns
         */
        void finalizeAddingUnknowns();

        /**
         * Search the tree for the leaf box which contains a certain point p
         * @param p Point p
         * @return Pointer to the box which contains p
         */
        Box *findLeaf(const Point& p) const;

        /**
         * Do the load balancing
         * @param loadHandler Handler for load partitioning
         * @param ld Pointer to the level data
         * @param nNearLevels Number of near interaction levels
         */
        void doLoadBalancing(LoadHandler *loadHandler, LevelData *ld,
                             int nNearLevels);

        /**
         * Calculate the unknown offset for the near interactions
         */
        void calcUnknownOffset(int nNearLevels);

        /**
         * Recursively calculate the unknown offset for this box
         * @param box Pointer to a box
         * @param unknownOffset Unknown offset for this box (input/output)
         */
        void recCalcUnknownOffset(Box* box, uint &unknownOffset);

        /**
         * Recursively set the unknown offset for this box
         * @param box Pointer to a box
         * @param unknownOffset Unknown offset for this box (input)
         */
        void recSetUnknownOffset(Box *box, uint unknownOffset);

        // ====================================================================
        // AUXILIARY FUNCTIONS
        // ====================================================================

        /**
         * Get the level of a certain box
         * @param box Pointer to the box
         * @return Level of the box
         */
        int getBoxLevel(const Box *box) const;

        /**
         * Get the centre of a certain box
         * @param box Pointer to the box
         * @param lvl Level of the box (optional)
         * @return Centre of the box
         */
        Point getBoxCentre(const Box *box, int lvl = -1) const;

        /**
         * Set the unknown offset for the local boxes
         * @param nNearLevels Number of near interaction levels
         */
        void setLocalUnknownOffset(int nNearLevels);
};

#endif
