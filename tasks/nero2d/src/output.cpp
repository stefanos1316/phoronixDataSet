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

#ifdef HAVE_CONFIG_H
        #include <config.h>
#endif

#include "output.h"
#include "nero2d.h"
#include "agghandler2d.h"
#include "levelhandler2d.h"
#include "nearinthandler2d.h"
#include "inthandler2d.h"
#include "object.h"
#include "geometry.h"
#include "grafix/grafix.h"
#include "medium.h"
#include "cnfgfile.h"
#include "excitation.h"
#include "handlman.h"
#include "scene2d.h"
#include "splaytree.h"
#include "helm2d.h"

#include <cstdlib>
#include <fstream>
#include <iostream>
#include <cstring>

using namespace std;

// ========================================================================
// SOLUTION VECTOR OUTPUT
// ========================================================================

void Nero2d::writeExcitationVector(const std::string &filename)
{
        int nProc = nexus->getNumProcesses();
        int thisProc = nexus->getProcessID();

        if (geometry->getNumUnknowns() > config->maxOutputSize) {
                cout << "\nWARNING: I refuse to write vectors bigger than "
                     << config->maxOutputSize << " (sue me...)\n" << endl;
                return;
        }

        // obtain the local number of unknowns from all processes
        Vector<int> nlUnknProc(nProc);
        nlUnknProc[thisProc] = nlUnknowns;
#ifdef HAVE_MPI
        MPI_Allgather (&nlUnknowns, 1, MPI_INT, nlUnknProc.data, 1,
                       MPI_INT, MPI_COMM_WORLD);
#endif

        // find the largest number of local unknowns
        int maxSize = 0;
        for (int i = 0; i < nProc; i++)
                if (nlUnknProc[i] > maxSize)
                        maxSize = nlUnknProc[i];

        Vector<cplx> recv(maxSize);

        if (thisProc == 0) {
                // save vector to disc
                ofstream ofs;
                ofs.open(filename.c_str());

                // write own part to disc
                if (ofs) ofs << B;

#ifdef HAVE_MPI
                MPI_Status stat;
                for (int i = 1; i < nProc; i++) {
                        // receive the buffer for each process
                        MPI_Recv(recv.data, nlUnknProc[i],
                                 MPI_CPLX, i, i, MPI_COMM_WORLD, &stat);
                        // write buffer to disc
                        recv.sz = nlUnknProc[i];
                        if (ofs) ofs << recv;
                }
#endif
                if (ofs)
                        ofs.close();
                else
                        cerr << "Cannot open output file: " << filename << endl;
        } else {
#ifdef HAVE_MPI
                MPI_Send(B.data, nlUnknowns, MPI_CPLX, 0,
                         thisProc, MPI_COMM_WORLD);
#endif
        }

#ifdef HAVE_MPI
        // synchronize and get out
        MPI_Barrier(MPI_COMM_WORLD);
#endif
}

void Nero2d::writeSolutionVector(const std::string &filename)
{
        int nProc = nexus->getNumProcesses();
        int thisProc = nexus->getProcessID();

        if (geometry->getNumUnknowns() > config->maxOutputSize) {
                cout << "\nWARNING: I refuse to write vectors bigger than "
                     << config->maxOutputSize << " (sue me...)\n" << endl;
                return;
        }

        // obtain the local number of unknowns from all processes
        Vector<int> nlUnknProc(nProc);
        nlUnknProc[thisProc] = nlUnknowns;
#ifdef HAVE_MPI
        MPI_Allgather (&nlUnknowns, 1, MPI_INT, nlUnknProc.data, 1,
                       MPI_INT, MPI_COMM_WORLD);
#endif

        // find the largest number of local unknowns
        int maxSize = 0;
        for (int i = 0; i < nProc; i++)
                if (nlUnknProc[i] > maxSize)
                        maxSize = nlUnknProc[i];

        Vector<cplx> recv(maxSize);

        if (thisProc == 0) {
                // save vector to disc
                ofstream ofs;
                ofs.open(filename.c_str());

                // write own part to disc
                if (ofs) ofs << X;

#ifdef HAVE_MPI
                MPI_Status stat;
                for (int i = 1; i < nProc; i++) {
                        // receive the buffer for each process
                        MPI_Recv(recv.data, nlUnknProc[i],
                                 MPI_CPLX, i, i, MPI_COMM_WORLD, &stat);
                        // write buffer to disc
                        recv.sz = nlUnknProc[i];
                        if (ofs) ofs << recv;
                }
#endif
                if (ofs)
                        ofs.close();
                else
                        cerr << "Cannot open output file: " << filename << endl;
        } else {
#ifdef HAVE_MPI
                MPI_Send(X.data, nlUnknowns, MPI_CPLX, 0,
                         thisProc, MPI_COMM_WORLD);
#endif
        }

#ifdef HAVE_MPI
        // synchronize and get out
        MPI_Barrier(MPI_COMM_WORLD);
#endif
}

