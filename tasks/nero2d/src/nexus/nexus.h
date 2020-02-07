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

#ifndef NEXUS_H
#define NEXUS_H

#include "pubbase.h"
#include "util.h"
#include "iterel.h"
#include "loadhandler.h"

#include <vector>

// ============================================================================
// LOWEST LEVEL AGGREGATION ITERATOR
// ============================================================================

class LevZeroAggIterator {

private:
        LowLevAggItEl curr;            // current element in the iterator

public:
        /**
         * Default constructor
         */
        LevZeroAggIterator() : curr() {};

        /**
         * Constructor
         * @param engine Pointer to the fmm tree
         * @param st Map iterator pointing to certain intGroup
         */
        LevZeroAggIterator(Engine *engine,
                           std::map<int, IntGroup*>::iterator st) :
                curr(engine, st) {};

        /**
         * Pre-Increment operator
         * @return LevZeroAggIterator after the increment
         */
        LevZeroAggIterator& operator++() {
                ++curr;
                return *this;
        }

        /**
         * Post-Increment operator
         * @return LevZeroAggIterator after the increment
         */
        LevZeroAggIterator operator++(int) {
                LevZeroAggIterator tmp = *this;
                ++curr;
                return tmp;
        }

        /**
         * Dereference operation
         * @return Element to which the iterator is currently pointing
         */
        LowLevAggItEl operator*() {
                return curr;
        }

        /**
         * Pointer operation
         * @return Pointer to the current element in the iterator
         */
        LowLevAggItEl* operator->() {
                return &curr;
        }

        friend bool operator==(const LevZeroAggIterator &lhs,
                               const LevZeroAggIterator &rhs);
        friend bool operator!=(const LevZeroAggIterator &lhs,
                               const LevZeroAggIterator &rhs);
};

inline bool operator==(const LevZeroAggIterator &lhs,
                       const LevZeroAggIterator &rhs)
{
        return (lhs.curr == rhs.curr);
}

inline bool operator!=(const LevZeroAggIterator &lhs,
                       const LevZeroAggIterator &rhs)
{
        return (lhs.curr != rhs.curr);
}

// ============================================================================
// LOWEST LEVEL DISAGGREGATION ITERATOR
// ============================================================================

class LevZeroDagIterator {

private:
        LowLevDagItEl curr;            // current element in the iterator

public:
        /**
         * Default constructor
         */
        LevZeroDagIterator() : curr() {};

        /**
         * Constructor
         * @param engine Pointer to the fmm tree
         * @param st Map iterator pointing to certain intGroup
         */
        LevZeroDagIterator(Engine *engine,
                           std::map<int, IntGroup*>::iterator st) :
                curr(engine, st) {};

        /**
         * Pre-Increment operator
         * @return LevZeroAggIterator after the increment
         */
        LevZeroDagIterator& operator++() {
                ++curr;
                return *this;
        }

        /**
         * Post-Increment operator
         * @return LevZeroAggIterator after the increment
         */
        LevZeroDagIterator operator++(int) {
                LevZeroDagIterator tmp = *this;
                ++curr;
                return tmp;
        }

        /**
         * Dereference operation
         * @return Element to which the iterator is currently pointing
         */
        LowLevDagItEl operator*() {
                return curr;
        }

        /**
         * Pointer operation
         * @return Pointer to the current element in the iterator
         */
        LowLevDagItEl* operator->() {
                return &curr;
        }

        friend bool operator==(const LevZeroDagIterator &lhs,
                               const LevZeroDagIterator &rhs);
        friend bool operator!=(const LevZeroDagIterator &lhs,
                               const LevZeroDagIterator &rhs);
};

inline bool operator==(const LevZeroDagIterator &lhs,
                       const LevZeroDagIterator &rhs)
{
        return (lhs.curr == rhs.curr);
}

inline bool operator!=(const LevZeroDagIterator &lhs,
                       const LevZeroDagIterator &rhs)
{
        return (lhs.curr != rhs.curr);
}

// ============================================================================
// TRANSLATION ITERATOR
// ============================================================================

class TranslIterator {

private:
        TranslItEl curr;            // current element in the iterator

public:
        /**
         * Constructor
         * @param engine Pointer to the fmm tree
         * @param st Map iterator pointing to certain intGroup
         */
        TranslIterator(Engine *engine, std::map<int, IntGroup*>::iterator st) :
                curr(engine, st) {};

        /**
         * Pre-Increment operator
         * @return TranslIterator after the increment
         */
        TranslIterator& operator++() {
                ++curr;
                return *this;
        }

