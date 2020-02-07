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

#ifndef LEVELHANDLER_H
#define LEVELHANDLER_H

#include "pubbase.h"
#include "queue.h"
#include "workpack.h"
#include "message.h"

#include <map>

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Box;
class Level;
class Subtree;
class IntGroup;
class Engine;
class TranslHandler;
class IntpolHandler;
class LevelHandler;

// ============================================================================
// LEVELHANDLER
// ============================================================================

class LevelHandler
{
public:
        /**
         * Constructor
         */
        LevelHandler();

        /**
         * Destructor
         */
        virtual ~LevelHandler();

        /**
         * Delete user allocated memory
         */
        void deleteUserAllocatedMemory();

        // ====================================================================
        // PURE VIRTUAL FUNCTIONS
        // ====================================================================

        /**
         * Get the sampling rate for a given partitioning
         * @param partition Partition [0 .. nPartitions -1]
         * @param nPartitions The number of partitions
         * @return The sampling rate for that partition
         */
        virtual int getSamplingRate(int partition, int nPartitions) const = 0;

        // ====================================================================
        // RADIATION PATTERN MEMORY VIRTUAL FUNCTIONS
        // ====================================================================

        /**
         * Allocate memory for a radiation pattern (cplx type)
         * @param size Number of elements
         * @return Pointer to the allocated buffer
         */
        virtual cplx* allocateMemory(int nElements);

        /**
         * Delete memory for a radiation pattern
         * @param pointer Pointer to the buffer
         */
        virtual void deleteMemory(cplx *pointer);

        // ====================================================================
        // K-SPACE PARTITIONING FUNCTIONS (OPTIONAL)
        // ====================================================================

        /**
         * Get the maximum number of partitions at this level
         * @return The maximum number of partitions at this level
         */
        virtual int getMaxNumPartitions() const { return 1; }

        /**
         * Get the number of boundary points for interpolation
         * @param chdSrcPart Identifier for the child source partition
         * @param parDstPart Identifier for the parent source partition
         * @return The number of boundary points for interpolation
         */
        virtual int getNumIntBoundaryPoints(int chdSrcPart, int parDstPart) {
                return 0;
        }

        /**
         * Get the number of boundary points for anterpolation
         * @param parSrcPart Identifier for the parent destination partition
         * @param chdDstPart Identifier for the child destination partition
         * @return The number of boundary points for anterpolation
         */
        virtual int getNumAntBoundaryPoints(int parSrcPart, int chdDstPart) {
                return 0;
        }

        // ====================================================================
        // ACCESSORS
        // ====================================================================

        /**
         * Get the sampling rate for this processor
         * @return The sampling rate for this partition
         */
        int getLocalSamplingRate() const
                { return getSamplingRate(thisPartition, nPartitions); }

        /**
         * Return the number of partitions (<= getMaxNumPartitions())
         * @return The number of partitions in this level
         */
        int getThisPartition() const { return thisPartition; }

        /**
         * Return the number of partitions (<= getMaxNumPartitions())
         * @return The number of partitions in this level
         */
        int getNumPartitions() const { return nPartitions; }

        /**
         * Return the number of divisions (nPartition / chdLh->nPartitions)
         * @return The number of divisions
         */
        int getNumDivisions() const { return nDivisions; }

        /**
         * Return the level number
         * @return Level number
         */
        int getLevel() const { return lvl; }

        /**
         * Return the box size at this level
         * @return Box size
         */
        deci getBoxSize() const { return boxSize; }

        /**
         * Return groupID of the interaction group to which this level belongs
         * @return The groupID
         */
        int getGroupID() const { return groupID; }

        /**
         * Get the number of translation handlers
         * @return The number of translation handlers
         */
        uint getNumTranslHandlers() const { return nTranslHandlers; }

        /**
         * Return a reference to certain translation temporary
         * @param translID Identifier for the translation temporary
         * @return A reference to the translation temporary
         */
        TranslTemp& getTranslTemp(uint translID) const {
                return translTemp[translID]; }