void Nero2d::writeSystemMatrix(const std::string& filename)
{
        int nProc = nexus->getNumProcesses();
        int thisProc = nexus->getProcessID();

        if (geometry->getNumUnknowns() > config->maxOutputSize) {
                cout << "\nWARNING: I refuse to write matrices bigger than "
                     << config->maxOutputSize << "x" << config->maxOutputSize
                     << " (sue me...)\n" << endl;
                return;
        }

        // obtain the local number of unknowns from all processes
        int *nlUnknProc = new int[nProc];
        nlUnknProc[thisProc] = nlUnknowns;
#ifdef HAVE_MPI
        MPI_Allgather (&nlUnknowns, 1, MPI_INT, nlUnknProc, 1,
                       MPI_INT, MPI_COMM_WORLD);
#endif

        // find the largest number of local unknowns
        int maxSize = 0;
        for (int i = 0; i < nProc; i++)
                if (nlUnknProc[i] > maxSize)
                        maxSize = nlUnknProc[i];

        Matrix<cplx> sysMat(maxSize, geometry->getNumUnknowns());
        cplx *in = new cplx[nlUnknowns];

        for(int j = 0, r = 0; j < nProc; j++) {
                for(int i = 0; i < nlUnknProc[j]; i++, r++) {
                        if (j == thisProc) in[i] = cplx(1, 0);
                        nexus->parallelMatrixVector(in, sysMat.data +
                                                    r*nlUnknowns);
                        //blockJacobiPreconl(sysMat.data + r*nlUnknowns,
                        //                   sysMat.data + r*nlUnknowns);
                        if (j == thisProc) in[i] = cplx(0, 0);
                }
        }

        delete [] in;

        if (thisProc == 0) {
                // save vector to disc
                ofstream ofs;
                ofs.open(filename.c_str());

                // write own part to disc
                sysMat.rows = nlUnknProc[thisProc];
                if (ofs) ofs << sysMat;

#ifdef HAVE_MPI
                MPI_Status stat;
                for (int i = 1; i < nProc; i++) {
                        // receive the buffer for each process
                        MPI_Recv(sysMat.data,
                                 nlUnknProc[i]*geometry->getNumUnknowns(),
                                 MPI_CPLX, i, i, MPI_COMM_WORLD, &stat);
                        // write buffer to disc
                        sysMat.rows = nlUnknProc[i];
                        if (ofs) ofs << sysMat << endl;
                }
#endif
                if (ofs)
                        ofs.close();
                else
                        cerr << "Cannot open output file: " << filename << endl;
        } else {
#ifdef HAVE_MPI
                MPI_Send(sysMat.data, nlUnknowns*geometry->getNumUnknowns(),
                         MPI_CPLX, 0, thisProc, MPI_COMM_WORLD);
#endif
        }

        // delete used memory, synchronize and get out
        delete [] nlUnknProc;
#ifdef HAVE_MPI
        MPI_Barrier(MPI_COMM_WORLD);
#endif
}

// ============================================================================
// OUTPUT CLASS
// ============================================================================

std::ostream& operator<<(std::ostream& os, const Output& O)
{
        O.addStreamOutput(os);
        return os;
}

// ============================================================================
// OUTPUT LINE CLASS
// ============================================================================

OutputLine::OutputLine() : nPoints(0), IT(0)
{

}

void OutputLine::load(std::ifstream &ifs)
{
        // temporary read variables
        double d1, d2, d3, d4;

        ifs >> d1 >> d2 >> d3 >> d4 >> nPoints;
        p1.setCoords(d1, d2);
        p2.setCoords(d3, d4);
}

void OutputLine::addStreamOutput(ostream& os) const
{
        os << "Line from (" << p1 << ") to (" << p2 << ") "
           << "in " << nPoints << " points" << endl;
}

void OutputLine::pointItInit(Geometry *geometry)
{
        IT = 0;
        geometryPtr = geometry;
}

void OutputLine::pointItGetNext(Point &p, int &groupID)
{
        double perc = ((double)IT)/((double)(nPoints-1));
        p = perc*p2 + (1.0-perc)*p1;
        Medium *medium = geometryPtr->getMediumAtPoint(p);
        groupID = (medium != NULL) ? medium->ID : -1;
        IT++;
}

string OutputLine::getBaseFilename()
{
        return string("line");
}

// ============================================================================
// OUTPUT BITMAP CLASS
// ============================================================================

