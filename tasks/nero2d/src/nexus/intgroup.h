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

#ifndef FMMTREE_H
#define FMMTREE_H

#include "pubbase.h"
#include "workpack.h"
#include <map>
#include <set>
#include <vector>

// ===========================================================================
// CLASS PROTOTYPES
// ===========================================================================

class Box;
class LevelData;
class Engine;
class IntGroup;
class LevelHandler;
class RecvMsg;
class Subtree;

// ============================================================================
// SUBTREE CLASS
// ============================================================================

class IntGroup
{
private:
        int groupID;            // identifier for this subtree

        SepTree sepTree;        // basis subtree == test subtree ?
        Subtree *basisSubtree;  // basis function subtree
        Subtree *testSubtree;   // test function subtree

        Point LL;               // lower left point for this subtree
        Point UR;               // upper right point for this subtree

        LevelData *ld;          // common level data for each level

        int nlAggLevels;        // number of local lowest-level dag levels
        int nlDagLevels;        // number of local lowest-level agg levels

        int nFarLevels;         // number of far interaction levels
        int nlFarLevels;        // number of local far interaction levels
        int blockJacobiLevel;   // block Jacobi preconditioner level

        LevelHandler **lh;      // level handler for each level

#ifdef HAVE_MPI
        MPI_Comm nearCommunicator;      // communicator for near ints
        MPI_Comm upCommunicator;        // communicator for upward pass
        MPI_Comm downCommunicator;      // communicator for downward pass
#endif

        // ====================================================================
        // TREE CONSTRUCTION
        // ====================================================================

        /**
         * Calculate and prepare the far interactions
         * @param calcAllRadPat Calculate all radiation patterns
         */
        void prepareFarInteractions(bool calcAllRadPat);

        // ====================================================================
        // FAR INTERACTIONS
        // ====================================================================

        /**
         * Recursively mark the boxes which participate in FMM interactions
         * @param p1 Pointer to a box
         * @param p2 Pointer to a box
         * @param lvl Level of p1 and p2
         */
        void recMarkFmmBoxes(Box *p1, Box *p2, int lvl);

public:
        /**
         * Constructor for the subtree
         * @param groupID Unique identifier for the interaction group
         * @param sepTree Seperate basis and test tree
         * @param basisSubtree Pointer to the basis function subtree
         * @param testSubtree Pointer to the test function subtree
         * @param LL Lower-left point of the surrounding bounding box
         * @param UR Upper-right point of the surrounding bounding box
         * @param groupID Identifier for the interaction group
         * @param ld Pointer to the level data
         */
        IntGroup(int groupID, SepTree sepTree, Subtree* basisSubtree,
                 Subtree* testSubtree, const Point& LL, const Point& UR,
                 LevelData *ld);

        /**
         * Destructor
         */
        ~IntGroup();

        // ====================================================================
        // TREE CONSTRUCTION
        // ====================================================================

        /**
         * Finalize the adding of the unknowns
         * @param blockJacobiLevel Block Jacobi level
         */
        void finalizeAddingUnknowns(int blockJacobiLevel);

        /**
         * Set the owner groups between [loLvl..hiLvl]
         * @param loLvl Lowest level to consider
         * @param hiLvl Highest level to consider
         * @param nPartitions Number of partitions
         */
        void setOwnerGroup(int loLvl, int hiLvl, int nPartitions);

        /**
         * Inherit the load balancing for this interaction group
         */
        void inheritLoadBalancing();

        // ====================================================================
        // NEAR AND FAR INTERACTION LISTS
        // ====================================================================

        /**
         * Recursively calculate the near interaction list of a target box
         * @param p Centre of the target box
         * @param targetLvl Level of the target box
         * @param boxCentre Centre of the box on the current path
         * @param parentLvl Level of the box on the current path
         * @param nList Boxes currently near to box on current path
         * @param cList Centres of boxes in nList
         */
        void recCalcNearIntList(const Point& p, int targetLvl, Point boxCentre,
                                int parentLvl, std::vector<Box*> &nList,
                                std::vector<Point> &cList) const;

        /**
         * Calculate the far interaction list of a certain box
         * @param box Pointer to a box
         * @param boxType Type of the box pointer (basis of test)
         * @param nearList Far interaction list of that box (output)
         */
        void calcFarIntList(const Box* box, TreeType boxType,
                            std::vector<Box*> &farList) const;

        // ====================================================================
        // FAR INTERACTIONS
        // ====================================================================

        /**
         * Prepare the far interactions for this FMM tree
         */
        void calculateFarInteractions();

