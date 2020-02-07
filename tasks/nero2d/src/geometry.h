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

#ifndef GEOMETRY_H
#define GEOMETRY_H

#include "segment.h"
#include "nexus/nexus.h"
#include <vector>

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Medium;
class Object;
class Grafix;
class ConfigFile;

// ============================================================================
// GEOMETRY CLASS
// ============================================================================

class Geometry
{
public:
        /**
         * Default constructor
         * @param config Configuration settings
         */
        Geometry(ConfigFile *config);

        /**
         * Destructor
         */
        ~Geometry();

        /**
         * Load the geometry from disc
         * @param ifs Pre-opened file stream pointing to the geometry section
         */
        void loadGeometry(std::ifstream &ifs);

        /**
         * Get the medium corresponding with a certain ID
         * @param groupID Identifier for the medium
         * @return Pointer to the medium corresponding with the groupID
         */
        Medium* getMedium(int groupID) const;

        /**
         * Get the medium index at a certain point p
         * @param p The point p under consideration
         * @return Pointer to the medium in which p resides
         */
        Medium* getMediumAtPoint(const Point& p) const;

        /**
         * Get the background medium
         * @return Pointer to the backgroun medium
         */
        Medium* getBackgroundMedium() const { return bgMedium; }

        /**
         * Add the interactions groups and the geometry to nexus
         * @param nexus Reference to the nexus object
         * @param LL Lower left point of the geometry tree
         * @param UR Upper right point of the geometry tree
         */
        void addGeometry(Nexus &nexus, const Point &LL, const Point &UR);

        /**
         * Count and save the local geometry
         * @param nexus Reference to the nexus object
         */
        void saveLocalGeometry(Nexus &nexus);

        /**
         * Get the SMP of interaction segs involved in unknowns [first..last]
         * @param smpList Map with SMP (output)
         * @param first Index of the first unknown
         * @param last Index of the last unknown
         */
        void getInteractingSegments(std::map<int, SMP>& smpList,
                                    int first, int last) const;

        /**
         * Accessor for the local segments
         * @param index Index of the segment
         * @return Reference to the desired segment
         */
        Segment &getSegment(int index) const { return lSeg[index]; }

        /**
         * Do we have a TM component
         * @return True or false
         */
        bool haveTM() const { return TM; }

        /**
         * Do we have a TE component
         * @return True or false
         */
        bool haveTE() const { return TE; }

        /**
         * Accessor for the frequency
         * @return The frequency
         */
        double getFrequency() const { return frequency; }

        /**
         * Accessor for beta
         * @return Beta
         */
        dcomplex getBeta() const { return beta; }

        /**
         * Accessor for the number of radiation pattern components
         * @return The number of radiation pattern components
         */
        int getNumRadPatComp() const { return nRadPatComp; }

        /**
         * Accessor the for number of unknowns
         * @return The number of unknowns
         */
        int getNumUnknowns() const { return nUnknowns; }

        /**
         * Accessor the for number of stored unknowns
         * @return The number of stored unknowns
         */
        int getNumStoredUnknowns() const { return nsUnknowns; }

        /**
         * Accessor the for number of local segments
         * @return The number of local segments
         */
        int getNumLocalSeg() const { return nlSeg; }

        /**
         * Accessor for the geometry bounding box
         * @param LL Lower left point (output)
         * @param UR Upper right point (output)
         */
        void getBoundingBox(Point &LL, Point &UR) { LL = geoLL; UR = geoUR; }

        /**
         * Draw the geometry on a bitmap
         * @param map Pointer to the bitmap
         */
        void draw(Grafix *map) const;

        /**
         * Print geometry to the output stream
         * @param os Output stream to add to
         * @param G Geometry to print
         * @return Output stream with the geometry added to it
         */
        friend std::ostream& operator<<(std::ostream& os, const Geometry& G);

private:
        ConfigFile *config;     // pointer to the configure file

        double frequency;       // frequency of the incident field(s)
        dcomplex beta;          // beta component for TETM
        bool TM, TE;            // transversal magnetic, eletric excitation
        int nRadPatComp;        // number of radiation pattern components

        int nObj;               // number of objects in the geometry
        Object* object;         // the objects in the geometry (PEC + diel)

        int nDiel;              // number of dielectrica in the geometry
        int nPec;               // number of pec in the geometry

        Point geoLL;            // bounding box of the geometry : lower left
        Point geoUR;            // bounding box of the geometry : upper right

        Medium* bgMedium;       // identifier of the background medium
        Medium** medium;        // set with all different mediums

        int nUnknowns;          // total number of unknowns in the geometry
        int nsUnknowns;         // number of stored unknowns

        int nSeg;               // total number of segments in the geometry
        int nlSeg;              // number of local segments
        Segment *lSeg;          // locally stored segments (# == nlSeg + neSeg)

        int *unknToSeg;         // index which points to a seg for each unknown

        // ====================================================================
        // DERIVED SCENE PARAMETERS
        // ====================================================================

        /**
         * Find the index of the medium surrounding a certain object
         * @param objIndex Index of the object under consideration
         * @return Pointer to the medium surrounding the object
         */
        Medium* findOuterMediumForObject(int objIndex) const;

        /**
         * Count total/local number of segments
         * @param nexus Reference to the nexus object
         */
        void countNumberOfSegmentsAndStoredUnknowns(Nexus &nexus);

        /**
         * Locates and saves the local and extra segments
         * @param nexus Reference to the nexus object
         */
        void saveLocalSegments(Nexus &nexus);
};

#endif
