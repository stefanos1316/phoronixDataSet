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

#include "base.h"
#include "nearinthandler2d.h"
#include "mathlib.h"
#include "geometry.h"
#include "object.h"
#include "medium.h"
#include "splaytree.h"

#include "nero2d.h"
#include "integrations.h"

#include <cstdio>
#include <map>

using namespace std;

// ============================================================================
// DEFAULT NEAR INTERACTION HANDLER
// ============================================================================

SegSegInt* NearIntHandler2d::segSegInt = NULL;

NearIntHandler2d::NearIntHandler2d(int start1, int stop1, int start2, int stop2)
{
        assert(segSegInt != NULL);

        // allocate memory for the matrix
        M.setDimensions(stop1-start1+1, stop2-start2+1);
        M.allocateMemory(cplx(0, 0));

        // calculate the interaction matrix M
        segSegInt->calcNearIntBlock(start1, stop1, start2, stop2, M);
}

void NearIntHandler2d::nearInt(const cplx *src, cplx *dst)
{
        const cplx alpha = 1, beta = 1; const int inc = 1;

        int m = M.nRows();
        int n = M.nCols();
        gemv_f77("N", &m, &n, &alpha, M.data, &m, src, &inc, &beta, dst, &inc);
}

// ============================================================================
// LU NEAR INTERACTION HANDLER
// ============================================================================

SegSegInt* LUNearIntHandler2d::segSegInt = NULL;

LUNearIntHandler2d::LUNearIntHandler2d(int start1, int stop1,
        int start2, int stop2, cplx *wrk) : work(wrk)
{
        assert(segSegInt != NULL);

        // allocate memory for the matrix
        M.setDimensions(stop1-start1+1, stop2-start2+1);
        M.allocateMemory(cplx(0, 0));

        // calculate the interaction matrix M
        segSegInt->calcNearIntBlock(start1, stop1, start2, stop2, M);

        // perform the LU decomposition
        calculateLU();
}

void LUNearIntHandler2d::calculateLU()
{
        assert (M.nRows() == M.nCols());
        assert (M.nRows() > 0);
        const int n = M.nRows(); int info;

        // calculate the actual LU decomposition
        int *iPivot = new int[n];
        getrf_f77(&n, &n, M.data, &n, iPivot, &info);
        if (info != 0)
                cout << "WARNING LAPACK routine zgetrf exited with a "
                        "non-zero return value (" << info << ")" << endl;

        // bring pivot into a new format for easier permutation
        pivot = new int[n];
        for (int j = 0; j < n; j++)
                pivot[j] = j;

        for (int j = n-1; j >= 0; j--) {
                int temp = pivot[j];
                pivot[j] = pivot[iPivot[j]-1];
                pivot[iPivot[j]-1] = temp;
        }

        delete [] iPivot;
}

void LUNearIntHandler2d::nearInt(const cplx *src, cplx *dst)
{
        const int one = 1, n = M.nRows();

        copy_f77(&n, src, &one, work, &one);
        trmv_f77("U", "N", "N", &n, M.data, &n, work, &one);
        trmv_f77("L", "N", "U", &n, M.data, &n, work, &one);
        for (int j = 0; j < n; j++)
                dst[j] += work[pivot[j]];
}

void LUNearIntHandler2d::nearIntBwd(const cplx *src, cplx *dst)
{
        const int one = 1, n = M.nRows();

        for (int j = 0; j < n; j++)
                work[pivot[j]] = src[j];
        trsv_f77("L", "N", "U", &n, M.data, &n, work, &one);
        trsv_f77("U", "N", "N", &n, M.data, &n, work, &one);
                copy_f77(&n, work, &one, dst, &one);
}

// ============================================================================
// OUTPUT NEAR INTERACTION HANDLER
// ============================================================================

SegOutput *NearOutputHandler2d::segOutput = NULL;
uint NearOutputHandler2d::nHandlers = 0;
uint NearOutputHandler2d::nHandlersDone = 0;

NearOutputHandler2d::NearOutputHandler2d(int testStart_, int testEnd_,
        int basisStart_, int basisEnd_) :  testStart(testStart_),
        testEnd(testEnd_), basisStart(basisStart_), basisEnd(basisEnd_)
{
        assert(segOutput != NULL);
        nHandlers++;
}