OutputBitmap::OutputBitmap() : resX(0), resY(0), backmap(NULL), IT(0)
{

}

OutputBitmap::~OutputBitmap()
{
        delete backmap;
}

void OutputBitmap::load(std::ifstream &ifs)
{
        // temporary read variables
        double d1, d2, d3, d4;

        ifs >> d1 >> d2 >> d3 >> d4 >> resX;
        p1.setCoords(d1, d2);
        p2.setCoords(d3, d4);

        double dx = (p2-p1).getX(), dy = (p2-p1).getY();
        resX = ((resX >> 2) << 2);
        if (resX <= 0) resX = 4;
        resY = (int)abs(resX*dy/dx);
        if (resY <= 0) resY = 1;
}

void OutputBitmap::addStreamOutput(ostream& os) const
{
        os << "Bitmap LL(" << p1 << ") UR(" << p2 << ") resX: " << resX << endl;
}

void OutputBitmap::prepareBackmap(Geometry *geometry)
{
        delete backmap;

        backmap = new Grafix(resX, resY);
        backmap->setCanvasViewport(p1.getX(), p1.getY(), p2.getX(), p2.getY());

        Color bgColor(255, 255, 255);   // background color
        Color bdColor(255, 255, 254);   // border color
        Color nmColor(255, 255, 253);   // no medium color

        // fill the backmap with 'background color'
        backmap->setDrawingColor(bgColor);
        for (int i = 0; i < resX*resY; i++)
                backmap->putPixel(i % resX, i / resX);

        double xc, yc;

        // use the grafix library to draw the geometry in 'border color'
        backmap->setDrawingColor(bdColor);
        geometry->draw(backmap);

        // floodfill each area of the map
        for(int i = 0; i < resX*resY; i++) {
                int x = i % resX; int y = i / resX;
                if (backmap->getPixel(x, y) != bgColor) continue;

                double xc, yc;
                backmap->inverseViewportTF(x, y, xc, yc);
                Medium *medium = geometry->getMediumAtPoint(Point(xc, yc));
                if (medium == NULL)
                        backmap->setDrawingColor(nmColor);
                else {
                        int ID = medium->ID;
                        int r = (ID >> 16) % 256; int g = (ID >> 8) % 256;
                        int b = ID % 256;
                        backmap->setDrawingColor(Color(r, g, b));
                }
                backmap->seedFill(xc, yc);
        }

        // determine the medium of the borders
        for(int i = 0; i < resX*resY; i++) {
                int x = i % resX; int y = i / resX;
                if (backmap->getPixel(x, y) != bdColor) continue;

                double xc, yc;
                backmap->inverseViewportTF(x, y, xc, yc);
                Medium *medium = geometry->getMediumAtPoint(Point(xc, yc));
                if (medium == NULL)
                        backmap->setDrawingColor(nmColor);
                else {
                        int ID = medium->ID;
                        int r = (ID >> 16) % 256; int g = (ID >> 8) % 256;
                        int b = ID % 256;
                        backmap->setDrawingColor(Color(r, g, b));
                }
                backmap->putPixel(x, y);
        }
}

int OutputBitmap::getGroupID(int index) const
{
        Color nmColor(255, 255, 253);   // no medium color

        int x = index % resX;
        int y = index / resX;
        Color c = backmap->getPixel(x, y);
        int ID = (c.getRed() << 16) + (c.getGreen() << 8) + c.getBlue();
        if (c == nmColor) ID = -1;

        return ID;
}

void OutputBitmap::pointItInit(Geometry *geometry)
{
        if (backmap == NULL)
                prepareBackmap(geometry);
        IT = 0;
}

void OutputBitmap::pointItGetNext(Point &p, int &groupID)
{
        int x = IT % resX; int y = IT / resX; double xc, yc;
        backmap->inverseViewportTF(x, y, xc, yc);
        p.setCoords(xc, yc);
        groupID = getGroupID(IT++);
}

string OutputBitmap::getBaseFilename()
{
        return string("bitmap");
}

// ============================================================================
// OUTPUT CIRCLE CLASS
// ============================================================================

OutputCircle::OutputCircle() : radius(0.0), nPoints(0), IT(0)
{

}

void OutputCircle::load(std::ifstream &ifs)
{
        // temporary read variables
        double d1, d2;

        ifs >> d1 >> d2 >> radius >> nPoints;
        centre.setCoords(d1, d2);
}

void OutputCircle::addStreamOutput(ostream& os) const
{
        os << "Circle C(" << centre << "), R = " << radius << " in "
           << nPoints << " points" << endl;
}

void OutputCircle::pointItInit(Geometry *geometry)
{
        IT = 0;
        geometryPtr = geometry;
}

