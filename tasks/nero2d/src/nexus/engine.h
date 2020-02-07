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

#ifndef ENGINE_H
#define ENGINE_H

#include "base.h"
#include "workpack.h"
#include "message.h"
#include "queue.h"
#include <vector>
#include <map>
#include <set>

// ===========================================================================
// CLASS PROTOTYPES
// ===========================================================================

class Box;
class LevelData;
class RecvMsg;
class IntGroup;
class Tree;
class LoadHandler;

// ===========================================================================
// TYPEDEFS
// ===========================================================================

typedef std::vector<Box*>::iterator BoxIt;
typedef std::map<int, IntGroup*> MapIG;
typedef std::map<int, IntGroup*>::iterator MapIGIt;
typedef std::map<int, IntGroup*>::const_iterator MapIGItC;

// ============================================================================
// ENGINE CLASS
// ============================================================================

class Engine
{
private:
        Tree *basisTree;                // basis function tree
        Tree *testTree;                 // test function tree
        SepTree sepTree;                // basis tree == test tree ?

        LevelData *ld;                  // level data for each level

        MapIG intGroup;                 // map with all interaction groups

        int blockJacobiLevel;           // block jacobi preconditioner level

        int nNearLevels;                // number of near interaction levels

        // NEAR INTERACTIONS
        int nNearIntHandlers;           // number of near handlers
        std::map<int, int> nNearInt;    // number of near ints per src proc
        std::map<int, Train<NearPack> > nearTrain; // near train for each proc
        Train<NearPack> *locNearTrain;  // pointer to the local near train
        NearMetaData *nearMetaData;     // near interaction meta data

        NearInt *nearInt;               // actual near interaction
        NearIntTemp *nearIntTemp;       // temporary storage for nearInt

        // PARALLEL SOLVING
        Queue<NearPack> nearQueue;              // queue for near interactions
        Queue<lZAggPack> levZeroAggQueue;       // L0 aggregation queue
        Queue<AggPack> aggQueue;                // higher level agg queue
        Queue<TranslPack> translQueue;          // queue for transl int
        Queue<TranslPack> idleTranslQueue;      // queue for idle transl int
        Queue<DagPack> dagQueue;                // higher level agg queue
        Queue<lZDagPack> levZeroDagQueue;       // L0 disaggregation queue

        bool canCalculate;                      // priority queue is non-empty

        std::map<int, InComm> nearInComm;       // comm pattern for near int
        std::map<int, OutComm> nearOutComm;     // comm pattern for near int

#ifdef HAVE_MPI
        int nInComms;                           // number of ingoing comms
        int nOutComms;                          // number of outgoing comms
        int nPendingRecvs;                      // number of pending receives
        int nPendingSends;                      // number of pending sends
        MPI_Status *status;                     // statuses for sends/recvs
        int *indices;                           // indices for recvs/sends
        RecvMsg *recvMsg;                       // received messages

        MPI_Comm nearCommunicator;              // communicator for near ints
        MPI_Comm upCommunicator;                // communicator for upward pass
        MPI_Comm downCommunicator;              // communicator for down pass
#endif

#ifdef USE_MPE
        int eventB[14];                         // begin events for MPE
        int eventE[14];                         // end events for MPE
#endif

        // ====================================================================
        // NEAR INTERACTIONS
        // ====================================================================

        /**
         * Recursively set the owners for the boxes that have near interactions
         * @param box Pointer to the current box
         * @param lvl Level of the box
         * @param currProc Current process
         * @param weightSoFar Weight of the currProc so far
         * @param targetWeight Target weight for each process
         */
        static void recSetNearIntOwner(Box *box, int lvl, int &currProc,
                                       double &weightSoFar,
                                       double targetWeight);

        // ====================================================================
        // MATRIX VECTOR PRODUCT
        // ====================================================================

        /**
         * Prepare a matrix vector product V = Z*U
         * @param U Source vector
         * @param V Destination vector
         */
        void prepareMatvec(const cplx *U, cplx *V);

        /**
         * Pop top work package from priority queue and process it
         * @param U Unknown vector U
         * @param V Destination vector V
         */
        void processWorkPackage(const cplx *U, cplx *V);

        /**
         * Perform a parallel matrix-vector multiplication V = X+P*R*U
         * @param U U Vector
         * @param V V Vector
         */
        void parallelMatrixVector(cplx *U, cplx *V);

public:
        /**
         * Default constructor
         */
        Engine();

        /**
         * Delete the tree and its boxes
         */
        ~Engine();

        // ====================================================================
        // TREE CONSTRUCTION
        // ====================================================================

        /**
         * Create the actual trees
         * @param rootCentre Centre of the tree
         * @param rootSize Size of the tree
         * @param nLevels Number of levels in the tree
         * @param sepTree Separate basis and test tree
         */
        void createTree(const Point &rootCentre, deci rootSize,
                        int nLevels, SepTree sepTree);

        /**
         * Create a new interaction group inside the FMM tree
         * @param LL Lower-left point of the surrounding bounding box
         * @param UR Upper-right point of the surrounding bounding box
         * @param groupID Identifier for the interaction group
         */
        void createInteractionGroup(const Point& LL, const Point& UR,
                                    int groupID);