        // ====================================================================
        // MODIFIERS
        // ====================================================================

        /**
         * Set the lowest level aggregation handler
         * @param aggID Identifier for the aggregation
         * @param handler Pointer to the aggregation handler
         */
        void setLowLevAggHandler(uint aggID, AggHandler *handler) {
                levZeroAgg[aggID].aggtr = handler;
        }

        /**
         * Set the lowest level disaggregation handler
         * @param dagID Identifier for the disaggregation
         * @param handler Pointer to the disaggregation handler
         */
        void setLowLevDagHandler(uint dagID, DagHandler *handler) {
                levZeroDag[dagID].dagtr = handler;
        }

        /**
         * Set the interpolation handler
         * @param intpolHandler Pointer to the interpolation handler
         */
        void setIntpolHandler(IntpolHandler *intpolHandler) {
                intHndl = intpolHandler;
        }

        /**
         * Set the translation handler
         * @param translID Identifier for the translation
         * @param handler Pointer to the translation handler
         */
        void setTranslHandler(uint translID, TranslHandler *handler) {
                translHandler[translID] = handler;
        }

        // ====================================================================
        // LEVELHANDLER CONSTRUCTION
        // ====================================================================

        /**
         * Set the number of partitions in this level
         * @param nPartitions Number of partitions
         */
        void setNumPartitions(int nPartitions);

        /**
         * Allocate memory for the radiation patterns
         */
        void allocateRadPatMemory();

        /**
         * Calculate the radiaton pattern offset for a certain level
         * @param level Pointer to the level
         * @param sector Pointer to the sector info
         */
        void calcRadPatOffset(Level *level, std::map<int, int*> &sector);

        /**
         * Calculate the radiation pattern offset for a certain level
         */
        void calcRadPatOffset();

        // ====================================================================
        // LOWEST LEVEL AGGREGATIONS
        // ====================================================================

        /**
         * Prepare the lowest level aggregations
         */
        void prepareLowestLevelAggregations();

        // ====================================================================
        // HIGHER LEVEL AGGREGATIONS
        // ====================================================================

        /**
         * Prepare the higher level aggregations
         */
        void prepareHigherLevAggregations();

        /**
         * Store the aggregations for spatial partitioning
         */
        void storeHigherLevAggregations();

        // ====================================================================
        // TRANSLATIONS
        // ====================================================================

        /**
         * Prepare the translations
         */
        void prepareTranslations();

        /**
         * Store the translations
         */
        void storeTranslations();

        // ====================================================================
        // HIGHER LEVEL DISAGGREGATIONS
        // ====================================================================

        /**
         * Prepare the disaggregation for spatial partitioning
         */
        void prepareHigherLevDisaggregations();

        /**
         * Store the disaggregations for spatial partitioning
         */
        void storeHigherLevDisaggregations();

        // ====================================================================
        // LOWEST LEVEL DISAGGREGATIONS
        // ====================================================================

        /**
         * Prepare the lowest level disaggregations
         */
        void prepareLowestLevelDisaggregations();

        // ====================================================================
        // SENDING / RECEIVAL
        // ====================================================================

#ifdef HAVE_MPI
        /**
         * Allocate send and receive buffers for upward pass
         */
        void allocateUpRendRecvBuffer();

        /**
         * Allocate send and receive buffers for downward pass
         */
        void allocateDownRendRecvBuffer();
#endif

        // ====================================================================
        // PACKAGES
        // ====================================================================

        /**
         * Subdivide the lowest level aggregations into packages
         */
        void createLowestLevelAggPackages();

        /**
         * Divide the aggregations into packages
         */
        void createAggPackages();

        /**
         * Divide the translations into packages
         */
        void createTranslPackages();

        /**
         * Divide the disaggregations into packages
         */
        void createDagPackages();

        /**
         * Subdivide the lowest level disaggregations into packages
         */
        void createLowestLevelDagPackages();

#ifdef HAVE_MPI
        // ====================================================================
        // COMMUNICATION FUNCTIONS
        // ====================================================================

