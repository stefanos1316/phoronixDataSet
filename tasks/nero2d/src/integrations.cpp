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

#include "mathlib.h"
#include "integrations.h"

Int::Int(int qOrder_) : qOrder(qOrder_)
{
        f = new dcomplex[qOrder];
        g = new dcomplex[qOrder];

        // create the D and U function
        funcU = new double[qOrder];
        getGaussQP(funcU, qOrder, 0, 1);
        funcD = new double[qOrder];
        for(int i = 0; i < qOrder; i++)
                funcD[i] = funcU[qOrder-1-i];
}

Int::~Int()
{
        delete [] f;
        delete [] g;
        delete [] funcU;
        delete [] funcD;
}

// =========================================================================
// NEAR INTERACTIONS SEGMENT DOUBLE INTEGRATIONS
// =========================================================================

double Int::PP_nb_f(double l1, double l2, double phi)
{
        // in case phi == pi => return limit
        if (dZero(phi-pi))
                return -0.5*l1/l2*log(l1)-0.75+0.5*(1.0+l1/l2)*log(l1+l2);
        // otherwise: general formula
        else return 0.5*l1/l2*sin(phi)*(atan((l2-l1*cos(phi))/l1/sin(phi))+
        atan(cos(phi)/sin(phi)))-0.75+0.25*(1.0-cos(phi)*l1/l2)*
        log(l1*l1+l2*l2-2.0*l1*l2*cos(phi))+0.5*cos(phi)*l1/l2*log(l1);
}

dcomplex Int::PP_nb(double l1, double l2, double phi, dcomplex gamma)
{
        return 0.5/pi*(log(gamma)+PP_nb_f(l1, l2, phi)+PP_nb_f(l2, l1, phi));
}

dcomplex Int::PP(dcomplex **intv, dcomplex gamma, double l1, double l2,
                    double phi, bool selfpatch, bool neighborpatch)
{
        // check for normal case
        bool normal = !(selfpatch || neighborpatch);

        // calculate the function values for the outer integral
        for(int t = 0; t < qOrder; t++)
                g[t] = gaussQuadr(intv[t], qOrder, 0, l1);

        // calculate the outer integral
        dcomplex result = I/4.0/l1/l2*gaussQuadr(g, qOrder, 0, l2);

        if (normal) return result;
        if (selfpatch) return result + 0.5/pi*(log(gamma*l1)-1.5);
        // if we get here: it's a neigborpatch
        return result + PP_nb(l1, l2, phi, gamma);
}

double Int::PD_nb_f(double l1, double l2, double phi)
{
        return 0.5*(l1*l1*cos(phi)+2.0*l1*l2-l2*l2*cos(phi))*
        atan(cos(phi)/sin(phi))-l1*l2*atan((cos(phi)*l2-l1)/l2/sin(phi));
}

double Int::PD_nb_g(double l1, double l2, double phi)
{
        return -0.5*l1*l1*atan((l1*cos(phi)-l2)/l1/sin(phi))*cos(phi)+
                0.25*sin(phi)*l1*l1*log(l2*l2+l1*l1-2.0*l1*l2*cos(phi))-
                0.5*l1*l1*sin(phi)*log(l1);
}

double Int::PD_nb(double l1, double l2, double phi)
{
        // in case phi == pi => return limit
        if (dZero(phi-pi)) return 0;

        return 0.5/pi/l1/l2*(PD_nb_f(l1,l2,phi)+PD_nb_g(l1,l2,phi)
                        -PD_nb_g(l2,l1,phi));
}

double Int::PU_nb_f(double l1, double l2, double phi)
{
        return 0.5*l1*l1*cos(phi)*atan(cos(phi)/sin(phi))+
                0.5*cos(phi)*l1*l1*atan((l2-cos(phi)*l1)/l1/sin(phi))-
                0.5*sin(phi)*l1*l1*log(l1)+0.25*sin(phi)*
                l1*l1*log(l2*l2+l1*l1-2.0*l1*l2*cos(phi));
}

double Int::PU_nb(double l1, double l2, double phi)
{
        // in case phi == pi => return limit
        if (dZero(phi-pi)) return 0;

        return 0.5/pi/l1/l2*(PU_nb_f(l1,l2,phi)+PU_nb_f(l2,l1,phi));
}

