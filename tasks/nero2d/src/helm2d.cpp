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

#ifdef HAVE_CONFIG_H
        #include <config.h>
#endif

#include "nero2d.h"
#include "helm2d.h"
#include "mathlib.h"
#include "inthandler2d.h"
#include "agghandler2d.h"
#include "translhandler2d.h"
#include "levelhandler2d.h"
#include "nearinthandler2d.h"
#include "object.h"
#include "geometry.h"
#include "medium.h"
#include "excitation.h"
#include "cnfgfile.h"
#include "handlman.h"

#include <iostream>
#include <cstdlib>
#include <map>
#include <vector>
#include <fstream>

using namespace std;

// ============================================================================
// SAMPLING RATE DETERMINATION
// ============================================================================

bool Helm2d::primeCheck(int N)
{
        if ((N % 13) == 0) N /= 13;
        while ((N % 11) == 0) N /= 11;
        while ((N % 7) == 0) N /= 7;
        while ((N % 5) == 0) N /= 5;
        while ((N % 3) == 0) N /= 3;
        while ((N % 2) == 0) N /= 2;

        if (N == 1) return true;
        return false;
}

int Helm2d::getAggMatSamplingRate(cplx gamma, double boxSize, int lN,
                                  double precision)
{
        int halfN = ((lN % 2) == 0) ? lN/2 : (lN-1)/2;
        dcomplex arg = (boxSize/sqrt(2.0))*gamma; int sN;

        // FIXME : nakijken voor verlieshebbende gamma
        if (halfN > 10000) return halfN;

        dcomplex *result = new dcomplex[halfN+1];
        amosBessJrangeNormalized(0, halfN, arg, result);

        for (sN = 1; sN <= halfN; sN++)
                if (abs(result[sN]/result[0]) < precision) break;

        delete [] result;

        return 2*sN-1;
}

void Helm2d::getRadPatSamplingRate(cplx gamma, double boxSize, double xDist,
                                   int &N, bool &HF, double &chi,
                                   double precision)
{
        if (abs(imag(gamma)/abs(gamma)) < 1e-12)
                N = getRadPatSamplingRateReal(gamma, boxSize, xDist, HF,
                                              chi, precision);
        else
                N = getRadPatSamplingRateComplex(gamma, boxSize, xDist, HF,
                                                 chi, precision);
}

int Helm2d::getRadPatSamplingRateComplex(cplx gamma, double boxSize,
                                         double xDist, bool &HF, double &chi,
                                         double precision)
{
        // FIXME: This method searches for N = 1, 2, 3, etc...
        // If N is very large, this method is slow!

        int L;

        cplx rt = gamma*boxSize*xDist;
        cplx ra = gamma*boxSize*sqrt(2.0);
        cplx rta = rt-ra;

        int LStep = 100;
        int Lmin = 0;
        int Lmax = Lmin+LStep-1;

        dcomplex *JN = new dcomplex[LStep];
        dcomplex *HN = new dcomplex[LStep];

        dcomplex H0; amosHank2rangeNormalized(0, 0, rta, &H0);
        dcomplex HN0; amosHank2rangeNormalized(0, 0, rt, &HN0);
        dcomplex exponent = exp(abs(imag(ra))-I*rt+I*rta);

        bool stop = false;
        while (!stop) {
                amosBessJrangeNormalized(Lmin, Lmax, ra, JN);
                amosHank2rangeNormalized(Lmin, Lmax, rt, HN);

                for (L = Lmin; L <= Lmax; L++) {
                        if (abs(HN[L-Lmin]/H0*JN[L-Lmin]*exponent) < precision)
                        {
                                stop = true;
                                HF = false;
                                chi = 1.0/L*log(abs(HN[L-Lmin]/HN0));
                                if (chi < 0 || isnan(chi)) {
                                        HF = true;
                                        chi = 0.0;
                                }
                                break;
                        }
                }

                Lmin = Lmax+1;
                Lmax = Lmin+LStep-1;
        }

        delete [] JN;
        delete [] HN;

        return 2*L+1;
}