void OutputCircle::pointItGetNext(Point &p, int &groupID)
{
        double theta = IT*2.0*pi/((double)nPoints);
        p = centre + radius*Point(cos(theta), sin(theta));
        Medium *medium = geometryPtr->getMediumAtPoint(p);
        groupID = (medium != NULL) ? medium->ID : -1;
        IT++;
}

string OutputCircle::getBaseFilename()
{
        return string("circle");
}

// ============================================================================
// OUTPUT HANDLER CLASS
// ============================================================================

OutputHandler::OutputHandler() : nOutputs(0), output(NULL), nOutputPoints(0),
        nlOutputPoints(0), lOutputPoints(NULL), lOutputGroupID(NULL),
        neroToNexus(NULL), calculateRCS(false)
{

}

OutputHandler::~OutputHandler()
{
        delete [] lOutputPoints;
        delete [] lOutputGroupID;
        delete [] neroToNexus;
        delete NearOutputHandler2d::segOutput;

        for (int i = 0; i < nOutputs; i++)
                delete output[i];
        delete [] output;
}

void OutputHandler::loadOutput(std::ifstream &ifs)
{
        char c;

        // read the number of outputs
        ifs >> nOutputs;
        output = new Output*[nOutputs];

        // read the actual outputs
        for(int i = 0; i < nOutputs; i++) {
                Output *&out = output[i];

                // read the type of output
                ifs >> c;
                OutputT type = OutputT(c);

                switch (type) {
                        case LINE:
                                out = new OutputLine();
                                break;
                        case BITMAP:
                                out = new OutputBitmap();
                                break;
                        case CIRCLEOUT:
                                out = new OutputCircle();
                                break;
                }

                // load the actual output
                out->load(ifs);

                // update the bounding box
                Point LL, UR;
                out->getBoundingBox(LL, UR);
                updateBoudingBox(LL);
                updateBoudingBox(UR);
        }

        ifs >> calculateRCS;
}

// ========================================================================
// FAR FIELD CALCULATION (RCS)
// ========================================================================

void OutputHandler::createRCSMaster(Nexus &nexus, Geometry *geometry)
{
        ofstream ofs;
        string filenameBase = "RCS";
        string filenameExt = "rdf";
        ostringstream filename;

        Medium *medium = geometry->getBackgroundMedium();
        LevelHandler2d* lvlHndl = medium->lvlHndl[medium->lvlHndl.size()-1];
        dcomplex fjog = 4.0*I/medium->gamma;

        int thisProc = nexus.getProcessID();
        int nProc = nexus.getNumProcesses();
        int nPart = lvlHndl->getNumPartitions();

        int maxPartSz = 0;
        for (int i = 0; i < nPart; i++)
                maxPartSz = max(maxPartSz, lvlHndl->getPartitionN(i, nPart));

        // write the first RCS
        if (geometry->haveTM())
                filename << filenameBase << "_E." << filenameExt;
        else
                filename << filenameBase << "_H." << filenameExt;

        ofs.open(filename.str().c_str());
        ofs.precision(15);
        cplx *buffer = new cplx[maxPartSz];

        for (int i = 0; i < lvlHndl->getNumPartitions(); i++) {
                int srcSize = lvlHndl->getPartitionN(i, nPart);
                bool isLocal = ((i == lvlHndl->getThisPartition()) && 
                                (lvlHndl->oRadPat != NULL));

                if (isLocal)
                        memcpy(buffer, lvlHndl->oRadPat, srcSize*sizeof(cplx));
#ifdef HAVE_MPI
                else {          // receive buffer from elsewhere
                        MPI_Status status;
                        MPI_Recv(buffer, srcSize, MPI_CPLX,
                                 MPI_ANY_SOURCE, i, MPI_COMM_WORLD, &status);
                }
#endif
                // write RCS to disc
                for (int j = 0; j < srcSize; j++)
                        ofs << abs((cplx)fjog*buffer[j]*buffer[j]) << endl;
        }
        delete [] buffer;
        ofs.close();

        if (geometry->getNumRadPatComp() == 1) return;

        // Write the second RCS
        filename.str(""); filename.clear();
        filename << filenameBase << "_H." << filenameExt;

        ofs.open(filename.str().c_str());
        ofs.precision(15);
        buffer = new cplx[maxPartSz];

        for (int i = 0; i < lvlHndl->getNumPartitions(); i++) {
                int srcSize = lvlHndl->getPartitionN(i, nPart);
                bool isLocal = ((i == lvlHndl->getThisPartition()) && 
                                (lvlHndl->oRadPat != NULL));

                if (isLocal)
                        memcpy(buffer, lvlHndl->oRadPat+srcSize,
                               srcSize*sizeof(cplx));
#ifdef HAVE_MPI
                else {          // receive buffer from elsewhere
                        MPI_Status status;
                        MPI_Recv(buffer, srcSize, MPI_CPLX,
                                 MPI_ANY_SOURCE, i, MPI_COMM_WORLD, &status);
                }
#endif
                // write RCS to disc
                for (int j = 0; j < srcSize; j++)
                        ofs << abs((cplx)fjog*buffer[j]*buffer[j]) << endl;
        }
        delete [] buffer;
        ofs.close();
}

