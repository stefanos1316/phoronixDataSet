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

#include "base.h"
#include "cnfgfile.h"
#include <cstring>
#include <fstream>

using namespace std;

// ============================================================================
// AUXILIARY ROUTINE
// ============================================================================

static string searchString(ifstream& ifs, const string& target)
{
        // reset input file stream
        ifs.clear();
        ifs.seekg(0);

        string line;
        // search line by line
        while(getline(ifs, line)) {
                int index = line.find(target);
                if (index != string::npos) {
                        index += target.length();
                        return line.substr(index);
                }
        }

        return string("");
}

// ============================================================================
// CONFIGURATION FILE
// ============================================================================

ConfigFile::ConfigFile(const char* inputFile, int *argc_, char **argv_[]) :
        argc(argc_), argv(argv_), outputProc(0), qOrder(10), segLengthRel(0.1),
        overshoot(0.5), minBoxSizeRel(0.5), xDist(3.01), fmmPrecision(1e-5),
        maxFmmLevel(-1), aggMethod(FULL), solutionFromDisc(false),
        intMethod(FFT), minBlifLocality(8.0), itMethod(TFQMR),
        itPrecision(1e-4), maxIterations(10000), trueNormParameter(1),
        restartParameter(10), blockJacobiLevel(0), sfc(HILBERT_SFC),
        packageSize(10000000), benchmarkMode(false), maxOutputSize(40000),
        writeZMatrix(false), writeXVector(false), writeBVector(false)
{
        // load the parameters from file
        loadParameters(inputFile);
        // possible override from command line
        processCommandLine(*argc, *argv);

        // sanity checks on parameters
        assert(itPrecision > 0);
        assert(maxIterations > 0);
        assert(restartParameter > 0);
}

void ConfigFile::loadParameters(const char *inputFilename)
{
        ifstream ifs(inputFilename);
        if(!ifs) {
                cout << "WARNING: Cannot open input file: " << inputFilename
                     << ",\nWill use default values." << endl;
                return;
        }

        string line; // temporary variable

        line = searchString(ifs, "OUTPUT_PROCESS");
        istringstream(line) >> outputProc;

        line = searchString(ifs, "QORDER");
        istringstream(line) >> qOrder;
        line = searchString(ifs, "SEGMENT_LENGTH");
        istringstream(line) >> segLengthRel;
        line = searchString(ifs, "OVERSHOOT");
        istringstream(line) >> overshoot;

        line = searchString(ifs, "MINIMAL_BOX_SIZE");
        istringstream(line) >> minBoxSizeRel;
        line = searchString(ifs, "X_DIST");
        istringstream(line) >> xDist;
        line = searchString(ifs, "FMM_PRECISION");
        istringstream(line) >> fmmPrecision;
        line = searchString(ifs, "MAX_FMM_LEVEL");
        istringstream(line) >> maxFmmLevel;

        line = searchString(ifs, "AGGREGATION_MATRICES");
        if (line.find("FULL") != string::npos) aggMethod = FULL;
        if (line.find("COMPACT") != string::npos) aggMethod = COMPACT;
        if (line.find("COMPRESSED") != string::npos) aggMethod = COMPRESSED;

        line = searchString(ifs, "INTERPOLATION_METHOD");
        if (line.find("FFT") != string::npos) intMethod = FFT;
        if (line.find("BLIF") != string::npos) intMethod = BLIF;
        if (line.find("MIXED") != string::npos) intMethod = MIXED;
        line = searchString(ifs, "MINIMAL_BLIF_LOCALITY");
        istringstream(line) >> minBlifLocality;

        line = searchString(ifs, "SOLUTION_FROM_DISC");
        istringstream(line) >> solutionFromDisc;
        line = searchString(ifs, "ITERATIVE_METHOD");
        if (line.find("TFQMR") != string::npos) itMethod = TFQMR;
        if (line.find("BICGSTAB") != string::npos) itMethod = BICGSTAB;
        if (line.find("RGMRES") != string::npos) itMethod = RGMRES;
        line = searchString(ifs, "ITERATIVE_PRECISION");
        istringstream(line) >> itPrecision;
        line = searchString(ifs, "MAX_ITERATIONS");
        istringstream(line) >> maxIterations;
        line = searchString(ifs, "RESTARTPARAMETER");
        istringstream(line) >> restartParameter;
        line = searchString(ifs, "TRUENORMPARAMETER");
        istringstream(line) >> trueNormParameter;
        line = searchString(ifs, "BLOCKJACOBI_LEVEL");
        istringstream(line) >> blockJacobiLevel;

        line = searchString(ifs, "SPACE_FILLING_CURVE");
        if (line.find("HILBERT") != string::npos) sfc = HILBERT_SFC;
        if (line.find("MORTON") != string::npos) sfc = MORTON_SFC;
        line = searchString(ifs, "PACKAGE_SIZE");
        istringstream(line) >> packageSize;
        line = searchString(ifs, "BENCHMARK_MODE");
        istringstream(line) >> benchmarkMode;

        line = searchString(ifs, "MAX_OUTPUT_SIZE");
        istringstream(line) >> maxOutputSize;
        line = searchString(ifs, "WRITE_Z_MATRIX");
        istringstream(line) >> writeZMatrix;
        line = searchString(ifs, "WRITE_B_VECTOR");
        istringstream(line) >> writeBVector;
        line = searchString(ifs, "WRITE_X_VECTOR");
        istringstream(line) >> writeXVector;

        ifs.close();
}

