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

#include "level.h"
#include "box.h"
#include "base.h"

#include <map>
using namespace std;

// ============================================================================
// LEVEL CLASS
// ============================================================================

double Level::getMisBalance(int nOG)
{
        // safety check
        if (gFirstBox == NULL) return 0.0;

        double tWeight = 0.0, weightSoFar = 0.0, misBalance = 0.0;

        // determine the total weight at this level
        for(Box *box = gFirstBox; box != NULL; box = box->next)
                tWeight += box->getWeight();

        map<int, double> weightMap;
        for(Box *box = gFirstBox; box != NULL; box = box->next) {
                double thisWeight = box->getWeight();
                double weightUC = weightSoFar + thisWeight/2.0;

                int owner = int(weightUC/tWeight*nOG);
                weightMap[owner] += thisWeight;

                weightSoFar += thisWeight;
        }

        double weightPerOG = tWeight/((double)nOG);
        for (int i = 0; i < nOG; i++) {
                double error = abs(weightMap[i]-weightPerOG)/weightPerOG;
                if (error > misBalance) misBalance = error;
        }

        return misBalance;
}

void Level::doLoadBalance(int nOwners, int lowLvl)
{
        // safety check
        if (gFirstBox == NULL) return;

        double tWeight = 0.0, weightSoFar = 0.0;

        // determine the total weight at this level
        for(Box *box = gFirstBox; box != NULL; box = box->next)
                tWeight += box->getWeight();

        for(Box *box = gFirstBox; box != NULL; box = box->next) {
                double thisWeight = box->getWeight();
                double weightUC = weightSoFar + thisWeight/2.0;

                int owner = int(weightUC/tWeight*nOwners);
                box->recSetOwner(owner, lvl, lowLvl);

                weightSoFar += thisWeight;
        }
}

void Level::postLoadBalancing()
{
        // find the first local box
        for(Box *box = gFirstBox; box != NULL; box = box->next)
                if (box->getOwner() == thisProc) {
                        lFirstBox = box;
                        break;
                }

        // count the number of local boxes
        nlBoxes = 0;
        for(Box *box = gFirstBox; box != NULL; box = box->next) {
                int owner = box->getOwner();
                if (owner == thisProc) nlBoxes++;
        }
}

uint Level::getNumLocalUnknowns() const
{
        // count the number of local boxes
        Box *box = lFirstBox; uint nlUnknowns = 0;
        for(uint i = 0; i < nlBoxes; i++, box = box->next)
                nlUnknowns += box->getNUnknowns();

        return nlUnknowns;
}
