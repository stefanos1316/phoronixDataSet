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

#ifndef POINT_H
#define POINT_H

#include "pubbase.h"
#include <iostream>

// ===========================================================================
// POINT 3D CLASS
// ===========================================================================

/**
 * Class for three dimensional points
 */
class Point3d {

private:
        deci x, y, z;

public:

        /**
         * Default constructor
         */
        Point3d();

        /**
         * Constructor initializing x, y and z
         * @param x x-coordinate
         * @param y y-coordinate
         * @param z z-coordinate
         */
        Point3d(deci x, deci y, deci z);

        /**
         * Point-point addition
         * @param P Right hand side point
         * @return Sum of the two points
         */
        const Point3d operator+(const Point3d &P) const;

        /**
         * Point-point addition
         * @param P Right hand side point
         * @return Difference of the two points
         */
        const Point3d operator-(const Point3d &P) const;

        /**
         * Scalar-point multiplication
         * @param p Scalar value
         * @param P Right hand side point
         * @return Product p*P
         */
        friend const Point3d operator*(deci p, const Point3d& P) {
                return Point3d(p*P.x, p*P.y, p*P.z);
        }

        /**
         * Point-scalar addition
         * @param P Left hand side point
         * @param p Scalar value
         * @return Product P + p
         */
        friend const Point3d operator+(const Point3d& P, deci p) {
                return Point3d(P.x+p, P.y+p, P.z+p);
        }

        /**
         * Point-scalar addition
         * @param P Left hand side point
         * @param p Scalar value
         * @return Product P = p
         */
        friend const Point3d operator-(const Point3d& P, deci p) {
                return Point3d(P.x-p, P.y-p, P.z-p);
        }

        /**
         * Print point to the output stream
         * @param os Output stream to add to
         * @param P Point to print
         * @return Output stream with the point added to it
         */
        friend std::ostream& operator<<(std::ostream& os, const Point3d& P) {
                os << P.x << ", " << P.y << ", " << P.z;
                return os;
        }

        /**
         * Get the x coordinate
         * @return x coordinate
         */
        deci getX() const { return x; };

        /**
         * Get the y coordinate
         * @return y coordinate
         */
        deci getY() const { return y; };

        /**
         * Get the z coordinate
         * @return z coordinate
         */
        deci getZ() const { return z; };

        /**
         * Set the coordinates x, y and z to their specified value
         * @param x x-coordinate
         * @param y y-coordinate
         * @param z z-coordinate
         */
        void setCoords(deci x, deci y, deci z);

        /**
         * Calculate the Euclidian norm of the point
         * @return Euclidian norm of the point
         */
        deci norm() const;

        /**
         * Calculate the cross product of two vectors
         * @param P Right hand side point
         * @return Cross product of the two vectors
         */
        Point3d cross(const Point3d& P) const;

        /**
         * Calculate the dot product of two points
         * @param P Right hand side point
         * @return Dot product of the two points
         */
        deci dot(const Point3d& P) const;

        /**
         * Extend this point beyond a point P in the upper right direction
         * @param P Point P
         */
        void extendUR(const Point3d& P);

        /**
         * Extend this point beyond a point P in the lower left direction
         * @param P Point P
         */
        void extendLL(const Point3d& P);

        /**
         * Check whether a point is contained in a box defined by LL and UR
         * @param LL Lower left point
         * @param UR Upper right box
         * @return True of false
         */
        bool isContained(const Point3d& LL, const Point3d& UR) const;
};

// ===========================================================================
// POINT 2D CLASS
// ===========================================================================

/**
 * Class for two dimensional points
 */
class Point2d {

private:
        deci x, y;

public:

        /**
         * Default constructor
         */
        Point2d();

        /**
         * Constructor initializing x and y
         * @param x x-coordinate
         * @param y y-coordinate
         */
        Point2d(deci x, deci y);

        /**
         * Constructor initializing x and y and z (ignored)
         * @param x x-coordinate
         * @param y y-coordinate
         * @param z z-coordinate (ignored)
         */
        Point2d(deci x, deci y, deci z);

        /**
         * Point-point addition
         * @param P Right hand side point
         * @return Sum of the two points
         */
        const Point2d operator+(const Point2d &P) const;

        /**
         * Point-point addition
         * @param P Right hand side point
         * @return Difference of the two points
         */
        const Point2d operator-(const Point2d &P) const;

        /**
         * Scalar-point multiplication
         * @param p Scalar value
         * @param P Right hand side point
         * @return Product p*P
         */
        friend const Point2d operator*(deci p, const Point2d& P) {
                return Point2d(p*P.x, p*P.y);
        }

        /**
         * Point-scalar addition
         * @param P Left hand side point
         * @param p Scalar value
         * @return Product P + p
         */
        friend const Point2d operator+(const Point2d& P, deci p) {
                return Point2d(P.x+p, P.y+p);
        }

        /**
         * Point-scalar subtraction
         * @param P Left hand side point
         * @param p Scalar value
         * @return Product P - p
         */
        friend const Point2d operator-(const Point2d& P, deci p) {
                return Point2d(P.x-p, P.y-p);
        }

        /**
         * Print point to the output stream
         * @param os Output stream to add to
         * @param P Point to print
         * @return Output stream with the point added to it
         */
        friend std::ostream& operator<<(std::ostream& os, const Point2d& P) {
                os << P.x << ", " << P.y;
                return os;
        }

        /**
         * Get the x coordinate
         * @return x coordinate
         */
        deci getX() const { return x; };

        /**
         * Get the y coordinate
         * @return y coordinate
         */
        deci getY() const { return y; };

        /**
         * Dummy call to avoid #IFDEFS
         * @return Always zero
         */
        deci getZ() const { return 0.0; };

        /**
         * Set the coordinates x and y to their specified value
         * @param x x-coordinate
         * @param y y-coordinate
         */
        void setCoords(deci x, deci y);

        /**
         * Calculate the Euclidian norm of the point
         * @return Euclidian norm of the point
         */
        deci norm() const;

        /**
         * Calculate the cross product of two vectors
         * @param P Right hand side point
         * @return Z-coordinate of cross product
         */
        deci cross(const Point2d& P) const;

        /**
         * Calculate the dot product of two points
         * @param P Right hand side point
         * @return Dot product of the two points
         */
        deci dot(const Point2d& P) const;

        /**
         * Extend this point beyond a point P in the upper right direction
         * @param P Point P
         */
        void extendUR(const Point2d& P);

        /**
         * Extend this point beyond a point P in the lower left direction
         * @param P Point P
         */
        void extendLL(const Point2d& P);

        /**
         * Check whether a point is contained in a box defined by LL and UR
         * @param LL Lower left point
         * @param UR Upper right box
         * @return True of false
         */
        bool isContained(const Point2d& LL, const Point2d& UR) const;
};

#endif