        /**
         * Post-Increment operator
         * @return TranslIterator after the increment
         */
        TranslIterator operator++(int) {
                TranslIterator tmp = *this;
                ++curr;
                return tmp;
        }

        /**
         * Dereference operation
         * @return Element to which the iterator is currently pointing
         */
        TranslItEl operator*() {
                return curr;
        }

        /**
         * Pointer operation
         * @return Pointer to the current element in the iterator
         */
        TranslItEl* operator->() {
                return &curr;
        }

        friend bool operator==(const TranslIterator &lhs,
                               const TranslIterator &rhs);
        friend bool operator!=(const TranslIterator &lhs,
                               const TranslIterator &rhs);
};

inline bool operator==(const TranslIterator &lhs, const TranslIterator &rhs)
{
        return (lhs.curr == rhs.curr);
}

inline bool operator!=(const TranslIterator &lhs, const TranslIterator &rhs)
{
        return (lhs.curr != rhs.curr);
}

// ============================================================================
// LEVEL ITERATOR
// ============================================================================

class LevelIterator {

private:
        LevelItEl curr;            // current element in the iterator

public:
        /**
         * Default constructor
         */
        LevelIterator() : curr() {};

        /**
         * Constructor
         * @param engine Pointer to the fmm tree
         * @param st Map iterator pointing to certain intGroup
         */
        LevelIterator(Engine *engine, std::map<int, IntGroup*>::iterator st) :
                curr(engine, st) {};

        /**
         * Pre-Increment operator
         * @return LevelIterator after the increment
         */
        LevelIterator& operator++() {
                ++curr;
                return *this;
        }

        /**
         * Post-Increment operator
         * @return LevelIterator after the increment
         */
        LevelIterator operator++(int) {
                LevelIterator tmp = *this;
                ++curr;
                return tmp;
        }

        /**
         * Dereference operation
         * @return Element to which the iterator is currently pointing
         */
        LevelItEl operator*() {
                return curr;
        }

        /**
         * Pointer operation
         * @return Pointer to the current element in the iterator
         */
        LevelItEl* operator->() {
                return &curr;
        }

        friend bool operator==(const LevelIterator &lhs,
                               const LevelIterator &rhs);
        friend bool operator!=(const LevelIterator &lhs,
                               const LevelIterator &rhs);
};

inline bool operator==(const LevelIterator &lhs, const LevelIterator &rhs)
{
        return (lhs.curr == rhs.curr);
}

inline bool operator!=(const LevelIterator &lhs, const LevelIterator &rhs)
{
        return (lhs.curr != rhs.curr);
}

// ============================================================================
// INTERPOLATION ITERATOR
// ============================================================================

class IntpolIterator {

private:
        IntpolItEl curr;            // current element in the iterator

public:
        /**
         * Default constructor
         */
        IntpolIterator() : curr() {};

        /**
         * Constructor
         * @param engine Pointer to the fmm tree
         * @param st Map iterator pointing to certain intGroup
         */
        IntpolIterator(Engine *engine, std::map<int, IntGroup*>::iterator st) :
                curr(engine, st) {};

        /**
         * Pre-Increment operator
         * @return IntpolIterator after the increment
         */
        IntpolIterator& operator++() {
                ++curr;
                return *this;
        }

        /**
         * Post-Increment operator
         * @return LevelIterator after the increment
         */
        IntpolIterator operator++(int) {
                IntpolIterator tmp = *this;
                ++curr;
                return tmp;
        }

        /**
         * Dereference operation
         * @return Element to which the iterator is currently pointing
         */
        IntpolItEl operator*() {
                return curr;
        }

        /**
         * Pointer operation
         * @return Pointer to the current element in the iterator
         */
        IntpolItEl* operator->() {
                return &curr;
        }

        friend bool operator==(const IntpolIterator &lhs,
                               const IntpolIterator &rhs);
        friend bool operator!=(const IntpolIterator &lhs,
                               const IntpolIterator &rhs);
};

inline bool operator==(const IntpolIterator &lhs, const IntpolIterator &rhs)
{
        return (lhs.curr == rhs.curr);
}

inline bool operator!=(const IntpolIterator &lhs, const IntpolIterator &rhs)
{
        return (lhs.curr != rhs.curr);
}

// ============================================================================
// NEAR INTERACTION ITERATOR
// ============================================================================

class NearIntIterator {

private:
        NearIntItEl curr;            // current element in the iterator

public:
        /**
         * Constructor
         * @param engine Pointer to the engine class
         * @param nearID near interaction ID
         */
        NearIntIterator(Engine *engine, int nearID) :
                curr(engine, nearID) {};

