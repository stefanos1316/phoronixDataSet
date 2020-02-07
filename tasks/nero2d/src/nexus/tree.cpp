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
#include "boxmemh.h"
#include "level.h"
#include "tree.h"
#include "defloadh.h"
#include "subtree.h"

using namespace std;

// ============================================================================
// TREE CLASS
// ============================================================================

Tree::Tree(const Point &rootCentre_, deci rootSize_, int nLevels_) :
        root (NULL), rootCentre(rootCentre_), rootSize(rootSize_),
        level(NULL), nLevels(nLevels_), nUnknowns(0), nlUnknowns(0),
        procOffset(NULL)
{
        root = BoxMemHandler::allocateBox();
        level = new Level[nLevels];
        for (int lvl = 0; lvl < nLevels; lvl++)
                level[lvl].lvl = lvl;
}

Tree::~Tree()
{
        BoxMemHandler::deleteAllBoxes();
        delete [] level;
        for (MapSTIt e = subTree.begin(); e != subTree.end(); e++)
                delete e->second;
        delete [] procOffset;
}

Subtree* Tree::createSubtree(int groupID, const Point &LL, const Point &UR)
{
        // make sure the groupID does not exist
        assert(subTree.find(groupID) == subTree.end());

        Subtree *newSubtree = new Subtree(LL, UR);
        // add the root to all ghost lists
        level[nLevels-1].addToGhostList(root, groupID);

        subTree[groupID] = newSubtree;

        return newSubtree;
}

void Tree::deleteSubtree(int groupID)
{
        MapSTIt e = subTree.find(groupID);

        // make sure the groupID exists
        assert(e != subTree.end());

        delete e->second;
        subTree.erase(e);
}

void Tree::recPruneGhostList(Box *box, int lvl)
{
        if (box == NULL) return;

        for( ; box != NULL; box = box->next) {
                level[lvl].ghostList.erase(box);
                recPruneGhostList(box->firstChild, lvl-1);
        }
}

void Tree::recAddUnknown(Box* par, const Point& pCentre, deci pSize, int lvl,
                         const Point& p, int targetLvl, set<int> &subTreeSet)
{
        set<int>::const_iterator e;

        // add the unknown to this box
        par->increaseNUnknowns();

        // remove this box from the ghost list but add all children
        for (e = subTreeSet.begin(); e != subTreeSet.end(); e++) {
                if (level[lvl].removeFromGhostList(par, *e)) {
                        Box *chd = par->firstChild;
                        for ( ; chd != NULL; chd = chd->next)
                                level[lvl-1].addToGhostList(chd, *e);
                }
        }

        // don't descend deeper if this box is a leaf
        if ((par->getNUnknowns() > 1) && (par->firstChild == NULL)) return;

        // target level has been reached: prune the subtree (if any) and return
        if (lvl == targetLvl) {
                if (lvl == 0) return;
                recPruneGhostList(par->firstChild, lvl-1);
                Box::recDeleteNonConnectedBoxes(par->firstChild);
                par->firstChild = NULL;
                par->setNChildren(0);
                return;
        }

        // search in which sector the unknown is located
        int sector = Box::searchSector(pCentre, p);
        // check whether the child already exists
        Box* chd = par->getChild(sector);
        // no: create a new one
        if (chd == NULL) {
                par->setNChildren(par->getNChildren()+1);
                chd = BoxMemHandler::allocateBox();
                chd->setSector(sector);
                chd->parent = par;
                chd->next = par->firstChild;
                par->firstChild = chd;

                // add the new child to the appropriate ghostlists
                for (Box *c = chd->next; c != NULL; c = c->next) {
                        std::map<Box*, std::set<int> >::const_iterator el = 
                                level[lvl-1].ghostList.find(c);
                        if (el == level[lvl-1].ghostList.end()) continue;
                        for (e = el->second.begin(); e != el->second.end(); e++)
                                level[lvl-1].addToGhostList(chd, *e);
                }

                // correction for the subTreeSet
                for (e = subTreeSet.begin(); e != subTreeSet.end(); e++)
                        level[lvl-1].removeFromGhostList(chd, *e);
                subTreeSet.clear();
        }

        deci addX = (sector & 0x1) ? 0.25*pSize : -0.25*pSize;
        deci addY = (sector & 0x2) ? 0.25*pSize : -0.25*pSize;
        deci addZ = (sector & 0x4) ? 0.25*pSize : -0.25*pSize;
        Point childCentre = pCentre + Point(addX, addY, addZ);

        recAddUnknown(chd, childCentre, 0.5*pSize, lvl-1,
                      p, targetLvl, subTreeSet);
}