        /**
         * Subdivide the far interactions into packages
         */
        void createFarIntPackages();

        // ====================================================================
        // MODIFIERS
        // ====================================================================

        /**
         * Set the level handler for a given interaction group and level
         * @param lvl Level for the handler
         * @param lh Pointer to the level handler
         */
        void setLevelHandler(int lvl, LevelHandler *lh);

        /**
         * Set a lowest level aggregation handler
         * @param lvl Identifier for the level
         * @param aggID Identifier for the aggregation
         * @param handler Pointer to the handler
         */
        void setLowLevAggHandler(uint lvl, uint aggID, AggHandler *handler);

        /**
         * Set a lowest level disaggregation handler
         * @param lvl Identifier for the level
         * @param dagID Identifier for the disaggregation
         * @param handler Pointer to the handler
         */
        void setLowLevDagHandler(uint lvl, uint dagID, DagHandler *handler);

        // ====================================================================
        // ACCESSORS
        // ====================================================================

        /**
         * Get the identifier for this interaction group
         * @return The identifier for this interaction group
         */
        int getGroupID() const { return groupID; }

        /**
         * Get the number of levels in this subtree
         * @return The number of levels in this subtree
         */
        uint getNumLevels() const;

        /**
         * Get the local number of agg levels in this subtree
         * @return The local number of agg levels in this subtree
         */
        uint getNumLocalAggLevels() const { return nlAggLevels; }

        /**
         * Get the local number of dag levels in this subtree
         * @return The local number of dag levels in this subtree
         */
        uint getNumLocalDagLevels() const { return nlDagLevels; }

        /**
         * Get the local number of far levels in this subtree
         * @return The local number of far levels in this subtree
         */
        uint getNumLocalFarLevels() const { return nlFarLevels; }

        /**
         * Get a reference to a lowest level aggregation
         * @param lvl Specifier for the level
         * @param aggID Specifier for the aggregation
         * @return A reference to a lowest level aggregation
         */
        lZAgg& getLowLevAgg(uint lvl, uint aggID) const;

        /**
         * Get a reference to a lowest level aggregation temporary
         * @param lvl Specifier for the level
         * @param aggID Specifier for the aggregation
         * @return A reference to a lowest level aggregation temporary
         */
        lZAggTemp& getLowLevAggTemp(uint lvl, uint aggID) const;

        /**
         * Get a reference to a lowest level disaggregation
         * @param lvl Specifier for the level
         * @param aggID Specifier for the disaggregation
         * @return A reference to a lowest level disaggregation
         */
        lZDag& getLowLevDag(uint lvl, uint dagID) const;

        /**
         * Get a reference to a lowest level disaggregation temporary
         * @param lvl Specifier for the level
         * @param aggID Specifier for the disaggregation
         * @return A reference to a lowest level disaggregation temporary
         */
        lZDagTemp& getLowLevDagTemp(uint lvl, uint dagID) const;

        /**
         * Check whether this subtree has far interactions
         * @return True of false
         */
        bool hasFarInteractions() { return nlFarLevels != 0; }

        /**
         * Get the number of lowest level aggregations
         * @param lvl Identifier for level
         * @return The number of lowest level aggregations
         */
        uint getNumLowLevAgg(int lvl) const;

        /**
         * Get the number of lowest level disaggregations 
         * @param lvl Identifier for level
         * @return The number of lowest level disaggregations
         */
        uint getNumLowLevDag(int lvl) const;

        /**
         * Get a pointer to a certain level handler
         * @param lvl Specifier for the level
         * @return A pointer to a certain level handler
         */
        LevelHandler* getLevelHandler(int lvl) const { return lh[lvl]; }

        /**
         * Check whether this interaction group physically contains a point
         * @param p Point under consideration
         * @return True of false
         */
        bool containsPoint(const Point& p) const;

#ifdef HAVE_MPI

        /**
         * Get the amount of communication
         * @param inSize Number of incoming bytes
         * @param outSize Number of outgoing bytes
         */
        void getCommSize(std::map<int, int> &inSize, 
                         std::map<int, int> &outSize) const;

        /**
         * Set the communication ID for the far interactions
         * @param nOutComms Number of outgoing communications (input/output)
         * @param nInComms Number of incomming communications (input/output)
         */
        void prepareCommunications(int &nOutComms, int &nInComms);

        /**
         * Set the communication ID for the far interactions
         * @param recvMsg Receive message (input/output)
         * @param msgInd Message index counter (input/output)
         */
        void storeInCommunications(RecvMsg *recvMsg, int &msgInd);
#endif
        friend class Engine;
        friend class LevelHandler;
};

#endif