dcomplex Int::PH(dcomplex **intv, char T1, dcomplex gamma, double l1,
                    double l2, double phi, bool selfpatch, bool nb12, bool nb21)
{
        // the selfpatch value is 0.25 for external interactions and -0.25
        // for internal interactions.  They cancel each other, so we return 0
        // complex selfpatchvalue = 0.25;
        // if (selfpatch) return (innerArea) ? selfpatchvalue : -selfpatchvalue;
        if (selfpatch) return 0;
        // check for borpatch type 1
        bool nbT1 = (T1 == 'U') ? (nb12) : (nb21);
        // check for borpatch type 2
        bool nbT2 = (T1 == 'U') ? (nb21) : (nb12);
        // check for normal case (selfpatch no longer possible)
        bool normal = !(nbT1 || nbT2);
        // assign correct hat function
        double* hatFunc = (T1 == 'U') ? funcU : funcD;

        // calculate the function values for the outer integral
        for(int t = 0; t < qOrder; t++) {
                for(int s = 0; s < qOrder; s++)
                        f[s] = hatFunc[s]*intv[t][s];
                // calculate the inner integral
                g[t] = gaussQuadr(f, qOrder, 0, l1);
        }
        // calculate the outer integral
        dcomplex result = I*gamma/l2/4.0*gaussQuadr(g, qOrder, 0, l2);

        if (normal) return result;

        // otherwise: neigborpatch (type 1 of type 2)
        if (nbT1) return result + PD_nb(l1, l2, phi);
        // has to be neigborpatch type 2
        return result + PU_nb(l1, l2, phi);
}

double Int::UD_nb_f_nln(double l1, double l2, double phi)
{
        // in case phi == pi => return limit
        if (dZero(phi-pi)) return (0.5*l1*l1+0.5*l1*l2)*log(l1+l2)-
                                l1*l2*log(l1)-0.5*l1*l1*log(l1)+0.25*l1*l2;

        return (0.25*l1*l2-0.25*l1*l1*cos(phi))*log(-2.0*cos(phi)*l2*l1+
        l2*l2+l1*l1)-0.5*l1*l1*sin(phi)*atan((-l2+l1*cos(phi))/l1/sin(phi))+
        0.5*sin(phi)*atan(cos(phi)/sin(phi))*l1*l1+0.25*l1*l2+0.5*l1*l1*
        cos(phi)*log(l1)-l1*l2*log(l1);
}

double Int::UD_nb_f_ln(double l1, double l2, double phi)
{
        // in case phi == pi => return limit
        if (dZero(phi-pi)) return -25.0/96.0*l1*l1*l2*l2-1.0/24.0*l1*l1*l1*l2+
        (1.0/8.0*l1*l1*l2*l2+1.0/6.0*l1*l1*l1*l2+1.0/24.0*l1*l1*l1*l1)*
        log(l1+l2)+(-1.0/24.0*l1*l1*l1*l1-1.0/6.0*l1*l1*l1*l2)*log(l1);

        return (1.0/6.0*sin(phi)*l1*l1*l1*l2-1.0/12.0*sin(phi)*l1*l1*l1*
        l1*cos(phi))*atan((l2-l1*cos(phi))/l1/sin(phi))+(1.0/24.0*l1*l1*l1*l1-
        1.0/12.0*l1*l1*l1*l1*cos(phi)*cos(phi)+1.0/6.0*l1*l1*l1*l2*
        cos(phi))*log(l1)+(1.0/6.0*sin(phi)*l1*l1*l1*l2-1.0/12.0*sin(phi)*
        l1*l1*l1*l1*cos(phi))*atan(cos(phi)/sin(phi))+(-1.0/48.0*l1*l1*l1*l1-
        1.0/12.0*l1*l1*l1*l2*cos(phi)+1.0/16.0*l1*l1*l2*l2+1.0/24.0*l1*l1*
        l1*l1*cos(phi)*cos(phi))*log(l1*l1+l2*l2-2.0*l1*l2*cos(phi))+1.0/24.0*
        l1*l1*l1*l2*cos(phi)-25.0/96.0*l1*l1*l2*l2;
}

dcomplex Int::UD_nb(double l1, double l2, double phi, dcomplex gamma)
{
        return 0.5/pi/l1/l2*(UD_nb_f_nln(l1,l2,phi)+
        UD_nb_f_nln(l2,l1,phi))-0.25*gamma*gamma/pi/l1/l2*cos(phi)*
        (0.25*log(gamma)*l1*l1*l2*l2+UD_nb_f_ln(l1,l2,phi)+
        UD_nb_f_ln(l2,l1,phi));
}

