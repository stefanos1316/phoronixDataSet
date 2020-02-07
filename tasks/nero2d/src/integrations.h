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

#ifndef INTEGRATIONS_H
#define INTEGRATIONS_H

class Int
{
private:
        dcomplex *f;     // temporary variable for various usage
        dcomplex *g;     // temporary variable for various usage
        double *funcU;   // temporary variable for integration
        double *funcD;   // temporary variable for integration
        int qOrder;             // order of gaussian quadrature

public:

        /**
         * Constructor
         * @param qOrder Quadrature order
         * @return
         */
        Int(int qOrder);

        /**
         * Destructor
         */
        ~Int();

        // ===================================================================
        // NEAR INTERACTIONS SEGMENT DOUBLE INTEGRATIONS
        // ===================================================================

        /**
         * Singular symmetrical part of the PP neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular symmetrical part of the PP nbp integration
         */
        double PP_nb_f(double l1, double l2, double phi);

        /**
         * Singular part of the PP neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @param gamma Wave number of the medium
         * @return Singular part of the PP nbp integration
         */
        dcomplex PP_nb(double l1, double l2, double phi, dcomplex gamma);

        /**
         * PP segment-segment integration
         * @param intv Values calculated in the quadrature points of the 2 segs
         * @param gamma Wave number of the medium
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @param selfpatch True upon selfpatch
         * @param neighborpatch True upon neighborpatch
         * @return PP segment-segment integration
         */
        dcomplex PP(dcomplex **intv, dcomplex gamma, double l1, double l2,
                    double phi, bool selfpatch, bool neighborpatch);

        /**
         * Singular symmetrical part of the PD neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular symmetrical part of the PD nbp integration
         */
        double PD_nb_f(double l1, double l2, double phi);

        /**
         * Singular anti-symmetrical part of the PD neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular anti-symmetrical part of the PD nbp integration
         */
        double PD_nb_g(double l1, double l2, double phi);

        /**
         * Singular part of the PD neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular part of the PD nbp integration
         */
        double PD_nb(double l1, double l2, double phi);

        /**
         * Singular symmetrical part of the PU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular symmetrical part of the PU nbp integration
         */
        double PU_nb_f(double l1, double l2, double phi);

        /**
         * Singular part of the PU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular part of the PU neighborpatch integration
         */
        double PU_nb(double l1, double l2, double phi);

        /**
         * PH segment-segment integration
         * @param intv Values calculated in the quadrature points of the 2 segs
         * @param T1 'U' for Up, 'D' for Down
         * @param gamma Wave number of the medium
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @param selfpatch True upon selfpatch
         * @param nb12 True upon neighborpatch type 1-2
         * @param nb21 True upon neighborpatch type 2-1
         * @return PH segment-segment integration
         */
        dcomplex PH(dcomplex **intv, char T1, dcomplex gamma, double l1,
                    double l2, double phi, bool selfpatch, bool nb12,
                    bool nb21);

        /**
         * Singular symm non-log part of the UD neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular symm non-log part of the UD nbp integration
         */
        double UD_nb_f_nln(double l1, double l2, double phi);

        /**
         * Singular symm logarithmic part of the UD neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular symm logarithmic part of the UD nbp integration
         */
        double UD_nb_f_ln(double l1, double l2, double phi);

        /**
         * Singular part of the UD neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @param gamma Wave number of the medium
         * @return Singular part of the UD nbp integration
         */
        dcomplex UD_nb(double l1, double l2, double phi, dcomplex gamma);

        /**
         * Singular non-symm log part of the UU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular non-symm log part of the UD nbp integration
         */
        double UU_nb_f_ln(double l1, double l2, double phi);

        /**
         * Singular anti-symm log part of the UU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular anti-symm log part of the UD nbp integration
         */
        double UU_nb_g_ln(double l1, double l2, double phi);

        /**
         * Singular anti-symm non-log part of the UU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular anti-symm non-log part of the UU nbp integration
         */
        double UU_nb_f_nln(double l1, double l2, double phi);

        /**
         * Singular part of the UU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @param gamma Wave number of the medium
         * @return Singular part of the UU nbp integration
         */
        dcomplex UU_nb(double l1, double l2, double phi, dcomplex gamma);

        /**
         * Singular symm log part of the DU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular symm log part of the DU nbp integration
         */
        double DU_nb_f_ln(double l1, double l2, double phi);

        /**
         * Singular symm non-log part of the DU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @return Singular symm non-log part of the DU nbp integration
         */
        double DU_nb_f_nln(double l1, double l2, double phi);

        /**
         * Singular part of the DU neighborpatch integration
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @param gamma Wave number of the medium
         * @return Singular part of the DU nbp integration
         */
        dcomplex DU_nb(double l1, double l2, double phi, dcomplex gamma);

        /**
         * HH segment-segment integration
         * @param intv Values calculated in the quadrature points of the 2 segs
         * @param T2 'U' for Up, 'D' for Down
         * @param T1 'U' for Up, 'D' for Down
         * @param gamma Wave number of the medium
         * @param l1 Length of segment 1
         * @param l2 Length of segment 2
         * @param phi Angle between two segments
         * @param selfpatch True upon selfpatch
         * @param nb12 True upon neighborpatch type 1-2
         * @param nb21 True upon neighborpatch type 2-1
         * @return HH segment-segment integration
         */
        dcomplex HH(dcomplex**intv, char T2, char T1, dcomplex gamma,
                    double l1, double l2, double phi, bool selfpatch,
                    bool nb12, bool nb21);

        // ===================================================================
        // SEGMENT SINGLE INTEGRATIONS
        // ===================================================================

        /**
         * Integrate f(x) with pulse weight function between 0 and l
         * @param fx Function values f(x)
         * @param l Endpoint of interval
         * @return Value of the integral
         */
        dcomplex P(dcomplex *fx, double l);

        /**
         * Integrate f(x) with a hat function (U/D) between 0 and l
         * @param fx Function values f(x)
         * @param T Type U/D
         * @param l Endpoint of interval
         * @return Value of the integral
         */
        dcomplex H(dcomplex *fx, char T, double l);
};

#endif