        /**
         * Set the fmm interaction limits for this 
         * @param lvl Level under consideration
         * @param minXDist Minimal separation (in boxsize units) for FMM
         * @param maxXDist Maximimal separation (in boxsize units) for FMM
         */
        void setFmmLimits(int lvl, deci minXDist, deci maxXDist = -1);

        /**
         * Set the block Jacobi level
         * @param blockJacobiLevel Block Jacobi level
         */
        void setBlockJacobiLevel(int blockJacobiLevel);

        /**
         * Set the minimal partition level
         * @param minPartLevel Minimal parititon level
         */
        void setMinimalPartitionLevel(int minPartLevel);

        /**
         * Add an unknown to the tree
         * @param r Centre of the unknown
         * @param nID Number of interaction groups to add unknown to
         * @param listID List of identifiers for the interaction group
         * @param targetLvl Target level to place the unknown
         * @param treeType Identifier for the tree
         */
        void addUnknown(const Point& r, int nID, const int *listID,
                        int targetLvl, TreeType treeType);

        /**
         * Check whether a certain unknown is local or not
         * @param r Centre of the basis function of the unknown
         * @param treeType Identifier for the tree
         * @return True of false
         */
        bool isLocal(const Point& r, TreeType treeType) const;

        /**
         * Get the owner of a certain unknown
         * @param r Centre of the basis function of the unknown
         * @param treeType Identifier for the tree
         * @return The owner of this unknown [0..nProc-1]
         */
        int getOwner(const Point&r, TreeType treeType) const;

        /**
         * Get the index to which a certain unknown is referred
         * @param r Centre of basis function of unknown
         * @param treeType Identifier for the tree
         * @return The index to which a certain support is referred. Negative
         *         if the support is not local
         */
        int getUnknownIndex(const Point &r, TreeType treeType);

        /**
         * Post adding unknowns
         */
        void finalizeAddingUnknowns();

        /**
         * Do the load balancing
         * @param loadHandler Handler for load partitioning
         * @param calcAllRadPat Calculate all the radiation patterns
         * @return The local number of unknowns
         */
        int doLoadBalancing(LoadHandler *loadHandler, bool calcAllRadPat);

        /**
         * Free the memory associated with the MLFMA tree
         */
        void deleteTree();

        /**
         * Post-local index retreival
         */
        void prepareMatrixVector();

        // ====================================================================
        // NEAR INTERACTIONS
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
         * Calculate the near interaction list of a certain box
         * @param box Pointer to a box
         * @param boxType Type of the box pointer (basis of test)
         * @param nearList Near interaction list of that box (output)
         */
        void calcNearIntList(const Box* box, TreeType boxType,
                             std::vector<Box*> &nearList) const;

        /**
         * Set the unknown offset for the local boxes
         */
        void setLocalUnknownOffset();

        /**
         * Recursively mark the boxes which have near interactions
         * @param p1 Pointer to a box
         * @param p2 Pointer to a box
         * @param lvl Level of p1 and p2
         */
        void recMarkNearBoxes(Box *p1, Box *p2, int lvl);

        /**
         * Recursively count the number of near interactions
         * @param box Test box under consideration
         */
        void recCountNearInteractions(Box *box);

        /**
         * Recursively count the number of outgoing near communications
         * @param box Basis box under consideration
         * @param sL Set of processes to which this box is already sent
         */
        void recCountNearSendComm(Box *box, std::set<int> sL);

        /**
         * Recursively store the number of near interactions
         * @param box Test box under consideration
         * @param index Index in nearInt for each process
         */
        void recStoreNearInteractions(Box *box, std::map<int, int> &index);

        /**
         * Recursively store the outgoing near communications
         * @param box Basis box under consideration
         * @param sL Set of processes to which this box is already sent
         * @param cIndex Index in nearComm for each process
         */
        void recStoreNearSendComm(Box *box, std::set<int> sL,
                                  std::map<int, int> &cIndex);

        /**
         * Prepare the near interactions handling
         */
        void prepareNearInteractions();

        /**
         * Set the near interactions handler for a near interaction
         * @param nearID Identifier for the near int handler
         * @param nih Pointer to the near int handler
         */
        void setNearIntHandler(int nearID, NearIntHandler *nih);

        /**
         * Subdivide the near interactions into packages
         */
        void createNearInteractionPackages();

#ifdef HAVE_MPI
        /**
         * Set the communication ID for the near interactions
         * @param nOutComms Number of outgoing communications (input/output)
         * @param nInComms Number of incomming communications (input/output)
         */
        void prepareNearCommunications(int &nOutComms, int &nInComms);

        /**
         * Copy and post the messages for near interaction communication
         * @param U Pointer to the source vector
         * @return The number of messages posted
         */
        int postNearIntSend(const cplx *U);

        /**
         * Post the receives for near interaction communication
         * @return The number of receives posted
         */
        int postNearIntRecv();
#endif
        // ===================================================================
        // MATVEC: WORK PACKAGE CALCULATION
        // ===================================================================