double Int::UU_nb_f_ln(double l1, double l2, double phi)
{
        if (dZero(phi-pi))
                return -1.0/3.0*log(l1)*l1*l1*l1*l2+(1.0/3.0*l1*l1*l1*l2+
                0.25*l1*l1*l2*l2)*log(l2+l1)-19.0/48.0*l1*l1*l2*l2;

        return (1.0/3.0*l1*l1*l1*l2*cos(phi))*log(l1)+
        (-1.0/6.0*l1*l1*l1*l2*cos(phi)+1.0/8.0*l1*l1*l2*l2)*
        log(l1*l1-2.0*cos(phi)*l1*l2+l2*l2)+(1.0/3.0*l1*l1*l1*sin(phi)*l2)*
        atan(cos(phi)/sin(phi))+(1.0/3.0*l1*l1*l1*sin(phi)*l2)*
        atan((l2-cos(phi)*l1)/sin(phi)/l1)-19.0/48.0*l1*l1*l2*l2;
}

double Int::UU_nb_g_ln(double l1, double l2, double phi)
{
        if (dZero(phi-pi)) return 0.125*l1*l1*l1*l1*log(l1+l2)
                        -0.125*l1*l1*l1*l1*log(l1)-0.125*l1*l1*l1*l2;

        return -1.0/4.0*l1*l1*l1*l1*sin(phi)*cos(phi)*
        atan((l2-l1*cos(phi))/sin(phi)/l1)-1.0/4.0*l1*l1*l1*l1*sin(phi)*
        cos(phi)*atan(cos(phi)/sin(phi))-(-1.0/8.0*l1*l1*l1*l1+1.0/4.0*
        l1*l1*l1*l1*cos(phi)*cos(phi))*log(l1)+1.0/8.0*l1*l1*l1*l2*cos(phi)+
        (-1.0/16.0*l1*l1*l1*l1+1.0/8.0*l1*l1*l1*l1*cos(phi)*cos(phi))*
        log(l1*l1-2.0*cos(phi)*l1*l2+l2*l2);
}

double Int::UU_nb_f_nln(double l1, double l2, double phi)
{
        if (dZero(phi-pi)) return -0.5*l1*l1*log(l1)+0.5*l1*l1*log(l1+l2);

        return -1.0/2.0*sin(phi)*l1*l1*atan((l1*cos(phi)-l2)/sin(phi)/l1)+
        0.5*l1*l1*cos(phi)*log(l1)-0.25*cos(phi)*log(l1*l1-2.0*l2*l1*cos(phi)+
        l2*l2)*l1*l1+0.5*sin(phi)*atan(cos(phi)/sin(phi))*l1*l1;
}

dcomplex Int::UU_nb(double l1, double l2, double phi, dcomplex gamma)
{
        return -0.25*gamma*gamma/pi/l1/l2*cos(phi)*(0.25*log(gamma)*l1*l1*
        l2*l2+UU_nb_f_ln(l1,l2,phi)+UU_nb_g_ln(l1,l2,phi)-
        1.0/3.0*UU_nb_g_ln(l2,l1,phi)) +0.5/pi/l1/l2*(-0.5*l1*l2+
        UU_nb_f_nln(l1, l2, phi)-UU_nb_f_nln(l2, l1, phi));
}

double Int::DU_nb_f_ln(double l1, double l2, double phi)
{
        if (dZero(phi-pi)) return (0.125*l1*l1*l2*l2-0.125*l1*l1*l1*l1)*
                log(l1+l2)+0.125*l1*l1*l1*l2+0.125*l1*l1*l1*l1*log(l1)-
                3.0/32.0*l1*l1*l2*l2;

        return 0.25*sin(phi)*cos(phi)*l2*l2*l2*l2*atan((-cos(phi)*l2+l1)
        /l2/sin(phi))+(0.25*l2*l2*l2*l2*cos(phi)*cos(phi)-0.125*l2*l2*l2*l2)*
        log(l2)-0.125*l1*l2*l2*l2*cos(phi)-3.0/32.0*l1*l1*l2*l2+(1.0/16.0*l2*
        l2*l2*l2-0.125f*l2*l2*l2*l2*cos(phi)*cos(phi)+1./16.*l1*l1*l2*l2)*
        log(l1*l1+l2*l2-2.0*l1*l2*cos(phi))+
        (0.25*sin(phi)*l2*l2*l2*l2*cos(phi))*atan(cos(phi)/sin(phi));
}

