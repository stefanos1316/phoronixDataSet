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

#ifndef OUTPUT_H
#define OUTPUT_H

#include "mathlib.h"
#include "nexus/nexus.h"
#include "matrix.h"

// ============================================================================
// TYPEDEFS
// ============================================================================

typedef enum { LINE = 'L', BITMAP = 'P', CIRCLEOUT = 'C', RCS = 'R'} OutputT;

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class Geometry;
class Excitation;
class Grafix;
class ConfigFile;
class HandlerManager;

// ============================================================================
// OUTPUT CLASS
// ============================================================================

class Output
{
public:
        /**
         * Virtual destructor for your convenience
         */
        virtual ~Output() {};

        /**
         * Load the output from disc
         * @param ifs Pre-opened file stream pointing to the output
         */
        virtual void load(std::ifstream &ifs) = 0;

        /**
         * Accessor for the output bounding box
         * @param LL Lower left point (output)
         * @param UR Upper right point (output)
         */
        virtual void getBoundingBox(Point &LL, Point &UR) const = 0;

        /**
         * Add the output to the stream
         * @param os Output stream to add to
         */
        virtual void addStreamOutput(std::ostream& os) const = 0;

        /**
         * Get the number of output points
         * @return The number of points
         */
        virtual int getNumPoints() const = 0;

        /**
         * Initializes the mesh iterator to the first output point
         * @param geometry Pointer to the geometry
         */
        virtual void pointItInit(Geometry *geometry) = 0;

        /**
         * Calculates and returns the next output point
         * @param p The next point in the mesh
         * @param groupID The groupID of the output point
         */
        virtual void pointItGetNext(Point &p, int &groupID) = 0;

        /**
         * Get the base filename
         * @return Base filename for the object
         */
        virtual std::string getBaseFilename() = 0;

        /**
         * Print output object to the output stream
         * @param os Output stream to add to
         * @param O Output object to print
         * @return Output stream with the output object added to it
         */
        friend std::ostream& operator<<(std::ostream& os, const Output& O);
};

// ============================================================================
// OUTPUT LINE CLASS
// ============================================================================

class OutputLine : public Output
{
public:
        /**
         * Default constructor
         */
        OutputLine();

        /**
         * Load the output line from disc
         * @param ifs Pre-opened file stream pointing to the output
         */
        void load(std::ifstream &ifs);

        /**
         * Accessor for the output bounding box
         * @param LL Lower left point (output)
         * @param UR Upper right point (output)
         */
        void getBoundingBox(Point &LL, Point &UR) const {
                LL.setCoords(min(p1.getX(), p2.getX()),
                             min(p1.getY(), p2.getY()));
                UR.setCoords(max(p1.getX(), p2.getX()),
                             max(p1.getY(), p2.getY()));
        }

        /**
         * Add the output to the stream
         * @param os Output stream to add to
         */
        void addStreamOutput(std::ostream& os) const;

        /**
         * Get the number of output points
         * @return The number of points
         */
        int getNumPoints() const { return nPoints; };

        /**
         * Initializes the mesh iterator to the first output point
         * @param geometry Pointer to the geometry
         */
        void pointItInit(Geometry *geometry);

        /**
         * Calculates and returns the next output point
         * @param p The next point in the mesh
         * @param groupID The groupID of the output point
         */
        void pointItGetNext(Point &p, int &groupID);

        /**
         * Get the base filename
         * @return Base filename for the object
         */
        std::string getBaseFilename();

private:
        Point p1, p2;           // begin- and endpoint
        int nPoints;            // number of points
        int IT;                 // iterator
        Geometry *geometryPtr;  // pointer to the geometry
};

// ============================================================================
// OUTPUT BITMAP CLASS
// ============================================================================

class OutputBitmap : public Output
{
public:
        /**
         * Default constructor
         */
        OutputBitmap();

        /**
         * Destructor
         */
        ~OutputBitmap();

        /**
         * Load the output bitmap from disc
         * @param ifs Pre-opened file stream pointing to the output
         */
        void load(std::ifstream &ifs);

        /**
         * Accessor for the output bounding box
         * @param LL Lower left point (output)
         * @param UR Upper right point (output)
         */
        void getBoundingBox(Point &LL, Point &UR) const {
                LL = p1; UR = p2;
        }

        /**
         * Add the output to the stream
         * @param os Output stream to add to
         */
        void addStreamOutput(std::ostream& os) const;

        /**
         * Get the number of output points
         * @return The number of points
         */
        int getNumPoints() const { return resX*resY; };

        /**
         * Initializes the mesh iterator to the first output point
         * @param geometry Pointer to the geometry
         */
        void pointItInit(Geometry *geometry);

        /**
         * Calculates and returns the next output point
         * @param p The next point in the mesh
         * @param groupID The groupID of the output point
         */
        void pointItGetNext(Point &p, int &groupID);

        /**
         * Get the base filename
         * @return Base filename for the object
         */
        std::string getBaseFilename();

private:
        Point p1, p2;           // specification of positions
        int resX, resY;         // resolution X and Y
        Grafix *backmap;        // backmap contain groupIDs
        int IT;                 // iterator

        /**
         * Creates a map of groupIDs
         * @param geometry Pointer to the geometry
         */
        void prepareBackmap(Geometry *geometry);

        /**
         * Get the groupID for a certain index point
         * @param index Index of the point
         * @return The groupID of that point
         */
        int getGroupID(int index) const;
};