void OutputHandler::createRCSSlave(Nexus &nexus, Geometry *geometry)
{
#ifdef HAVE_MPI
        Medium *medium = geometry->getBackgroundMedium();
        LevelHandler2d* lvlHndl = medium->lvlHndl[medium->lvlHndl.size()-1];
        if (lvlHndl->oRadPat == NULL) return;
        int srcSize = lvlHndl->getLocalRadPatN();

        // send the first part of the RCS
        MPI_Send(lvlHndl->oRadPat, srcSize, MPI_CPLX,
                 0, lvlHndl->getThisPartition(), MPI_COMM_WORLD);

        // send the second part (if any)
        if (geometry->getNumRadPatComp() == 1) return;
        MPI_Send(lvlHndl->oRadPat+srcSize, srcSize, MPI_CPLX,
                 0, lvlHndl->getThisPartition(), MPI_COMM_WORLD);
#endif
}

void OutputHandler::createRCS(Nexus &nexus, Geometry *geometry)
{
        cout << "Writing RCS..."; cout.flush();

#ifdef HAVE_MPI
        MPI_Barrier(MPI_COMM_WORLD);
#endif

        if (nexus.getProcessID() == 0)
                createRCSMaster(nexus, geometry);
        else
                createRCSSlave(nexus, geometry);

#ifdef HAVE_MPI
        MPI_Barrier(MPI_COMM_WORLD);
#endif

        cout << "done" << endl;
}

void OutputHandler::calculateOutput(Geometry *geometry, Vector<cplx> &X,
                                    const ConfigFile *config, Excitation *exc,
                                    HandlerManager *hm)
{
        // get out early
        if ((nOutputs == 0) && (!calculateRCS)) return;

        // calculate the global bounding box
        Point geoLL, geoUR, globLL, globUR;
        geometry->getBoundingBox(geoLL, geoUR);

        globLL = Point(min(outLL.getX(), geoLL.getX()),
                       min(outLL.getY(), geoLL.getY()));
        globUR = Point(max(outUR.getX(), geoUR.getX()),
                       max(outUR.getY(), geoUR.getY()));

        Nexus *nexus = new Nexus();

        // create a new fmm tree
        Medium *bgMedium = geometry->getBackgroundMedium();
        double minBoxSize = config->minBoxSizeRel*bgMedium->lambda;
        int nLevels = nexus->prepareAddingUnknowns(globLL, globUR,
                                                   minBoxSize, TREE_SEPARATE);

        // set the block Jacobi level (no block jacobi for output!)
        nexus->setBlockJacobiLevel(-1);
        nexus->setMinimalPartitionLevel(config->blockJacobiLevel);

        // set the xDist for each level
        for (int lvl = 0; lvl < nLevels; lvl++) {
                if (lvl <= config->maxFmmLevel)
                        nexus->setFmmLimits(lvl, config->xDist, -1);
                else
                        nexus->setFmmLimits(lvl, 1e300, -1);
        }

        // create interaction groups for each medium
        geometry->addGeometry(*nexus, globLL, globUR);

        // add the output points to nexus
        addOutputPoints(*nexus, geometry);

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

        // do the load balancing and create the near and far interaction lists
        cout << "Setting up Nexus data structures..."; cout.flush();
        int nlUnknowns = nexus->doLoadBalancing(calculateRCS);
        cout << "done" << endl;

        // load the solution from disc if not calculated
        if (config->solutionFromDisc)
                loadSolutionVector("solution.dat", X, *nexus, nlUnknowns);

        // display the level handler information
        int precision = cout.precision(2);
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
                     <<"/" << N << " (" << (double)Na/N << ")" << ", #BP: "
                     << nBP << ", #part: " << numPart << "/" << maxPart
                     << " (" << intStr << ")" << endl;
        } }
        cout.precision(precision);

        cout << "Storing the local geometry..."; cout.flush();
        geometry->saveLocalGeometry(*nexus);
        cout << "done" << endl;

        cout << "Number of unknowns: " << nlUnknowns << "/"
             << geometry->getNumUnknowns() << " ("
             << geometry->getNumStoredUnknowns() << " stored)" << endl;

        cout << "Storing the local output..."; cout.flush();
        saveLocalOutput(*nexus, geometry);
        cout << "done" << endl;

        vector<int> nlUnknProc;
        nexus->getNumLocalUnknowns(nlUnknProc, TREE_TEST);
        for (int i = 0; i < nexus->getNumProcesses(); i++) {
                double perc = (100.0*nlUnknProc[i])/nOutputPoints;
                cout << "Number of local outputs for process " << i << ": "
                     << nlUnknProc[i] << " (" << perc << "%)" << endl;
        }

        // delete the tree if we only want the RCS
        /*if (nlOutputPoints == 0)
                nexus->deleteTree();*/

        cout << "Number of outputs: " << nlOutputPoints << "/"
             << nOutputPoints << endl;


        cout << "Gathering statistics..."; cout.flush();
        hm->gatherStatistics(nexus, geometry, config);
        cout << "done" << endl << endl;