void NearOutputHandler2d::nearInt(const cplx *src, cplx *dst)
{
        cout << "Calculating scatttered fields...(" << ++nHandlersDone
             << "/" << nHandlers << ")\r";

        // calculate the output
        segOutput->calcOutput(testStart, testEnd, basisStart,
                              basisEnd, src, dst);

        if (nHandlersDone == nHandlers) cout << endl;
}

// ============================================================================
// SEGMENT SEGMENT INTERACTION CACHING CLASS
// ============================================================================

bool SegSegCacheEl::operator==(const SegSegCacheEl &rhs) const
{
        if (!dZero(r-rhs.r)) return false;
        if (!dZero(theta-rhs.theta)) return false;
        if (!dZero(psi-rhs.psi)) return false;
        if (!dZero(l1-rhs.l1)) return false;
        if (!dZero(l2-rhs.l2)) return false;
        if (medium != rhs.medium) return false;

        return true;
}

bool SegSegCacheEl::operator<(const SegSegCacheEl &rhs) const
{
        if (!dZero(r-rhs.r)) return (r-rhs.r < 0);
        if (!dZero(theta-rhs.theta)) return (theta-rhs.theta < 0);
        if (!dZero(psi-rhs.psi)) return (psi-rhs.psi < 0);
        if (!dZero(l1-rhs.l1)) return (l1-rhs.l1 < 0);
        if (!dZero(l2-rhs.l2)) return (l2-rhs.l2 < 0);
        if (medium != rhs.medium) return (medium - rhs.medium < 0);

        return false;   // they equal
}

bool SegSegCacheEl::operator>(const SegSegCacheEl &rhs) const
{
        if (!dZero(r-rhs.r)) return (r-rhs.r > 0);
        if (!dZero(theta-rhs.theta)) return (theta-rhs.theta > 0);
        if (!dZero(psi-rhs.psi)) return (psi-rhs.psi > 0);
        if (!dZero(l1-rhs.l1)) return (l1-rhs.l1 > 0);
        if (!dZero(l2-rhs.l2)) return (l2-rhs.l2 > 0);
        if (medium != rhs.medium) return (medium - rhs.medium > 0);

        return false;   // they equal
}

// ============================================================================
// SEGMENT-SEGMENT INTERACTION
// ============================================================================

SegSegInt::SegSegInt(const Geometry *geometry_, int qOrder_) :
        geometry(geometry_), qOrder(qOrder_)
{
        TM = geometry->haveTM();
        TE = geometry->haveTE();
        omega = 2.0*pi*geometry->getFrequency();
        beta = geometry->getBeta();

        st = new SplayTree<SegSegCacheEl>(10000, 0);
        itg = new Int(qOrder);

        for(int v = 0; v < 6; v++) {
                hf[v] = new dcomplex*[qOrder];
                for(int i = 0; i < qOrder; i++)
                        hf[v][i] = new dcomplex[qOrder];
        }

        // initialize Gauss quadrature
        gaussQP = new double[qOrder];
        getGaussQP(gaussQP, qOrder, 0.0, 1.0);
}

SegSegInt::~SegSegInt()
{
        delete st;
        delete itg;

        for(int v = 0; v < 6; v++) {
                for(int i = 0; i < qOrder; i++)
                        delete [] hf[v][i];
                delete [] hf[v];
        }

        delete [] gaussQP;
}

