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

#ifndef MATHLIB_H
#define MATHLIB_H

#include "base.h"

// ============================================================================
// DEFINITIONS
// ============================================================================

#define ZERO_THRESHOLD (1e-12)
#define MACHPREC (1e-15)

// definition of pi
static const double pi = 3.141592653589793238463;
static const double oopi = 0.318309886183790671538;
static const double topi = 0.636619772367581343076;

static const dcomplex I(0, 1);

// ========================================================================
// GAUSSIAN QUADRATURE
// ========================================================================

/**
 * perform gaussian quadrature of a function f
 * @param f Function values of f in gaussian quadrature points
 * @param qOrder Order of gaussian quadrature
 * @param a Lower limit
 * @param b Upper limit
 * @return Value of the integral
 */
dcomplex gaussQuadr(dcomplex* f, int qOrder, double a, double b);

/**
 * Get the quadrature points for integration between a and b
 * @param gaussQP Quadrature points (output)
 * @param qOrder Order of gaussian quadrature
 * @param a Lower limit
 * @param b Upper limit
 */
void getGaussQP(double* gaussQP, int qOrder, double a, double b);

/**
 * Check wether a certain gaussian quadrature order is supported
 * @param qOrder Order of gaussian quadrature
 * @return True of false
 */
bool gaussQuadrOrderIsSupported(int qOrder);

// ========================================================================
// AUXILIARY FUNCTIONS
// ========================================================================

/**
 * Checks whether a double is small enough to be considered 0
 * @param d Argument
 * @return True of false
 */
inline bool dZero(double d)
{
        return (fabs(d) < ZERO_THRESHOLD);
}

/**
 * Checks whether a cplx is small enough to be considered 0
 * @param c Argument
 * @return True of false
 */
inline bool cZero(cplx c)
{
        return (abs(c) < ZERO_THRESHOLD);
}

/**
 * Checks whether a double is significantly negative, positive or zero
 * @param d Double under study
 * @return -1 for negative, 1 for positive, 0 otherwise
 */
inline int dCompare(double d)
{
        if ((d + ZERO_THRESHOLD) < 0) return -1;
        if ((d - ZERO_THRESHOLD) > 0) return 1;
        return 0;
}

/**
 * Calculate c[i] = a[i] * b[i] for i = [0..n-1]
 * @param a Pointer to source a
 * @param b Pointer to source b
 * @param c Pointer to source c
 * @param n number of elements
 */
inline void vpm(const cplx *a, const cplx *b, cplx *c, int n)
{
        cplx *cstop = c + n;
        while (c < cstop) *c++ = *a++ * *b++;
}

/**
 * Calculate c[i] += a[i] * b[i] for i = [0..n-1]
 * @param a Pointer to source a
 * @param b Pointer to source b
 * @param c Pointer to source c
 * @param n number of elements
 */
inline void avpm(const cplx *a, const cplx *b, cplx *c, int n)
{
        cplx *cstop = c + n;
        while (c < cstop) *c++ += *a++ * *b++;
}

/**
 * Calculate c[i] += a[i] * b[i] for i = [0..n-1]
 * @param a Pointer to source a
 * @param b Pointer to source b
 * @param c Pointer to source c
 * @param n number of elements
 */
inline void zdavpm(dcomplex *a, double *b, dcomplex *c, int n)
{
        dcomplex *cstop = c + n;
        while (c < cstop)
                *c++ += *a++ * *b++;
}

/**
 * Calculate c[i] = a[i] * b[i] for i = [0..n-1]
 * @param a Pointer to source a
 * @param b Pointer to source b
 * @param c Pointer to source c
 * @param n number of elements
 */
inline void zdvpm(dcomplex *a, double *b, dcomplex *c, int n)
{
        dcomplex *cstop = c + n;
        while (c < cstop)
                *c++ = *a++ * *b++;
}