        /**
         * Get the amount of communication
         * @param inSize Number of incoming bytes
         * @param outSize Number of outgoing bytes
         */
        void getCommSize(std::map<int, int> &inSize, 
                         std::map<int, int> &outSize) const;

        /**
         * Set the message ID for the communications
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

        /**
         * Copy and post the messages for the upward pass communication
         */
        int postUpSend();

        /**
         * Post the receives for the upward pass communication
         */
        int postUpRecv();

        /**
         * Copy and post the messages for the downward pass communication
         */
        int postDownSend();

        /**
         * Post the receives for the downward pass communication
         */
        int postDownRecv();
#endif

        // ====================================================================
        // AUXILIARY FUNCTIONS
        // ====================================================================

        /**
         * Check whether a box is local to a certain processor
         * @param box Pointer to a box
         * @return True of false
         */
        bool isLocal(const Box* box) const;

        /**
         * Prepare this level for matrix-vector product
         */
        void prepareMatvec();

        // ====================================================================
        // PROCESS AND PARTION CONVERSION
        // ====================================================================

        /**
         * Get the process that contains a certain box
         * @param box Pointer to a box 
         * @param partition Partition in which we are interested
         * @return The corresponding process identifier
         */
        int getBoxProc(const Box *box, int partition) const;

        /**
         * Convert a partition to a process number
         * @param part Partition number
         * @param OG Owner group
         * @return The corresponding process identifier
         */
        int part2proc(int part, int OG) const;

        /**
         * Convert a process identifier to a partition identifier
         * @param proc Process identifier
         * @return The corresponding partition identifier
         */
        int proc2part(int proc) const;

        /**
         * Convert a process into an owner group
         * @param proc Process identifier
         * @return The corresponding owner group
         */
        int proc2OG(int proc) const;

private:

        /**
         * Prepare the higher level aggregations for a certain child partition
         * @param chdPart Identifier for the child partition
         */
        void prepareHigherLevAggregations(int chdPart);

        /**
         * Prepare the send schedule for the higher level aggregations
         * @param parPart Identifier for the parent partition
         */
        void prepareSendHigherLevAggregations(int parPart);

        /**
         * Store the higher level aggregations for a certain child partition
         * @param chdPart Identifier for the child partition
         * @param index Map for holding the agg index
         */
        void storeHigherLevAggregations(int chdPart, std::map<int, int> &index);

        /**
         * Store the send schedule for the higher level aggregations
         * @param parPart Identifier for the parent partition
         * @param index Map for holding the upOutComm index
         */
        void storeSendHigherLevAggregations(int parPart,
                                            std::map<int, int> &index);

        /**
         * Prepare the higher level disaggregations for a certain par partition
         * @param parPart Identifier for the child partition
         */
        void prepareHigherLevDisaggregations(int parPart);

        /**
         * Prepare the send schedule for the higher level disaggregations
         * @param chdPart Identifier for the child partition
         */
        void prepareSendHigherLevDisaggregations(int chdPart);

        /**
         * Store the higher level disaggregations for a certain parent partition
         * @param parPart Identifier for the parent partition
         * @param index Map for holding the dag index
         */
        void storeHigherLevDisaggregations(int parPart,
                                           std::map<int, int> &index);

        /**
         * Store the send schedule for the higher level disaggregations
         * @param chdPart Identifier for the child partition
         * @param index Map for holding the downOutComm index
         */
        void storeSendHigherLevDisaggregations(int chdPart,
                                               std::map<int, int> &index);

protected:
        LevelHandler *chdLh;                    // pointer to the child handler
        LevelHandler *parLh;                    // pointer to the parent handler

public:
        cplx *oRadPat;                          // outgoing radiation pattern
        cplx *iRadPat;                          // incoming radiation pattern

private:
        // information about itself
        int groupID;                            // identifier for the intgroup
        int lvl;                                // level of this levelData
        double boxSize;                         // boxSize at this level
        IntGroup *ig;                           // backlink to the int group
        Subtree *basisSt;                       // backlink to the basis subtree
        Subtree *testSt;                        // backlink to the test subtree

