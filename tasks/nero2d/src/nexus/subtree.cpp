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
#include "subtree.h"

Subtree::Subtree(const Point &LL_, const Point &UR_) : LL(LL_), UR(UR_),
        root(NULL), rootSize(0.0), level(NULL), nLevels(0), lHighestLeafLvl(0)
{

}

Subtree::~Subtree()
{
        delete [] level;
}

// ============================================================================
// TREE CONSTRUCTION
// ============================================================================

void Subtree::findRoot(Box *globalRoot, const Point &globalRootCentre,
                       deci globalRootSize, int globalRootLevel)
{
        root = globalRoot;
        rootCentre = globalRootCentre;
        rootSize = globalRootSize;
        nLevels = globalRootLevel + 1;

        // in case the complete tree contains no unknowns
        if (root == NULL) return;

        while (true) {
                int s1 = Box::searchSector(rootCentre, LL);
                int s2 = Box::searchSector(rootCentre, UR);

                // if both points do not belong to the same sector
                // then we have found a good root for the subtree
                if (s1 != s2) break;

                // find a child box
                Box* chd = root->getChild(s1);
                // no: create a new one
                if (chd == NULL) break;

                // update the parent pointer
                root = chd;
                // update the parent centre
                deci addX = (s1 & 0x1) ? 0.25*rootSize : -0.25*rootSize;
                deci addY = (s1 & 0x2) ? 0.25*rootSize : -0.25*rootSize;
                deci addZ = (s1 & 0x4) ? 0.25*rootSize : -0.25*rootSize;
                rootCentre = rootCentre + Point(addX, addY, addZ);
                // update parent size
                rootSize *= 0.5;
                // update the number of levels
                nLevels--;
        }
}

void Subtree::markSubtreeBoxes()
{
        assert(nLevels > 0);

        // first recursively mark all boxes under the subtree root
        if (root != NULL)
                root->recSetBelongsToThisIntGroup(true);

        // then mark the boxes in the ghost list as false
        for (setBoxIt e = ghostList.begin(); e != ghostList.end(); e++) {
                assert((*e)->belongsToThisIntGroup());
                (*e)->recSetBelongsToThisIntGroup(false);
        }

        // create the level structure
        level = new Level[nLevels];
        for (int lvl = 0; lvl < nLevels; lvl++)
                level[lvl].lvl = lvl;

        // locate global first
        level[nLevels-1].gFirstBox = root;
        for(int lvl = nLevels-2; lvl >= 0; lvl--) {
                // iterate over all parents to find the first box at this level
                Box* par = level[lvl+1].gFirstBox;
                for ( ; par != NULL; par = par->getNext())
                        if (par->getFirstChild() != NULL) {
                                level[lvl].gFirstBox = par->getFirstChild();
                                break;
                        }
                // count the global number of boxes and the number of near lvl
                level[lvl].ngBoxes = 0;
                Box *box = level[lvl].gFirstBox;
                for( ; box != NULL; box = box->getNext()) {
                        level[lvl].ngBoxes++;
                }
        }
}

void Subtree::removeAllMarks()
{
        if (root == NULL) return;
        root->recSetFlag(false);
        root->recSetBelongsToThisIntGroup(false);
        root->recSetContainsLocalData(false);
}

void Subtree::setOwnerGroup(int loLvl, int hiLvl, int nPartitions)
{
        int thisOG = thisProc / nPartitions;

        // set the owner group based on the owner + partition
        if ((nPartitions == 1) || (nPartitions < level[hiLvl].minNumPart)) {
                for (int lvl = loLvl; lvl <= hiLvl; lvl++) {
                        Box* box = level[lvl].gFirstBox;
                        for ( ; box != NULL; box = box->getNext()) {
                                int OG = box->getOwner() / nPartitions;
                                box->setOwnerGroup(OG);
                        }
                }
        } else {
                Box* box = level[hiLvl].gFirstBox;
                for ( ; box != NULL; box = box->getNext()) {
                        int OG = box->getOwner() / nPartitions;
                        box->recSetOwnerGroup(OG, hiLvl, loLvl);
                }
        }

        // find the local variables for level
        for (int lvl = loLvl; lvl <= hiLvl; lvl++) {
                level[lvl].lFirstBox = NULL;
                level[lvl].nlBoxes = 0;
                level[lvl].nlFlagged = 0;

                Box *box = level[lvl].gFirstBox;
                for( ; box != NULL; box = box->getNext()) {
                        // if the box is not local: bail out
                        if (box->getOwnerGroup() != thisOG) continue;

                        level[lvl].nlBoxes++;
                        if (level[lvl].lFirstBox == NULL)
                                level[lvl].lFirstBox = box;
                        if (box->isFlagged())
                                level[lvl].nlFlagged++;
                        if (box->getFirstChild() == NULL)
                                if (lHighestLeafLvl < lvl)
                                        lHighestLeafLvl = lvl;
                }
        }
}

// ============================================================================
// AUXILIARY FUNCTIONS
// ============================================================================

Point Subtree::getBoxCentre(const Box *box, int lvl) const
{
        if (lvl < 0) lvl = getBoxLevel(box);
        int deepness = nLevels - 1 - lvl;
        int *sector = (deepness == 0) ? NULL : new int[deepness];

        // save the sectors from bottom to the top
        for (int i = 0; i < deepness; i++) {
                sector[i] = box->getSector();
                box = box->parent;
        }

        Point currCentre = rootCentre;
        deci currSize = rootSize;
        // now calculate the centre from top to bottom
        for (int i = deepness-1; i >= 0; i--) {
                int s = sector[i];
                // update the centrum
                deci addX = (s & 0x1) ? 0.25*currSize : -0.25*currSize;
                deci addY = (s & 0x2) ? 0.25*currSize : -0.25*currSize;
                deci addZ = (s & 0x4) ? 0.25*currSize : -0.25*currSize;
                currCentre = currCentre + Point(addX, addY, addZ);

                currSize = 0.5*currSize;
        }

        delete [] sector;
        return currCentre;
}

int Subtree::getBoxLevel(const Box *box) const
{
        int deepness = 0;

        while (box->getParent() != NULL) {
                deepness++;
                box = box->parent;
        }
        return nLevels - 1 - deepness;
}

bool Subtree::containsPoint(const Point& p) const
{
        if (p.getX() < (LL.getX()-ZERO_THRESHOLD)) return false;
        if (p.getY() < (LL.getY()-ZERO_THRESHOLD)) return false;
        if (p.getX() > (UR.getX()+ZERO_THRESHOLD)) return false;
        if (p.getY() > (UR.getY()+ZERO_THRESHOLD)) return false;

        return true;
}
