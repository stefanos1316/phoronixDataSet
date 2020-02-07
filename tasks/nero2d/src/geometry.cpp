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

#include "geometry.h"
#include "medium.h"
#include "object.h"
#include "mathlib.h"
#include "grafix/grafix.h"
#include "cnfgfile.h"

#include <fstream>
using namespace std;

// ============================================================================
// GEOMETRY CLASS
// ============================================================================

Geometry::Geometry(ConfigFile *config_) : config(config_), frequency(1e8),
        nRadPatComp(1), TM(true), TE(false), nObj(0), object(NULL), nDiel(0),
        nPec(0), bgMedium(NULL), medium(NULL), nUnknowns(0), nsUnknowns(0),
        nSeg(0), nlSeg(0), lSeg(NULL), unknToSeg(NULL)
{

}

Geometry::~Geometry()
{
        delete [] object;
        delete bgMedium;
        delete [] medium;
        delete [] lSeg;
        delete [] unknToSeg;
}

void Geometry::loadGeometry(ifstream &ifs)
{
        // temporary read variables
        double d1, d2, d3, d4;
        char c;

        // read the geometry header
        ifs >> frequency >> d1 >> d2 >> TM >> TE;
        beta = dcomplex(d1, d2);

        Medium::frequency = frequency;
        Medium::beta = beta;
        if (TE && TM) nRadPatComp = 2;

        // at least TM or TE must be selected
        if ((!TE) && (!TM)) {
                cerr << "Error: select either TM or TE or both in "
                        "the geometry file." << endl;
                exit(EXIT_FAILURE);
        }

        // if only TM or TE is selected beta must be zero
        if ( !((TE && TM) || cZero(beta)) ) {
                if (TM) cerr << "Beta must be equal to zero in a TM "
                                "simulation." << endl;
                if (TE) cerr << "Beta must be equal to zero in a TE "
                                "simulation." << endl;
                exit(EXIT_FAILURE);
        }

        // read the background medium parameters
        ifs >> d1 >> d2 >> d3 >> d4;
        assert((d1 >= 1) && (d2 <= 0) && (d3 >= 1) && (d4 <= 0));

        // read the number objects
        ifs >> nObj >> nDiel >> nPec;
        assert(nObj == (nDiel + nPec));
        assert(nObj > 0);

        // add the background medium to the medium list
        bgMedium = new Medium(eps0*dcomplex(d1, d2), mu0*dcomplex(d3, d4));
        medium = new Medium*[nDiel+1];
        medium[0] = bgMedium;

        // load the objects
        object = new Object[nObj];
        for(int i = 0, medIndex = 1; i < nObj; i++) {
                Object &obj = object[i];

                obj.loadObject(ifs);
                if (obj.getMaterial() == DIEL)
                        medium[medIndex++] = obj.getInnerMedium();
        }

        // set medium IDs
        for (int i = 0; i < (nDiel+1); i++)
                medium[i]->ID = i;

        // load the bounding box
        ifs >> d1 >> d2 >> d3 >> d4;
        geoLL = Point(d1, d2); geoUR = Point(d3, d4);

        nSeg = nUnknowns = 0;
        // calculate the segment length and the number of segs in each object
        for(int i = 0; i < nObj; i++) {
                Object &obj = object[i];

                // determine the outer medium for each object
                obj.setOuterMedium(findOuterMediumForObject(i));

                // set the segment length for this object
                obj.setSegmentLength(config->segLengthRel);
                int nObjSeg = obj.getNumSeg();

                // how many unknowns per segment ?
                int nUnknPerSeg = (obj.getMaterial() == DIEL) ? 2 : 1;
                nUnknPerSeg *= nRadPatComp;

                nSeg += nObjSeg;
                nUnknowns += nObjSeg*nUnknPerSeg;
        }
}

Medium* Geometry::getMediumAtPoint(const Point& r) const
{
        const int bgBody = -1;
        int bestIndex = bgBody;

        // check all body numbers
        for (int i = 0; i < nObj; i++) {
                Object &obj = object[i];
                // if the object does not contain the point: continue
                if (!obj.containsPoint(r)) continue;

                // update body variable
                if (bestIndex == bgBody) {
                        bestIndex = i;
                        continue;
                }

                // only update the body if the boundingbox surrounds the old one
                Object &bestObj = object[bestIndex];

                Point LL, UR, bestLL, bestUR;
                obj.getBoundingBox(LL, UR);
                bestObj.getBoundingBox(bestLL, bestUR);

                if (LL.getX() < bestLL.getX()) continue;
                if (LL.getY() < bestLL.getY()) continue;
                if (UR.getX() > bestUR.getX()) continue;
                if (UR.getY() > bestUR.getY()) continue;
                bestIndex = i;
        }

        if (bestIndex == bgBody)
                return bgMedium;
        else
                return object[bestIndex].getInnerMedium();
}