#ifdef HAVE_MPI
        // communication info
        int totalIn = 0, totalOut = 0; map<int, int> nRecvBytes, nSendBytes;
        nexus->getCommSize(nRecvBytes, nSendBytes);
        for (int i = 0; i < nexus->getNumProcesses(); i++) {
                totalIn += nRecvBytes[i];
                totalOut += nSendBytes[i];
                cout << "Traffic to process " << i << ": "
                     << nRecvBytes[i] << " / "
                     << nSendBytes[i] << endl;
        }
        cout << "+ -----------------------" << endl;
        cout << "Total receive/send: " << totalIn
             << " /  " << totalOut << endl << endl;
#endif

        setup(*nexus, geometry, config, hm);
        nexus->prepareMatrixVector();

        Vector<cplx> lOutput(6*nlOutputPoints);
        nexus->parallelMatrixVector(X.data, lOutput.data);

        writeOutputToDisc(*nexus, geometry, lOutput, "_sc.bdf");

        // B) Incoming field
        // =================

        cout << "Calculating incident fields..."; cout.flush();
        exc->calcIncomingField(lOutputPoints, lOutputGroupID,
                               nlOutputPoints, lOutput);
        cout << "done" << endl;
        writeOutputToDisc(*nexus, geometry, lOutput, "_in.bdf");

        // C) RCS
        // ======

        if (calculateRCS)
                createRCS(*nexus, geometry);

        delete nexus;
}

void OutputHandler::writeOutputToDiscMaster(Nexus &nexus, Geometry* geometry,
                                            const Vector<cplx> &lOutput,
                                            const string &suffix)
{
        int thisProc = nexus.getProcessID();
        int nProc = nexus.getNumProcesses();

        // obtain the local number of output points from all processes
        int *nlOutputPointsProc = new int[nexus.getNumProcesses()];
        nlOutputPointsProc[thisProc] = nlOutputPoints;
#ifdef HAVE_MPI
        MPI_Allgather (&nlOutputPoints, 1, MPI_INT, nlOutputPointsProc, 1,
                       MPI_INT, MPI_COMM_WORLD);
#endif
        int maxOutputPoints = 0;
        for (int i = 0; i < nProc; i++)
                maxOutputPoints = max(maxOutputPoints, nlOutputPointsProc[i]);
        delete [] nlOutputPointsProc;

        cplx *buffer = new cplx[6*maxOutputPoints];

        for (int i = 0, cnt = 0, owner = 0, recvSize = 0; i < nOutputs; i++) {
                Output *&out = output[i];

                // open an output stream for that output
                ostringstream filename;
                filename << out->getBaseFilename() << i << suffix;

                ofstream ofs;
                ofs.open(filename.str().c_str());

                if(!ofs) cerr << "Cannot open output file: " << endl;

                // write the output stream
                out->pointItInit(geometry);
                for (int j = 0, prevOwner = -1; j < out->getNumPoints(); j++) {
                        Point p; int groupID;
                        out->pointItGetNext(p, groupID);

                        // if the medium is PEC, owner is -1
                        owner = (groupID < 0) ?
                                -1 : nexus.getOwner(p, TREE_TEST);

#ifdef HAVE_MPI
                        // first receive and write buffer from other process
                        if ((owner != prevOwner) && (recvSize > 0)) {
                                MPI_Status status;
                                MPI_Recv(buffer, recvSize, MPI_CPLX, prevOwner,
                                         0, MPI_COMM_WORLD, &status);
                                for (int k = 0; k < recvSize; k++)
                                        ofs << real(buffer[k]) << "\t"
                                            << imag(buffer[k]) << endl;
                                recvSize = 0;
                        }
#endif
                        prevOwner = owner;

                        if (owner == -1) {              // PEC: write zeros
                                for (int k = 0; k < 6; k++)
                                        ofs << 0 << "\t" << 0 << endl;
                                continue;
                        } else if (owner == thisProc) { // local: write data
                                int lIndex = neroToNexus[cnt++];
                                for (int k = 0; k < 6; k++)
                                        ofs << real(lOutput(6*lIndex+k)) << "\t"
                                            << imag(lOutput(6*lIndex+k))
                                            << endl;
                                continue;
                        } else {                        // prepare to receive
                                recvSize += 6;
                        }
                }

#ifdef HAVE_MPI
                // receive and write buffer from other process
                if (recvSize > 0) {
                        MPI_Status status;
                        MPI_Recv(buffer, recvSize, MPI_CPLX,
                                 owner, 0, MPI_COMM_WORLD, &status);
                        for (int k = 0; k < recvSize; k++)
                                ofs << real(buffer[k]) << "\t"
                                    << imag(buffer[k]) << endl;
                        recvSize = 0;
                }
#endif

                // close the output stream
                ofs.close();
        }

        delete [] buffer;
}

