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

#include "translhandler2d.h"
#include "levelhandler2d.h"
#include "mathlib.h"
#include "medium.h"

using namespace std;

// ===========================================================================
// FULL TRANSLATION HANDLER
// ===========================================================================

int FullTranslHandler::nRadPatComp = 1;

FullTranslHandler::FullTranslHandler(const LevelHandler2d* lvlHndl,
                                     const Medium *medium, const Point &T)
{
        int N = lvlHndl->getFullRadPatN();
        int partN = lvlHndl->getLocalRadPatN();
        int start = lvlHndl->getLocalStartPos();
        int groupID = lvlHndl->getGroupID();

        translOperator.setDimensions(partN);
        translOperator.allocateMemory(cplx(0,0));

        Vector<cplx> completeTransl(N, 0);
        CalcTranslator::calcTranslOperator(medium->gamma, N, T, completeTransl);

        for (int i = 0; i < partN; i++)
                translOperator(i) = completeTransl(start+i);
}

void FullTranslHandler::translate(cplx *src, cplx *dst)
{
        int Q = translOperator.size();
        for (int i = 0; i < nRadPatComp; i++)
                avpm(src+i*Q, translOperator.data, dst+i*Q, Q);
}

// ===========================================================================
// TRANSLATION HANDLER LF
// ===========================================================================

int TranslHandlerLF::nRadPatComp = 1;

TranslHandlerLF::TranslHandlerLF(const LevelHandler2d* lvlHndl,
                                 const Medium *medium, const Point &T)
{
        int N = 2*lvlHndl->getFullRadPatN();    // there's a minus and plus part
        int partN = 2*lvlHndl->getLocalRadPatN();
        int start = lvlHndl->getLocalStartPos();
        int groupID = lvlHndl->getGroupID();

        translOperator.setDimensions(partN);
        translOperator.allocateMemory(cplx(0,0));

        Vector<cplx> completeTransl(N, 0);
        CalcTranslator::calcTranslOperatorLF(medium->gamma, N, T,
                                             lvlHndl->getChi(), completeTransl);

        for (int i = 0; i < partN; i++)
                translOperator(i) = completeTransl(start+i);

        // Bart: Correct!
}

void TranslHandlerLF::translate(cplx *src, cplx *dst)
{
        int Q = translOperator.size();
        for (int i = 0; i < nRadPatComp; i++)
                avpm(src+i*Q, translOperator.data, dst+i*Q, Q);

        // Bart: Correct!
}

// ============================================================================
// TRANSLATION OPERATOR CALCULATION
// ============================================================================

double CalcTranslator::getTranslPrecision(double boxSize, double xDist,
                                          cplx gamma, int N)
{
        int numSendPoints = 10, numRecvPoints = 10;
        double R = boxSize/sqrt(2.);

        // calculate the sending and receiving Points
        Point* sendP = new Point[numSendPoints];
        for (int i = 0; i < numSendPoints; i++) {
                double angle = 2.0*pi*i/(double)numSendPoints;
                sendP[i].setCoords(R*cos(angle), R*sin(angle));
        }
        Point* recvP = new Point[numRecvPoints];
        for (int i = 0; i < numRecvPoints; i++) {
                double angle = 2.0*pi*i/(double)numRecvPoints;
                recvP[i].setCoords(R*cos(angle), R*sin(angle));
        }

        double boxDistance = boxSize*xDist;
        double phi = pi/7.0;

        Point b1(0, 0);
        Point b2(boxDistance*cos(phi), boxDistance*sin(phi));

        Point *k_n = new Point[N];
        dcomplex a(1,0), b(cos(2.0*pi/N), sin(2.0*pi/N));
        for(int i = 0; i < N; i++) {
                k_n[i].setCoords(real(a), imag(a));
                a *= b;
        }

        Vector<cplx> translation(N);
        calcTranslOperator(gamma, N, b2-b1, translation);

        double currentError = 0.0;
        for(int j = 0; j < numRecvPoints; j++)
                for(int i = 0 ; i < numSendPoints; i++) {
                        // FMM solution
                        dcomplex FMMRes = 0.0;

                        for(int k = 0 ; k < N; k++) {
                                double dot1 = k_n[k].dot(sendP[j]);
                                double dot2 = k_n[k].dot(recvP[i]);

                                FMMRes += ((cplx)exp(I*gamma*dot1))*
                                          translation(k)*
                                          ((cplx)exp(-I*gamma*dot2));
                        }

                        // Exact solution
                        Point diffP;
                        diffP = recvP[i] - sendP[j] + b2 - b1;
                        double distance = diffP.norm();
                        dcomplex exRes;
                        fastHankel0(gamma*distance, &exRes);

                        double err = abs((FMMRes-exRes)/exRes);
                        if (err > currentError) currentError = err;
                }

        delete [] k_n;
        delete [] sendP;
        delete [] recvP;
        return currentError;
}


