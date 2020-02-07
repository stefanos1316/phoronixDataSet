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

#include "nero2d.h"
#include "cnfgfile.h"
#include "geometry.h"
#include "handlman.h"
#include "levelhandler2d.h"

#include <fstream>
#include <iostream>
#include <cstdlib>

#include <set>

using namespace std;

// ============================================================================
// PRECONDITIONER CALCULATION MONITORING
// ============================================================================

void Nero2d::prePreconditionerCalculation()
{
           Util::startChrono();
}

void Nero2d::progressPreconditionerCalculation(int currentBox, int numBoxes)
{
        cout << "Calculating preconditioners (" << currentBox << "/"
                        << numBoxes << ")\r";
        if (currentBox == numBoxes) cout << endl;
}

void Nero2d::postPreconditionerCalculation()
{
        double time = Util::stopChrono();
        cout.precision(3);
        cout << "Preconditioner calculation time: " << time << "s" << endl;
        cout.precision(10);
}

// ============================================================================
// EXCITATION CALCULATION MONITORING
// ============================================================================

void Nero2d::preExcitationCalculation()
{
        Util::startChrono();
}

void Nero2d::progressExcitationCalculation(int currentBox, int numBoxes)
{
        cout << "Calculating excitations (" << currentBox << "/"
                        << numBoxes << ")\r";
        if (currentBox == numBoxes) cout << endl;
}

void Nero2d::postExcitationCalculation()
{
        double time = Util::stopChrono();
        cout.precision(3);
        cout << "Excitation calculation time: " << time << "s" << endl;
        cout.precision(10);
}

// ============================================================================
// INITIAL GUESS CALCULATION MONITORING
// ============================================================================

void Nero2d::preInitialGuessCalculation()
{
        Util::startChrono();
}

void Nero2d::postInitialGuessCalculation()
{
        double time = Util::stopChrono();
        cout.precision(3);
        cout << "Initial guess calculation time: " << time << "s" << endl;
        cout.precision(10);
}

// ============================================================================
// NEAR INTERACTION CALCULATION MONITORING
// ============================================================================

void Nero2d::progressPrepareNearInteraction(int currentBox, int numBoxes)
{
        cout << "Preparing near interactions (" << currentBox << "/"
                        << numBoxes << ")\r";
        if (currentBox == numBoxes) cout << endl;
}

void Nero2d::preNearInteractionCalculation()
{
        Util::startChrono();
}

void Nero2d::progressCalculateNearInteraction(int currentNear, int numNear)
{

}

void Nero2d::postNearInteractionCalculation()
{

}

// ============================================================================
// FAR INTERACTION CALCULATION MONITORING
// ============================================================================

void Nero2d::preFarInteractionCalculation()
{
        Util::startChrono();
}

void Nero2d::progressPrepareFarInteraction(int currentBox, int numBoxes,
                                           int groupID, int level)
{
        cout << "Preparing far interactions (" << currentBox << "/"
                        << numBoxes << ") for level " << level
                        << " of tree " << groupID << "\r";
        if (currentBox == numBoxes) cout << endl;
}

void Nero2d::progressCalculateLevelZeroAggregations(int currentBox,
                int numBoxes, int groupID)
{
        cout << "Calculation level zero aggregations (" << currentBox << "/"
                        << numBoxes << ") of tree " << groupID << "\r";
        if (currentBox == numBoxes) cout << endl;
}

void Nero2d::progressCalculateTranslOperator(int currentTl, int numTl)
{
        cout << "Calculating translation operator (" << currentTl << "/"
                        << numTl << ")\r";
        if (currentTl == numTl) cout << endl;
}

void Nero2d::postFarInteractionCalculation()
{
        double time = Util::stopChrono();
        cout.precision(3);
        cout << "Far interaction calculation time: " << time << "s" << endl;
        cout.precision(10);
}

// ============================================================================
// ITERATIVE SOLVING MONITORING
// ============================================================================

void Nero2d::preCommunicationCalculation()
{
        cout << "Waiting for other processes to complete..." << endl;
}

void Nero2d::postCommunicationCalculation()
{
        cout << "Completed communications setup" << endl;
}

// ============================================================================
// ITERATIVE SOLVING MONITORING
// ============================================================================