void SegSegInt::calcSegSegInteraction(const Segment &s2, const Segment &s1,
                                      dcomplex *out, Medium *medium)
{
        double l1, l2, hp1, hn1, hp2, hn2; Point n1, n2, t1, t2;
        s1.getMetaData(n1, t1, l1, hp1, hn1);
        s2.getMetaData(n2, t2, l2, hp2, hn2);

        Segment &sn1 = geometry->getSegment(s1.next);
        Segment &sn2 = geometry->getSegment(s2.next);

        // check for selfpatch
        bool sp = (&s1 == &s2);
        // check for neighborpatch
        bool nb12 = (&sn1 == &s2);
        bool nb21 = (&sn2 == &s1);
        bool nbp = (nb12 || nb21);
        // check for normal integration
        bool normal = !(sp || nbp);

        double phi = pi;
        // calculate phi in case of borpatch
        if (nb12) // angle between s2 and -s1
                phi = atan2(-t2.cross(t1), -t2.dot(t1));
        if (nb21) // angle between s1 and -s2
                phi = atan2(-t1.cross(t2), -t1.dot(t2));

        // get medium parameters
        dcomplex gamma = medium->gamma;

        // pointer to the appropriate hankel function (regular/non-regular)
        void (*intFunc) (dcomplex, dcomplex*) = (normal) ?
                        &fastHankel012 : &fastHankel012reg;

        // first of all, calculate the necessary integranda
        for (int t = 0; t < qOrder; t++) {
                for (int s = 0; s < qOrder; s++) {
                        dcomplex hankel012[3];
                        Point GP1 = (1.0-gaussQP[s])*s1.p + gaussQP[s]*sn1.p;
                        Point GP2 = (1.0-gaussQP[t])*s2.p + gaussQP[t]*sn2.p;
                        Point arg = GP2 - GP1;
                        double narg = arg.norm();
                        intFunc(gamma*narg, hankel012);
                        double dn1 = n1.dot(arg)/narg;
                        double dn2 = n2.dot(arg)/narg;
                        double dn1n2 = n1.dot(n2);

                        hf[0][t][s] = hankel012[0];
                        hf[3][t][s] = -dn1n2/2.0f*(hankel012[0]+hankel012[2]);
                        // in case of selfpatch: stop here
                        if (sp) continue;
                        hf[1][t][s] = hankel012[1]*dn1;
                        hf[2][s][t] = -hankel012[1]*dn2;
                        hf[3][t][s] += hankel012[2]*dn1*dn2;
                }
        }

        // calculate interactions
        out[0] = itg->PP(hf[0], gamma, l1, l2, phi, sp, nbp);
        out[1] = itg->PH(hf[1], 'U', gamma, l1, l2, phi, sp, nb12, nb21);
        out[2] = itg->PH(hf[1], 'D', gamma, l1, l2, phi, sp, nb12, nb21);
        out[3] = itg->PH(hf[2], 'U', gamma, l2, l1, phi, sp, nb21, nb12);
        out[4] = itg->PH(hf[2], 'D', gamma, l2, l1, phi, sp, nb21, nb12);
        out[5] = itg->HH(hf[3], 'U', 'U', gamma, l1, l2, phi, sp, nb12, nb21);
        out[6] = itg->HH(hf[3], 'D', 'U', gamma, l1, l2, phi, sp, nb12, nb21);
        out[7] = itg->HH(hf[3], 'U', 'D', gamma, l1, l2, phi, sp, nb12, nb21);
        out[8] = itg->HH(hf[3], 'D', 'D', gamma, l1, l2, phi, sp, nb12, nb21);
}