int Helm2d::getRadPatSamplingRateReal(cplx gamma, double boxSize, double xDist,
                                      bool &HF, double &chi, double precision)
{
        // Try the LF-criterium
        // If necessary/allowed, go to the HF-case

        int N;
        int L;

        int Lmin = (int)(sqrt(2.0)*abs(gamma)*boxSize+1);
        int Lmax = Lmin+100;

        dcomplex *JN = new dcomplex[Lmax-Lmin+1];
        amosBessJrange(Lmin, Lmax, sqrt(2.0)*gamma*boxSize, JN);

        dcomplex *HN = new dcomplex[Lmax];
        amosHank2range(0, 1, gamma*xDist*boxSize, HN);
        dcomplex H0 = HN[0];

        for (L = 2; L < Lmax; L++)
                HN[L] = 2.0*(L-1)/(gamma*xDist*boxSize)*HN[L-1]-HN[L-2];

        for (L = Lmin; L < Lmax; L++)
                if (abs(HN[L]/H0*JN[L-Lmin]) < precision) break;

        N = 2*L+1;

        if (L==Lmax || (abs(JN[L-Lmin]) > MACHPREC)) {          // HF-case
                HF = true;
                chi = 0.0;
                N = getRadPatSamplingRateRealHF(gamma, boxSize,
                                                xDist, precision);

                // post processing for N (Bart)
                while (!primeCheck(N++));
                // compensate for the last N++
                N = N-1;
        }

        else {                                                  // LF-case
                // post processing for N (Bart)
                while (!primeCheck(N++));
                // compensate for the last N++
                N = N-1;
                L = (int)((N-1)/2.0);

                HF = false;
                chi = 1.0/L*log(abs(HN[L-Lmin]/H0));
        }

        delete [] JN;
        delete [] HN;

        return N;

        // Bart: Correct!
}

int Helm2d::getRadPatSamplingRateRealHF(cplx gamma, double boxSize,
                                        double xDist, double precision)
{
        // shortcuts
        double n = xDist-1, k = abs(gamma), s2 = sqrt(2.0);
        double d0 = abs(log(precision)/log(10.0)), a = boxSize;
        double error = precision;

        // try excess bandwith formula
        int N = (int)(2.0*(s2*k*a+2.0*pow(d0, 2.0/3.0)*pow(k*a, 1.0/3.0)));

        if (N < 10000)
                error = CalcTranslator::getTranslPrecision(boxSize, xDist,
                                                           gamma, N);
        if (error > precision) { // excess bandwith formula not valid
                int Nmin = (int)(abs(k*boxSize))+1;
                int Nmax = 10*Nmin+100;

                for(int cN = Nmin; cN < Nmax; cN++) {
                        double E = CalcTranslator::getTranslPrecision(boxSize,
                                                        xDist, gamma, cN);

                        if (E < error) {
                                error = E;
                                N = cN;
                        }
                        if (error < precision) break;
                }
        }

        return N;
}

double Helm2d::getXDist(double boxSize, double frequency,
                        const ConfigFile *config)
{
        double lambda0 = c/frequency;
        double maxAbsSegLenght = config->segLengthRel*lambda0;
        double maxActBoxSize = boxSize + config->overshoot*maxAbsSegLenght;
        double actXDist = config->xDist*maxActBoxSize/boxSize;

        double small = 1e-5;
        if (actXDist < 1.0) return 1.0-small;
        if (actXDist < sqrt(2.0)) return sqrt(2.0)-small;
        if (actXDist < 2.0) return 2.0-small;
        if (actXDist < sqrt(5.0)) return sqrt(5.0)-small;
        if (actXDist < sqrt(8.0)) return sqrt(8.0)-small;
        if (actXDist < 3.0) return 3.0-small;
        if (actXDist < sqrt(10.0)) return sqrt(10.0)-small;
        if (actXDist < sqrt(13.0)) return sqrt(13.0)-small;
        if (actXDist < sqrt(18.0)) return sqrt(18.0)-small;
        return actXDist;
}

double Helm2d::getEnlargedBoxSize(double boxSize, double wavelength,
                                  const ConfigFile *config)
{
        double overSizeRel = config->overshoot*config->segLengthRel;
        return boxSize + overSizeRel*wavelength;
}

void Nero2d::setup()
{
        Util::startChrono();

        // calculate the handler objects
        hm->allocateWorkMemory();

        hm->calcNearIntHandlers(nexus, geometry, config);
        hm->calcAggHandlers(nexus, geometry, config, true);
        hm->calcIntpolHandlers(nexus, geometry, config);
        hm->calcTranslHandlers(nexus, geometry, config);

        // calculate the right hand side vector
        B.setDimensions(nlUnknowns);
        B.allocateMemory(cplx(0, 0));
        excitation->calcExcitationVector(B);

        // allocate the unknown vector
        X.setDimensions(nlUnknowns);
        X.allocateMemory(cplx(0, 0));

        // count the memory for the iterative solving process
        unsigned int iterWork = 0;
        switch (config->itMethod) {
                case TFQMR:
                        iterWork = 12*nlUnknowns;
                        break;
                case BICGSTAB:
                        iterWork = 10*nlUnknowns;
                        break;
                case RGMRES:
                        iterWork = (4+config->restartParameter)*nlUnknowns;
                        break;
        }

        // calculate and allocate work vector
        itWork = new cplx[iterWork];
        nexus->prepareMatrixVector();

        double time = Util::stopChrono();
        cout << "Setup time: " << time << "s" << endl;

#ifdef HAVE_MPI
        cout << "Waiting for other processes to finish setup...";
        cout.flush();
        MPI_Barrier(MPI_COMM_WORLD);
        cout << "done" << endl;
#endif
}
