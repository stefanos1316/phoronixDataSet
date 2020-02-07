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

#include "box.h"
#include "level.h"
#include "leveldata.h"
#include "defloadh.h"
#include "base.h"

using namespace std;

// ===========================================================================
// SPACE FILLING CURVES
// ===========================================================================

#ifdef NEXUS_3D
int SpaceFillCurve::hilbertState(int state, int sector)
{
        const int hilbState[12][8] = {
                { 1, 2, 3, 2, 4, 5, 3, 5},
                { 2, 6, 0, 7, 8, 8, 0, 7},
                { 0, 9,10, 9, 1, 1,11,11},
                { 6, 0, 6,11, 9, 0, 9, 8},
                {11,11, 0, 7, 5, 9, 0, 7},
                { 4, 4, 8, 8, 0, 6,10, 6},
                { 5, 7, 5, 3, 1, 1,11,11},
                { 6, 1, 6,10, 9, 4, 9,10},
                {10, 3, 1, 1,10, 3, 5, 9},
                { 4, 4, 8, 8, 2, 7, 2, 3},
                { 7, 2,11, 2, 7, 5, 8, 5},
                {10, 3, 2, 6,10, 3, 4, 4}
        };
        return hilbState[state][sector];
}

int SpaceFillCurve::hilbertPos(int state, int sector)
{
        const int hilbPos[12][8] = {
                {0,1,3,2,7,6,4,5},
                {0,7,1,6,3,4,2,5},
                {0,3,7,4,1,2,6,5},
                {2,3,1,0,5,4,6,7},
                {4,3,5,2,7,0,6,1},
                {6,5,1,2,7,4,0,3},
                {4,7,3,0,5,6,2,1},
                {6,7,5,4,1,0,2,3},
                {2,5,3,4,1,6,0,7},
                {2,1,5,6,3,0,4,7},
                {4,5,7,6,3,2,0,1},
                {6,1,7,0,5,2,4,3}
        };

        return hilbPos[state][sector];
}
#else
int SpaceFillCurve::hilbertState(int state, int sector)
{
        const int hilbState[4][4] = {
                {1,2,0,0},
                {0,1,3,1},
                {2,0,2,3},
                {3,3,1,2}
        };
        return hilbState[state][sector];
}

int SpaceFillCurve::hilbertPos(int state, int sector)
{
        const int hilbPos[4][4] = {
                {0,3,1,2},
                {0,1,3,2},
                {2,3,1,0},
                {2,1,3,0}
        };

        return hilbPos[state][sector];
}
#endif

int SpaceFillCurve::mortonState(int state, int sector)
{
        return 0;
}

int SpaceFillCurve::mortonPos(int state, int sector)
{
        return sector;
}

// ============================================================================
// LOAD HANDLER CLASS
// ============================================================================

int (*DefaultLoadHandler::sfStateFunc)(int, int) = SpaceFillCurve::hilbertState;
int (*DefaultLoadHandler::sfPosFunc)(int, int) = SpaceFillCurve::hilbertPos;

void DefaultLoadHandler::recOrderSpaceFill(Box *parent, int state)
{
        if (parent == NULL) return;
        Box *orderedBox[8] = { NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL };

        for(Box *box = parent->firstChild; box != NULL; box = box->next) {
                int sector = box->getSector();
                int pos = sfPosFunc(state, sector);
                int newstate = (sfStateFunc)(state, sector);
                orderedBox[pos] = box;
                recOrderSpaceFill(box, newstate);
        }

        for(int i = 0; i < 8; i++)
                if (orderedBox[i] != NULL)
                        orderedBox[i]->next = NULL;

        Box *box = NULL;
        for(int i = 0; i < 8; i++)
                if (orderedBox[i] != NULL)
                        if (box == NULL) {
                                box = orderedBox[i];
                                parent->firstChild = box;
                        } else {
                                box->next = orderedBox[i];
                                box = box->next;
                        }
}

void DefaultLoadHandler::orderBoxes()
{
        // order the boxes in the tree according a space filling curve
        recOrderSpaceFill(root, 0);
        connectBoxes();
}

void DefaultLoadHandler::connectBoxes()
{
        // locate global first
        level[nLevels-1].gFirstBox = root;
        for(int lvl = nLevels-2; lvl >= 0; lvl--) {
                // iterate over all parents to find the first box at this level
                Box* par = level[lvl+1].gFirstBox;
                for ( ; par != NULL; par = par->next)
                        if (par->firstChild != NULL) {
                                level[lvl].gFirstBox = par->firstChild;
                                break;
                        }

                // connect the boxes at this level
                par = level[lvl+1].gFirstBox;
                if (par == NULL) break;
                for( ; (par != NULL) && (par->next != NULL); par = par->next) {
                        Box *chd = par->firstChild;
                        if (chd == NULL) continue;
                        // get last child (mind the ; )
                        for( ; chd->next != NULL; chd = chd->next);
                        // find the next parent that has children
                        for( ; par->next != NULL; par = par->next) {
                                if (par->next->firstChild != NULL) {
                                        // connect last child with the first one
                                        chd->next = par->next->firstChild;
                                        break;
                                }
                        }
                }
        }

        // count the number of boxes at each level
        for(int lvl = 0; lvl < nLevels; lvl++) {
                level[lvl].ngBoxes = 0;
                Box *box = level[lvl].gFirstBox;
                for( ; box != NULL; box = box->next)
                        level[lvl].ngBoxes++;
        }
}

void DefaultLoadHandler::loadDivision()
{
        // do the load balancing for the near levels
        level[nNearLevels-1].doLoadBalance(nProc, 0);

        // do the load balancing for the other levels
        for (int lvl = nNearLevels, nPart = 1; lvl < nLevels; lvl++) {
                level[lvl].doLoadBalance(nProc, lvl);

                if ((nPart*2) <= nProc)
                        nPart *= 2;

                ld[lvl].nPartitions = nPart;
        }

        for (int lvl = nLevels-1, nPart = nProc; lvl >= 0; lvl--) {
                double misBalance = level[lvl].getMisBalance(nProc/nPart*2);
                if ((misBalance < 0.01) && (nPart > 1))
                        nPart /= 2;
                level[lvl].minNumPart = nPart;
        }
}