void Nero2d::progressIterativeSolving(int nIt, deci resNorm,
                                      deci relResNorm, deci kappa)
{
        if (config->benchmarkMode) {
                double time = Util::stopChrono();
                itTimes.push_back(time);
                Util::startChrono();
        } else {
                cout << "Iteration: " << nIt <<  "      norm: "
                                << relResNorm << "      kappa: "
                                << kappa << "           \r";
                cout.flush();
        }
}

void Nero2d::displayPreSolveInfo()
{
        ostringstream oss;
        oss << "Solving with ";
        switch (config->itMethod) {
                case TFQMR:
                        oss << "TFQMR";
                        break;
                case BICGSTAB:
                        oss << "BICGSTAB";
                        break;
                case RGMRES:
                        oss << "RGMRES (r=" << config->restartParameter << ")";
                        break;
        }
        oss << ". Block-Jacobi level : " << config->blockJacobiLevel;
        cout << oss.str() << endl;
        Util::startChrono();
}

void Nero2d::displayPostSolveInfo()
{
        double time = Util::stopChrono();
        cout << "\n\n\tExit status: " << exitStatus << endl;
        cout << "\tNumber of iterations: " << nIterations << endl;
        cout.precision(3);
        cout << "\tIterative solving time: " << time << "s" << endl;
        cout.precision(10);
}

// ============================================================================
// OUTPUT CALCULATION MONITORING
// ============================================================================

string Nero2d::humRead(double size)
{
        ostringstream oss;
        oss.precision(4);

        if (size < 1023) {
                oss << (int)size << " bytes";
                return oss.str();
        }
        size = size / 1024;
        if (size < 1023) {
                oss << size << " KB";
                return oss.str();
        }
        size = size / 1024;
        if (size < 1023) {
                oss << size << " MB";
                return oss.str();
        }
        size = size / 1024;
        oss << size << " GB";
        return oss.str();
}

void Nero2d::progressOutputCalculation(int currentOut, int numOut)
{
        cout << "Calculating output pixel (" << currentOut << "/"
                        << numOut << ")\r";
        cout.flush();
        if (currentOut == numOut) cout << endl;
}

void Nero2d::markSection(std::string msg)
{
        int msgLength = msg.length();
        int numEq = 50;
        int numSpaces = (numEq - msgLength)/2;
        if (numSpaces < 0) numSpaces = 0;

        cout << endl;
        for (int i = 0; i < numEq; i++)
                cout << "=";
        cout << endl;
        for (int i = 0; i < numSpaces; i++)
                cout << " ";
        cout << msg << endl;
        for (int i = 0; i < numEq; i++)
                cout << "=";
        cout << endl;
}

void Nero2d::displayStatistics()
{
        int oldPrec = cout.precision();
        cout.precision(2);

        // number of unknowns info
        vector<int> nlUnknProc;
        nexus->getNumLocalUnknowns(nlUnknProc, TREE_BASIS);
        for (int i = 0; i < nexus->getNumProcesses(); i++) {
                double perc = (100.0*nlUnknProc[i])/geometry->getNumUnknowns();
                cout << "Number of local unknowns for process " << i << ": "
                     << nlUnknProc[i] << " (" << perc << "%)" << endl;
        }

        cout << "+ -----------------------" << endl;
        cout << "Total unknowns: " << geometry->getNumUnknowns()
             << endl << endl;

        // memory info

        // count the memory for  the iterative solving process
        unsigned int iterative = 0, rhsVector = 0, unknVector = 0, segMem = 0;
        switch (config->itMethod) {
                case TFQMR:
                        iterative = 12*nlUnknowns;
                        break;
                case BICGSTAB:
                        iterative = 10*nlUnknowns;
                        break;
                case RGMRES:
                        iterative = (4+config->restartParameter)*nlUnknowns;
                        break;
        }
        iterative *= sizeof(cplx);

        // memory for rhs and unknown vector
        rhsVector = nlUnknowns*sizeof(cplx);
        unknVector = nlUnknowns*sizeof(cplx);

        // memory for segment storage
        segMem = geometry->getNumLocalSeg()*sizeof(Segment);
        Memory mem = hm->getMemoryStats();

        cout << "Preconditioner: " << humRead(mem.prec) << endl;
        cout << "Near interactions: " << humRead(mem.nearInt) << endl;
        cout << "L0 aggregations: " << humRead(mem.aggMat) << endl;
        cout << "L0 disaggregations: " << humRead(mem.dagMat) << endl;
        cout << "Translation Ops: " << humRead(mem.translOp) << endl;
        cout << "Radiation patterns: "
                                << humRead(LevelHandler2d::radPatMem) << endl;
        cout << "Unknown vector: " << humRead(unknVector) << endl;
        cout << "Rhs vector: " << humRead(rhsVector) << endl;
        cout << "Iterative solving: " << humRead(iterative) << endl;
        cout << "Geometry: " << humRead(segMem) << endl;
        cout << "Interpolation: " << humRead(mem.intMem) << endl;
        cout << "Work vector: " << humRead(mem.workSize) << endl << endl;

        cout << "+ -----------------------" << endl;
        cout << "Total memory: " << humRead(hm->getTotalMem()+
                LevelHandler2d::radPatMem+unknVector+rhsVector+segMem)
             << endl << endl;

#ifdef HAVE_MPI
        // communication info
        int totalIn = 0, totalOut = 0; map<int, int> nRecvBytes, nSendBytes;
        nexus->getCommSize(nRecvBytes, nSendBytes);
        for (int i = 0; i < nexus->getNumProcesses(); i++) {
                totalIn += nRecvBytes[i];
                totalOut += nSendBytes[i];
                cout << "Traffic to process " << i << ": "
                     << humRead(nRecvBytes[i]) << " / "
                     << humRead(nSendBytes[i]) << endl;
        }
        cout << "+ -----------------------" << endl;
        cout << "Total receive/send: " << humRead(totalIn)
             << " /  " << humRead(totalOut) << endl;
#endif

        cout.precision(oldPrec);
}

