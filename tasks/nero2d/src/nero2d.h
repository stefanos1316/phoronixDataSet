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

#ifndef NERO2D_H
#define NERO2D_H

#include "base.h"
#include "matrix.h"
#include <vector>

// ============================================================================
// CLASS PROTYPES
// ============================================================================

class Nexus;
class Geometry;
class Excitation;
class OutputHandler;
class ConfigFile;
class HandlerManager;

class Nero2d
{
private:
        // ====================================================================
        // PROCESS INFO
        // ====================================================================

        int nProc;                      // number of processes
        int thisProc;                   // this process

        // ====================================================================
        // MAIN DATA STRUCTURES
        // ====================================================================

        ConfigFile *config;             // input configure files

        Geometry *geometry;             // the geometry of the simulation
        Excitation *excitation;         // the excitation of the geometry
        OutputHandler *output;          // the outputs in the scene

        Nexus *nexus;                   // master nexus object
        HandlerManager *hm;             // handler manager

        // ====================================================================
        // STATISTICS
        // ====================================================================

        int nlUnknowns;                 // local number of unknowns

        // ====================================================================
        // PRECONDITIONERS
        // ====================================================================

        // ====================================================================
        // FAR INTERACTIONS
        // ====================================================================

        int nRadPatComp;                // number of rad pattern components

        // ====================================================================
        // WORK MEMORY
        // ====================================================================

        cplx *itWork;                   // iterative solving work memory

        // ====================================================================
        // SOLUTION VECTORS
        // ====================================================================

        Vector<cplx> X;                 // solution vector
        Vector<cplx> B;                 // right hand side vector

        // ====================================================================
        // ITERATIVE SOLVING INFO
        // ====================================================================

        int nIterations;                // number of iterations
        int exitStatus;                 // PIM exit status
        std::vector<double> itTimes;    // iteration times for benchmarkMode
        deci rhsNorm;                   // norm of glove rhs vector

        // ===================================================================
        // SCENE MANAGEMENT
        // ===================================================================

        /**
         * Load an input geometry file (.igf) from disc
         * @param filename Filename to the .igf file
         */
        void loadScene(const char *filename);

        /**
         * Print scene information to the screen
         */
        void printScene() const;

        // ===================================================================
        // SETUP
        // ===================================================================

        /**
         * Calculate and setup the FMM structures
         */
        void setup();

        // ===================================================================
        // ITERATIVE SOLVING
        // ===================================================================

        /**
         * Apply left block-jacobi preconditioner
         * @param U Source vector
         * @param V Destination vector
         */
        void blockJacobiPreconl(cplx *U, cplx *V);
        void blockJacobiPreconlFwd(cplx *U, cplx *V);

        /**
         * Iterative solution of Z.X = B
         */
        void solve();

        /**
         * Accessor the for the right hand side norm
         * @return Right hand side norm
         */
        deci getRhsNorm() { return rhsNorm; }

        // ====================================================================
        // OUTPUT
        // ====================================================================

        /**
         * Calculate the output
         */
        void calculateOutput();

        /**
         * Saves the excitation vector B to hard disc
         * @param filename Name of the output file
         */
        void writeExcitationVector(const std::string &filename);

        /**
         * Saves the solution vector X to hard disc
         * @param filename Name of the output file
         */
        void writeSolutionVector(const std::string &filename);

        /**
         * Save the system matrix Z to hard disc
         * @param filename Name of the output file
         */
        void writeSystemMatrix(const std::string& filename);

public:
        /**
         * Overloaded constructor
         * @param argc Pointer to the argument count
         * @param argv[] Pointer to the argument list
         */
        Nero2d(int *argc, char **argv[]);

        /**
         * Destructor
         */
        ~Nero2d();

        /**
         * Calculates the mesh in 2 passes: first pass calculates the points
         * using an online algorithm; the second pass stores the local mesh.
         * Special care has to be taken of extra segments, these are segments
         * which are not local but have to be stored anyway for rooftop use.
         */
        void createLocalMesh();

        // ===================================================================
        // INFORMATION DISPLAY
        // ===================================================================

        /**
         * Display certain information prior to iterative solving
         */
        void displayPreSolveInfo();

        /**
         * Display certain information after iterative solving
         */
        void displayPostSolveInfo();

        /**
         * Display detailed information about the memory used and communication
         */
        void displayStatistics();

