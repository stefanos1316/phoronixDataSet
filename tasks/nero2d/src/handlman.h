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

#ifndef STATISTICS_H
#define STATISTICS_H

#include "base.h"
#include <map>
#include <vector>

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Nexus;
class Geometry;
class ConfigFile;

class NearIntHandler;
class PrecBJ;
class AggHandler;
class DagHandler;
class TranslHandler;
class IntpolHandler;

// ============================================================================
// MEMORY USAGE
// ============================================================================

class Memory
{
public:
        /**
         * Constructor
         */
        Memory();

        /**
         * Return the total amount of memory
         * @return The total amount of memory
         */
        double getTotalMem() const;

        double prec;            // memory for preconditioner
        double nearInt;         // memory for near interactions
        double aggMat;          // memory for aggregation matrices
        double dagMat;          // memory for disaggregation matrices
        double translOp;        // memory for transl operators
        double radPat;          // memory for radiation patterns
        double workSize;        // memory for work vector
        double intMem;          // memory for interpolation
};

// ============================================================================
// HANDLER MANAGER CLASS
// ============================================================================

class HandlerManager
{
public:
        /**
         * Default constructor
         */
        HandlerManager();

        /**
         * Destructor
         */
        ~HandlerManager();

        // ====================================================================
        // NEAR INTERACTIONS
        // ====================================================================

        /**
         * Delete the near interaction handlers
         */
        void deleteNearIntHandlers();

        /**
         * Prepare the calculation of the near interactions
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void prepareNearIntHandlers(Nexus *nexus, const Geometry *geometry,
                                    const ConfigFile *config);

        /**
         * Prepare the calculation of the near interaction handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void calcNearIntHandlers(Nexus *nexus, const Geometry *geometry,
                                 const ConfigFile *config);

        /**
         * Calculate the near interaction output handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void calcNearOutputHandlers(Nexus &nexus, const Geometry *geometry,
                                    const ConfigFile *config);

        /**
         * Apply the block Jacobi preconditioner to a vector
         * @param U Input vector
         * @param V Output vector
         */
        void blockJacobiPreconl(const cplx *U, cplx *V);

        /**
         * Accessor the number of Jacobi blocks in the preconditioner
         * @return The number of Jacobi blocks in the preconditioner
         */
        int getNumJacobiBlocks() { return nPrecBJ; }

        // ====================================================================
        // LOWEST LEVEL AGGREGATIONS
        // ====================================================================

        /**
         * Delete the aggregation handlers
         */
        void deleteAggHandlers();

        /**
         * Prepare the calculation of the lowest level aggregation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void prepareAggHandlers(Nexus *nexus, const Geometry *geometry,
                                const ConfigFile *config);

        /**
         * Calculate and setup the aggregation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         * @param sameAggDag Aggregation handler also implements disaggregation
         */
        void doCalcAggHandlers(Nexus *nexus, const Geometry *geometry,
                             const ConfigFile *config, bool sameAggDag);

        /**
         * Calculate the agg handlers from the cached aggregation handlers
         * @param nexus Pointer to the nexus structure
         */
        void calcAggFromCache(Nexus *nexus);

        /**
         * Calculate and setup the aggregation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         * @param sameAggDag Aggregation handler also implements disaggregation
         */
        void calcAggHandlers(Nexus *nexus, Geometry *geometry,
                             const ConfigFile *config, bool sameAggDag);

        // ====================================================================
        // LOWEST LEVEL DISAGGREGATIONS
        // ====================================================================

        /**
         * Delete the disaggregation handlers
         */
        void deleteDagHandlers();

        /**
         * Prepare the calculation of the lowest level disaggregation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void prepareDagHandlers(Nexus *nexus, const Geometry *geometry,
                                const ConfigFile *config);

        /**
         * Calculate the lowest level output disaggregation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void calcDagOutputHandlers(Nexus &nexus, const Geometry *geometry,
                                   const ConfigFile *config);

        // ====================================================================
        // TRANSLATIONS
        // ====================================================================

        /**
         * Delete the translation handlers
         */
        void deleteTranslHandlers();

        /**
         * Prepare the calculation of the translation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void prepareTranslHandlers(Nexus *nexus, const Geometry *geometry,
                                   const ConfigFile *config);

        /**
         * Calculate and setup the translation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void calcTranslHandlers(Nexus *nexus, const Geometry *geometry,
                                const ConfigFile *config);

        // ====================================================================
        // INTERPOLATIONS
        // ====================================================================

        /**
         * Delete the interpolation handlers
         */
        void deleteIntpolHandlers();

        /**
         * Prepare the calculation of the interpolation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void prepareIntpolHandlers(Nexus *nexus, const Geometry *geometry,
                                   const ConfigFile *config);

        /**
         * Calculate and setup the interpolation handlers
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         */
        void calcIntpolHandlers(Nexus *nexus, const Geometry *geometry,
                                const ConfigFile *config);

        // ====================================================================
        // MEMORY ROUTINES
        // ====================================================================

        /**
         * Calculate the total amount of memory necessary
         * @return The total amount of memory
         */
        double getTotalMem() const;

        /**
         * Allocate memory for the work vector
         */
        void allocateWorkMemory();

        /**
         * Calculate the amount of memory required
         */
        void gatherStatistics(Nexus *nexus, Geometry *geometry,
                              const ConfigFile *config);

        /**
         * Accessor the memory statistics
         * @return The memory statistics
         */
        Memory getMemoryStats() { return mem; };

private:

        Memory mem;             // memory structure
        cplx *work;             // work memory

        // ====================================================================
        // NEAR INTERACTIONS
        // ====================================================================

        int nNearInt;           // number of near interaction handlers
        int nPrecBJ;            // number of block jacobi blocks
        int maxNearN;           // maximun near interaction block size
        int maxNearM;           // maximun near interaction block size
        int maxPrecN;           // maximum size of prec block
        PrecBJ *precBJ;         // preconditioner blocks

        // ====================================================================
        // LOWEST LEVEL AGGREGATIONS
        // ====================================================================

        int nLowLevAgg;         // number of lowest level aggregations
        int maxAggNUnkn;        // maximum number of unknowns in an aggregation
        int maxAggN;            // maximum lowest level aggregation N
        int maxAggNa;           // maximum lowest level aggregation Na

        // ====================================================================
        // LOWEST LEVEL DISAGGREGATIONS
        // ====================================================================

        int nLowLevDag;         // number of lowest lvl disaggregations

        // ====================================================================
        // INTERPOLATIONS
        // ====================================================================

        int maxFFTN;            // maximum N in FFT interpolation
        int maxBlifN;           // maximum N in Blif interpolation
        int nIntHndl;           // number of interpolation handlers

        // ====================================================================
        // TRANSLATIONS
        // ====================================================================

        int nTransl;            // number of translation handlers
        int maxTranslN;         // maximum number of samples to translate

        // ====================================================================
        // HANDLER CONTAINERS
        // ====================================================================

        std::vector<NearIntHandler*> nearIntHandler;
        std::vector<AggHandler*> aggHandler;
        std::vector<DagHandler*> dagHandler;
        std::vector<TranslHandler*> translHandler;
        std::vector<IntpolHandler*> intpolHandler;
};

#endif