void OutputHandler::writeOutputToDiscSlave(Nexus &nexus, Geometry* geometry,
                                           const Vector<cplx> &lOutput)
{
#ifdef HAVE_MPI
        int thisProc = nexus.getProcessID();
        int nProc = nexus.getNumProcesses();

        // obtain the local number of output points from all processes
        int *nlOutputPointsProc = new int[nProc];
        nlOutputPointsProc[thisProc] = nlOutputPoints;

        MPI_Allgather (&nlOutputPoints, 1, MPI_INT, nlOutputPointsProc, 1,
                       MPI_INT, MPI_COMM_WORLD);
        delete [] nlOutputPointsProc;

        cplx *buffer = new cplx[6*nlOutputPoints];
        for (int i = 0, cnt = 0, bufSize = 0; i < nOutputs; i++) {
                Output *&out = output[i];

                // write the output stream
                out->pointItInit(geometry);
                for (int j = 0; j < out->getNumPoints(); j++) {
                        Point p; int groupID;
                        out->pointItGetNext(p, groupID);

                        // if the medium is PEC, owner is -1
                        int owner = (groupID < 0) ?
                                -1 : nexus.getOwner(p, TREE_TEST);

                        if (owner == thisProc) {        // buffer point
                                int lIndex = neroToNexus[cnt++];
                                for (int k = 0; k < 6; k++)
                                        buffer[bufSize++] = lOutput(6*lIndex+k);
                        } else {                        // send buffer
                                if (bufSize == 0) continue;
                                MPI_Send(buffer, bufSize, MPI_CPLX, 0,
                                         0, MPI_COMM_WORLD);
                                bufSize = 0;
                        }
                }

                // send buffer if it's non-empty
                if (bufSize == 0) continue;
                MPI_Send(buffer, bufSize, MPI_CPLX, 0, 0, MPI_COMM_WORLD);
                bufSize = 0;
        }

        delete [] buffer;
#endif
}

void OutputHandler::writeOutputToDisc(Nexus &nexus, Geometry* geometry,
                                      const Vector<cplx> &lOutput,
                                      const string &suffix)
{
        if (nOutputPoints == 0) return;

        cout << "Writing output file(s)..."; cout.flush();

        if (nexus.getProcessID() == 0)
                writeOutputToDiscMaster(nexus, geometry, lOutput, suffix);
        else
                writeOutputToDiscSlave(nexus, geometry, lOutput);
        cout << "done" << endl;
}

void OutputHandler::addOutputPoints(Nexus &nexus, Geometry *geometry)
{
        nOutputPoints = 0;
        for (int i = 0; i < nOutputs; i++) {
                Output *&out = output[i];

                out->pointItInit(geometry);
                for (int j = 0; j < out->getNumPoints(); j++) {
                        if (nOutputPoints % 512 == 0)
                                cout << "Adding output (" <<
                                        nOutputPoints << ")\r";

                        Point p; int groupID;

                        out->pointItGetNext(p, groupID);
                        if (groupID < 0) continue;

                        for (int k = 0; k < 6; k++)
                                nexus.addUnknown(p, 1, &groupID, 0, TREE_TEST);

                        nOutputPoints++;
                }
        }
}