void ConfigFile::processCommandLine(int argc, char *argv[])
{
        findKeyword(argc, argv, "OUTPUT_PROCESS", outputProc);
        findKeyword(argc, argv, "QORDER", qOrder);
        findKeyword(argc, argv, "SEGMENT_LENGTH", segLengthRel);
        findKeyword(argc, argv, "OVERSHOOT", overshoot);
        findKeyword(argc, argv, "MINIMAL_BOX_SIZE", minBoxSizeRel);
        findKeyword(argc, argv, "X_DIST", xDist);
        findKeyword(argc, argv, "FMM_PRECISION", fmmPrecision);
        findKeyword(argc, argv, "MAX_FMM_LEVEL", maxFmmLevel);
        findKeyword(argc, argv, "AGGREGATION_MATRICES", aggMethod);
        findKeyword(argc, argv, "INTERPOLATION_METHOD", intMethod);
        findKeyword(argc, argv, "MINIMAL_BLIF_LOCALITY", minBlifLocality);
        findKeyword(argc, argv, "SOLUTION_FROM_DISC", solutionFromDisc);
        findKeyword(argc, argv, "ITERATIVE_METHOD", itMethod);
        findKeyword(argc, argv, "ITERATIVE_PRECISION", itPrecision);
        findKeyword(argc, argv, "MAX_ITERATIONS", maxIterations);
        findKeyword(argc, argv, "RESTARTPARAMETER", restartParameter);
        findKeyword(argc, argv, "TRUENORMPARAMETER", trueNormParameter);
        findKeyword(argc, argv, "BLOCKJACOBI_LEVEL", blockJacobiLevel);
        findKeyword(argc, argv, "SPACE_FILLING_CURVE", sfc);
        findKeyword(argc, argv, "PACKAGE_SIZE", packageSize);
        findKeyword(argc, argv, "BENCHMARK_MODE", benchmarkMode);
        findKeyword(argc, argv, "MAX_OUTPUT_SIZE", maxOutputSize);
        findKeyword(argc, argv, "WRITE_Z_MATRIX", writeZMatrix);
        findKeyword(argc, argv, "WRITE_B_VECTOR", writeBVector);
        findKeyword(argc, argv, "WRITE_X_VECTOR", writeXVector);
}

void ConfigFile::findKeyword(int argc, char *argv[],
                         const string &keyword, int &result)
{
        for (int i = 0; i < argc-1; i++)
                if (string(argv[i]).find(string(keyword)) != string::npos) {
                        string s(argv[i+1]);
                        istringstream(s) >> result;
                }
}

void ConfigFile::findKeyword(int argc, char *argv[],
                         const string &keyword, bool &result)
{
        for (int i = 0; i < argc-1; i++)
                if (string(argv[i]).find(string(keyword)) != string::npos) {
                        string s(argv[i+1]);
                        istringstream(s) >> result;
                }
}

void ConfigFile::findKeyword(int argc, char *argv[],
                         const string &keyword, double &result)
{
        for (int i = 0; i < argc-1; i++)
                if (string(argv[i]).find(string(keyword)) != string::npos) {
                        string s(argv[i+1]);
                        istringstream(s) >> result;
                }
}

void ConfigFile::findKeyword(int argc, char *argv[],
                         const string &keyword, ItMethod &result)
{
        for (int i = 0; i < argc-1; i++)
                if (string(argv[i]).find(string(keyword)) != string::npos) {
                        string s(argv[i+1]);
                        if (s.find("TFQMR") != string::npos)
                                result = TFQMR;
                        if (s.find("BICGSTAB") != string::npos)
                                result = BICGSTAB;
                        if (s.find("RGMRES") != string::npos)
                                result = RGMRES;
                }
}

void ConfigFile::findKeyword(int argc, char *argv[],
                             const string &keyword, SpaceFill &result)
{
        for (int i = 0; i < argc-1; i++)
                if (string(argv[i]).find(string(keyword)) != string::npos) {
                        string s(argv[i+1]);
                        if (s.find("HILBERT") != string::npos)
                                result = HILBERT_SFC;
                        if (s.find("MORTON") != string::npos)
                                result = MORTON_SFC;
                }
}

void ConfigFile::findKeyword(int argc, char *argv[],
                         const string &keyword, AggMethod &result)
{
        for (int i = 0; i < argc-1; i++)
                if (string(argv[i]).find(string(keyword)) != string::npos) {
                        string s(argv[i+1]);
                        if (s.find("FULL") != string::npos)
                                result = FULL;
                        if (s.find("COMPACT") != string::npos)
                                result = COMPACT;
                        if (s.find("COMPRESSED") != string::npos)
                                result = COMPRESSED;
                }
}

void ConfigFile::findKeyword(int argc, char *argv[],
                             const string &keyword, IntMethod &result)
{
        for (int i = 0; i < argc-1; i++)
                if (string(argv[i]).find(string(keyword)) != string::npos) {
                        string s(argv[i+1]);
                        if (s.find("FFT") != string::npos)
                                result = FFT;
                        if (s.find("BLIF") != string::npos)
                                result = BLIF;
                        if (s.find("MIXED") != string::npos)
                                result = MIXED;
                }
}