/**
 * Return the minimum of two values
 * @param a Value one
 * @param b Value two
 * @return The minimum of these two values
 */
inline double min(double a, double b)
{
        return (a < b) ? a : b;
}

/**
 * Return the minimum of two values
 * @param a Value one
 * @param b Value two
 * @return The minimum of these two values
 */
inline double min(double a, int b)
{
        return (a < (double)b) ? a : (double)b;
}

/**
 * Return the minimum of two values
 * @param a Value one
 * @param b Value two
 * @return The minimum of these two values
 */
inline int min(int a, int b)
{
        return (a < b) ? a : b;
}

/**
 * Return the maximum of two values
 * @param a Value one
 * @param b Value two
 * @return The maximum of these two values
 */
inline double max(double a, double b)
{
        return (a > b) ? a : b;
}

/**
 * Return the maximum of two values
 * @param a Value one
 * @param b Value two
 * @return The maximum of these two values
 */
inline int max(int a, int b)
{
        return (a > b) ? a : b;
}

/**
 * Return the maximum of two values
 * @param a Value one
 * @param b Value two
 * @return The maximum of these two values
 */
inline double max(double a, int b)
{
        return (a > (double)b) ? a : (double)b;
}

/**
 * Calculate the BesselJ range
 * @param fromOrder First order to consider
 * @param toOrder Final order to consider
 * @param argument Argument value
 * @param result Pre-allocated vector for storing the result
 */
void amosBessJrange(int fromOrder, int toOrder,
                    dcomplex argument, dcomplex *result);

/**
 * Calculate the BesselJ range (Normalized)
 * @param fromOrder First order to consider
 * @param toOrder Final order to consider
 * @param argument Argument value
 * @param result Pre-allocated vector for storing the result
 */
void amosBessJrangeNormalized(int fromOrder, int toOrder,
                              dcomplex argument, dcomplex *result);

/**
 * Calculate the BesselY range
 * @param fromOrder First order to consider
 * @param toOrder Final order to consider
 * @param argument Argument value
 * @param result Pre-allocated vector for storing the result
 */
void amosBessYrange(int fromOrder, int toOrder,
                    dcomplex argument, dcomplex *result);

/**
 * Calculate the HankelH2 range
 * @param fromOrder First order to consider
 * @param toOrder Final order to consider
 * @param argument Argument value
 * @param result Pre-allocated vector for storing the result
 */
void amosHank2range(int fromOrder, int toOrder,
                    dcomplex argument, dcomplex *result);

/**
 * Calculate the HankelH2 range (Normalized)
 * @param fromOrder First order to consider
 * @param toOrder Final order to consider
 * @param argument Argument value
 * @param result Pre-allocated vector for storing the result
 */
void amosHank2rangeNormalized(int fromOrder, int toOrder,
                              dcomplex argument, dcomplex *result);

/**
 * Calculate the scaled 0th order hankel function for dcomplex arguments
 * @param order Order of the hankel function
 * @param z Argument z
 * @return Result
 */
dcomplex HankelScaled(int order, dcomplex z);

// ========================================================================
// ZHANG AND JIN BESSEL AND HANKEL FUNCTIONS (fastest)
// ========================================================================

/**
 * Calculates the zeroth order hankel function for real arguments
 * @param x Argument x
 * @param result Result vector
 */
void ZhangJinHank0Real(double x, dcomplex *result);

/**
 * Calculates the 0th order hankel function for dcomplex arguments
 * @param z Argument z
 * @param result Result vector
 */
void ZhangJinHank0Complex(dcomplex z, dcomplex *result);

/**
 * Calculates the 0th and 1st order hankel function for real arguments
 * @param x Argument x
 * @param result Result vector
 */
void ZhangJinHank01Real(double x, dcomplex *result);

/**
 * Calculate the Bessel and Neumann functions for orders
   [0..maxOrder] using the Zhang and Jin algorithm
 * @param z Argument z
 * @param J Vector for storing the BesselJs
 * @param Y Vector for storing the BesselYs
 */