void Tree::addUnknown(const Point& r, int nID, const int *listID,
                      int targetLvl)
{
        nUnknowns++;

        // find the interaction groups corresponding with the groupIDs
        set<int> subTreeSet;
        for (int i = 0; i < nID; i++)
                subTreeSet.insert(listID[i]);

        // add the unknown in the FMM tree
        recAddUnknown(root, rootCentre, rootSize, nLevels-1, r,
                      targetLvl, subTreeSet);
}

bool Tree::isLocal(const Point& r) const
{
        Box* box = findLeaf(r);

        if (box->getOwner() == thisProc) return true;
        return (box->containsLocalData());
}

int Tree::getOwner(const Point&r) const
{
        Box* box = findLeaf(r);
        return box->getOwner();
}

int Tree::getUnknownIndex(const Point &r)
{
        // search the box which contains p
        Box* box = findLeaf(r);

        // if a non-local box contains
        if (box->getOwner() != thisProc)
                if (!box->containsLocalData())
                        return -1;

        int unknownIndex = box->getOffset();
        int srcProc = box->getOwner();
        box->setOffset(unknownIndex+1);

        return unknownIndex + procOffset[srcProc];
}

void Tree::finalizeAddingUnknowns()
{
        if (nUnknowns == 0) {
                level[nLevels-1].ghostList.erase(root);
                BoxMemHandler::deleteBox(root);
                root = NULL;
        }

        for (MapSTIt e = subTree.begin(); e != subTree.end(); e++) {
                int groupID = e->first;
                Subtree *st = e->second;

                // find the root for the subtree
                st->findRoot(root, rootCentre, rootSize, nLevels-1);

                // in case the subtree contains no unknowns
                if (level[nLevels-1].removeFromGhostList(root, groupID))
                        level[st->nLevels-1].addToGhostList(st->root, groupID);

                if (st->root == NULL) continue;

                // remove all ghostList entries located higher than the root
                Box *par = st->root->parent;
                int lvl = st->nLevels;
                for ( ; par != NULL; par = par->parent, lvl++)
                        for (Box *c = par->firstChild; c != NULL; c = c->next)
                                level[lvl-1].removeFromGhostList(c, groupID);
        }

        // copy the ghostlist
        for (int lvl = 0; lvl < nLevels; lvl++) {
                map<Box*, set<int> >::const_iterator e = 
                        level[lvl].ghostList.begin();
                for ( ; e != level[lvl].ghostList.end(); e++) {
                        set<int>::const_iterator s = e->second.begin();
                        for ( ; s != e->second.end(); s++)
                                subTree[*s]->addToGhostList(e->first);
                }

                level[lvl].ghostList.clear();
        }
}

void Tree::recCalcUnknownOffset(Box* box, uint &unknownOffset)
{
        // calculate the offset for this box
        if ((box->getOwner() == thisProc) || (box->containsLocalData())) {
                recSetUnknownOffset(box, unknownOffset);
                unknownOffset += box->getNUnknowns();
                return;
        }

        // recursively calculate the offset for all its children
        Box *chd = box->firstChild;
        for(uint i = 0; i < box->getNChildren(); i++, chd = chd->next)
                recCalcUnknownOffset(chd, unknownOffset);
}

void Tree::recSetUnknownOffset(Box *box, uint unknownOffset)
{
        // set the offset for this box
        box->setOffset(unknownOffset);

        // recursively set the offset for all its children
        Box *chd = box->firstChild;
        for(uint i = 0; i < box->getNChildren(); i++, chd = chd->next) {
                recSetUnknownOffset(chd, unknownOffset);
                unknownOffset += chd->getNUnknowns();
        }
}

