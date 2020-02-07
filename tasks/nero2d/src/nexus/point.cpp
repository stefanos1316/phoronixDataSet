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

#include "point.h"
#include <math.h>

// ===========================================================================
// POINT 3D CLASS
// ===========================================================================

Point3d::Point3d() : x(0), y(0), z(0)
{

}

Point3d::Point3d(deci x_, deci y_, deci z_) : x(x_), y(y_), z(z_)
{

}

const Point3d Point3d::operator+(const Point3d &P) const
{
        return Point3d(x + P.x, y + P.y, z + P.z);
}

const Point3d Point3d::operator-(const Point3d &P) const
{
        return Point3d(x - P.x, y - P.y, z - P.z);
}

void Point3d::setCoords(deci x, deci y, deci z)
{
        this->x = x;
        this->y = y;
        this->z = z;
}

deci Point3d::norm() const
{
        return sqrt(x*x+y*y+z*z);
}

Point3d Point3d::cross(const Point3d& P) const
{
        return Point3d(y*P.z-P.y*z, z*P.x-P.z*x, x*P.y-P.x*y);
}

deci Point3d::dot(const Point3d& P) const
{
        return x*P.x+y*P.y+z*P.z;
}

void Point3d::extendLL(const Point3d& P)
{
        if (P.x < x) x = P.x;
        if (P.y < y) y = P.y;
        if (P.z < z) z = P.z;
}

void Point3d::extendUR(const Point3d& P)
{
        if (P.x > x) x = P.x;
        if (P.y > y) y = P.y;
        if (P.z > z) z = P.z;
}

bool Point3d::isContained(const Point3d& LL, const Point3d& UR) const
{
        if (x < LL.x) return false;
        if (y < LL.y) return false;
        if (z < LL.z) return false;
        if (x > UR.x) return false;
        if (y > UR.y) return false;
        if (z > UR.z) return false;
        return true;
}

// ===========================================================================
// POINT 2D CLASS
// ===========================================================================

Point2d::Point2d() : x(0.0), y(0.0)
{

}

Point2d::Point2d(deci x_, deci y_) : x(x_), y(y_)
{

}

Point2d::Point2d(deci x_, deci y_, deci z_) : x(x_), y(y_)
{

}

const Point2d Point2d::operator+(const Point2d &P) const
{
        return Point2d(x + P.x, y + P.y);
}

const Point2d Point2d::operator-(const Point2d &P) const
{
        return Point2d(x - P.x, y - P.y);
}

void Point2d::setCoords(const deci x, const deci y)
{
        this->x = x;
        this->y = y;
}

deci Point2d::norm() const
{
        return sqrt(x*x+y*y);
}

deci Point2d::cross(const Point2d& P) const
{
        return x*P.y - P.x*y;
}

deci Point2d::dot(const Point2d& P) const
{
        return x*P.x+y*P.y;
}

void Point2d::extendLL(const Point2d& P)
{
        if (P.x < x) x = P.x;
        if (P.y < y) y = P.y;
}

void Point2d::extendUR(const Point2d& P)
{
        if (P.x > x) x = P.x;
        if (P.y > y) y = P.y;
}

bool Point2d::isContained(const Point2d& LL, const Point2d& UR) const
{
        if (x < LL.x) return false;
        if (y < LL.y) return false;
        if (x > UR.x) return false;
        if (y > UR.y) return false;
        return true;
}
