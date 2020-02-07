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

#include "medium.h"
#include "inthandler2d.h"
#include "mathlib.h"
#include "levelhandler2d.h"

#include <fstream>
using namespace std;

// ===========================================================================
// MEDIUM CLASS
// ===========================================================================

double Medium::frequency = -1;
dcomplex Medium::beta = -1;

Medium::Medium(dcomplex eps_, dcomplex mu_) : eps(eps_),
        mu(mu_), ID(-1)
{
        // temporary field
        double omega = 2.0*pi*frequency;
        assert(omega > 0);

        // calculate derived parameters
        Z = sqrt(mu/eps);
        gamma = sqrt(omega*omega*eps*mu-beta*beta);
        lambda = abs(2.0*pi/gamma);
        k = omega*sqrt(eps*mu);

        // choosing the correct wave vectors (Bart)
        if (imag(gamma) > 0 && imag(gamma)/abs(gamma) > MACHPREC) gamma *= -1;
        if (imag(k) > 0 && imag(k)/abs(k) > MACHPREC) k *= -1;

        ggofoez = 0.25*gamma*gamma/(omega*eps*Z0);
        mibofoez = -0.25*I*beta/(omega*eps*Z0);
        izbofom = 0.25*I*Z0*beta/(omega*mu);
        mzggofoom = -0.25*Z0*gamma*gamma/(omega*mu);
        bogg = beta/(gamma*gamma);
        moezogg = -omega*eps*Z0/(gamma*gamma);
        omozgg = omega*mu/(Z0*gamma*gamma);

        // calculate maxDist
        if (isLossless())
                maxDist = -1;
        else
                maxDist = -log(1e-5)/abs(imag(gamma));
}

Medium::~Medium()
{
        for (int i = 0; i < lvlHndl.size(); i++) {
                lvlHndl[i]->deleteUserAllocatedMemory();
                delete lvlHndl[i];
        }

        lvlHndl.clear();
}

bool Medium::isLossless()
{
        return dZero(imag(gamma));
}

std::ostream& operator<<(std::ostream& os, const Medium& M)
{
        os << "Eps: " << M.eps/eps0 << " Mu: " << M.mu/mu0;
}