double Int::DU_nb_f_nln(double l1, double l2, double phi)
{
        if (dZero(phi-pi))
                return 0.5*l1*l1*log(l1)+0.25*l1*l2-0.5*log(l1+l2)*l1*l1;

        return -0.5*sin(phi)*atan(cos(phi)/sin(phi))*l2*l2-0.5*cos(phi)*l2*l2*
        log(l2)+0.25*cos(phi)*log(l1*l1+l2*l2-2.0*l1*l2*cos(phi))*l2*l2+0.5*
        sin(phi)*l2*l2*atan((cos(phi)*l2-l1)/l2/sin(phi))+0.25*l1*l2;
}

dcomplex Int::DU_nb(double l1, double l2, double phi, dcomplex gamma)
{
        return -0.25*gamma*gamma/pi/l1/l2*cos(phi)*(0.25*log(gamma)*l1*l1*
        l2*l2+DU_nb_f_ln(l1,l2,phi)+DU_nb_f_ln(l2,l1,phi))
        +0.5/pi/l1/l2*(DU_nb_f_nln(l2, l1, phi)+DU_nb_f_nln(l2, l1, phi));
}

dcomplex Int::HH(dcomplex**intv, char T2, char T1, dcomplex gamma, double l1,
            double l2, double phi, bool selfpatch, bool nb12, bool nb21)
{
        // check for neighborpatch type 1
        bool nbT1 = (T1 == T2) ? false : ((T1 == 'U') ? (nb12) :
                        (nb21));
        // check for neighborpatch type 2
        bool nbT2 = (T1 == T2) ? (nb12 || nb21) : false;
        bool nbT2a = (nbT2) ? ((T1 == 'U') ? nb21 :
                        nb12) : false;
        // check for neighborpatch type 3
        bool nbT3 = (T1 == T2) ? false : ((T1 == 'U') ? nb21 : nb12);
        // check for normal case
        bool normal = (selfpatch || nbT1 || nbT2 || nbT3) ?
                        false : true;

        double* hatFunc1 = (T1 == 'U') ? funcU : funcD;
        double* hatFunc2 = (T2 == 'U') ? funcU : funcD;

        int s,t;
        // calculate the function values for the outer integral
        for(t = 0; t < qOrder; t++) {
                // calculate the function values for the inner integral
                for(s = 0; s < qOrder; s++)
                        f[s] = hatFunc1[s]*intv[t][s];
                // inner integration
                g[t] = hatFunc2[t]*gaussQuadr(f, qOrder, 0, l1);
        }

        // outer integration
        dcomplex result = -I*gamma*gamma/4.0*gaussQuadr(g, qOrder, 0, l2);

        if (normal) return result;

        if (selfpatch) {
                // if T1 == T2: transfer piece of selfpatch to neighborpatch
                if (T1 == T2)
                        return result + gamma*gamma/4.0/pi*(-7.0/16.0*l1*l1+
                                        0.25*l1*l1*log(gamma*l1)) +
                                        0.25*(2.0*log(l1)-1.0)/pi;
                else
                        return result + gamma*gamma/4.0/pi*(-5.0/16.0*l1*l1+
                                        0.25*l1*l1*log(gamma*l1)) + 0.25/pi;
        }

        if (nbT1) return result + UD_nb(l1,l2, phi, gamma);
        // caution: this part is not symmetrical in l1 and l2
        if (nbT2a) return result + UU_nb(l1,l2, phi, gamma);
        if (nbT2) return result + UU_nb(l2,l1, phi, gamma);

        return result + DU_nb(l1, l2, phi, gamma);
}

// =========================================================================
// SEGMENT SINGLE INTEGRATIONS
// =========================================================================

dcomplex Int::P(dcomplex *fx, double l)
{
        return 1/l*gaussQuadr(fx, qOrder, 0, l);
}

dcomplex Int::H(dcomplex *fx, char T, double l)
{
        double* hatFunc = (T == 'U') ? funcU : funcD;
        zdvpm(fx, hatFunc, f, qOrder);

        return gaussQuadr(f, qOrder, 0, l);
}