Medium* Geometry::findOuterMediumForObject(int objIndex) const
{
        const int bgBody = -1;
        int currBestIndex = bgBody; Point p;

        Object &refObj = object[objIndex];
        if (refObj.getShape() == CIRCLE) {
                p = refObj.getOrigin() + Point(refObj.getRadius(), 0);
        } else {
                refObj.meshItInit();
                p = refObj.meshItGetNext();
        }

        for(int i = 0; i < nObj; i++) {
                if (i == objIndex) continue;
                Object &obj = object[i];
                if (!obj.containsPoint(p)) continue;

                if (currBestIndex == bgBody) {
                        currBestIndex = i;
                        continue;
                }

                Object &currBest = object[currBestIndex];

                Point bestLL, bestUR, LL, UR;
                obj.getBoundingBox(LL, UR);
                currBest.getBoundingBox(bestLL, bestUR);

                if (LL.getX() < bestLL.getX()) continue;
                if (LL.getY() < bestLL.getY()) continue;
                if (UR.getX() > bestUR.getX()) continue;
                if (UR.getY() > bestUR.getY()) continue;
                currBestIndex = i;
        }

        if (currBestIndex == bgBody)
                return bgMedium;
        else
                return object[currBestIndex].getInnerMedium();
}

void Geometry::addGeometry(Nexus &nexus, const Point &LL, const Point &UR)
{
        // create an interaction group for the background medium
        nexus.createInteractionGroup(bgMedium->ID, LL, UR);

        // create an interaction group for each dielectric object
        for(int i = 0; i < nObj; i++) {
                Object &obj = object[i];
                if (obj.getMaterial() == PEC) continue;

                Point objLL, objUR;
                obj.getBoundingBox(objLL, objUR);
                int groupID = obj.getInnerMedium()->ID;
                nexus.createInteractionGroup(groupID, objLL, objUR);
        }

        Util::startChrono();
        for(int i = 0, cnt = 0; i < nObj; i++) {
                Object &obj = object[i];

                // get the inner and outer medium IDs
                int listID[2];
                listID[0] = obj.getOuterMedium()->ID;
                if (obj.getMaterial() == DIEL)
                        listID[1] = obj.getInnerMedium()->ID;

                // how many unknowns for this segment ?
                int nUnknPerSeg = 1;
                if (obj.getMaterial() == DIEL) nUnknPerSeg *= 2;
                if (TE && TM) nUnknPerSeg *= 2;

                obj.meshItInit();
                for(int j = 0; j < obj.getNumSeg(); j++, cnt++) {
                        if (cnt % 512 == 0)
                                cout << "Adding geometry (" << cnt
                                     << "/" << nSeg << ")\r";

                        Point p = obj.meshItGetNext();
                        for (int k = 0; k < nUnknPerSeg; k++)
                                if (obj.getMaterial() == PEC)
                                        nexus.addUnknown(p, 1, listID, 0);
                                else
                                        nexus.addUnknown(p, 2, listID, 0);
                }
        }

        cout << "Adding geometry (" << nSeg << "/" << nSeg << ")" << endl;
        cout << "Added geometry in " << Util::stopChrono() << "s" << endl;
}

void Geometry::saveLocalGeometry(Nexus &nexus)
{
        delete [] lSeg;
        delete [] unknToSeg;

        // count the number of local and extra segments
        countNumberOfSegmentsAndStoredUnknowns(nexus);

        // create memory for the local and extra segments
        lSeg = new Segment[nlSeg];
        Segment::lSeg = lSeg;
        unknToSeg = new int[nsUnknowns];

        // now save the local mesh for all objects
        saveLocalSegments(nexus);
}

void Geometry::getInteractingSegments(std::map<int, SMP>& smpList,
                                      int first, int last) const
{
        smpList.clear();

        // for all unknowns...
        for(int i = first; i <= last; i++) {
                int si = unknToSeg[i];  // ... find the corresponding segment
                if (smpList.find(si) != smpList.end()) continue;
                // and add it to the segment list
                smpList[si] = SMP(i-first, NULL);
        }

        // update the previous keys
        for(int i = first; i <= last; i++) {
                int si = unknToSeg[i];
                int nsi = lSeg[si].next;
                // if a key nsi does not exist, a default item is included
                smpList[nsi].prev = &smpList[si];
        }
}

void Geometry::countNumberOfSegmentsAndStoredUnknowns(Nexus &nexus)
{
        // reset the counters
        nlSeg = nsUnknowns = 0;

        for(int i = 0; i < nObj; i++) {
                Object &obj = object[i];

                int nUnknPerSeg = 1;
                if (obj.getMaterial() == DIEL) nUnknPerSeg *= 2;
                if (TE && TM) nUnknPerSeg *= 2;

                obj.meshItInit();
                Point p1 = obj.meshItGetNext();
                int in1 = nexus.isLocal(p1);

                for(int j = 0; j < obj.getNumSeg(); j++) {
                        Point p2 = obj.meshItGetNext();
                        int in2 = nexus.isLocal(p2);

                        if (in2) {
                                nlSeg++;
                                nsUnknowns += nUnknPerSeg;
                        }
                        if ((!in2) && (in1)) nlSeg += 2;
                        in1 = in2;
                }
        }
}

