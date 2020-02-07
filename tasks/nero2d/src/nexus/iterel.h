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

#ifndef ITERATORELEMENT_H
#define ITERATORELEMENT_H

#include "pubbase.h"
#include <map>

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Engine;
class IntGroup;

class AggHandler;
class DagHandler;
class IntpolHandler;
class LevelHandler;
class NearIntHandler;
class TranslHandler;

// ============================================================================
// LOWEST LEVEL AGGREGATION ITERATOR
// ============================================================================

class LowLevAggItEl {

private:
        Engine *engine;                         // pointer to the engine
        std::map<int, IntGroup*>::iterator ig;  // intGroup iterator element
        uint lvl;                               // current level
        int aggID;                              // current aggregator ID

        /**
         * Update the public fields
         */
        void updateFields();

public:
        /**
         * Default constructor
         */
        LowLevAggItEl() : engine(NULL), lvl(0), aggID(-1), start(-1),
                          stop(-1), lvlHndl(NULL) {};

        /**
         * Constructor
         * @param engine Pointer to the engine
         * @param st Map iterator pointing to certain intGroup
         */
        LowLevAggItEl(Engine *engine, std::map<int, IntGroup*>::iterator st);

        /**
         * Increment operator
         * @return LowLevAggItEl after the increment
         */
        LowLevAggItEl& operator++();

        /**
         * Set the aggregator structure for this box
         * @param handler Aggregation handler
         */
        void setHandler(AggHandler *handler);

        int start;                      // first index of this box
        int stop;                       // last index of this box
        Point boxCentre;                // centre of the box
        LevelHandler *lvlHndl;          // level handler

        friend bool operator==(const LowLevAggItEl &lhs,
                               const LowLevAggItEl &rhs);
        friend bool operator!=(const LowLevAggItEl &lhs,
                               const LowLevAggItEl &rhs);
};

inline bool operator==(const LowLevAggItEl &lhs, const LowLevAggItEl &rhs)
{
        return ((lhs.ig == rhs.ig) && (lhs.aggID == rhs.aggID));
}

inline bool operator!=(const LowLevAggItEl &lhs, const LowLevAggItEl &rhs)
{
        return ((lhs.ig != rhs.ig) || (lhs.aggID != rhs.aggID));
}

// ============================================================================
// LOWEST LEVEL DISAGGREGATION ITERATOR
// ============================================================================

class LowLevDagItEl {

private:
        Engine *engine;                         // pointer to the engine
        std::map<int, IntGroup*>::iterator ig;  // intGroup iterator element
        uint lvl;                               // current level
        int dagID;                              // current aggregator ID

        /**
         * Update the public fields
         */
        void updateFields();

public:
        /**
         * Default constructor
         */
        LowLevDagItEl() : engine(NULL), lvl(0), dagID(-1), start(-1),
                          stop(-1), lvlHndl(NULL) {};

        /**
         * Constructor
         * @param engine Pointer to the engine
         * @param st Map iterator pointing to certain intGroup
         */
        LowLevDagItEl(Engine *engine, std::map<int, IntGroup*>::iterator st);

        /**
         * Increment operator
         * @return LowLevDagItEl after the increment
         */
        LowLevDagItEl& operator++();

        /**
         * Set the aggregator structure for this box
         * @param handler Disaggregation handler
         */
        void setHandler(DagHandler *handler);

        int start;                      // first index of this box
        int stop;                       // last index of this box
        Point boxCentre;                // centre of the box
        LevelHandler *lvlHndl;          // level handler

        friend bool operator==(const LowLevDagItEl &lhs,
                               const LowLevDagItEl &rhs);
        friend bool operator!=(const LowLevDagItEl &lhs,
                               const LowLevDagItEl &rhs);
};

inline bool operator==(const LowLevDagItEl &lhs, const LowLevDagItEl &rhs)
{
        return ((lhs.ig == rhs.ig) && (lhs.dagID == rhs.dagID));
}

inline bool operator!=(const LowLevDagItEl &lhs, const LowLevDagItEl &rhs)
{
        return ((lhs.ig != rhs.ig) || (lhs.dagID != rhs.dagID));
}

// ============================================================================
// TRANSLATION ITERATOR
// ============================================================================

class TranslItEl {

private:
        Engine *engine;                         // pointer to the engine
        std::map<int, IntGroup*>::iterator ig;  // intGroup iterator element
        int level;                              // level under consideration
        int translID;                           // current translation ID

        /**
         * Update the public fields
         */
        void updateFields();

public:
        /**
         * Default constructor
         */
        TranslItEl() : engine(NULL), level(0), translID(-1), lvlHndl(NULL) {};

        /**
         * Constructor
         * @param engine Pointer to the engine
         * @param st Map iterator pointing to certain intGroup
         */
        TranslItEl(Engine *engine, std::map<int, IntGroup*>::iterator st);

        /**
         * Increment operator
         * @return TranslItEl after the increment
         */
        TranslItEl& operator++();

        /**
         * Set the translation handler for this translation
         * @param translHandler Translation handler
         */
        void setHandler(TranslHandler *translHandler);

        LevelHandler* lvlHndl;  // level handler at this level
        Point T;                // vector describing translation

        friend bool operator==(const TranslItEl &lhs, const TranslItEl &rhs);
        friend bool operator!=(const TranslItEl &lhs, const TranslItEl &rhs);
};