        /**
         * Display a fancy message centered between a lot of equal signs
         * @param msg Message to display
         */
        void markSection(std::string msg);

        // ====================================================================
        // MONITORING FUNCTIONS
        // ====================================================================

        /**
         * This function is called before the calculation of the preconditioners
         */
        void prePreconditionerCalculation();

        /**
         * Monitor progression of the preconditioner calculation
         * @param currentBox Current box which is processed
         * @param numBoxes Number of boxes to be processed
         */
        void progressPreconditionerCalculation(int currentBox, int numBoxes);

        /**
         * This function is called after the calculation of the preconditioners
         */
        void postPreconditionerCalculation();

        /**
         * This function is called before the calculation of the excitations
         */
        void preExcitationCalculation();

        /**
         * This function is called before the calculation of the initial guess
         */
        void preInitialGuessCalculation();

        /**
         * This function is called after the calculation of the initial guess
         */
        void postInitialGuessCalculation();

        /**
         * Monitor progression of the excitation vector calculation
         * @param currentBox Current box which is processed
         * @param numBoxes Number of boxes to be processed
         */
        void progressExcitationCalculation(int currentBox, int numBoxes);

        /**
         * This function is called after the calculation of the excitations
         */
        void postExcitationCalculation();

        /**
         * Monitor progression of the near interaction preparation
         * @param currentBox Current box which is processed
         * @param numBoxes Number of boxes to be processed
         */
        void progressPrepareNearInteraction(int currentBox, int numBoxes);

        /**
         * This function is called before the calculation of near interactions
         */
        void preNearInteractionCalculation();

        /**
         * Monitor progression of the near interaction calculation
         * @param currentNear Current near interaction which is calculated
         * @param numNear Number of near interactions to be calculated
         */
        void progressCalculateNearInteraction(int currentNear, int numNear);

        /**
         * This function is called after the calculation of near interactions
         */
        void postNearInteractionCalculation();

        /**
         * Monitor progression of the far interaction preparation
         * @param currentBox Current box which is processed
         * @param numBoxes Number of boxes to be processed
         * @param groupID Identifier for the interaction group processed
         * @param level Level of the interaction group processed
         */
        void progressPrepareFarInteraction(int currentBox, int numBoxes,
                                           int groupID, int level);

        /**
         * This function is called before the calculation of far interactions
         */
        void preFarInteractionCalculation();

        /**
         * Monitor progression of the level zero (dis)aggregation calculation
         * @param currentBox Current box which is calculated
         * @param numBoxes Number of boxes to be calculated
         * @param groupID Identifier for the interaction group
         */
        void progressCalculateLevelZeroAggregations(int currentBox,
                        int numBoxes, int groupID);

        /**
         * Monitor progression of the translation operator calculation
         * @param currentTl Current translation operator which is calculated
         * @param numTl Number of translation operators to be calculated
         */
        void progressCalculateTranslOperator(int currentTl, int numTl);

        /**
         * This function is called after the calculation of far interactions
         */
        void postFarInteractionCalculation();

        /**
         * This function is called before the calculation of communciations
         */
        void preCommunicationCalculation();

        /**
         * This function is called after the calculation of communciations
         */
        void postCommunicationCalculation();

        /**
         * Print progress information
         * @param nIt Number of iterations so far
         * @param resNorm Residual norm
         * @param relResNorm Relative residual norm
         * @param kappa Kappa parameter (TFQMR only)
         */
        void progressIterativeSolving(int nIt, deci resNorm,
                                      deci relResNorm, deci kappa);

        /**
         * Monitor progression of the translation operator calculation
         * @param currentOut Current output which is calculated
         * @param numOut Number of outputs to be calculated
         */
        void progressOutputCalculation(int currentOut, int numOut);

        /**
         * Convert a size in bytes to a human readable string
         * @param size A size in bytes
         * @return A string to convert to
         */
        static std::string humRead(double size);

        friend int main(int, char **);
        friend void matvec(cplx*, cplx*, int*);
        friend void preconl(cplx *U, cplx *V, int *IPAR);
        friend void progressIterativeSolving(int *locLen, int *nIt, deci *norm,
                                             cplx *X, cplx *res, cplx *trueRes);
        friend void tfqmrProgressIterativeSolving(int *nIt, deci *kappa,
                                                  deci *resNorm);
};

#endif