// ============================================================================
// OUTPUT CIRCLE CLASS
// ============================================================================

class OutputCircle : public Output
{
public:
        /**
         * Default constructor
         */
        OutputCircle();

        /**
         * Load the output circle from disc
         * @param ifs Pre-opened file stream pointing to the output
         */
        void load(std::ifstream &ifs);

        /**
         * Accessor for the output bounding box
         * @param LL Lower left point (output)
         * @param UR Upper right point (output)
         */
        void getBoundingBox(Point &LL, Point &UR) const {
                Point offset(radius, radius);
                LL = centre - offset;
                UR = centre + offset;
        }

        /**
         * Add the output to the stream
         * @param os Output stream to add to
         */
        void addStreamOutput(std::ostream& os) const;

        /**
         * Get the number of output points
         * @return The number of points
         */
        int getNumPoints() const { return nPoints; };

        /**
         * Initializes the mesh iterator to the first output point
         * @param geometry Pointer to the geometry
         */
        void pointItInit(Geometry *geometry);

        /**
         * Calculates and returns the next output point
         * @param p The next point in the mesh
         * @param groupID The groupID of the output point
         */
        void pointItGetNext(Point &p, int &groupID);

        /**
         * Get the base filename
         * @return Base filename for the object
         */
        std::string getBaseFilename();

private:
        Point centre;           // centre of the circle
        double radius;          // radius of output (circle)
        int nPoints;            // number of points
        int IT;                 // iterator
        Geometry *geometryPtr;  // pointer to the geometry
};

// ============================================================================
// OUTPUT HANDLER CLASS
// ============================================================================

class OutputHandler
{
public:
        /**
         * Default constructor
         */
        OutputHandler();

        /**
         * Destructor
         */
        ~OutputHandler();

        /**
         * Load the output from disc
         * @param ifs Pre-opened file stream pointing to the output section
         */
        void loadOutput(std::ifstream &ifs);

        /**
         * Calculate all output
         * @param geometry Pointer to the geometry
         * @param X Reference to the solution vector
         * @param config Pointer to the configuration file
         * @param exc Pointer to the excitation structure
         * @param hm Pointer to the handler manager
         */
        void calculateOutput(Geometry *geometry, Vector<cplx> &X,
                             const ConfigFile *config, Excitation *exc,
                             HandlerManager *hm);

        /**
         * Accessor for the output bounding box
         * @param LL Lower left point (output)
         * @param UR Upper right point (output)
         */
        void getBoundingBox(Point &LL, Point &UR) { LL = outLL; UR = outUR; }

        /**
         * Print output handler to the output stream
         * @param os Output stream to add to
         * @param O Output handler to print
         * @return Output stream with the output handler added to it
         */
        friend std::ostream& operator<<(std::ostream& os,
                                        const OutputHandler& O);

private:
        int nOutputs;           // number of outputs in the scene
        Output** output;        // pointers to the actual outputs

        Point outLL;            // lower left point of output bounding box
        Point outUR;            // upper right point of output bounding box

        int nOutputPoints;      // the global number of output points
        int nlOutputPoints;     // the number of local output points
        Point *lOutputPoints;   // local output points
        int *lOutputGroupID;    // local groupID
        int *neroToNexus;       // local to global output
        bool calculateRCS;      // calculate the RCS or not

        /**
         * Update the bounding box to contain p
         * @param p Point p under consideration
         */
        void updateBoudingBox(const Point &p);

        void calcTranslHandlers(Nexus &nexus, Geometry *geometry,
                               const ConfigFile *config);

        /**
         * Setup structures for matrix-vector product
         * @param nexus reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param config Pointer to the configuration
         * @param hm Pointer to the handler manager
         */
        void setup(Nexus &nexus, Geometry *geometry, const ConfigFile *config,
                   HandlerManager *hm);

        /**
         * Add the output points to nexus
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         */
        void addOutputPoints(Nexus &nexus, Geometry *geometry);

        /**
         * Save the local output points
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         */
        void saveLocalOutput(Nexus &nexus, Geometry *geometry);

        void createRCSMaster(Nexus &nexus, Geometry *geometry);

        void createRCS(Nexus &nexus, Geometry *geometry);

        void createRCSSlave(Nexus &nexus, Geometry *geometry);

        /**
         * Expand local output to global and write to disc
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param lOutput Reference to the local output
         * @param suffix Suffix for the output filename
         */
        void writeOutputToDisc(Nexus &nexus, Geometry *geometry,
                               const Vector<cplx> &lOutput,
                               const std::string &suffix);

        /**
         * Expand local output to global and write to disc (slave function)
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param lOutput Reference to the local output
         */
        void writeOutputToDiscSlave(Nexus &nexus, Geometry* geometry,
                                    const Vector<cplx> &lOutput);

        /**
         * Expand local output to global and write to disc (master function)
         * @param nexus Reference to the nexus object
         * @param geometry Pointer to the geometry
         * @param lOutput Reference to the local output
         */
        void writeOutputToDiscMaster(Nexus &nexus, Geometry* geometry,
                                     const Vector<cplx> &lOutput,
                                     const std::string &suffix);

        // ====================================================================
        // INPUT
        // ====================================================================

        /**
         * Load the solution vector X to hard disc
         * @param filename Name of the input file
         */
        void loadSolutionVector(const std::string &filename,
                                Vector<cplx> &X, Nexus &nexus,
                                int nlUnknowns);
};

#endif
