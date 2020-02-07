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

#include "excitation.h"
#include "scene2d.h"
#include "medium.h"
#include "mathlib.h"
#include "object.h"
#include "geometry.h"
#include "integrations.h"

using namespace std;

// ============================================================================
// POINT SOURCES
// ============================================================================

dcomplex Source::lineSourceEzField(const Point& r) const
{
        double norm = (r-orig).norm();
        dcomplex H2; fastHankel0(medium->gamma*norm, &H2);
        double omega = 2.0*pi*medium->frequency;
        return 0.25*omega*medium->mu*I0*H2;
}

dcomplex Source::lineSourceHtField(const Point& r, const Point& t) const
{
        Point arg = r-orig;
        double narg = arg.norm();
        dcomplex result[2];
        fastHankel01(medium->gamma*narg, result);
        dcomplex H2 = result[1];
        Point tmp(arg.getY(), -arg.getX());
        double dt = t.dot(tmp)/narg;
        return -0.25*I*I0*medium->k*medium->k/medium->gamma*dt*H2;
}

dcomplex Source::lineSourceHzField(const Point& r) const
{
        return 0;
}

dcomplex Source::lineSourceEtField(const Point& r, const Point& t) const
{
        double norm = (r-orig).norm();
        dcomplex result[2]; fastHankel01(medium->gamma*norm, result);
        dcomplex H2 = result[1];
        dcomplex mu = medium->mu;
        dcomplex beta = medium->beta;
        dcomplex gamma = medium->gamma;
        double omega = 2.0*pi*medium->frequency;
        double rdott = (r-orig).dot(t)/norm;
        return -0.25*I0*rdott*omega*I*mu*beta/gamma*H2;
}

// ============================================================================
// PLANE-WAVES
// ============================================================================

dcomplex Source::planeWaveTMEzField(const Point& r) const
{
        Point u(cos(angle), sin(angle));
        cplx gamma = medium->gamma;
        cplx k = medium->k;
        return Fx0*gamma/k*exp(-I*medium->gamma*r.dot(u));
}

dcomplex Source::planeWaveTMHtField(const Point& r, const Point& t) const
{
        Point u(cos(angle), sin(angle));
        Point tmp(u.getY(), -u.getX());
        double tdot = t.dot(tmp);
        cplx gamma = medium->gamma;
        return Fx0/medium->Z*tdot*exp(-I*gamma*r.dot(u));
}

dcomplex Source::planeWaveTEHzField(const Point& r) const
{
        Point u(cos(angle), sin(angle));
        cplx gamma = medium->gamma;
        cplx k = medium->k;
        return Fx0*gamma/k*exp(-I*gamma*r.dot(u));
}

dcomplex Source::planeWaveTEEtField(const Point& r, const Point& t) const
{
        Point u(cos(angle), sin(angle));
        Point tmp(u.getY(), -u.getX());
        double tdot = t.dot(tmp);
        cplx gamma = medium->gamma;
        //cplx beta = medium->beta;
        cplx k = medium->k;
        return -Fx0*medium->Z*tdot*exp(-I*gamma*r.dot(u));
        //return u.dot(t)*beta/gamma*planeWaveTMEzField(r);

        // FIXME !!  2.5D (the above)

        // this is pure TE (PEC only)
        //return -medium->Z*medium->Z*planeWaveTMHtField(r, t);
}

// ============================================================================
// GAUSSIAN BUNDLES
// ============================================================================

dcomplex hermite(int n, dcomplex x)
{
        if (n == 0)
                return 1.0;
        else if (n == 1)
                return 2.0*x;
        else
                return 2.0*(x*hermite(n-1,x)-(n-1.0)*hermite(n-2,x));
}

dcomplex Dhermite(int n, dcomplex x)
{
        if (n == 0)
                return 0.0;
        else if (n == 1)
                return 2.0;
        else
                return 2.0*(hermite(n-1,x)+x*Dhermite(n-1,x)-
                          (n-1.0)*Dhermite(n-2,x));
}

int faculty(int n)
{
        if (n == 0)
                return 1;
        else if (n == 1)
                return 1;
        else
                return n*faculty(n-1);
}