// ===========================================================================
// PROGRAM ENTRY
// ===========================================================================

int main(int argc, char *argv[])
{
        Nexus::initMPI(&argc, &argv);
        Nero2d nero(&argc, &argv);

        int thisProc = nero.thisProc;
        int nProc = nero.nProc;

        //ofstream outputfile;

        // redirect cout object
        if (nero.config->benchmarkMode) {
                nero.itTimes.reserve(2*nero.config->maxIterations+1);
                cout << "\t *** BENCHMARK_MODE (silent) ***" << endl;
                cout.rdbuf(NULL);
        } else {
                if (thisProc != nero.config->outputProc) {
                        /*ostringstream oss;
                        oss << "output/screen" << thisProc << ".txt";
                        outputfile.open(oss.str().c_str());
                        cout.rdbuf(outputfile.rdbuf());*/
                        cout.rdbuf(NULL);
                }
        }

        cout << "Process " << thisProc+1 << "/" << nProc
             << " is alive on " << nero.nexus->getProcessName() << endl;

        cout << endl << "Welcome to Nero v2.0" << endl;
        cout << "Fun will now commence" << endl;

        nero.markSection("SCENE INFO");
        nero.printScene();

        if (!nero.config->solutionFromDisc)     // calculate the solution
        {
                nero.markSection("ADDING GEOMETRY");
                nero.createLocalMesh();

                nero.markSection("STATISTICS");
                nero.displayStatistics();

                nero.markSection("BEGIN SETUP");
                nero.setup();

                nero.markSection("SOLVING ZX = B");
                nero.displayPreSolveInfo();
                nero.solve();
                nero.displayPostSolveInfo();

                nero.markSection("OUTPUT");

                if (nero.config->writeZMatrix) {
                        cout << "Writing system matrix ..." << endl;
                        nero.writeSystemMatrix("matrix.dat");
                }
                if (nero.config->writeBVector) {
                        cout << "Writing excitation vector ..." << endl;
                        nero.writeExcitationVector("excitation.dat");
                }
                if (nero.config->writeXVector) {
                        cout << "Writing solution vector ..." << endl;
                        nero.writeSolutionVector("solution.dat");
                }

                nero.hm->deleteNearIntHandlers();
                nero.hm->deleteTranslHandlers();
        }

        delete nero.nexus;
        nero.nexus = NULL;

        nero.calculateOutput();

        // write the log to disc
        if (nero.config->benchmarkMode) {
                if (thisProc == 0) {
                        ofstream ofs;
                        ofs.open("benchmark.dat");

                        for (int i = 0; i < nero.itTimes.size(); i++)
                                ofs << i << "\t" << nero.itTimes[i] << endl;
                        ofs.close();
                }
        } else {
                /*if (thisProc != nero.outputProc)
                        outputfile.close();*/
        }

        fftw_forget_wisdom();

        cout << endl << "Exiting... bye!" << endl << endl;
        return EXIT_SUCCESS;
}
