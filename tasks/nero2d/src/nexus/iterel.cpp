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

#include "iterel.h"
#include "engine.h"
#include "intgroup.h"
#include "levelhandler.h"

// ============================================================================
// LOWEST LEVEL AGGREGATION ITERATOR
// ============================================================================

LowLevAggItEl::LowLevAggItEl(Engine *engine_, MapIGIt ig_) : engine(engine_),
        ig(ig_), lvl(0), aggID(0), start(-1), stop(-1), lvlHndl(NULL)
{
        if (ig == engine->getLastIntGroup()) return;
        // it is possible that that level zero doesn't have any aggregations
        // or that the lowest level simply doesn't exist!
        if (ig->second->getNumLowLevAgg(lvl) == 0)
                ++(*this);
        updateFields();
}

LowLevAggItEl& LowLevAggItEl::operator++()
{
        aggID++;
        // update the fields to point to the next element
        for ( ; ig != engine->getLastIntGroup(); ig++, lvl = 0) {
                IntGroup *aig = ig->second;

                for ( ; lvl < aig->getNumLocalAggLevels(); lvl++, aggID = 0) {
                        if (aggID < aig->getNumLowLevAgg(lvl)) {
                                updateFields();
                                return *this;   
                        }
                }
        }

        return *this;
}

void LowLevAggItEl::updateFields()
{
        if (ig == engine->getLastIntGroup()) return;

        lZAggTemp &tmp = ig->second->getLowLevAggTemp(lvl, aggID);
        lZAgg &agg = ig->second->getLowLevAgg(lvl, aggID);

        start = agg.unknownOffset;
        stop = start+tmp.n-1;
        lvlHndl = ig->second->getLevelHandler(lvl);
        boxCentre = tmp.centre;
}

void LowLevAggItEl::setHandler(AggHandler *handler) {
        ig->second->setLowLevAggHandler(lvl, aggID, handler);
}

// ============================================================================
// LOWEST LEVEL DISAGGREGATION ITERATOR
// ============================================================================

LowLevDagItEl::LowLevDagItEl(Engine *engine_, MapIGIt ig_) : engine(engine_),
        ig(ig_), lvl(0), dagID(0), start(-1), stop(-1), lvlHndl(NULL)
{
        if (ig == engine->getLastIntGroup()) return;
        // it is possible that that level zero doesn't have any aggregations
        // or that the lowest level simply doesn't exist!
        if (ig->second->getNumLowLevDag(lvl) == 0)
                ++(*this);
        updateFields();
}

LowLevDagItEl& LowLevDagItEl::operator++()
{
        dagID++;
        // update the fields to point to the next element
        for ( ; ig != engine->getLastIntGroup(); ig++, lvl = 0) {
                IntGroup *aig = ig->second;

                for ( ; lvl < aig->getNumLocalAggLevels(); lvl++, dagID = 0) {
                        if (dagID < aig->getNumLowLevDag(lvl)) {
                                updateFields();
                                return *this;
                        }
                }
        }

        return *this;
}

void LowLevDagItEl::updateFields()
{
        if (ig == engine->getLastIntGroup()) return;

        lZDagTemp &tmp = ig->second->getLowLevDagTemp(lvl, dagID);
        lZDag &dag = ig->second->getLowLevDag(lvl, dagID);

        start = dag.unknownOffset;
        stop = start+tmp.n-1;
        lvlHndl = ig->second->getLevelHandler(lvl);
        boxCentre = tmp.centre;
}

void LowLevDagItEl::setHandler(DagHandler *handler) {
        ig->second->setLowLevDagHandler(lvl, dagID, handler);
}

// ============================================================================
// TRANSLATION ITERATOR
// ============================================================================

TranslItEl::TranslItEl(Engine *engine_, MapIGIt ig_) : engine(engine_),
        ig(ig_), level(0), translID(0), lvlHndl()
{
        if (ig == engine->getLastIntGroup()) return;
        // set the level handler (can't in initalization list
        lvlHndl = ig->second->getLevelHandler(level);
        // it is possible that that level zero doesn't have any translations
        // or that the lowest level simply doesn't exist!
        if (lvlHndl->getNumTranslHandlers() == 0)
                ++(*this);
        updateFields();
}