void Geometry::saveLocalSegments(Nexus &nexus)
{
        // shorter names for frequent usage
        int segIndex = 0;

        for(int j = 0; j < nObj; j++) {
                Object &obj = object[j];
                int firstInd = -1, prevInd = -1;

                // init the mesh itterator and get the first point
                obj.meshItInit();
                Point p1 = obj.meshItGetNext();
                int in1 = nexus.isLocal(p1);

                for(int i = 0; i < obj.getNumSeg(); i++) {
                        Point p2 = obj.meshItGetNext();
                        int in2 = nexus.isLocal(p2);

                        if (in2) { // if the index is local

                                // how many unknowns for this segment ?
                                int nUnknPerSeg = 1;
                                if (obj.getMaterial() == DIEL) nUnknPerSeg *= 2;
                                if (TE && TM) nUnknPerSeg *= 2;

                                // retreive the unknown indices
                                for (int k = 0; k < nUnknPerSeg; k++) {
                                        int unkIndex =
                                                nexus.getUnknownIndex(p2);
                                        assert((unkIndex >= 0) &&
                                               (unkIndex < nsUnknowns));
                                        unknToSeg[unkIndex] = segIndex;
                                }

                                if (i == 0) firstInd = segIndex;
                                lSeg[segIndex].p = p1;
                                lSeg[segIndex].obj = &obj;
                                assert((segIndex >= 0) && (segIndex < nlSeg));
                                if (i == (obj.getNumSeg()-1))
                                        lSeg[segIndex].next = firstInd;
                                assert((prevInd < nlSeg));
                                if (prevInd >= 0)
                                        lSeg[prevInd].next = segIndex;
                                prevInd = segIndex;
                                segIndex++;
                        }

                        // if the index is not local, but the previous was
                        if ((!in2) && (in1)) {
                                if (i == 0) firstInd = segIndex;
                                // add two extra segments
                                if (prevInd >= 0)
                                        lSeg[prevInd].next = segIndex;
                                assert((segIndex >= 0) && (segIndex < nlSeg));
                                lSeg[segIndex].p = p1;
                                lSeg[segIndex].obj = &obj;
                                lSeg[segIndex].next = segIndex+1;
                                segIndex++;
                                assert((segIndex >= 0) && (segIndex < nlSeg));
                                lSeg[segIndex].p = p2;
                                lSeg[segIndex].obj = &obj;
                                lSeg[segIndex].next = -1;
                                segIndex++;
                                prevInd = -1;
                        }

                        in1 = in2;
                        p1 = p2;
                }
        }

        for(int i = 0; i < nlSeg; i++)
                if (lSeg[i].next >= 0)
                        lSeg[lSeg[i].next].prev = i;
}

void Geometry::draw(Grafix *map) const
{
        for(int i = 0; i < nObj; i++) {
                Object &obj = object[i];
                obj.meshItInit();
                Point p1 = obj.meshItGetNext();

                for(int j = 0; j < obj.getNumSeg(); j++) {
                        Point p2 = obj.meshItGetNext();
                        map->drawLine(p1.getX(), p1.getY(),
                                      p2.getX(), p2.getY());
                        p1 = p2;
                }
        }
}

Medium *Geometry::getMedium(int groupID) const
{
        assert ((groupID >= 0) && (groupID <= (nDiel+1)));
        return medium[groupID];
}

ostream& operator<<(std::ostream& os, const Geometry& G)
{
        os << "Number of objects: " << G.nObj << " (" << G.nPec << " PEC, "
             << G.nDiel << " DIEL)" << endl;
        os << "Frequency: " << G.frequency << "Hz. Wavelength: "
             << c/G.frequency << " m" << ", seglength: "
             << G.config->segLengthRel << endl;
        os << "Background: gamma = " << G.bgMedium->gamma<< endl;
        os << "TM: " << (G.haveTM() ? "yes" : "no") << ", TE: "
           << (G.haveTE() ? "yes" : "no") << ", Beta : " << G.beta << endl;
        os << "Geometry bouding box: (" << G.geoLL
             << "), (" << G.geoUR << ")" << endl;

        os << "\t-----------------------------------" << endl;
        os << "\tOBJECT LISTING" << endl;
        os << "\t-----------------------------------" << endl;
        for (int i = 0; i < G.nObj; i++)
                os << "\t* Object " << i << ": " << G.object[i] << endl;
        return os;
}
