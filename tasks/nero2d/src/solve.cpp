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

#include "nero2d.h"
#include "nearinthandler2d.h"
#include "geometry.h"
#include "cnfgfile.h"
#include "handlman.h"

// ===========================================================================
// PIM CALLABLE ROUTINES
// ===========================================================================

Nero2d *neroPtr = NULL;

static void pzsum(int *iSize, cplx *X, int *iPar)
{
#ifdef HAVE_MPI
        cplx work[10];
        MPI_Allreduce(X, work, *iSize, MPI_DOUBLE_COMPLEX,
                      MPI_SUM, MPI_COMM_WORLD);
        int one = 1;
        copy_f77(iSize, work, &one, X, &one);
#endif
}

static void pdznrm(deci *result, int *locLen, const cplx *U, int *iPar)
{
        *result = 0;
        for (int i = 0; i < *locLen; i++)
                *result += real(U[i])*real(U[i])+imag(U[i])*imag(U[i]);

#ifdef HAVE_MPI
        deci pSum = *result;
        MPI_Allreduce(&pSum, result, 1, MPI_DOUBLE_PRECISION,
                      MPI_SUM, MPI_COMM_WORLD);
#endif
}

static void empty(cplx *U, cplx *V, int *IPAR)
{

}

inline void preconl(cplx *U, cplx *V, int *IPAR)
{
        neroPtr->blockJacobiPreconl(U, V);
}

inline void progressIterativeSolving(int *locLen, int *nIt, deci *norm,
                                     cplx *X, cplx *res, cplx *trueRes)
{
        deci relNorm = *norm/neroPtr->getRhsNorm();
        neroPtr->progressIterativeSolving(*nIt, *norm, relNorm, -1);
}

inline void tfqmrProgressIterativeSolving(int *nIt, deci *kappa,
                                          deci *resNorm)
{
        deci relNorm = *resNorm/neroPtr->getRhsNorm();
        neroPtr->progressIterativeSolving(*nIt, *resNorm, relNorm, *kappa);
}

inline void matvec(cplx* U, cplx* V, int *iPar)
{
        neroPtr->nexus->parallelMatrixVector(U, V);
}

// ========================================================================
// BLOCK JACOBI PRECONDITIONER
// ========================================================================

void Nero2d::blockJacobiPreconl(cplx *U, cplx *V)
{
        hm->blockJacobiPreconl(U, V);
}

// ========================================================================
// SOLVING
// ========================================================================

void Nero2d::solve()
{
        int nProc = nexus->getNumProcesses();
        int thisProc = nexus->getProcessID();

        // shortcuts
        neroPtr = this;
        int N = geometry->getNumUnknowns();

        int lda = geometry->getNumUnknowns();
        int blockSize = nlUnknowns;
        int locLen = nlUnknowns;
        int stopType = 2;                        // 2 == |r_k| < eps * |b|
        // left preconditioner for PIM
        int preconType = (hm->getNumJacobiBlocks() > 0) ?  1 : 0;

        pdznrm(&rhsNorm, &nlUnknowns, B.data, NULL);

        // setup PIM parameters
        int *iPar = new int[13];
        deci *dPar = new deci[6];

        pim_setpar_f77(iPar, dPar, &lda, &N, &blockSize, &locLen,
                       &config->restartParameter, &nProc, &thisProc,
                       &preconType, &stopType, &config->maxIterations,
                       &config->itPrecision);

        // launch iterative solver
        switch (config->itMethod) {
                case TFQMR:
                        pim_tfqmr2_f77(X.data, B.data, itWork, iPar, dPar,
                                       matvec, preconl, empty, pzsum, pdznrm,
                                       tfqmrProgressIterativeSolving,
                                       &config->trueNormParameter);
                        break;
                case BICGSTAB:
                        pim_bicgstab_f77(X.data, B.data, itWork, iPar, dPar,
                                         matvec, preconl, empty, pzsum, pdznrm,
                                         ::progressIterativeSolving);
                        break;
                case RGMRES:
                        pim_rgmres_f77(X.data, B.data, itWork, iPar, dPar,
                                       matvec, preconl, empty, pzsum, pdznrm,
                                       ::progressIterativeSolving);
                        break;
        }

        nIterations = iPar[10];
        exitStatus = iPar[11];

        // free used memory
        delete [] iPar;
        delete [] dPar;
}