        // pointers to the corresponding levels
        Level *basisLevel;                      // pointer to the basis level
        Level *testLevel;                       // pointer to the test level

        // k-space partitioning at this level
        int thisPartition;                      // this partition
        int nPartitions;                        // number of partitions
        int thisOG;                             // this owner group
        int nOG;                                // number of owner groups
        int nDivisions;                         // number of divisions

        // radiation patterns at this level
        int iRadPatZeroFirst;                   // first ind in iRadpat to zero
        int iRadPatZeroSize;                    // number of el to zero in iRad
        int oRadPatZeroFirst;                   // first ind in oRadpat to zero
        int oRadPatZeroSize;                    // number of el to zero in oRad

        // work package execution schedule
        uint nAggPacksDone;                     // number of agg WP done
        uint nAggPacksToDo;                     // number of agg WP to do
        uint nDagPacksDone;                     // number of dag WP done
        uint nDagPacksToDo;                     // number of dag WP to do

        // level zero aggregations
        int nLvlZeroAgg;                        // number of lowest level agg
        lZAgg *levZeroAgg;                      // level zero aggregation
        Train<lZAggPack> lZAggTrain;            // level zero agg train
        LZAggMetaData lZAggMetaData;            // meta data for the L0 agg
        lZAggTemp *levZeroAggTemp;              // temporary storage for agg
        Train<lZAggPack> *locLevZeroAggTrain;   // pointer to local L0 agg

        // higher level aggregations
        int nAggregations;                      // number of aggregations
        std::map<int, int> nAgg;                // number of agg per src proc
        Agg *agg;                               // actual aggregations
        std::map<int, Train<AggPack> > aggTrain;// aggregation trains
        Train<AggPack> *locAggTrain;            // pointer to local agg train
        IntMetaData *intMetaData;               // interpolation meta data
        std::map<int, int*> aggSector;          // agg sector info per process

        // translations
        int nTranslations;                      // number of transl
        std::map<int, int> nTransl;             // number of transl per src proc
        Transl *transl;                         // actual translations
        std::map<int, Train<TranslPack> > translTrain;  // translation train
        Train<TranslPack> *locTranslTrain;      // pointer to local agg train
        TranslMetaData *translMetaData;         // translation meta data

        // higher level disaggregations
        int nDisaggregations;                   // number of disaggregations
        std::map<int, int> nDag;                // number of dag per src proc
        Dag *dag;                               // actual disaggregations
        std::map<int, Train<DagPack> > dagTrain;// dag train for each process
        Train<DagPack> *locDagTrain;            // pointer to local dag train
        IntMetaData *antMetaData;               // anterpolation meta data
        std::map<int, int*> dagSector;          // dag sector info per process

        // level zero disaggregations
        int nLvlZeroDag;                        // number of lowest level dag
        lZDag *levZeroDag;                      // level zero disaggregation
        Train<lZDagPack> lZDagTrain;            // level zero dag train
        LZDagMetaData lZDagMetaData;            // meta data for the L0 dag
        lZDagTemp *levZeroDagTemp;              // temporary storage for agg
        Train<lZDagPack> *locLevZeroDagTrain;   // pointer to local L0 dag

        int nTranslHandlers;                    // number of transl handlers
        TranslHandler** translHandler;          // actual translation handlers
        IntpolHandler *intHndl;                 // interpolator handler object

        TranslTemp *translTemp;                 // translation temp data

        std::map<int, OutComm> upOutComm;       // outgoing comm for upward pass
        std::map<int, InComm> upInComm;         // incoming comm for upward pass
        std::map<int, OutComm> downOutComm;     // outgoing comm for down pass
        std::map<int, InComm> downInComm;       // incoming comm for down pass

        // friend classes
        friend class IntGroup;
        friend class Engine;
};

#endif