void SegSegInt::segSegInteractionForMedium(pair<const int, SMP> &sPair2,
                                           pair<const int, SMP> &sPair1,
                                           Matrix<cplx> &M, Medium* medium,
                                           double sign)
{
        // if the interaction medium is PEC (NULL): do nothing
        if (medium == NULL) return;

        // get the two interacting segments
        Segment &s1 = geometry->getSegment(sPair1.first);
        Segment &s2 = geometry->getSegment(sPair2.first);

        // get their meta data
        double l1, l2, hp1, hn1, hp2, hn2; Point n1, n2, t1, t2;
        s1.getMetaData(n1, t1, l1, hp1, hn1);
        s2.getMetaData(n2, t2, l2, hp2, hn2);

        // calculate other meta data
        double psi = atan2(t1.cross(t2), t1.dot(t2));
        if (psi < 0) psi += 2*pi; // make sure -pi == pi
        Point vectR = s2.p - s1.p;
        double r = vectR.norm();
        // set theta to zero in case of selfpatches
        double theta = dZero(r) ? 0 : atan2(t1.cross(vectR), t1.dot(vectR));

        // calculate the meta data which distinguishes unique interactions
        // TODO : better medIndex
        SegSegCacheEl cache(r, l1, l2, theta, psi, medium->ID);

        if (!st->find(cache)) {
                // calculate the segment interactions
                calcSegSegInteraction(s2, s1, cache.data, medium);
                st->insert(cache);
        }
        dcomplex *data = cache.data;
        data[1] *= hn1;
        data[2] *= hp1;
        data[3] *= hn2;
        data[4] *= hp2;
        data[5] *= hn1*hn2;
        data[6] *= hn1*hp2;
        data[7] *= hp1*hn2;
        data[8] *= hp1*hp2;

        // get medium parameters
        dcomplex gamma = medium->gamma;
        dcomplex eps = medium->eps;
        dcomplex mu = medium->mu;

        dcomplex igegeowom = I*gamma*gamma/omega/mu;
        dcomplex migegeowoe = -I*gamma*gamma/omega/eps;
        dcomplex mioeogg = -I*omega*eps/gamma/gamma;
        dcomplex iomogg = I*omega*mu/gamma/gamma;
        dcomplex mbooe = -beta/omega/eps;
        dcomplex boom = beta/omega/mu;
        dcomplex ibboggoe = I*beta*beta/gamma/gamma/omega/eps;
        dcomplex ibogg = I*beta/gamma/gamma;
        dcomplex mibboggom = -I*beta*beta/gamma/gamma/omega/mu;

        SMP &smp1 = sPair1.second;
        SMP &smp2 = sPair2.second;

        int ofs1 = 0, ofs2 = 0;

        // Ez due to ...
        if (TM) {
                // ... Ez interaction
                if (s1.obj->getMaterial() == DIEL) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*data[1];
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*data[2];
                        ofs1++;
                }

                // ... Hz interaction
                if (TE) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*mbooe*data[0]/Z0*hn1;
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*mbooe*data[0]/Z0*hp1;
                        ofs1++;
                }

                // ... Et interaction
                if (TE && (s1.obj->getMaterial() == DIEL))
                        ofs1++;

                // ... Ht interaction
                if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                        M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                sign*migegeowoe*data[0]/Z0;

                ofs2++;
        }

        // Hz due to ...
        if (TE && (s2.obj->getMaterial() == DIEL)) {
                ofs1 = 0;

                // ... Ez interaction
                if (TM && (s1.obj->getMaterial() == DIEL)) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*boom*data[0]*Z0*hn1;
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*boom*data[0]*Z0*hp1;
                        ofs1 ++;
                }

                // ... Hz interaction
                if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                        M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                sign*data[1];
                if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                        M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                sign*data[2];
                ofs1++;

                // ... Et interaction
                if (s1.obj->getMaterial() == DIEL) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*igegeowom*data[0]*Z0;
                }

                ofs2++;
        }

        // Et due to ...
        if (TE) {
                ofs1 = 0;

                // ... Ez interaction
                if (TM && (s1.obj->getMaterial() == DIEL)) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*ibogg*data[3]*hn1;
                        if ((smp1.unknPos >= 0) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*ibogg*data[4]*hn1;
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*ibogg*data[3]*hp1;
                        if ((smp1.prev != NULL) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*ibogg*data[4]*hp1;

                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        -sign*ibogg*data[1]*hn2;
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*ibogg*data[2]*hn2;
                        if ((smp1.unknPos >= 0) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*ibogg*data[1]*hp2;
                        if ((smp1.prev != NULL) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*ibogg*data[2]*hp2;
                        ofs1++;
                }

                // ... Hz interaction
                if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                        M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*iomogg*data[5]/Z0;
                if ((smp2.prev != NULL) && (smp1.unknPos >= 0))
                        M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*iomogg*data[6]/Z0;
                if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                        M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*iomogg*data[7]/Z0;
                if ((smp1.prev != NULL) && (smp2.prev != NULL))
                        M(smp2.prev->unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*iomogg*data[8]/Z0;

                if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                        M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*ibboggoe*data[0]/Z0*hn1*hn2;
                if ((smp2.prev != NULL) && (smp1.unknPos >= 0))
                        M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        -sign*ibboggoe*data[0]/Z0*hn1*hp2;
                if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                        M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*ibboggoe*data[0]/Z0*hp1*hn2;
                if ((smp1.prev != NULL) && (smp2.prev != NULL))
                        M(smp2.prev->unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*ibboggoe*data[0]/Z0*hp1*hp2;
                ofs1++;

                // ... Et interaction
                if (s1.obj->getMaterial() == DIEL) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) -=
                                        sign*data[3];
                        if ((smp2.prev != NULL) && (smp1.unknPos >= 0))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) -=
                                        sign*data[4];
                        ofs1++;
                }

                // ... Ht interaction
                if (TM) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*mbooe*data[0]/Z0*hn2;
                        if ((smp2.prev != NULL) && (smp1.unknPos >= 0))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        -sign*mbooe*data[0]/Z0*hp2;
                }

                ofs2++;
        }

        // Ht due to ...
        if (TM && (s2.obj->getMaterial() == DIEL)) {
                ofs1 = 0;

                // ... Ez interaction
                if (s1.obj->getMaterial() == DIEL) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*mioeogg*data[5]*Z0;
                        if ((smp2.prev != NULL) && (smp1.unknPos >= 0))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*mioeogg*data[6]*Z0;
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*mioeogg*data[7]*Z0;
                        if ((smp1.prev != NULL) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*mioeogg*data[8]*Z0;

                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*mibboggom*data[0]*Z0*hn1*hn2;
                        if ((smp2.prev != NULL) && (smp1.unknPos >= 0))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        -sign*mibboggom*data[0]*Z0*hn1*hp2;
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*mibboggom*data[0]*Z0*hp1*hn2;
                        if ((smp1.prev != NULL) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*mibboggom*data[0]*Z0*hp1*hp2;

                        ofs1++;
                }

                // ... Hz interaction
                if (TE) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*ibogg*data[3]*hn1;
                        if ((smp1.unknPos >= 0) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*ibogg*data[4]*hn1;
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*ibogg*data[3]*hp1;
                        if ((smp1.prev != NULL) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*ibogg*data[4]*hp1;

                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        -sign*ibogg*data[1]*hn2;
                        if ((smp1.prev != NULL) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        -sign*ibogg*data[2]*hn2;
                        if ((smp1.unknPos >= 0) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*ibogg*data[1]*hp2;
                        if ((smp1.prev != NULL) && (smp2.prev != NULL))
                                M(smp2.prev->unknPos+ofs2, smp1.prev->unknPos+ofs1) +=
                                        sign*ibogg*data[2]*hp2;
                        ofs1++;
                }

                // ... Et interaction
                if (TE && (s1.obj->getMaterial() == DIEL)) {
                        if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                                M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        sign*boom*data[0]*Z0*hn2;
                        if ((smp2.prev != NULL) && (smp1.unknPos >= 0))
                                M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) +=
                                        -sign*boom*data[0]*Z0*hp2;
                        ofs1++;
                }

                // ... Ht interaction
                if ((smp1.unknPos >= 0) && (smp2.unknPos >= 0))
                        M(smp2.unknPos+ofs2, smp1.unknPos+ofs1) -=
                                sign*data[3];
                if ((smp2.prev != NULL) && (smp1.unknPos >= 0))
                        M(smp2.prev->unknPos+ofs2, smp1.unknPos+ofs1) -=
                                sign*data[4];
        }
}

void SegSegInt::segSegInteraction(pair<const int, SMP> &smp2,
                                  pair<const int, SMP> &smp1,
                                  Matrix<cplx> &M)
{
        Segment &s1 = geometry->getSegment(smp1.first);
        Segment &s2 = geometry->getSegment(smp2.first);

        Medium *o2 = s2.obj->getOuterMedium();
        Medium *o1 = s1.obj->getOuterMedium();
        Medium *i2 = s2.obj->getInnerMedium();
        Medium *i1 = s1.obj->getInnerMedium();

        if (o1 == o2) segSegInteractionForMedium(smp2, smp1, M, o1, 1);
        if (i1 == i2) segSegInteractionForMedium(smp2, smp1, M, i1, 1);
        if (o2 == i1) segSegInteractionForMedium(smp2, smp1, M, o2, -1);
        if (i2 == o1) segSegInteractionForMedium(smp2, smp1, M, i2, -1);
}

void SegSegInt::calcNearIntBlock(int start1, int stop1,
                                 int start2, int stop2,
                                 Matrix<cplx> &M)
{
        // create a list of participating segments
        map<int, SMP> smpList1;
        geometry->getInteractingSegments(smpList1, start1, stop1);
        map<int, SMP> smpList2;
        geometry->getInteractingSegments(smpList2, start2, stop2);

        map<int, SMP>::iterator e1 = smpList1.begin();
        for( ; e1 != smpList1.end(); e1++) {
                map<int, SMP>::iterator e2 = smpList2.begin();
                for( ; e2 != smpList2.end(); e2++)
                        segSegInteraction(*e1, *e2, M);
        }
}

// ============================================================================
// SEGMENT OUTPUT CLASS
// ============================================================================

SegOutput::SegOutput(Geometry *geometry_, int qOrder_, Point *outputPoints_,
        int *pointGroupID_) : geometry(geometry_), qOrder(qOrder_),
        outputPoints(outputPoints_), pointGroupID(pointGroupID_)
{
        TM = geometry->haveTM();
        TE = geometry->haveTE();
        omega = 2.0*pi*geometry->getFrequency();
        beta = geometry->getBeta();

        itg = new Int(qOrder);
        for(int v = 0; v < 6; v++) {
                hf[v] = new dcomplex*[qOrder];
                for(int i = 0; i < qOrder; i++)
                        hf[v][i] = new dcomplex[qOrder];
        }

        // initialize Gauss quadrature
        gaussQP = new double[qOrder];
        getGaussQP(gaussQP, qOrder, 0.0, 1.0);
}

SegOutput::~SegOutput()
{
        delete itg;

        for(int v = 0; v < 6; v++) {
                for(int i = 0; i < qOrder; i++)
                        delete [] hf[v][i];
                delete [] hf[v];
        }

        delete [] gaussQP;
}

void SegOutput::calcOutput(int pointStart, int pointEnd,
                           int segStart, int segEnd,
                           const cplx *src, cplx *dst)
{
        // create a list of participating segments
        map<int, SMP> smpList;
        geometry->getInteractingSegments(smpList, segStart, segEnd);

        // loop over all output points in the test box
        for (int i = pointStart; i <= pointEnd; i += 6) {
                int groupID = pointGroupID[i/6];
                Medium *medium = geometry->getMedium(groupID);
                Point r = outputPoints[i/6];

                // loop over all segments in the basis box
                map<int, SMP>::iterator e = smpList.begin();
                for( ; e != smpList.end(); e++) {
                        double sign = 0.0;
                        Segment &s = geometry->getSegment((*e).first);

                        // try the inner medium
                        if (s.obj->getInnerMedium() == medium)
                                sign = 1.0;

                        // try the outer medium
                        if (s.obj->getOuterMedium() == medium)
                                sign = -1.0;

                        // exit if the segment is not adjacent to the medium
                        if (sign == 0.0) continue;

                        // calculate the six field components
                        Vector<cplx> result(6);
                        calcSegScatField(*e, r, medium, src, result, sign);
                        int index = i - pointStart;

                        // add results to the global output vector
                        for (int j = 0; j < 6; j++)
                                dst[index+j] += result(j);
                }
        }
}

void SegOutput::calcSingularPart(double r, double l, double theta,
                                 cplx gamma, cplx *result)
{
        // these terms behave well
        double st = sin(theta);
        double ct = cos(theta);
        double rst = r*st;
        double rct = r*ct;
        double lmrct = l-r*ct;

        // these terms can be singular
        double rlnr = r*log(r); // ok
        double lmrctlnp = lmrct*log(r*r-2*r*l*ct+l*l); // ok
        double rstlnp = rst*log(r*r-2*r*l*ct+l*l); // ok
        double rstatan = rst*(atan(lmrct/r/st)+atan(ct/st)); // ok
        double rctatan = rct*(atan(lmrct/r/st)+atan(ct/st));
        double lmrctatan = lmrct*(atan(lmrct/r/st)+atan(ct/st));

        if (dZero(r)) {
                rlnr = 0;
                rstatan = 0;
                rctatan = 0;
        }
        if (dZero(theta)) {
                rstatan = 0;
                if (r < l) {
                        rctatan = r*pi;
                        lmrctatan = l*pi;
                }
                if (r > l) {
                        rctatan = 0;
                        lmrctatan = 0;
                }
                if (dZero(r - l)) {
                        lmrctlnp = 0;
                        rstlnp = 0;
                        rctatan = l*pi/2.0;
                        lmrctatan = l*pi/2.0;
                }
        }

        result[0] = l*log(gamma)+0.5*lmrctlnp-l+rstatan+ct*rlnr;
        result[1] =  0.5*rstlnp+rctatan-st*rlnr;
        result[2] = -0.5*rstlnp+lmrctatan+st*rlnr;

        result[0] *= -2.0*I/(pi*l);
        result[1] *= -2.0*I/(pi*gamma*l);
        result[2] *= -2.0*I/(pi*gamma*l);
}

void SegOutput::calcSegScatField(pair<const int, SMP> &sPair, const Point &r,
                                 const Medium* medium, const cplx* X,
                                 Vector<cplx> &result, double sign)
{
        // shortcuts
        Segment &s = geometry->getSegment(sPair.first);
        Segment &sn = geometry->getSegment(s.next);
        SMP smp = sPair.second;
        bool isDiel = (s.obj->getMaterial() == DIEL);

        // calculate some necessary parameters
        dcomplex gamma = medium->gamma;
        dcomplex eps   = medium->eps;
        dcomplex mu    = medium->mu;

        dcomplex ggooefz = 0.25*gamma*gamma/omega/eps/Z0;
        dcomplex mggzoomf = -0.25*gamma*gamma*Z0/omega/mu;
        dcomplex igof = 0.25*I*gamma;
        dcomplex igzof = 0.25*I*gamma*Z0;
        dcomplex igofz = 0.25*I*gamma/Z0;
        dcomplex omof = 0.25*mu*omega;
        dcomplex moeof = -0.25*eps*omega;
        dcomplex mibofoez = -0.25*I*beta/omega/eps/Z0;
        dcomplex ibzofom = 0.25*I*beta*Z0/omega/mu;

        // calculate the meta-data
        double l, hp, hn; Point n, t;
        s.getMetaData(n, t, l, hp, hn);
        // tx = [1, 0], ty = [0, 1]
        Point nx(0, -1); Point ny(1, 0);
        double dnnx = n.dot(nx);
        double dnny = n.dot(ny);

        bool singular = false;
        for (int j = 0; j < qOrder; j++) {
                Point GP = (1.0-gaussQP[j])*s.p + gaussQP[j]*sn.p;
                Point arg = r-GP;
                double narg = arg.norm();

                hf[0][0][j] = gamma*narg;
                hf[1][0][j] = n.dot(arg)/narg;  // dn
                hf[2][0][j] = nx.dot(arg)/narg; // dnx
                hf[3][0][j] = ny.dot(arg)/narg; // dny

                if (abs(hf[0][0][j]) < 0.05) singular = true;
        }

        for (int j = 0; j < qOrder; j++) {
                dcomplex gnarg = hf[0][0][j];
                dcomplex hankel012[3];
                fastHankel012(gnarg, hankel012);

                double dn = real(hf[1][0][j]);
                double dnx = real(hf[2][0][j]);
                double dny = real(hf[3][0][j]);

                hf[0][0][j] = hankel012[0];
                hf[1][0][j] = hankel012[1]*dn;
                hf[2][0][j] = hankel012[1]*dnx;
                hf[3][0][j] = hankel012[1]*dny;
                hf[4][0][j] = -0.5*dnnx*(hankel012[0]+hankel012[2])+
                        hankel012[2]*dn*dnx;
                hf[5][0][j] = -0.5*dnny*(hankel012[0]+hankel012[2])+
                        hankel012[2]*dn*dny;

                if (singular) {
                        dcomplex hankel012reg[3];
                        fastHankel012reg(gnarg, hankel012reg);
                        hf[0][0][j] = hankel012reg[0];
                        hf[1][0][j] = hankel012reg[1]*dn;
                        hf[2][0][j] = hankel012reg[1]*dnx;
                }
        }

        dcomplex P0  = itg->P(hf[0][0], l);
        dcomplex U1n = itg->H(hf[1][0], 'U', l)*hn;
        dcomplex D1n = itg->H(hf[1][0], 'D', l)*hp;
        dcomplex Px  = itg->P(hf[2][0], l);
        dcomplex Py  = itg->P(hf[3][0], l);
        dcomplex U2x = itg->H(hf[4][0], 'U', l)*hn;
        dcomplex D2x = itg->H(hf[4][0], 'D', l)*hp;
        dcomplex U2y = itg->H(hf[5][0], 'U', l)*hn;
        dcomplex D2y = itg->H(hf[5][0], 'D', l)*hp;

        if (singular) {
                dcomplex singularPart[4];
                Point vectR = r - s.p;
                double r = vectR.norm();
                double theta = atan2(t.cross(vectR), t.dot(vectR));
                calcSingularPart(r, l, theta, gamma, singularPart);

                P0 += singularPart[0];
                U1n += singularPart[1]*hn;
                D1n += singularPart[2]*hp;
        }

        // set result vector 0
        for (int i = 0; i < 6; i++) result(i) = 0;

        int ofs = 0;
        // TM fields due to Ez
        if (TM && isDiel) {
                if (smp.unknPos >= 0) {
                        // Ez due to Ez (Up)
                        result(2) += sign*igof*U1n*(dcomplex)X[smp.unknPos];
                        // Hx due to Ez (Up)
                        result(3) += sign*moeof*U2x*(dcomplex)X[smp.unknPos];
                        // Hy due to Ez (Up)
                        result(4) += sign*moeof*U2y*(dcomplex)X[smp.unknPos];
                }

                if (smp.prev != NULL) {
                        // Ez due to Ez (Down)
                        result(2) += sign*igof*D1n*(dcomplex)X[smp.prev->unknPos];
                        // Hx due to Ez (Down)
                        result(3) += sign*moeof*D2x*(dcomplex)X[smp.prev->unknPos];
                        // Hy due to Ez (Down)
                        result(4) += sign*moeof*D2y*(dcomplex)X[smp.prev->unknPos];
                }
                ofs++;
        }

        // TM fields due to Hz
        if (TM && TE) {
                if ((smp.unknPos >= 0) && TE) {
                        // Ez due to Hx (Up)
                        result(2) += sign*mibofoez*P0*(dcomplex)X[smp.unknPos+ofs]*hn;
                        // Ex due to Hx (Up)
                        // TODO
                        // Ey due to Hx (Up)
                        // TODO
                }

                if ((smp.prev != NULL) && TE) {
                        // Ez due to Hx (Down)
                        result(2) += -sign*mibofoez*P0*(dcomplex)X[smp.prev->unknPos+ofs]*hp;
                        // Ex due to Hx (Down)
                        // TODO
                        // Ey due to Hx (Down)
                        // TODO
                }
                ofs++;
        }

        // TM fields due to Et
        if (TM && TE && isDiel) {
                ofs++;
        }

        // TM fields due to Ht
        if (TM) {
                if (smp.unknPos >= 0) {
                        // Ez due to Ht
                        result(2) += sign*ggooefz*P0*(dcomplex)X[smp.unknPos+ofs];
                        // Hx due to Ht
                        result(3) += sign*igofz*Px*(dcomplex)X[smp.unknPos+ofs];
                        // Hy due to Ht
                        result(4) += sign*igofz*Py*(dcomplex)X[smp.unknPos+ofs];
                }
        }

        // ======================= TE FIELDS ===========================

        ofs = 0;
        // TE fields due to Ez
        if (TE && TM && isDiel) {
                if ((smp.unknPos >= 0) && TE) {
                        // Ez due to Hz (Up)
                        result(5) += sign*ibzofom*P0*(dcomplex)X[smp.unknPos+ofs]*hn;
                        // Ex due to Hz (Up)
                        // TODO
                        // Ey due to Hz (Up)
                        // TODO
                }

                if ((smp.prev != NULL) && TE) {
                        // Ez due to Hz (Down)
                        result(5) += -sign*ibzofom*P0*(dcomplex)X[smp.prev->unknPos+ofs]*hp;
                        // Ex due to Hz (Down)
                        // TODO
                        // Ey due to Hz (Down)
                        // TODO
                }

                ofs++;
        }

        // TE fields due to Hz
        if (TE) {
                //int ofs = (isDiel) ? 1 : 0;
                if (smp.unknPos >= 0) {
                        // Hz due to Hz (Up)
                        result(5) += 1.0/Z0*sign*igof*U1n*(dcomplex)X[smp.unknPos+ofs];
                        // Ex due to Hz (Up)
                        result(0) += 1.0/Z0*sign*omof*U2x*(dcomplex)X[smp.unknPos+ofs];
                        // Ey due to Hz (Up)
                        result(1) += 1.0/Z0*sign*omof*U2y*(dcomplex)X[smp.unknPos+ofs];
                }

                if (smp.prev != NULL) {
                        // Hz due to Hz (Down)
                        result(5) += 1.0/Z0*sign*igof*D1n*(dcomplex)X[smp.prev->unknPos+ofs];
                        // Ex due to Hz (Down)
                        result(0) += 1.0/Z0*sign*omof*D2x*(dcomplex)X[smp.prev->unknPos+ofs];
                        // Ey due to Hz (Down)
                        result(1) += 1.0/Z0*sign*omof*D2y*(dcomplex)X[smp.prev->unknPos+ofs];
                }
                ofs++;
        }

        // TE fields due to Et
        if (TE && isDiel) {
                if (smp.unknPos >= 0) {
                        // Hz due to Et
                        result(5) += 1.0/Z0*sign*mggzoomf*P0*(dcomplex)X[smp.unknPos+ofs];
                        // Ex due to Et
                        result(0) += 1.0/Z0*sign*igzof*Px*(dcomplex)X[smp.unknPos+ofs];
                        // Ey due to Et
                        result(1) += 1.0/Z0*sign*igzof*Py*(dcomplex)X[smp.unknPos+ofs];
                }
                ofs++;
       }

        // TE fields due to Ht
        if (TE && TM) {

        }
}