void OutputHandler::saveLocalOutput(Nexus &nexus, Geometry *geometry)
{
        // count the number of local outputs
        nlOutputPoints = 0;
        for (int i = 0; i < nOutputs; i++) {
                Output *&out = output[i];

                out->pointItInit(geometry);
                for (int j = 0; j < out->getNumPoints(); j++) {
                        Point p; int groupID;

                        out->pointItGetNext(p, groupID);
                        if (groupID < 0) continue;

                        if (nexus.isLocal(p, TREE_TEST))
                                nlOutputPoints++;
                }
        }


        // create a local list of output points and group IDs
        lOutputPoints = new Point[nlOutputPoints];
        lOutputGroupID = new int[nlOutputPoints];
        neroToNexus = new int[nlOutputPoints];

        for (int i = 0, cnt = 0; i < nOutputs; i++) {
                Output *&out = output[i];

                out->pointItInit(geometry);
                for (int j = 0; j < out->getNumPoints(); j++) {
                        Point p; int groupID;
                        out->pointItGetNext(p, groupID);
                        if (groupID < 0) continue;
                        if (!nexus.isLocal(p, TREE_TEST)) continue;

                        int index;
                        for (int j = 0; j < 6; j++)
                                index = nexus.getUnknownIndex(p, TREE_TEST);

                        index /= 6;
                        assert((index >= 0) && (index < nlOutputPoints));

                        lOutputGroupID[index] = groupID;
                        lOutputPoints[index] = p;
                        neroToNexus[cnt++] = index;
                }
        }
}

void OutputHandler::setup(Nexus &nexus, Geometry *geometry,
                          const ConfigFile *config, HandlerManager *hm)
{
        OutputDag::outputPoints = lOutputPoints;
        OutputDag::pointGroupID = lOutputGroupID;

        // set the segment-segment interaction calculation handler
        SegOutput *segOutput = new SegOutput(geometry, config->qOrder,
                                             lOutputPoints, lOutputGroupID);
        NearOutputHandler2d::segOutput = segOutput;


        hm->allocateWorkMemory();

        hm->calcAggHandlers(&nexus, geometry, config, false);
        hm->calcDagOutputHandlers(nexus, geometry, config);
        hm->calcNearOutputHandlers(nexus, geometry, config);
        hm->calcIntpolHandlers(&nexus, geometry, config);
        hm->calcTranslHandlers(&nexus, geometry, config);
}

void OutputHandler::updateBoudingBox(const Point &p)
{
        outLL.extendLL(p);
        outUR.extendUR(p);
}


void OutputHandler::loadSolutionVector(const std::string &filename,
                                       Vector<cplx> &X, Nexus &nexus,
                                       int nlUnknowns)
{
        int nProc = nexus.getNumProcesses();
        int thisProc = nexus.getProcessID();

        // obtain the local number of unknowns from all processes
        Vector<int> nlUnknProc(nProc);
        nlUnknProc[thisProc] = nlUnknowns;

        // allocate the unknown vector
        X.setDimensions(nlUnknowns);
        X.allocateMemory(cplx(0, 0));

#ifdef HAVE_MPI
        MPI_Allgather (&nlUnknowns, 1, MPI_INT, nlUnknProc.data, 1,
                       MPI_INT, MPI_COMM_WORLD);
#endif

        // find the largest number of local unknowns
        int maxSize = 0;
        for (int i = 0; i < nProc; i++)
                if (nlUnknProc[i] > maxSize)
                        maxSize = nlUnknProc[i];

        Vector<cplx> send(maxSize);

        if (thisProc == 0) {
                // load vector from disc
                ifstream ifs;
                ifs.open(filename.c_str());

                if (!ifs) {
                        cerr << "Cannot open input file: " << filename << endl;
                        exit(EXIT_FAILURE);
                }

                // load own part from disc
                if (ifs) ifs >> X;

#ifdef HAVE_MPI
                for (int i = 1; i < nProc; i++) {
                        // load buffer from disc
                        send.sz = nlUnknProc[i];
                        if (ifs) ifs >> send;
                        // send the buffer for each process
                        MPI_Send(send.data, nlUnknProc[i],
                                 MPI_CPLX, i, i, MPI_COMM_WORLD);
                }
#endif
                if (ifs) ifs.close();
        } else {
#ifdef HAVE_MPI
                MPI_Status stat;
                MPI_Recv(X.data, nlUnknowns, MPI_CPLX, 0,
                         thisProc, MPI_COMM_WORLD, &stat);
#endif
        }

        // make sure it gets freed !
        send.sz = maxSize;

#ifdef HAVE_MPI
        // synchronize and get out
        MPI_Barrier(MPI_COMM_WORLD);
#endif
}

ostream& operator<<(std::ostream& os, const OutputHandler& O)
{
        os << "\t-----------------------------------" << endl;
        os << "\tOUTPUT LISTING (LL: (" << O.outLL
           << ") UR (" << O.outUR << "))" << endl;
        os << "\t-----------------------------------" << endl;
        for (int i = 0; i < O.nOutputs; i++)
                os << "\t* Output " << i << ": " << *O.output[i];
        if (O.calculateRCS)
                os << "\t* RCS for background medium" << endl;
        return os;
}