inline bool operator==(const TranslItEl &lhs, const TranslItEl &rhs)
{
        return ((lhs.ig == rhs.ig) && (lhs.translID == rhs.translID));
}

inline bool operator!=(const TranslItEl &lhs, const TranslItEl &rhs)
{
        return ((lhs.ig != rhs.ig) || (lhs.translID != rhs.translID));
}

// ============================================================================
// LEVEL ITERATOR
// ============================================================================

class LevelItEl {

private:
        Engine *engine;                         // pointer to the engine
        std::map<int, IntGroup*>::iterator ig;  // intGroup iterator element

        /**
         * Update the public fields
         */
        void updateFields();

public:
        /**
         * Default constructor
         */
        LevelItEl() : groupID(-1), level(-1), boxSize(-1) {};

        /**
         * Constructor
         * @param engine Pointer to the engine
         * @param st Map iterator pointing to certain intGroup
         */
        LevelItEl(Engine *engine, std::map<int, IntGroup*>::iterator st);

        /**
         * Increment operator
         * @return LevelItEl after the increment
         */
        LevelItEl& operator++();

        /**
         * Set the level handler for this translation
         * @param levelHandler Level handler
         */
        void setHandler(LevelHandler *levelHandler);

        int groupID;            // groupID to which the box belongs
        double boxSize;         // size of a box at this level
        int level;              // level

        friend bool operator==(const LevelItEl &lhs, const LevelItEl &rhs);
        friend bool operator!=(const LevelItEl &lhs, const LevelItEl &rhs);
        friend class LevelIterator;
};

inline bool operator==(const LevelItEl &lhs, const LevelItEl &rhs)
{
        return ((lhs.ig == rhs.ig) && (lhs.level == rhs.level));
}

inline bool operator!=(const LevelItEl &lhs, const LevelItEl &rhs)
{
        return ((lhs.ig != rhs.ig) || (lhs.level != rhs.level));
}

// ============================================================================
// INTERPOLATION ITERATOR
// ============================================================================

class IntpolItEl {

private:
        Engine *engine;                         // pointer to the engine
        std::map<int, IntGroup*>::iterator ig;  // intGroup iterator element
        int parLvl;                             // parent level

        /**
         * Update the public fields
         */
        void updateFields();

public:
        /**
         * Default constructor
         */
        IntpolItEl() : engine(NULL), parLvl(-1),
                       chdLvlHndl(NULL), parLvlHndl(NULL) {};

        /**
         * Constructor
         * @param engine Pointer to the engine
         * @param st Map iterator pointing to certain intGroup
         */
        IntpolItEl(Engine *engine, std::map<int, IntGroup*>::iterator st);

        /**
         * Increment operator
         * @return LevelItEl after the increment
         */
        IntpolItEl& operator++();

        /**
         * Set the interpolation handler
         * @param intpolHandler Interpolation handler
         */
        void setHandler(IntpolHandler *intpolHandler);

        LevelHandler *chdLvlHndl;       // child level handler
        LevelHandler *parLvlHndl;       // parent level handler

        friend bool operator==(const IntpolItEl &lhs, const IntpolItEl &rhs);
        friend bool operator!=(const IntpolItEl &lhs, const IntpolItEl &rhs);
};

inline bool operator==(const IntpolItEl &lhs, const IntpolItEl &rhs)
{
        return ((lhs.ig == rhs.ig) && (lhs.parLvl == rhs.parLvl));
}

inline bool operator!=(const IntpolItEl &lhs, const IntpolItEl &rhs)
{
        return ((lhs.ig != rhs.ig) || (lhs.parLvl != rhs.parLvl));
}

// ============================================================================
// NEAR INTERACTION ITERATOR
// ============================================================================

class NearIntItEl {

private:
        int nearID;             // near interaction ID
        Engine *engine;        // pointer to the engine

        /**
         * Update the fields to match the ones corresponding to the transl ID
         */
        void updateFields();

public:
        /**
         * Constructor
         * @param engine Pointer to the engine
         * @param nearID near interaction ID
         */
        NearIntItEl(Engine *engine, int nearID);

        /**
         * Increment operator
         * @return LevelItEl after the increment
         */
        NearIntItEl& operator++();

        /**
         * Set the near interaction handler for this translation
         * @param nearIntHandler Near interaction handler
         */
        void setHandler(NearIntHandler *nearIntHandler);

        uint basisStart;        // first basis function index
        uint basisEnd;          // final basis function index
        uint testStart;         // first test function index
        uint testEnd;           // final test function index
        uint srcUnknownOffset;  // source unknown offset
        uint dstUnknownOffset;  // destination unknown offset

        friend bool operator==(const NearIntItEl &lhs,
                               const NearIntItEl &rhs);
        friend bool operator!=(const NearIntItEl &lhs,
                               const NearIntItEl &rhs);
};

inline bool operator==(const NearIntItEl &lhs, const NearIntItEl &rhs)
{
        return ((lhs.nearID == rhs.nearID) && (lhs.engine == rhs.engine));
}

inline bool operator!=(const NearIntItEl &lhs, const NearIntItEl &rhs)
{
        return ((lhs.nearID != rhs.nearID) || (lhs.engine != rhs.engine));
}

#endif