TranslItEl& TranslItEl::operator++()
{
        translID++;
        // update the fields to point to the next element
        for ( ; ig != engine->getLastIntGroup(); ig++, level = 0) {
                for ( ; level < ig->second->getNumLocalFarLevels(); level++, translID = 0) {
                        lvlHndl = ig->second->getLevelHandler(level);
                        if (translID < lvlHndl->getNumTranslHandlers()) {
                                updateFields();
                                return *this;
                        }
                }
        }

        return *this;
}

void TranslItEl::updateFields()
{
        if (ig == engine->getLastIntGroup()) return;

        lvlHndl = ig->second->getLevelHandler(level);
        T = lvlHndl->getTranslTemp(translID).R;
}

void TranslItEl::setHandler(TranslHandler *translHandler)
{
        lvlHndl->setTranslHandler(translID,translHandler);
}

// ============================================================================
// LEVEL ITERATOR
// ============================================================================

LevelItEl::LevelItEl(Engine *engine_, MapIGIt ig_) : engine(engine_),
        ig(ig_), boxSize(-1.0), groupID(-1), level(0)
{
        updateFields();
}

LevelItEl& LevelItEl::operator++()
{
        if (ig == engine->getLastIntGroup()) return *this;

        // update the fields to point to the next element
        if ((++level) >= ig->second->getNumLevels()) {
                ig++;
                level = 0;
        }

        updateFields();
        return *this;
}

void LevelItEl::updateFields()
{
        if (ig == engine->getLastIntGroup()) return;

        boxSize = engine->getBoxSize(level);
        groupID = ig->second->getGroupID();
}

void LevelItEl::setHandler(LevelHandler *lvlHndl)
{
        ig->second->setLevelHandler(level, lvlHndl);
}

// ============================================================================
// INTERPOLATION ITERATOR
// ============================================================================

IntpolItEl::IntpolItEl(Engine *engine_, MapIGIt ig_) : engine(engine_),
        ig(ig_), parLvl(1)
{
        if (ig == engine->getLastIntGroup()) return;
        // it is possible that that there are no interpolators in
        // the first interaction group
        if (parLvl >= ig->second->getNumLocalFarLevels())
                ++(*this);
        updateFields();
}

IntpolItEl& IntpolItEl::operator++()
{
        if (ig == engine->getLastIntGroup()) return *this;

        parLvl++;
        // update the fields to point to the next element
        for ( ; ig != engine->getLastIntGroup(); ig++, parLvl = 1) {
                if (parLvl < ig->second->getNumLocalFarLevels()) {
                        updateFields();
                        return *this;
                }
        }

        return *this;
}

void IntpolItEl::updateFields()
{
        if (ig == engine->getLastIntGroup()) return;

        chdLvlHndl = ig->second->getLevelHandler(parLvl-1);
        parLvlHndl = ig->second->getLevelHandler(parLvl);
}

void IntpolItEl::setHandler(IntpolHandler *intpolHandler)
{
        chdLvlHndl->setIntpolHandler(intpolHandler);
}

// ============================================================================
// NEAR INTERACTION ITERATOR
// ============================================================================

NearIntItEl::NearIntItEl(Engine *engine_, int nearID_) : 
        engine(engine_), nearID(nearID_), basisStart(0), basisEnd(0),
        testStart(0), testEnd(0), srcUnknownOffset(0), dstUnknownOffset(0)
{
        updateFields();
}

NearIntItEl& NearIntItEl::operator++()
{
        if (nearID == engine->getNumNearIntHandlers()) return *this;

        // update the fields to point to the next element
        nearID++;

        updateFields();
        return *this;
}

void NearIntItEl::updateFields()
{
        if (nearID == engine->getNumNearIntHandlers()) return;

        NearIntTemp &nT = engine->getNearIntTemp(nearID);

        basisStart = nT.basisStart;
        basisEnd = nT.basisEnd;
        testStart = nT.testStart;
        testEnd = nT.testEnd;

        NearInt &nI = engine->getNearInt(nearID);

        srcUnknownOffset = nI.srcUnknownOffset;
        dstUnknownOffset = nI.dstUnknownOffset;
}

void NearIntItEl::setHandler(NearIntHandler *nearIntHandler)
{
        engine->setNearIntHandler(nearID, nearIntHandler);
}
