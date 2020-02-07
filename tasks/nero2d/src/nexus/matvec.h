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

#ifndef MATVEC_H
#define MATVEC_H

/**
 * Calculate c[i] += a[i] * b[i] for i = [0..n-1]
 * @param a Pointer to source a
 * @param b Pointer to source b
 * @param c Pointer to source c
 * @param n number of elements
 */
inline void avpm(cplx *a, cplx *b, cplx *c, int n)
{
        cplx *cstop = c + n;
        while (c < cstop) *c++ += *a++ * *b++;
}

/**
 * Calculate c[i] = a[i] * b[i] for i = [0..n-1]
 * @param a Pointer to source a
 * @param b Pointer to source b
 * @param c Pointer to source c
 * @param n number of elements
 */
inline void vpm(cplx *a, cplx *b, cplx *c, int n)
{
        cplx *cstop = c + n;
        while (c < cstop) *c++ = *a++ * *b++;
}

#endif
