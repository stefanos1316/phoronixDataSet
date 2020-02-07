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

#include "nexus.h"
#include "engine.h"
#include "base.h"
#include <cstring>
#include <cstdio>

using namespace std;

// ============================================================================
// NEXUS CONSTRUCTION
// ============================================================================

Nexus::Nexus() : engine(NULL)
{
#ifdef HAVE_MPI
        int MPI_hasInit, dummy;
        MPI_Initialized(&MPI_hasInit);
        assert(MPI_hasInit);

        MPI_Comm_rank(MPI_COMM_WORLD, &thisProc);
        MPI_Comm_size(MPI_COMM_WORLD, &nProc);
        MPI_Get_processor_name(procName, &dummy);
#else
        nProc = 1;
        thisProc = 0;
        sprintf(procName, "localhost");
#endif
}

Nexus::~Nexus()
{
        delete engine;
}

void Nexus::initMPI(int *argc, char **argv[])
{
#ifdef HAVE_MPI
        // check whether MPI is already initialized
        int MPI_hasInit;
        MPI_Initialized(&MPI_hasInit);

        // no ? do it now!
        if (!MPI_hasInit)
                MPI_Init(argc, argv);
#endif
}

void Nexus::destroyMPI()
{
#ifdef HAVE_MPI
        MPI_Finalize();
#endif
}

// ============================================================================
// ACCESSORS
// ============================================================================

int Nexus::getProcessID() const
{
        return thisProc;
}

int Nexus::getNumProcesses() const
{
        return nProc;
}

std::string Nexus::getProcessName() const
{
        return std::string(procName);
}

void Nexus::getCommSize(std::map<int, int> &inSize, 
                        std::map<int, int> &outSize) const
{
        inSize.clear();
        outSize.clear();
#ifdef HAVE_MPI
        engine->getCommSize(inSize, outSize);
#endif
}

void Nexus::getNumLocalUnknowns(vector<int> &nlUnknowns,
                                TreeType treeType) const
{
        engine->getNumLocalUnknowns(nlUnknowns, treeType);
}

// ============================================================================
// USER CALLABLE FUNCTIONS
// ============================================================================

int Nexus::prepareAddingUnknowns(const Point& LL, const Point& UR,
                                 deci minBoxSize, SepTree sepTree)
{
        // sanity checks
        assert(minBoxSize > 0);
        assert(LL.getX() < UR.getX());
        assert(LL.getY() < UR.getY());
        assert(engine == NULL);

        int nLevels = Engine::calcNumLevels(LL, UR, minBoxSize);
        deci treeSize = minBoxSize * (0x1 << (nLevels-1));
        Point centre = LL + 0.5*treeSize;

        engine = new Engine();
        engine->createTree(centre, treeSize, nLevels, sepTree);

        return nLevels;
}

deci Nexus::prepareAddingUnknowns(const Point& LL, const Point& UR,
                                  int nLevels, SepTree sepTree)
{
        // sanity checks
        assert(nLevels > 0);
        assert(LL.getX() < UR.getX());
        assert(LL.getY() < UR.getY());
        assert(engine == NULL);

        deci minBoxSize = Engine::calcMinBoxSize(LL, UR, nLevels);
        deci treeSize = minBoxSize * (0x1 << (nLevels-1));
        Point centre = LL + 0.5*treeSize;

        engine = new Engine();
        engine->createTree(centre, treeSize, nLevels, sepTree);

        return minBoxSize;
}

void Nexus::setFmmLimits(int lvl, deci minXDist, deci maxXDist)
{
        assert(engine != NULL);
        engine->setFmmLimits(lvl, minXDist, maxXDist);
}

void Nexus::setBlockJacobiLevel(int bjl)
{
        assert(engine != NULL);
        engine->setBlockJacobiLevel(bjl);
}

void Nexus::setMinimalPartitionLevel(int minPartLevel)
{
        assert(engine != NULL);
        engine->setMinimalPartitionLevel(minPartLevel);
}

void Nexus::createInteractionGroup(int groupID, const Point& LL,
                                   const Point& UR)
{
        engine->createInteractionGroup(LL, UR, groupID);
}

void Nexus::addUnknown(const Point& r, int nID, const int *listID,
                       int targetLvl, TreeType treeType)
{
        // input validation
        assert(targetLvl >= 0);
        assert(nID > 0);
        assert(listID != NULL);

        // add the unknown the tree to the Fmm tree
        engine->addUnknown(r, nID, listID, targetLvl, treeType);
}

void Nexus::finalizeAddingUnknowns()
{
        engine->finalizeAddingUnknowns();
}

bool Nexus::isLocal(const Point &r, TreeType treeType) const
{
        return engine->isLocal(r, treeType);
}

int Nexus::getOwner(const Point&r, TreeType treeType) const
{
        return engine->getOwner(r, treeType);
}

int Nexus::getUnknownIndex(const Point &r, TreeType treeType)
{
        return engine->getUnknownIndex(r, treeType);
}

int Nexus::doLoadBalancing(bool calcAllRadPat, LoadHandler *loadHandler)
{
        return engine->doLoadBalancing(loadHandler, calcAllRadPat);
}

void Nexus::deleteTree()
{
        engine->deleteTree();
}

void Nexus::prepareMatrixVector()
{
        engine->prepareMatrixVector();
}

void Nexus::parallelMatrixVector(const cplx *U, cplx *V)
{
        engine->parallelMatrixVector(U, V);
}

// ============================================================================
// ITERATORS
// ============================================================================

const LevZeroAggIterator Nexus::getLevZeroAggBegin()
{
        return LevZeroAggIterator(engine, engine->getFirstIntGroup());
}

const LevZeroAggIterator Nexus::getLevZeroAggEnd()
{
        return LevZeroAggIterator(engine, engine->getLastIntGroup());
}

const LevZeroDagIterator Nexus::getLevZeroDagBegin()
{
        return LevZeroDagIterator(engine, engine->getFirstIntGroup());
}

const LevZeroDagIterator Nexus::getLevZeroDagEnd()
{
        return LevZeroDagIterator(engine, engine->getLastIntGroup());
}

const TranslIterator Nexus::getTranslBegin()
{
        return TranslIterator(engine, engine->getFirstIntGroup());
}

const TranslIterator Nexus::getTranslEnd()
{
        return TranslIterator(engine, engine->getLastIntGroup());
}

const LevelIterator Nexus::getLevelBegin()
{
        return LevelIterator(engine, engine->getFirstIntGroup());
}

const LevelIterator Nexus::getLevelEnd()
{
        return LevelIterator(engine, engine->getLastIntGroup());
}

const IntpolIterator Nexus::getIntpolBegin()
{
        return IntpolIterator(engine, engine->getFirstIntGroup());
}

const IntpolIterator Nexus::getIntpolEnd()
{
        return IntpolIterator(engine, engine->getLastIntGroup());
}

const NearIntIterator Nexus::getNearIntBegin()
{
        return NearIntIterator(engine, 0);
}

const NearIntIterator Nexus::getNearIntEnd()
{
        return NearIntIterator(engine, engine->getNumNearIntHandlers());
}
