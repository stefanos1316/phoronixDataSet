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

#include "object.h"
#include "medium.h"
#include "mathlib.h"

#include <fstream>
using namespace std;

// ===========================================================================
// DEFINITIONS
// ===========================================================================

#define MIN_NUM_SEG_CIRCLE 6

// ===========================================================================
// OBJECT CLASS
// ===========================================================================

Object::Object() : shape(CIRCLE), material(DIEL), radius(-1.0), nPoints(0),
        nSeg(0), segLength(0.0), geometry(NULL), innerMedium(NULL),
        outerMedium(NULL), itMD1(0), itMD2(0)
{

}

Object::~Object()
{
        delete [] geometry;
        delete innerMedium;
}

void Object::loadObject(std::ifstream &ifs)
{
        // temporary read variables
        double d1, d2, d3, d4;
        char c;

        ifs >> c >> d1 >> d2 >> d3 >> d4;
        shape = Shape(c);
        bbLL.setCoords(d1, d2);
        bbUR.setCoords(d3, d4);
        Point prev = bbLL - Point(1.0, 1.0);

        switch (shape) {
                case CIRCLE:
                        ifs >> radius >> d1 >> d2;
                        origin.setCoords(d1, d2);
                        break;
                case POLYGON:
                        ifs >> nPoints >> d1 >> d2;
                        origin.setCoords(d1, d2);
                        geometry = new Point[nPoints];
                        for(int i = 0; i < nPoints; i++) {
                                ifs >> d1 >> d2;
                                geometry[i].setCoords(d1, d2);
                                assert((prev.getX() != d1) ||
                                       (
prev.getY() != d2));
                                prev.setCoords(d1, d2);
                        }
                        break;
        }

        // load material data
        ifs >> c >> d1 >> d2 >> d3 >> d4;
        material = Material(c);
        if (material == DIEL) innerMedium =
                new Medium(eps0*dcomplex(d1,d2), mu0*dcomplex(d3,d4));
}

void Object::setSegmentLength(double segLengthRel)
{
        double innerLambda = (innerMedium != NULL) ?
                innerMedium->lambda : c;
        double outerLambda = (outerMedium != NULL) ?
                outerMedium->lambda : c;
        segLength = (innerLambda > outerLambda) ?
                segLengthRel*outerLambda : segLengthRel*innerLambda;

        calcNumSeg();
}

bool Object::containsPoint(const Point& p) const
{
        // fast elimination based upon bounding box
        if (bbLL.getX() > p.getX()) return false;
        if (bbLL.getY() > p.getY()) return false;
        if (bbUR.getX() < p.getX()) return false;
        if (bbUR.getY() < p.getY()) return false;

        // rigorous checking ... for circle
        if (shape == CIRCLE)
                if ((origin-p).norm() < radius) return true;
        // ... for polygon
        if (shape == POLYGON) {
                double theta = 0;
                for (int j = 0; j < nPoints; j++) {
                        int i1 = j % nPoints;
                        int i2 = (j+1) % nPoints;
                        Point& p1 = geometry[i1];
                        Point& p2 = geometry[i2];

                        Point v1 = p-p1;
                        Point v2 = p-p2;
                        theta += atan2(v1.cross(v2), v1.dot(v2));
                }
                if (fabs(theta - 2*pi) < 1e-3) return true;
        }

        return false;
}

void Object::calcNumSeg()
{
        nSeg = 0;
        if (shape == CIRCLE) {
                int n = (int)((radius*2*pi)/(segLength))+1;
                if (n < MIN_NUM_SEG_CIRCLE)
                        n = MIN_NUM_SEG_CIRCLE;
                nSeg = n;
        } else {
                for(int i = 0; i < nPoints; i++) {
                        Point& p1 = geometry[i];
                        Point& p2 = (i+1 == nPoints) ?
                                        geometry[0] : geometry[i+1];

                        double length = (p1-p2).norm();
                        nSeg += (int)(length/segLength)+1;
                }
        }
}

ostream& operator<<(std::ostream& os, const Object& O)
{
        switch (O.material) {
                case DIEL:
                        os << "Dielectricum, ";
                        break;
                case PEC:
                        os << "PEC, ";
                        break;
        }

        switch(O.shape) {
                case CIRCLE:
                        os << "Circle (centre (" << O.origin << "), radius "
                                        << O.radius << ")" << endl;
                        break;
                case POLYGON:

                        os << "Polygon (centre (" << O.origin << "), nPoints "
                                        << O.nPoints << ")" << endl;
                        break;
        }

        return os << "\t  Bouding box: (" << O.bbLL << "), (" << O.bbUR << ")";
}

void Object::meshItInit() const
{
        itMD1 = 0;
        itMD2 = 0;
}

Point Object::meshItGetNext() const
{
        if (shape == CIRCLE) { // circle
                double n = nSeg;
                double i = (itMD1++) % nSeg;
                return origin + radius*Point(cos(2.0*pi*i/n), sin(2.0*pi*i/n));

        } else {                     // polygon
                int i1 = itMD1 % nPoints;
                int i2 = (itMD1+1) % nPoints;
                Point& p1 = geometry[i1];
                Point& p2 = geometry[i2];

                double length = (p1-p2).norm();
                int n = (int)(length/segLength)+1;

                double perc = ((double)itMD2++)/((double)n);
                if (itMD2 == n) { itMD1++; itMD2 = 0; }
                return (1.0-perc)*p1+perc*p2;
        }
}
