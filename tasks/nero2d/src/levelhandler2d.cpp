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

#include "levelhandler2d.h"
#include "inthandler2d.h"
#include <fftw3.h>

using namespace std;

double LevelHandler2d::radPatMem = 0.0;
int LevelHandler2d::nRadPatComp = 1;

LevelHandler2d::~LevelHandler2d()
{
        delete aggIntpl;
}

// ============================================================================
// OVERRIDED FUNCTIONS
// ============================================================================

cplx* LevelHandler2d::allocateMemory(int nElements)
{
        radPatMem += nElements*sizeof(cplx);
        return reinterpret_cast<cplx*>(fftw_malloc(nElements*sizeof(cplx)));
}

void LevelHandler2d::deleteMemory(cplx *pointer)
{
        fftw_free(reinterpret_cast<fftw_complex*>(pointer));
}

int LevelHandler2d::getSamplingRate(int partition, int nPartitions) const
{
        if (HF)
                return nRadPatComp * getPartitionN(partition, nPartitions);
        else
                return 2*nRadPatComp * getPartitionN(partition, nPartitions);
}

int LevelHandler2d::getPartitionN(int partition, int nPartitions) const
{
        return getPartStartPos(partition+1, nPartitions) -
               getPartStartPos(partition, nPartitions);
}

int LevelHandler2d::getLocalRadPatN() const
{
        return getPartitionN(getThisPartition(), getNumPartitions());
}

int LevelHandler2d::getPartStartPos(int partition, int nPartitions) const
{
        return (int)round((double)partition*(double)N/(double)nPartitions);
}

int LevelHandler2d::getMaxNumPartitions() const
{
        if (config->intMethod == FFT) return 1;
        double nBP = BlifInterpolator::getNumIntpolPoint(Na, N,
                                                         config->fmmPrecision);
        double numPart = (double)N / (config->minBlifLocality*nBP);

        int result = (int)pow(2.0, floor(log10(numPart)/log10(2.0)));

        return (result > 0) ? result : 1;
}

IntMethod LevelHandler2d::getIntMethod() const
{
        if (config->intMethod == FFT) return FFT;
        if (config->intMethod == BLIF) return BLIF;
        return (getMaxNumPartitions() > 1) ? BLIF : FFT;
}

int LevelHandler2d::getNumIntBoundaryPoints(int srcPart, int dstPart)
{
        int nDiv = parLh->getNumDivisions();

        // source info
        int nSrcPart = getNumPartitions();
        int nextSrcPart = (srcPart + 1 + nSrcPart) % nSrcPart;
        int prevSrcPart = (srcPart - 1 + nSrcPart) % nSrcPart;

        // outbound boundary partitions
        int nDstPart = parLh->getNumPartitions();
        int dstNeedingLastP = nextSrcPart*nDiv;
        int dstNeedingFirstP = prevSrcPart*nDiv + nDiv-1;

        int nPoints = BlifInterpolator::getNumIntpolPoint(Na, N,
                                                          config->fmmPrecision);

        int result = 0;
        if (dstNeedingLastP == dstPart) result += nPoints;
        if (dstNeedingFirstP == dstPart) result += nPoints;

        return nRadPatComp*result;
}

int LevelHandler2d::getNumAntBoundaryPoints(int srcPart, int dstPart)
{
        int nDiv = getNumDivisions();

        // source info
        int nSrcPart = getNumPartitions();
        int nextSrcPart = (srcPart + 1 + nSrcPart) % nSrcPart;
        int prevSrcPart = (srcPart - 1 + nSrcPart) % nSrcPart;

        // outbound boundary partitions
        int dstNeedingLastP = nextSrcPart/nDiv;
        int dstNeedingFirstP = prevSrcPart/nDiv;

        int nPoints = BlifInterpolator::getNumIntpolPoint(Na, N,
                                                          config->fmmPrecision);

        int result = 0;
        if (dstNeedingLastP == dstPart) result += nPoints;
        if (dstNeedingFirstP == dstPart) result += nPoints;

        return nRadPatComp*result;
}

FFTInterpolator *LevelHandler2d::getAggIntpl(cplx *work)
{
        if (aggIntpl == NULL)
                aggIntpl = new FFTInterpolator(getNyqSamplingRate(),
                                               getFullRadPatN(), work);
        return aggIntpl;
}