        /**
         * Pre-Increment operator
         * @return NearIntIterator after the increment
         */
        NearIntIterator& operator++() {
                ++curr;
                return *this;
        }

        /**
         * Post-Increment operator
         * @return LevelIterator after the increment
         */
        NearIntIterator operator++(int) {
                NearIntIterator tmp = *this;
                ++curr;
                return tmp;
        }

        /**
         * Dereference operation
         * @return Element to which the iterator is currently pointing
         */
        NearIntItEl operator*() {
                return curr;
        }

        /**
         * Pointer operation
         * @return Pointer to the current element in the iterator
         */
        NearIntItEl* operator->() {
                return &curr;
        }

        friend bool operator==(const NearIntIterator &lhs,
                               const NearIntIterator &rhs);
        friend bool operator!=(const NearIntIterator &lhs,
                               const NearIntIterator &rhs);
};

inline bool operator==(const NearIntIterator &lhs, const NearIntIterator &rhs)
{
        return (lhs.curr == rhs.curr);
}

inline bool operator!=(const NearIntIterator &lhs, const NearIntIterator &rhs)
{
        return (lhs.curr != rhs.curr);
}

// ============================================================================
// NEXUS CLASS
// ============================================================================

class Nexus
{
private:
        char procName[MAX_PROCESSOR_NAME];      // processor name
        Engine *engine;                       // private Fmm Tree object

        // Copy constructors must be kept private because each object is
        // unique due to unique MPI_COMM_WORLD communicator
        Nexus(const Nexus&);                    // private copy-constructor
        void operator=(const Nexus&);           // private assignment operator

public:
        /**
         * Default constructor, MPI must be initialized
         */
        Nexus();

        /**
         * Destructor (not virtual)
         */
        ~Nexus();

        /**
         * Initialize MPI
         * @param argc Pointer to the argument count number
         * @param argv[] Pointer to the argument list
         */
        static void initMPI(int *argc, char **argv[]);

        /**
         * Destroy MPI
         */
        static void destroyMPI();

        // ====================================================================
        // ACCESSORS
        // ====================================================================

        /**
         * Get the identifier of the current process
         * @return Identifier of the current process
         */
        int getProcessID() const;

        /**
         * Get the number of parallel processes
         * @return The number of parallel processes
         */
        int getNumProcesses() const;

        /**
         * Get the process name
         * @return String containing the process name
         */
        std::string getProcessName() const;

        /**
         * Get the amount of communication
         * @param inSize Number of incoming bytes (output)
         * @param outSize Number of outgoing bytes (output)
         */
        void getCommSize(std::map<int, int> &inSize,
                         std::map<int, int> &outSize) const;

        /**
         * Get the number of local unknowns per process
         * @param nlUnknowns Number of local unknowns per process (output)
         * @param treeType Type of tree (basis/test)
         */
        void getNumLocalUnknowns(std::vector<int> &nlUnknowns,
                                 TreeType treeType) const;

        // ====================================================================
        // USER CALLABLE FUNCTIONS
        // ====================================================================

        /**
         * Call this prior to creating interaction groups
         * @param LL Lower left point of the global geometry
         * @param UR Upper right point of the global geometry
         * @param minBoxSize Level zero box size
         * @param sepTree Separate basis and test tree
         * @return The number of levels
         */
        int prepareAddingUnknowns(const Point& LL, const Point& UR,
                                  deci minBoxSize, SepTree sepTree);

        /**
         * Call this prior to creating interaction groups
         * @param LL Lower left point of the global geometry
         * @param UR Upper right point of the global geometry
         * @param nLevels The number of levels
         * @param sepTree Separate basis and test tree
         * @return Level zero box size
         */
        deci prepareAddingUnknowns(const Point& LL, const Point& UR,
                                   int nLevels, SepTree sepTree);

        /**
         * Set the fmm interaction limits for this 
         * @param lvl Level under consideration
         * @param minXDist Minimal separation (in boxsize units) for FMM
         * @param maxXDist Maximimal separation (in boxsize units) for FMM
         */
        void setFmmLimits(int lvl, deci minXDist, deci maxXDist = -1);

        /**
         * Set the block Jacobi level
         * @param blockJacobiLevel The block Jacobi level
         */
        void setBlockJacobiLevel(int blockJacobiLevel);

        /**
         * Set the minimal partition level
         * @param minPartLevel Minimal parititon level
         */
        void setMinimalPartitionLevel(int minPartLevel);