void Tree::calcUnknownOffset(int nNearLevels)
{
        if (nUnknowns == 0) return;

        if (procOffset == NULL)
                procOffset = new int[nProc];
        memset(procOffset, 0, nProc*sizeof(int));

        Box *box = level[nNearLevels-1].gFirstBox;
        uint currProc = box->getOwner();

        for(uint unknownOffset = 0; box != NULL; box = box->next) {
                int owner = box->getOwner();

                // if a change in processor is detected: reset unknown count
                if (owner != currProc) {
                        unknownOffset = 0;
                        currProc = owner;
                }

                recCalcUnknownOffset(box, unknownOffset);
                procOffset[owner] = unknownOffset;
        }

        uint counter = procOffset[thisProc];

        for (int i = 0; i < nProc; i++) {
                if (i == thisProc) continue;
                int add = procOffset[i];
                procOffset[i] = counter;
                counter += add;
        }
        procOffset[thisProc] = 0;
}

Box* Tree::findLeaf(const Point& p) const
{
        Box* box = const_cast<Box*>(root);
        Point centre = rootCentre;
        deci boxSize = rootSize;

        while (true) {
                int sector = Box::searchSector(centre, p);
                Box *chd = box->getChild(sector);
                if (chd == NULL) return box;

                // update child to parent
                deci addX = (sector & 0x1) ? 0.25*boxSize : -0.25*boxSize;
                deci addY = (sector & 0x2) ? 0.25*boxSize : -0.25*boxSize;
                deci addZ = (sector & 0x4) ? 0.25*boxSize : -0.25*boxSize;
                centre = centre + Point(addX, addY, addZ);
                box = chd;
                boxSize *= 0.5;
        }
}

void Tree::doLoadBalancing(LoadHandler *loadHandler, LevelData *ld,
                           int nNearLevels)
{
        if (loadHandler == NULL)
                loadHandler = new DefaultLoadHandler();

        // do the load balancing
        loadHandler->setTreeData(root, level, ld, nLevels, nNearLevels);
        loadHandler->orderBoxes();
        loadHandler->loadDivision();

        delete loadHandler;

        // find the lFirstBox and the nlBoxes in this level
        for (int lvl = 0; lvl < nNearLevels; lvl++)
                level[lvl].postLoadBalancing();
        nlUnknowns = level[nNearLevels-1].getNumLocalUnknowns();
}

int Tree::getBoxLevel(const Box *box) const
{
        int deepness = 0;

        while (box->parent != NULL) {
                deepness++;
                box = box->parent;
        }
        return nLevels - 1 - deepness;
}

Point Tree::getBoxCentre(const Box *box, int lvl) const
{
        if (lvl < 0) lvl = getBoxLevel(box);
        int deepness = nLevels - 1 - lvl;
        int *sector = (deepness == 0) ? NULL : new int[deepness];

        // save the sectors from bottom to the top
        for (int i = 0; i < deepness; i++) {
                sector[i] = box->getSector();
                box = box->parent;
        }

        Point centre = rootCentre;
        deci currSize = rootSize;
        // now calculate the centre from top to bottom
        for (int i = deepness-1; i >= 0; i--) {
                int s = sector[i];
                // update the centrum
                deci addX = (s & 0x1) ? 0.25*currSize : -0.25*currSize;
                deci addY = (s & 0x2) ? 0.25*currSize : -0.25*currSize;
                deci addZ = (s & 0x4) ? 0.25*currSize : -0.25*currSize;
                centre = centre + Point(addX, addY, addZ);

                currSize = 0.5*currSize;
        }

        delete [] sector;
        return centre;
}

void Tree::setLocalUnknownOffset(int nNearLevels)
{
        Box *box = level[nNearLevels-1].lFirstBox;
        if (box == NULL) return;

        uint nlBoxes = level[nNearLevels-1].nlBoxes;
        uint currProc = box->getOwner();
        for(uint unknownOffset = 0, i = 0; i < nlBoxes; i++, box = box->next) {
                recSetUnknownOffset(box, unknownOffset);
                unknownOffset += box->getNUnknowns();
        }
}
