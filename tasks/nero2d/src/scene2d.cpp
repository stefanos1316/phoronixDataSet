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
#include "mathlib.h"
#include "nearinthandler2d.h"
#include "agghandler2d.h"
#include "inthandler2d.h"
#include "levelhandler2d.h"
#include "output.h"
#include "object.h"
#include "medium.h"
#include "geometry.h"
#include "excitation.h"
#include "cnfgfile.h"
#include "handlman.h"
#include "splaytree.h"
#include "scene2d.h"
#include "helm2d.h"

#include <cstdlib>
#include <fstream>
#include <ios>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

// ============================================================================
// SRCACHEEL CLASS
// ============================================================================

bool SRCacheEl::operator==(const SRCacheEl &rhs) const
{
        if (!dZero(real(gamma)-real(rhs.gamma))) return false;
        if (!dZero(imag(gamma)-imag(rhs.gamma))) return false;
        if (!dZero(boxSize-rhs.boxSize)) return false;
        if (!dZero(xDist-rhs.xDist)) return false;

        return true;
}

bool SRCacheEl::operator<(const SRCacheEl &rhs) const
{
        if (!dZero(real(gamma)-real(rhs.gamma)))
                return (real(gamma)-real(rhs.gamma) < 0);
        if (!dZero(imag(gamma)-imag(rhs.gamma)))
                return (imag(gamma)-imag(rhs.gamma) < 0);
        if (!dZero(boxSize-rhs.boxSize)) return (boxSize-rhs.boxSize < 0);
        if (!dZero(xDist-rhs.xDist)) return (xDist-rhs.xDist < 0);

        return false;   // they equal
}

bool SRCacheEl::operator>(const SRCacheEl &rhs) const
{
        if (!dZero(real(gamma)-real(rhs.gamma)))
                return (real(gamma)-real(rhs.gamma) > 0);
        if (!dZero(imag(gamma)-imag(rhs.gamma)))
                return (imag(gamma)-imag(rhs.gamma) > 0);
        if (!dZero(boxSize-rhs.boxSize)) return (boxSize-rhs.boxSize > 0);
        if (!dZero(xDist-rhs.xDist)) return (xDist-rhs.xDist > 0);

        return false;   // they equal
}

// ============================================================================
// NERO2D CLASS
// ============================================================================

Nero2d::Nero2d(int *argc, char **argv[]) : nProc(1), thisProc(0), config(NULL),
        geometry(NULL), excitation(NULL), output(NULL), nexus(NULL), hm(NULL),
        nlUnknowns(0), nRadPatComp(1), itWork(NULL), nIterations(0),
        exitStatus(0), rhsNorm(0.0)
{
        if (*argc == 1) {
                cerr << "\tError: please specify input file as argument.\n";
                exit(EXIT_FAILURE);
        }

        // load the config.dat and do some sanity checks
        config = new ConfigFile("config.dat", argc, argv);

        // load the scene.igf file
        const char *geoFilename = (*argv)[1];
        loadScene(geoFilename);

        // allocate memory for the master nexus object
        nexus = new Nexus();

        // allocate memory for the handler manager
        hm = new HandlerManager();

        nProc = nexus->getNumProcesses();
        thisProc = nexus->getProcessID();

        // make sure outputProc <= numProc
        if (config->outputProc >= nProc)
                config->outputProc = 0;
}

Nero2d::~Nero2d()
{
        delete config;
        delete geometry;
        delete excitation;
        delete output;
        delete hm;
        delete [] itWork;

        delete nexus;
        Nexus::destroyMPI();
}

void Nero2d::loadScene(const char *filename)
{
        const int wxGBT_version = 4;

        // free memory of possible previously loaded scene2d
        delete geometry;
        delete excitation;
        delete output;

        char c; double d1, d2, d3, d4;  // temps
        int versionNumber;
        ifstream ifs(filename);
        if(!ifs) {
                cerr << "Cannot open input file: " << filename << endl;
                exit(EXIT_FAILURE);
        }

        ifs >> versionNumber;
        if (versionNumber != wxGBT_version) {
                cerr << "ERROR: The input file:" << "\n\t" << filename << endl
                     << "was generated by an incompitable version of wxGBTool."
                        "\n(version " << versionNumber << ", need version "
                     << wxGBT_version << ")" << endl << endl;
                cerr << "Open and save the .gbt file with the version of "
                     << "wxGBTool that\ncorresponds to the version of Nero2d "
                        "and try again." << endl;
                exit(EXIT_FAILURE);
        }

        // read the geometry
        geometry = new Geometry(config);
        geometry->loadGeometry(ifs);

        // read the excitations
        excitation = new Excitation(geometry, config->qOrder);
        excitation->loadExcitation(ifs);

        // read the outputs
        output = new OutputHandler();
        output->loadOutput(ifs);

        // two radiation patterns (Ex and Hx) for TE/TM simulations
        // otherwise, use only one radation pattern component
        nRadPatComp = (geometry->haveTM() && geometry->haveTE()) ? 2 : 1;

        ifs.close();
}

void Nero2d::printScene() const
{
        cout << *geometry;
        cout << *excitation;
        cout << *output;
}