dcomplex Source::gaussBundleTMEzField(const Point& r) const
{
        dcomplex gamma = medium->gamma;

        double a = 0.128*real(gamma)*gaussW*gaussW;
        dcomplex rraX = r.getX() - (orig.getX() - I*a*cos(angle));
        dcomplex rraY = r.getY() - (orig.getY() - I*a*sin(angle));

        dcomplex arg = sqrt(rraX*rraX + rraY*rraY);
        // chose the correct squareroot
        if (imag(arg) < 0) arg = -arg;

        dcomplex H0 = HankelScaled(0, gamma*arg);
        dcomplex P = exp(-I*gamma*(arg-a*I))/HankelScaled(0, gamma*I*a);

        return P*H0;
}

dcomplex Source::gaussBundleTMHtField(const Point& r, const Point& t) const
{
        dcomplex gamma = medium->gamma;
        dcomplex epsilon = medium->eps;
        double omega = 2.0*pi*medium->frequency;

        double a = 0.128*real(gamma)*gaussW*gaussW;
        dcomplex rraX = r.getX() - (orig.getX() - I*a*cos(angle));
        dcomplex rraY = r.getY() - (orig.getY() - I*a*sin(angle));

        dcomplex arg = sqrt(rraX*rraX + rraY*rraY);
        // chose the correct squareroot
        if (imag(arg) < 0) arg = -arg;

        dcomplex H1 = HankelScaled(1, gamma*arg);
        dcomplex P = exp(-I*gamma*(arg-a*I))/HankelScaled(0, gamma*I*a);

        return -I*omega*epsilon*P*H1/gamma/arg*(t.getX()*rraY-t.getY()*rraX);
}

dcomplex Source::gaussBundleTEHzField(const Point& r) const
{
        return 0.0;
}

dcomplex Source::gaussBundleTEEtField(const Point& r, const Point& t) const
{
        dcomplex gamma = medium->gamma;
        dcomplex beta = medium->beta;

        double a = 0.128*real(gamma)*gaussW*gaussW;
        dcomplex rraX = r.getX() - (orig.getX() - I*a*cos(angle));
        dcomplex rraY = r.getY() - (orig.getY() - I*a*sin(angle));

        dcomplex arg = sqrt(rraX*rraX + rraY*rraY);
        // chose the correct squareroot
        if (imag(arg) < 0) arg = -arg;

        dcomplex H1 = HankelScaled(1, gamma*arg);
        dcomplex P = exp(-I*gamma*(arg-a*I))/HankelScaled(0, gamma*I*a);

        return -I*beta*P*H1/gamma/arg*(t.getX()*rraX+t.getX()*rraX);
}

// ============================================================================
// PUBLIC FUNCTIONS
// ============================================================================

dcomplex Source::calcEzField(const Point& r) const
{
        switch (source) {
                case POINTSOURCE:
                        return lineSourceEzField(r);
                case GAUSSBUNDLE:
                        return gaussBundleTMEzField(r);
                case PLANEWAVE:
                        return planeWaveTMEzField(r);
        }
}

dcomplex Source::calcHtField(const Point& r, const Point& t) const
{
        switch (source) {
                case POINTSOURCE:
                        return lineSourceHtField(r, t);
                case GAUSSBUNDLE:
                        return gaussBundleTMHtField(r, t);
                case PLANEWAVE:
                        return planeWaveTMHtField(r, t);
        }
}

dcomplex Source::calcHzField(const Point& r) const
{
        switch (source) {
                case POINTSOURCE:
                        return lineSourceHzField(r);
                case GAUSSBUNDLE:
                        return gaussBundleTEHzField(r);
                case PLANEWAVE:
                        return planeWaveTEHzField(r);
        }
}

dcomplex Source::calcEtField(const Point& r, const Point& t) const
{
        switch (source) {
                case POINTSOURCE:
                        return lineSourceEtField(r, t);
                case GAUSSBUNDLE:
                        return gaussBundleTEEtField(r, t);
                case PLANEWAVE:
                        return planeWaveTEEtField(r, t);
        }
}

