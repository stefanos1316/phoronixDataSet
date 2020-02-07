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

#ifndef LEVELHANDLER2D_H
#define LEVELHANDLER2D_H

#include "nexus/levelhandler.h"
#include "cnfgfile.h"

class FFTInterpolator;
class BlifInterpolator;

class LevelHandler2d : public LevelHandler
{
public:

        /**
         * Constructor
         * @param N_ The sampling rate for a full radiation pattern
         * @param Na_ The Nyquist sampling rate for a full radiation pattern
         * @param gamma_ The wave number for this medium
         * @param HF_ HF- or LF-case (true -> HF)
         * @param config_ Pointer to the configuration file
         */
        LevelHandler2d(int N_, int Na_, cplx gamma_, bool HF_, double chi_,
                const ConfigFile *config_): N(N_), Na(Na_), gamma(gamma_),
                HF(HF_), chi(chi_), config(config_), aggIntpl(NULL) { };

        /**
         * Destructor
         */
        ~LevelHandler2d();

        // ====================================================================
        // RADIATION PATTERN MEMORY VIRTUAL FUNCTIONS
        // ====================================================================

        /**
         * Allocate memory for a radiation pattern (cplx type)
         * @param size Number of elements
         * @return Pointer to the allocated buffer
         */
        cplx* allocateMemory(int nElements);

        /**
         * Delete memory for a radiation pattern
         * @param pointer Pointer to the buffer
         */
        void deleteMemory(cplx *pointer);

        // ====================================================================
        // SAMPLING RATES
        // ====================================================================

        /**
         * Get the sampling rate for a full radiation pattern at this level
         * @return The sampling rate
         */
        int getFullRadPatN() const { return N; }

        /**
         * Get the sampling rate for the local part of a radiation pattern
         * @return The sampling rate for the local part of a radiation pattern
         */
        int getLocalRadPatN() const;

        int getPartitionN(int partition, int nPartitions) const;

        /**
         * Get the sampling rate for a given partitioning
         * @param partition Partition [0 .. nPartitions-1]
         * @param nPartitions The number of partitions
         * @return The sampling rate for that partition
         */
        int getSamplingRate(int partition, int nPartitions) const;

        /**
         * Get the first sample index for a certain partition
         * @param partition Partition under consideration
         * @param nPartitions Number of partitions 
         * @return The first sample index for a certain partitioning
         */
        int getPartStartPos(int partition, int nPartitions) const;

        /**
         * Get the first sample index for this partitioning
         * @return The first sample index for this partitioning
         */
        int getLocalStartPos() const {
                return getPartStartPos(getThisPartition(), getNumPartitions());
        }

        /**
         * Return the minimal sampling rate for this radiation pattern
         * @return The minimal sampling rate for this radiation pattern
         */
        int getNyqSamplingRate() const { return Na; }

        /**
         * Get the maximum number of partitions at this level
         * @return The maximum number of partitions at this level
         */
        int getMaxNumPartitions() const;

        /**
         * Get the interpolation method between this level and the previous one
         * @return The interpolation method
         */
        IntMethod getIntMethod() const;

        /**
         * Get the number of boundary points for interpolation
         * @param chdSrcPart Identifier for the child source partition
         * @param parDstPart Identifier for the parent source partition
         * @return The number of boundary points for interpolation
         */
        int getNumIntBoundaryPoints(int chdSrcPart, int parDstPart);

        /**
         * Get the number of boundary points for anterpolation
         * @param parSrcPart Identifier for the parent destination partition
         * @param chdDstPart Identifier for the child destination partition
         * @return The number of boundary points for anterpolation
         */
        int getNumAntBoundaryPoints(int parSrcPart, int chdDstPart);

        /**
         * Accessor for gamma
         * @return Gamma
         */
        cplx getGamma() const { return gamma; };

        /**
         * Accessor for HF
         * @return HF
         */
        bool getHF() const { return HF; };

        /**
         * Accessor for chi
         * @return chi
         */
        double getChi() const { return chi; };

        // ====================================================================
        // MODIFIERS
        // ====================================================================

        /**
         * Set the sampling rate for a full radiation pattern
         * @param N_ The sampling rate
         */
        void setSamplingRate(int N_) { N = N_; };

        /**
         * Set the nyquist sampling rate for a full radiation pattern
         * @param N_ The sampling rate
         */
        void setNyqSamplingRate(int Na_) { Na = Na_; };

        /**
         * Set how the problem should be handled: HF/LF
         * @param HF_ true -> HF
         */
        void setHF(bool HF_) { HF = HF_; };

        /**
         * Set the normalization factor
         * @param chi Normalization factor
         */
        void setChi(double chi_) { chi = chi_; };

        /**
         * Get the aggregation interpolator
         * @param work Pointer to the work vector
         * @return Pointer to the aggregation interpolator
         */
        FFTInterpolator *getAggIntpl(cplx *work);

        static double radPatMem;
        static int nRadPatComp;         // number of rad pattern components

private:
        int N;                          // sampling rate for a full pattern
        int Na;                         // minimal sampl rate for a full pattern
        cplx gamma;                     // propagation constant of the medium
        bool HF;                        // Bart: HF or LF (true -> HF)
        double chi;                     // Bart: Normalization factor

        FFTInterpolator *aggIntpl;      // the aggregation interpolator
        const ConfigFile *config;       // pointer to the configuration file

        friend class BlifInterpolator;
};

#endif
