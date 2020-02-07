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

#ifndef CNFGFILE_H
#define CNFGFILE_H

// ============================================================================
// TYPE DEFINITIONS
// ============================================================================

typedef enum { HILBERT_SFC, MORTON_SFC } SpaceFill;
typedef enum { FULL, COMPACT, COMPRESSED } AggMethod;
typedef enum { FFT, BLIF, MIXED } IntMethod;
typedef enum { BICGSTAB, TFQMR, RGMRES } ItMethod;

// ============================================================================
// CONFIGURATION FILE
// ============================================================================

class ConfigFile
{
public:
        /**
         * Default constructor
         * @param inputFile Filename of the input file
         * @param argc Pointer to the number of program arguments
         * @param argv[] Pointer to the program arguments
         */
        ConfigFile(const char* inputFile, int *argc, char **argv[]);

        int *argc;              // pointer to the number of arguments
        char ***argv;           // pointer to the program arguments

        int outputProc;         // process that displays the output on screen

        int qOrder;             // gaussian quadrature order
        double segLengthRel;    // relative target length of one segment
        double overshoot;       // percentage of segment out of box

        double minBoxSizeRel;   // relative minimal box size
        double xDist;           // seperation distance near/far interactions
        double fmmPrecision;    // precision for FMM interactions
        int maxFmmLevel;        // maximum FMM level

        AggMethod aggMethod;    // type aggregation method

        IntMethod intMethod;    // type interpolation method
        double minBlifLocality; // minimal local points / boundary points ratio

        bool solutionFromDisc;  // load the solution from disc
        ItMethod itMethod;      // type of iterative solver
        double itPrecision;     // precision for the iterative solver
        int maxIterations;      // maximum number of iterations
        int trueNormParameter;  // true norm parameter for TFQMR
        int restartParameter;   // restart parameter for RGMRES
        int blockJacobiLevel;   // level at which the block jacobi is used

        SpaceFill sfc;          // type of space filling curve
        double packageSize;     // size of a package
        bool benchmarkMode;     // benchmark mode

        int maxOutputSize;      // maximum output size for writing
        bool writeZMatrix;      // write the system matrix or not
        bool writeXVector;      // write the solution vector
        bool writeBVector;      // write the righ hand side vector

private:
        /**
         * Loads and initializes the basis scene parameters
         * @param inputFilename Input filename
         */
        void loadParameters(const char *inputFilename);

        /**
         * Process the command line parameters
         * @param argc Number of arguments
         * @param argv[] Arguments themselves
         */
        void processCommandLine(int argc, char *argv[]);

        /**
         * Find a keyword in the argument list for integer values
         * @param argc Argument count
         * @param argv[] Argument list
         * @param keyword Keyword to find
         * @param result Integer result (output)
         */
        void findKeyword(int argc, char *argv[],
                         const std::string &keyword, int &result);

        /**
         * Find a keyword in the argument list for boolean values
         * @param argc Argument count
         * @param argv[] Argument list
         * @param keyword Keyword to find
         * @param result Boolean result (output)
         */
        void findKeyword(int argc, char *argv[],
                         const std::string &keyword, bool &result);

        /**
         * Find a keyword in the argument list for double values
         * @param argc Argument count
         * @param argv[] Argument list
         * @param keyword Keyword to find
         * @param result Double result (output)
         */
        void findKeyword(int argc, char *argv[],
                         const std::string &keyword, double &result);

        /**
         * Find a keyword in the argument list for ItMethod values
         * @param argc Argument count
         * @param argv[] Argument list
         * @param keyword Keyword to find
         * @param result ItMethod result (output)
         */
        void findKeyword(int argc, char *argv[],
                         const std::string &keyword, ItMethod &result);

        /**
         * Find a keyword in the argument list for Sfc values
         * @param argc Argument count
         * @param argv[] Argument list
         * @param keyword Keyword to find
         * @param result Sfc result (output)
         */
        void findKeyword(int argc, char *argv[],
                         const std::string &keyword, SpaceFill &result);

        /**
         * Find a keyword in the argument list for AggMethod values
         * @param argc Argument count
         * @param argv[] Argument list
         * @param keyword Keyword to find
         * @param result AggMethod result (output)
         */
        void findKeyword(int argc, char *argv[],
                         const std::string &keyword, AggMethod &result);

        /**
         * Find a keyword in the argument list for IntMethod values
         * @param argc Argument count
         * @param argv[] Argument list
         * @param keyword Keyword to find
         * @param result IntMethod result (output)
         */
        void findKeyword(int argc, char *argv[],
                         const std::string &keyword, IntMethod &result);
};

#endif