std::ostream& operator<<(std::ostream& os, const Source& E)
{
        // shortcuts
        Point r = E.orig;
        dcomplex E0 = E.Fx0; dcomplex I0 = E.I0;
        double w = E.gaussW; double angle = E.angle;

        switch(E.source) {
                case POINTSOURCE:
                        os << "PointSrc at (" << r << "), I = " << I0;
                        break;
                case GAUSSBUNDLE:
                        os << "GaussB at (" << r << "), F0 = " << E0
                                << " angle = " << angle << " width = " << w;
                        break;
                case PLANEWAVE:
                        os << "PlaneWave F0 = " << E0 << ", angle = " << angle;
                        break;
        }
        return os;
}

// ============================================================================
// EXCITATION CLASS
// ============================================================================

Excitation::Excitation(Geometry *geometry_, int qOrder_) :
        geometry(geometry_), qOrder(qOrder_), nSources(0), source(NULL)
{
        TM = geometry->haveTM();
        TE = geometry->haveTE();
}

Excitation::~Excitation()
{
        delete [] source;
}

void Excitation::loadExcitation(ifstream &ifs)
{
        // temporary read variables
        double d1, d2, d3, d4;
        char c;

        ifs >> nSources;

        source = new Source[nSources];
        for(int j = 0; j < nSources; j++) {
                Source &src = source[j];
                ifs >> c;
                src.source = ExcType(c);
                switch (src.source) {
                        case POINTSOURCE:
                                ifs >> d1 >> d2 >> d3 >> d4;
                                src.I0 = dcomplex(d1, d2);
                                src.orig.setCoords(d3, d4);
                                src.medium =
                                        geometry->getMediumAtPoint(src.orig);
                                assert(src.medium != NULL);
                                break;
                        case GAUSSBUNDLE:
                                ifs >> src.gaussW >> src.angle;
                                ifs >> d1 >> d2 >> d3 >> d4;
                                ifs >> src.order;
                                src.Fx0 = dcomplex(d1, d2);
                                src.orig.setCoords(d3, d4);
                                src.medium = geometry->getBackgroundMedium();
                                break;
                        case PLANEWAVE:
                                ifs >> d1 >> d2 >> src.angle;
                                src.Fx0 = dcomplex(d1, d2);
                                src.medium = geometry->getBackgroundMedium();
                                break;
                }
                // convert the degrees to radians
                src.angle *= pi/180.0;
        }


        // FIXME FIXME
        for(int j = 0; j < nSources; j++) {
                Source &src = source[j];
                switch (src.source) {
                        case POINTSOURCE:
                                if (TE) {
                                        cerr << "This version only supports "
                                                "for pure TM point sources "
                                              << endl;
                                        exit (0);
                                }
                                break;
                        case GAUSSBUNDLE:
                                if (TE && !TM) {
                                        cerr << "This version has no support "
                                                "for pure TE gaussian bundles "
                                             << endl;
                                        exit (0);
                                }
                                break;
                        case PLANEWAVE:
                                if (TE && TM) {
                                        cerr << "This version has no support "
                                                "for pure TE/TM plane waves "
                                             << endl;
                                        exit (0);
                                }
                                break;

                }
        }
}


void Excitation::addSource(std::pair<const int, SMP> &sPair, Source &src,
                           int sign, Vector<cplx> &V)
{
        // calculate the segment data + shortcuts
        Segment &s = geometry->getSegment(sPair.first);
        Segment &sn = geometry->getSegment(s.next);

        double l, hn, hp; Point n, t;
        s.getMetaData(n, t, l, hp, hn);
        SMP smp = sPair.second;
        bool isDIEL = (s.obj->getMaterial() != PEC);
        double sgn = 1.0*sign;
        int offset = 0;

        for (int j = 0; j < qOrder; j++) {
                Point GP = (1.0-gaussQP[j])*s.p + gaussQP[j]*sn.p;
                if (TM) hf[0][0][j] = src.calcEzField(GP);
                if (TE && isDIEL) hf[2][0][j] = src.calcHzField(GP);
                if (TE) hf[3][0][j] = src.calcEtField(GP, t);
                if (TM && isDIEL) hf[1][0][j] = src.calcHtField(GP, t);
        }

        // Ez (both PEC and dielectrics)
        if (TM) {
                dcomplex pe = itg->P(hf[0][0], l);
                if (smp.unknPos >= 0)
                        V(smp.unknPos+offset) += sgn*pe;
                offset++;
        }

        // Hz (only dielectrica)
        if (TE && isDIEL) {
                dcomplex ph = itg->P(hf[2][0], l);
                if (smp.unknPos >= 0)
                        V(smp.unknPos+offset) += sgn*Z0*ph;
                offset++;
        }

        // Et (both PEC and dielectrics)
        if (TE) {
                dcomplex ue = itg->H(hf[3][0], 'U', l);
                dcomplex de = itg->H(hf[3][0], 'D', l);

                if (smp.unknPos >= 0)
                        V(smp.unknPos+offset) += sgn*ue*hn;
                if (smp.prev != NULL)
                        V(smp.prev->unknPos+offset) += sgn*de*hp;
                offset++;
        }

        // Ht (only dielectrica)
        if (TM && isDIEL) {
                dcomplex uh = itg->H(hf[1][0], 'U', l);
                dcomplex dh = itg->H(hf[1][0], 'D', l);

                if (smp.unknPos >= 0)
                        V(smp.unknPos+offset) += sgn*uh*Z0*hn;
                if (smp.prev != NULL)
                        V(smp.prev->unknPos+offset) += sgn*dh*Z0*hp;
                offset++;
        }
}