        /**
         * Create a group with interacting unknowns
         * @param groupID Unique identifier for this group
         * @param LL Lower-left point of the surrounding bounding box
         * @param UR Upper-right point of the surrounding bounding box
         */
        void createInteractionGroup(int groupID, const Point& LL,
                                    const Point& UR);

        /**
         * Add an unknown to one or two interaction lists
         * @param r Centre of basis function of unknown
         * @param nID Number of interaction groups to add the unknown to
         * @param listID List of interaction group ID's
         * @param targetLvl Lowest level in which to add the unknown
         * @param treeType Which tree to add the unkown
         */
        void addUnknown(const Point& r, int nID,
                        const int *listID, int targetLvl = 0,
                        TreeType treeType = TREE_BASIS);

        /**
         * Post-geometry adding: call this when all geometry has been added
         */
        void finalizeAddingUnknowns();

        /**
         * Do the load balancing
         * @param calcAllRadPat Calculate all the radiation patterns
         * @param loadHandler Handler for the load balancing
         * @return The number of local unknowns
         */
        int doLoadBalancing(bool calcAllRadPat = false,
                            LoadHandler *loadHandler = NULL);

        /**
         * Check whether a certain unknown is local or not
         * @param r Centre of basis function of unknown
         * @param treeType Identifier for the tree
         * @return True of false
         */
        bool isLocal(const Point &r, TreeType treeType = TREE_BASIS) const;

        /**
         * Get the owner of a certain unknown
         * @param r Centre of the basis function of the unknown
         * @param treeType Identifier for the tree
         * @return The owner of this unknown [0..nProc-1]
         */
        int getOwner(const Point&r, TreeType treeType = TREE_BASIS) const;

        /**
         * Get the index to which a certain unknown is referred
         * @param r Centre of basis function of unknown
         * @param treeType Identifier for the tree
         * @return The index to which a certain support is referred. Negative
         * if the support is not local
         */
        int getUnknownIndex(const Point &r, TreeType treeType = TREE_BASIS);

        // ====================================================================
        // PARALLEL SOLVING
        // ====================================================================

        /**
         * Delete the memory associated with the MLFMA tree
         */
        void deleteTree();

        /**
         * Post-local index retreival
         */
        void prepareMatrixVector();

        /**
         * Perform a parallel matrix-vector multiplication V = Z*U
         * @param U U Pre-allocated input vector U
         * @param V V Pre-allocated output vector V
         */
        void parallelMatrixVector(const cplx *U, cplx *V);

        // ====================================================================
        // ITERATORS
        // ====================================================================

        /**
         * Get the aggregation iterator pointing to the first element
         * @return The aggregation iterator pointing to the first element
         */
        const LevZeroAggIterator getLevZeroAggBegin();

        /**
         * Get the aggregation iterator pointing past the final element
         * @return The aggregation iterator pointing past the final element
         */
        const LevZeroAggIterator getLevZeroAggEnd();

        /**
         * Get the disaggregation iterator pointing to the first element
         * @return The disaggregation iterator pointing to the first element
         */
        const LevZeroDagIterator getLevZeroDagBegin();

        /**
         * Get the disaggregation iterator pointing past the final element
         * @return The disaggregation iterator pointing past the final element
         */
        const LevZeroDagIterator getLevZeroDagEnd();

        /**
         * Get the translation iterator pointing to the first element
         * @return The translation iterator pointing to the first element
         */
        const TranslIterator getTranslBegin();

        /**
         * Get the translation iterator pointing past the final element
         * @return The translation iterator pointing past the final element
         */
        const TranslIterator getTranslEnd();

        /**
         * Get the level iterator pointing to the first element
         * @return The level iterator pointing to the first element
         */
        const LevelIterator getLevelBegin();

        /**
         * Get the level iterator pointing past the final element
         * @return The level iterator pointing past the final element
         */
        const LevelIterator getLevelEnd();

        /**
         * Get the interpolation iterator pointing to the first element
         * @return The interpolation iterator pointing to the first element
         */
        const IntpolIterator getIntpolBegin();

        /**
         * Get the interpolation iterator pointing past the final element
         * @return The interpolation iterator pointing past the final element
         */
        const IntpolIterator getIntpolEnd();

        /**
         * Get the near interaction iterator pointing to the first element
         * @return The near interaction iterator pointing to the first element
         */
        const NearIntIterator getNearIntBegin();

        /**
         * Get the near interaction iterator pointing past the final element
         * @return The near interaction iterator pointing past the final element
         */
        const NearIntIterator getNearIntEnd();
};

#endif