void Nero2d::createLocalMesh()
{
        // calculate the global bounding box
        Point geoLL(0.0, 0.0), geoUR(0.0, 0.0), outLL(0.0, 0.0),
              outUR(0.0, 0.0), globLL(0.0, 0.0), globUR(0.0, 0.0);
        geometry->getBoundingBox(geoLL, geoUR);
        output->getBoundingBox(outLL, outUR);

        globLL = Point(min(outLL.getX(), geoLL.getX()),
                       min(outLL.getY(), geoLL.getY()));
        globUR = Point(max(outUR.getX(), geoUR.getX()),
                       max(outUR.getY(), geoUR.getY()));

        // create a new fmm tree
        Medium *bgMedium = geometry->getBackgroundMedium();
        double minBoxSize = config->minBoxSizeRel*bgMedium->lambda;
        int nLevels = nexus->prepareAddingUnknowns(globLL, globUR,
                                                   minBoxSize, TREE_EQUAL);

        // set the block Jacobi level
        nexus->setBlockJacobiLevel(config->blockJacobiLevel);

        // create interaction groups for each medium
        geometry->addGeometry(*nexus, globLL, globUR);

        // tell nexus all geometry has been added
        nexus->finalizeAddingUnknowns();

        // set the level handlers
        LevelHandler2d::nRadPatComp = geometry->getNumRadPatComp();
        LevelIterator it = nexus->getLevelBegin();

        SplayTree<SRCacheEl> *st = new SplayTree<SRCacheEl>(1000, 0);
        for ( ; it != nexus->getLevelEnd(); it++) {
                cout << "Setting level handlers for group ID "
                     << it->groupID << "\r";
                Medium *medium = geometry->getMedium(it->groupID);
                cplx gamma = medium->gamma;
                double wavelength = medium->lambda;
                double ebs = Helm2d::getEnlargedBoxSize(it->boxSize, 
                        wavelength, config);
                double actXDist = Helm2d::getXDist(it->boxSize,
                        geometry->getFrequency(), config);
                bool HF; double chi; int N, Na;

                SRCacheEl cache(gamma, ebs, actXDist);
                if (!st->find(cache)) {
                        // calculate the sampling rates
                        Helm2d::getRadPatSamplingRate(gamma, ebs, actXDist, N,
                                HF, chi, config->fmmPrecision);

                        if (HF)
                                Na = Helm2d::getAggMatSamplingRate(gamma, ebs,
                                        N, config->fmmPrecision);
                        else
                                Na = N;

                        cache.setData(N, Na, HF, chi);
                        st->insert(cache);
                } else {
                        N = cache.getN();
                        Na = cache.getNa();
                        HF = cache.isHF();
                        chi = cache.getChi();
                }

                // make the sampling rate even for the lowest level
                if ((it->level == 0) && (config->aggMethod == COMPRESSED))
                        Na = ((Na % 2) == 0) ? Na : Na + 1;

                // reason: correct radar cross section calculation
                if (it->level == nLevels-1) {
                        HF = true;
                        chi = 0.0;
                }

                LevelHandler2d *lvlHndl = 
                        new LevelHandler2d(N, Na, gamma, HF, chi, config);

                medium->lvlHndl.push_back(lvlHndl);
                it->setHandler((LevelHandler*)lvlHndl);
        }

        delete st;
        cout << "Done setting the level handlers              " << endl;

        // set the xDist for each level
        for (int lvl = 0; lvl < nLevels; lvl++) {
                double boxSize = minBoxSize*(1 << lvl);
                double actXDist = Helm2d::getXDist(boxSize,
                        geometry->getFrequency(), config);
                if (lvl <= config->maxFmmLevel)
                        nexus->setFmmLimits(lvl, actXDist, -1);
                else
                        nexus->setFmmLimits(lvl, 1e300, -1);
        }

        // do the load balancing and create the near and far interaction lists
        Util::startChrono();
        cout << "Setting up Nexus data structures..."; cout.flush();
        nlUnknowns = nexus->doLoadBalancing();
        cout << "done" << endl;
        cout << Util::stopChrono() << endl;

        // display the level handler information
        int precision = cout.precision(3);
        { LevelIterator it = nexus->getLevelBegin();
        int prevGroupID = -1;
        for ( ; it != nexus->getLevelEnd(); it++) {
                Medium *medium = geometry->getMedium(it->groupID);
                LevelHandler2d *lvlHndl = medium->lvlHndl[it->level];
                bool HF = lvlHndl->getHF();
                int N = lvlHndl->getFullRadPatN();
                int Na = lvlHndl->getNyqSamplingRate();
                int numPart = lvlHndl->getNumPartitions();
                int maxPart = lvlHndl->getMaxNumPartitions();
                double actXDist = Helm2d::getXDist(it->boxSize,
                        geometry->getFrequency(), config);
                int nBP = BlifInterpolator::getNumIntpolPoint(Na, N,
                                config->fmmPrecision);

                if (it->groupID != prevGroupID) {
                        cout << "Level info for groupID "
                             << it->groupID << endl;
                        prevGroupID = it->groupID;
                }

                string intStr = (it->level == 0) ? "n/a" :
                        ((lvlHndl->getIntMethod() == FFT) ? "FFT" : "BLIF");

                cout << "\t" << it->level << ": HF: " << HF << ", N = " << Na
                     << "/" << N << " (" << (double)Na/N << ")" << ", #BP: "
                     << nBP << ", #part: " << numPart << "/" << maxPart
                     << ", xDist: " << actXDist << " (" << intStr << ")"
                     << endl;
        } }
        cout.precision(precision);

        cout << "Storing the local geometry..."; cout.flush();
        geometry->saveLocalGeometry(*nexus);
        nexus->deleteTree();
        cout << "done" << endl;

        cout << "Number of unknowns: " << nlUnknowns << "/"
             << geometry->getNumUnknowns() << " ("
             << geometry->getNumStoredUnknowns() << " stored)" << endl;

        cout << "Gathering statistics..."; cout.flush();
        hm->gatherStatistics(nexus, geometry, config);
        cout << "done" << endl;
}

void Nero2d::calculateOutput()
{
        output->calculateOutput(geometry, X, config, excitation, hm);
}