void CalcTranslator::calcTranslOperator(cplx gamma, int Q, const Point &R,
                                        Vector<cplx> &data)
{
        double distance = R.norm();
        double phi = atan2(R.getY(), R.getX());
        double pot = pi/2.0; double ooq = 1./Q;

        int Q1 = ((Q % 2) == 0) ? Q/2-1 : (Q-1)/2;
        int Q2 = ((Q % 2) == 0) ? Q/2 : (Q-1)/2;
        int size = Q*sizeof(fftw_complex);
        dcomplex *HV = reinterpret_cast<dcomplex*>(fftw_malloc(size));
        dcomplex *F = reinterpret_cast<dcomplex*>(fftw_malloc(size));
        fastHankelSymm(Q1, Q2, gamma*distance, HV);

        dcomplex a = exp(I*(phi-pot));
        dcomplex b = exp(-Q1*(phi-pot)*I);
        for(int i = 0; i < Q; i++) {
                HV[i] *= b;
                b *= a;
        }

        fftw_plan fwd = fftw_plan_dft_1d(Q, reinterpret_cast<fftw_complex*>(HV),
                                         reinterpret_cast<fftw_complex*>(F),
                                         FFTW_FORWARD, FFTW_ESTIMATE);
        fftw_execute(fwd);
        fftw_destroy_plan(fwd);

        a = exp(2.0*pi*Q1*I*ooq);
        b = ooq;
        for(int i = 0; i < Q; i++) {
                data(i) = F[i]*b;
                if (isnan(real(data(i)) || isnan(imag(data(i)))))
                        cerr << "NaN while calculating translation operator"
                             << endl;
                b *= a;
        }

        fftw_free(HV);
        fftw_free(F);
}

void CalcTranslator::calcTranslOperatorLF(cplx gamma, int Q, const Point &R,
                                          double chi, Vector<cplx> &data)
{
        assert((Q % 2) == 0); // To make sure there's a minus and a plus part

        double RT = R.norm();
        double phiT = atan2(-R.getY(), -R.getX()); // Do the translation in the opposite direction
        double pot = pi/2.0;

        int Qplus = Q/2;
        int Qminus = Qplus;

        int Q1 = ((Qplus % 2) == 0) ? Qplus/2-1 : (Qplus-1)/2;
        int Q2 = ((Qplus % 2) == 0) ? Qplus/2 : (Qplus-1)/2;

        dcomplex *HN = new dcomplex[Q1+Q2+1];
        fastHankelSymm(Q1, Q2, gamma*RT, HN);

        dcomplex phi [Q];
        for (int i=0; i < Q; i++) {
                if (i < Qminus) phi[i] = 2.0*pi/Qminus*i + I*chi; // phiMinus
                else phi[i] = 2.0*pi/Qplus*(i-Qminus) - I*chi;    // phiPlus
        }

        for (int m = 0; m < Qminus; m++) {
        for (int n = -Q1; n < 0; n++) {
                data[m] += 1.0/Qminus*HN[n+Q1]*exp(I*(1.0*n)*(phiT-phi[m]+pot));
        }
        }

        for (int m = Qminus; m < Q; m++) {
        for (int n = 0; n <= Q2; n++) {
                data[m] += 1.0/Qplus*HN[n+Q1]*exp(I*(1.0*n)*(phiT-phi[m]+pot));
        }
        }

        delete [] HN;

        // Bart: Correct!
}