void Excitation::calculateSegSources(std::pair<const int, SMP> &sPair,
                                     Vector<cplx> &V)
{
        for(int i = 0; i < nSources; i++) {
                if (geometry->getSegment(sPair.first).obj->getOuterMedium() ==
                                   source[i].medium)
                        addSource(sPair, source[i], 1, V);
                if (geometry->getSegment(sPair.first).obj->getInnerMedium() ==
                                   source[i].medium)
                        addSource(sPair, source[i], -1, V);
        }
}

void Excitation::calcExcitationVector(Vector<cplx> &V)
{
        // prepare the numerical integration variables
        itg = new Int(qOrder);
        for(int v = 0; v < 6; v++) {
                hf[v] = new dcomplex*[qOrder];
                for(int i = 0; i < qOrder; i++)
                        hf[v][i] = new dcomplex[qOrder];
        }

        // initialize Gauss quadrature
        gaussQP = new double[qOrder];
        getGaussQP(gaussQP, qOrder, 0.0, 1.0);

        // create a list of participating segments
        map<int, SMP> smpList;
        geometry->getInteractingSegments(smpList, 0, V.size()-1);

        map<int, SMP>::iterator e = smpList.begin();
        for( ; e != smpList.end(); e++)
                calculateSegSources(*e, V);

        // free the numerical integration variables
        for(int v = 0; v < 6; v++) {
                for(int i = 0; i < qOrder; i++)
                        delete [] hf[v][i];
                delete [] hf[v];
        }

        delete [] gaussQP;
        delete itg;
}

void Excitation::calcIncomingField(const Point *r, const int *groupID,
                                   int n, Vector<cplx> &result)
{
        for(int i = 0; i < 6*n; i++)
                result(i) = 0;
        Point ty(1, 0); Point tz(0, 1);
        for (int j = 0; j < n; j++) {
                const Point &p = r[j];

                for(int i = 0; i < nSources; i++) {
                        Source &exc = source[i];
                        if (TM) {
                                if (groupID[j] == exc.medium->ID)
                                        result(6*j+2) += exc.calcEzField(p);
                                if (groupID[j] == exc.medium->ID)
                                        result(6*j+3) += exc.calcHtField(p, ty);
                                if (groupID[j] == exc.medium->ID)
                                        result(6*j+4) += exc.calcHtField(p, tz);
                        }
                        if (TE) {
                                if (groupID[j] == exc.medium->ID)
                                        result(6*j+5) += exc.calcHzField(p);
                                if (groupID[j] == exc.medium->ID)
                                        result(6*j+0) += exc.calcEtField(p, ty);
                                if (groupID[j] == exc.medium->ID)
                                        result(6*j+1) += exc.calcEtField(p, tz);
                        }
                }
        }
}

ostream& operator<<(std::ostream& os, const Excitation& E)
{
        cout << "\t-----------------------------------" << endl;
        cout << "\tEXCITATION LISTING" << endl;
        cout << "\t-----------------------------------" << endl;
        for (int i = 0; i < E.nSources; i++)
                cout << "\t* Excitation " << i << ": " << E.source[i] << endl;
}