void ZhangJinJY01Complex(dcomplex z, dcomplex *J, dcomplex *Y);

/**
 * Calculates the 0th and 1st order hankel function for dcomplex arguments
 * @param z Argument z
 * @param result Result vector
 */
inline void ZhangJinHank01Complex(dcomplex z, dcomplex *result)
{
        dcomplex J[2], Y[2];
        ZhangJinJY01Complex(z, J, Y);
        result[0] = J[0] - dcomplex(0, 1)*Y[0];
        result[1] = J[1] - dcomplex(0, 1)*Y[1];
}

// ========================================================================
// FAST HANKEL 0, 1 ,2 FUNCTIONS
// ========================================================================

/**
 * Calculates the 0th order hankel function for dcomplex arguments
 * @param z Argument z
 * @param result Result vector
 */
inline void fastHankel0(dcomplex z, dcomplex *result)
{
        if (dZero(imag(z)))
                ZhangJinHank0Real(real(z), result);
        else
                ZhangJinHank0Complex(z, result);
}

/**
 * Calculates the 0th and 1st order hankel function for dcomplex arguments
 * @param z Argument z
 * @param result Result vector
 */
inline void fastHankel01(dcomplex z, dcomplex *result)
{
        if (dZero(imag(z)))
                ZhangJinHank01Real(real(z), result);
        else
                ZhangJinHank01Complex(z, result);
}

/**
 * Calculates the 0th and 1st order regular hankel function
 * @param z Argument z
 * @param result Result vector
 */
inline void fastHankel01reg(dcomplex z, dcomplex *result)
{
        double norm = abs(z);

        if (norm < 1e-2) {
                result[0] = dcomplex(1, 0.073804295108687);
                result[1] = 0;
                return;
        }

        if (dZero(imag(z)))
                ZhangJinHank01Real(real(z), result);
        else
                ZhangJinHank01Complex(z, result);

        dcomplex ooarg = 1.0/z;
        result[0] += I*topi*log(z);
        result[1] += -I*topi*ooarg;
}

/**
 * Calculates the 0th, 1st and 2nd order hankel function for dcomplex arguments
 * @param z Argument z
 * @param result Result vector
 */
inline void fastHankel012(dcomplex z, dcomplex *result)
{
        fastHankel01(z, result);
        result[2] = 2.0/z*result[1] - result[0];
}

/**
 * Calculates the 0th, 1st and 2nd order regular hankel function
 * @param z Argument z
 * @param result Result vector
 */
inline void fastHankel012reg(dcomplex z, dcomplex *result)
{
        double norm = abs(z);

        if (norm < 1e-2) {
                result[0] = dcomplex(1, 0.073804295108687);
                result[1] = 0;
                result[2] = dcomplex(0, 0.318309886183791);
                return;
        }

        fastHankel01(z, result);
        result[2] = 2.0/z*result[1] - result[0];

        dcomplex ooarg = 1.0/z;
        result[0] += I*topi*log(z);
        result[1] += -I*topi*ooarg;
        result[2] += -2.0*I*topi*ooarg*ooarg;
}

// ========================================================================
// FAST HIGHER ORDER HANKEL FUNCTIONS
// ========================================================================

/**
 * Calculate the Hankel functions of the second kind for orders
   [-Q1..Q2] using the Zhang and Jin algorithm
 * @param Q1 minimum order calculated
 * @param Q2 maximum order calculated
 * @param z Argument z
 * @param result Result vector
 */
void fastHankelSymm(int Q1, int Q2, dcomplex z, dcomplex *result);

// ========================================================================
// INVERSE ERROR FUNCTION
// ========================================================================

/**
 * Calculate the inverse error function of x (x in ]0..1[)
 * @param x Real valued argument
 * @return Inverse error function of x (relative error < 1E-9)
 */
double erfinv(double x);

#endif
