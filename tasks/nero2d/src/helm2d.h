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

#ifndef HELM2D_H
#define HELM2D_H

class Helm2d 
{
private:
        /**
         * Get the number of equidistant sampling points for FMM interaction HF
         * @param gamma Wave vector in the medium
         * @param boxSize Size of the boxes
         * @param xDist Relative distance between the boxes
         * @param HF HF/LF-boolean is determined in this routine
         * @param precision Target precision
         * @return Number of sampling points
         */
        static int getRadPatSamplingRateComplex(cplx gamma, double boxSize,
                                                double xDist, bool &HF,
                                                double &chi, double precision);

        /**
         * Get the number of equidistant sampling points for FMM interaction HF
         * @param gamma Wave vector in the medium
         * @param boxSize Size of the boxes
         * @param xDist Relative distance between the boxes
         * @param HF HF/LF-boolean is determined in this routine
         * @param precision Target precision
         * @return Number of sampling points
         */
        static int getRadPatSamplingRateReal(cplx gamma, double boxSize,
                                             double xDist, bool &HF, 
                                             double &chi, double precision);

        /**
         * Get the number of equidistant sampling points for FMM interaction HF
         * @param gamma Wave vector in the medium
         * @param boxSize Size of the boxes
         * @param xDist Relative distance between the boxes
         * @param precision Target precision
         * @return Number of sampling points
         */
        static int getRadPatSamplingRateRealHF(cplx gamma, double boxSize,
                                               double xDist, double precision);

public:
        /**
         * Get the number of equidistant sampling points for FMM interaction
         * @param gamma Wave vector in the medium
         * @param boxSize Size of the boxes
         * @param xDist Relative distance between the boxes
         * @param N Number of sampling points (output)
         * @param HF HF/LF-boolean is determined in this routine (output)
         * @param precision Target precision
         */
        static void getRadPatSamplingRate(cplx gamma, double boxSize,
                                          double xDist, int &N, bool &HF,
                                          double &chi, double precision);

        /**
         * Get the number of equidistant sampling points for small agg matrices
         * @param groupID Identifier of the medium
         * @param boxSize Size of boxes
         * @param lN Lowest number to consider
         * @param precision Target precision
         * @return Number of sampling points
         */
        static int getAggMatSamplingRate(cplx gamma, double boxSize,
                                         int lN, double precision);

        /**
         * Check whether a number is composed out of small prime factors
         * @param N Number under consideration
         * @return True of false
         */
        static bool primeCheck(int N);

        /**
         * Get the xDist for a certain boxsize considering the overshoot
         * @param boxSize Absolute value of the boxsize
         * @param frequency Frequency of the simulation
         * @param config Pointer to the config file
         * @return The corrected xDist considering the overshoot
         */
        static double getXDist(double boxSize, double frequency,
                               const ConfigFile *config);

        /**
         * Incorporate the overshoot for a certain box
         * @param boxSize Absolute value of the boxsize
         * @param wavelength Wavelength of the considered medium
         * @param config Pointer to the config file
         * @return The corrected boxSize considering the overshoot
         */
        static double getEnlargedBoxSize(double boxSize, double wavelength,
                                         const ConfigFile *config);
};

#endif