        /**
         * Schedule a translation train of packages
         * @param lvl Level associated with the work package
         * @param el Translation train itself
         * @param back Add the package to the back or to the front
         */
        void addTranslation(int lvl, Train<TranslPack>* el, bool back);

        /**
         * Process one near interaction work package
         * @param U Source vector
         * @param V Destination vector
         * @param nearPackage Near package to process
         * @param md Near interaction meta data
         */
        void processNearIntPackage(const cplx *U, cplx *V,
                                   NearPack *nearPackage, 
                                   const NearMetaData &md);

        /**
         * Process one translation work package
         * @param translWP Translation work package
         * @param md Translation meta data
         */
        void processTranslPack(TranslPack *translWP, const TranslMetaData &md);

        /**
         * Process one level zero aggregation work package
         * @param U Source vector
         * @param aggWP Level zero aggregation package to process
         * @param md Level zero aggregation meta data
         */
        void processlZAggPack(const cplx *U, lZAggPack *aggWP, 
                              const LZAggMetaData &md);

        /**
         * Process a higher level aggregation work package
         * @param aggWP Higher aggregation package to process
         * @param IntMetaData Meta data associated with this train
         */
        void processHigherLevAggPack(AggPack *aggWP, const IntMetaData &md);

        /**
         * Process one level zero disaggregation work package
         * @param V Destination vector
         * @param dagWP Level zero disaggregation package to process
         * @param md Level zero disaggregation meta data
         */
        void processlZDagPack(cplx *V, lZDagPack *dagWP, 
                              const LZDagMetaData &md);

        /**
         * Process a higher level disaggregation work package
         * @param dagWP Higher disaggregation package to process
         * @param IntMetaData Meta data associated with this train
         */
        void processHigherLevDagPack(DagPack *dagWP, const IntMetaData &md);

        // ====================================================================
        // MATRIX VECTOR PRODUCT
        // ====================================================================

        /**
         * Perform a parallel matrix-vector multiplication V = Z*U
         * @param U U Pre-allocated input vector U
         * @param V V Pre-allocated output vector V
         */
        void parallelMatrixVector(const cplx *U, cplx *V);

#ifdef HAVE_MPI
        /**
         * Process a received message and take appropriate action
         * @param msg Message that is received
         * @param srcProc Originating process
         */
        void processMessage(const RecvMsg &msg, int srcProc, int ID);
#endif

        // ====================================================================
        // ACCESSORS
        // ====================================================================

        /**
         * Get the number of levels
         * @return The number of levels in the tree
         */
        int getNumLevels();

        /**
         * Get an iterator pointing to the first interaction group
         * @return An iterator pointing to the first element
         */
        MapIGIt getFirstIntGroup() { return intGroup.begin(); }

        /**
         * Get an iterator point to the last subtree
         * @return An iterator pointing to the last element
         */
        MapIGIt getLastIntGroup() { return intGroup.end(); }

        /**
         * Get the size of the box at a certain level
         * @param lvl Level under consideration
         * @return Size of the box
         */
        deci getBoxSize(int lvl);

        /**
         * Return the number of near interaction handlers
         * @return The number of near interaction handlers
         */
        int getNumNearIntHandlers() const { return nNearIntHandlers; }

        /**
         * Return a reference to a near interaction
         * @param nearID Identifier for the near interaction
         * @return A reference to a near interaction
         */
        NearInt& getNearInt(int nearID) { return nearInt[nearID]; };

        /**
         * Return a reference to a near interaction temporary
         * @param nearID Identifier for the near interaction temporary
         * @return A reference to a near interaction temporary
         */
        NearIntTemp& getNearIntTemp(int nearID) { return nearIntTemp[nearID]; };

        /**
         * Get the number of local unknowns per process
         * @param nlUnknowns Number of local unknowns per process (output)
         * @param treeType Type of the tree (basis/test tree)
         */
        void getNumLocalUnknowns(std::vector<int> &nlUnknowns,
                                 TreeType treetype) const;

#ifdef HAVE_MPI

        // ====================================================================
        // COMMUNICATIONS
        // ====================================================================

        /**
         * Get the amount of communication
         * @param inSize Number of incoming bytes
         * @param outSize Number of outgoing bytes
         */
        void getCommSize(std::map<int, int> &inSize, 
                         std::map<int, int> &outSize) const;

        /**
         * Allocate memory for all communication structures
         */
        void prepareCommunications();
#endif

        // ====================================================================
        // AUXILIARY FUNCTIONS
        // ====================================================================

        /**
         * Calculate the number of levels in a tree
         * @param LL Lower left of the bounding box
         * @param UR Upper right of the bounding box
         * @param minBoxSize Level zero box size
         * @return The number of levels
         */
        static int calcNumLevels(const Point& LL, const Point& UR,
                                 deci minBoxSize);

        /**
         * Calculate the minimal box size of a tree
         * @param LL Lower left of the bounding box
         * @param UR Upper right of the bounding box
         * @param nLevels The number of levels
         * @return Level zero box size
         */
        static deci calcMinBoxSize(const Point& LL, const Point& UR,
                                   int nLevels);
};

#endif
