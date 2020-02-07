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

#ifndef OBJECT_H
#define OBJECT_H

#include "nexus/nexus.h"

// ============================================================================
// TYPEDEFS
// ============================================================================

// shape types
typedef enum { CIRCLE = 'C', POLYGON = 'P' } Shape;
// material types
typedef enum { DIEL = 'D', PEC = 'P' } Material;

// ============================================================================
// CLASS PROTOYPES
// ============================================================================

class Medium;

// ============================================================================
// OBJECT CLASS
// ============================================================================

class Object
{
public:
        /**
         * Default constructor
         */
        Object();

        /**
         * Destructor
         */
        ~Object();

        /**
         * Load the object from disc
         * @param ifs Pre-opened file stream pointing to the object section
         */
        void loadObject(std::ifstream &ifs);

        /**
         * Accessor the material type
         * @return The material of the object
         */
        Material getMaterial() const { return material; }

        /**
         * Accessor the shape type
         * @return The shape op the object
         */
        Shape getShape() const { return shape; }

        /**
         * Accessor for the origin of the object
         * @return The origin of the object
         */
        Point getOrigin() const { return origin; }

        /**
         * Accessor for the radius of the object
         * @return The radius of the object
         */
        double getRadius() const { return radius; }

        /**
         * Return a pointer to the inner medium (NULL for PEC)
         * @return A pointer to the inner medium
         */
        Medium* getInnerMedium() const { return innerMedium; }

        /**
         * Return a pointer to the outer medium (NULL for PEC)
         * @return A pointer to the outer medium
         */
        Medium* getOuterMedium() const { return outerMedium; }

        /**
         * Accessor for the bounding box
         * @param LL Lower left point of the bounding box (output)
         * @param UR Upper right point of the bounding box (output)
         */
        void getBoundingBox(Point &LL, Point &UR) { LL = bbLL; UR = bbUR; };

        /**
         * Accessor for the number of segments in this object
         * @return The number of segments in this object
         */
        int getNumSeg() { return nSeg; }

        /**
         * Set the outer medium of the object
         * @param om Pointer to the outer medium
         */
        void setOuterMedium(Medium* om) { outerMedium = om; }

        /**
         * Set the relative segment length
         * @param segLengthRel Relative segment length
         */
        void setSegmentLength(double segLengthRel);

        /**
         * Initializes the mesh iterator to the first segment
         */
        void meshItInit() const;

        /**
         * Calculates and returns the next mesh point
         * @return The next point in the mesh
         */
        Point meshItGetNext() const;

        /**
         * Check whether a point lies in a certain object
         * @param p Pointer to the point
         * @return True of False
         */
        bool containsPoint(const Point& p) const;

        /**
         * Print object to the output stream
         * @param os Output stream to add to
         * @param O Object to print
         * @return Output stream with the object added to it
         */
        friend std::ostream& operator<<(std::ostream& os, const Object& O);

private:
        Shape shape;            // 'C' or 'P' (Circle or Polygon)
        Material material;      // 'P' or 'D' (Pec or Diel)

        Point origin;           // 'C': origin of the object or
                                // 'P': inner point somewhere
        double radius;          // radius of circle

        Point bbLL;             // bounding box of scene : lower left
        Point bbUR;             // bounding box of scene : upper right

        int nPoints;            // the number of points in the object
        int nSeg;               // number of segments
        double segLength;       // the length of each segment in this object

        Point *geometry;        // contains the geometry

        Medium *innerMedium;    // the inner interaction group
        Medium *outerMedium;    // pointer to the outer interaction group

        mutable int itMD1;      // iterator metadata
        mutable int itMD2;      // iterator metadata

        /**
         * Calculate the number of segments in this object
         */
        void calcNumSeg();
};

#endif
