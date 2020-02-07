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

#ifndef WORKPACK_H
#define WORKPACK_H

#include "pubbase.h"

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class NearIntHandler;
class AggHandler;
class LevelHandler;
class DagHandler;

// ============================================================================
// WORK PACKAGE ELEMENTS DATA STRUCTURES
// ============================================================================

class NearInt
{
public:
        uint srcUnknownOffset;  // unknown offset for Xn
        uint dstUnknownOffset;  // unknown offset for Ym
        NearIntHandler *nih;    // near interaction matrix

        NearInt() : srcUnknownOffset(0), dstUnknownOffset(0), nih(NULL) {}
};

class lZAgg {
public:
        uint unknownOffset;     // unknown offset
        uint radPatOffset;      // radiation pattern offset
        AggHandler* aggtr;      // aggregation handler

        lZAgg() : unknownOffset(0), radPatOffset(0), aggtr(NULL) {}
};

class Transl
{
public:
        uint srcOffset;         // radiation pattern offset
        uint dstOffset;         // radiation pattern offset
        uint hndlIndex;         // translation index

        Transl() : srcOffset(0), dstOffset(0), hndlIndex(0) {}
};

class Agg
{
public:
        uint nChildren;         // number of children
        uint chdOffset;         // child radiation pattern offset
        uint parOffset;         // parent radiation pattern offset
        uint secOffset;         // sector offset

        Agg() : nChildren(0), chdOffset(0), parOffset(0), secOffset(0) {}
};

class Dag
{
public:
        uint nChildren;         // number of children
        uint chdOffset;         // child radiation pattern offset
        uint parOffset;         // parent radiation pattern offset

        Dag() : nChildren(0), chdOffset(0), parOffset(0) {}
};

class lZDag {
public:
        uint unknownOffset;     // unknown offset
        uint radPatOffset;      // radiation pattern offset
        DagHandler* dagtr;      // aggregation handler

        lZDag() : unknownOffset(0), radPatOffset(0), dagtr(NULL) {}
};

// ============================================================================
// WORK PACKAGE ELEMENTS TEMPORARY DATA STRUCTURES
// ============================================================================

class NearIntTemp
{
public:
        uint basisStart;        // first basis function index
        uint basisEnd;          // final basis function index
        uint testStart;         // first test function index
        uint testEnd;           // final test function index

        NearIntTemp() : basisStart(0), basisEnd(0), testStart(0), testEnd(0) {}
};

class lZAggTemp
{
public:
        Point centre;           // centre of a box
        uint n;                 // number of unknowns in that box

        lZAggTemp() : n(0) {}
};

class TranslTemp
{
public:
        Point R;                // translation vector

        TranslTemp() {}
        TranslTemp(const Point &R_) : R(R_) {}

        bool operator==(const TranslTemp &rhs) const;
        bool operator<(const TranslTemp &rhs) const;
        bool operator>(const TranslTemp &rhs) const;
};

class lZDagTemp
{
public:
        Point centre;           // centre of a box
        uint n;                 // number of unknowns in that box

        lZDagTemp() : n(0) {}
};

// ============================================================================
// WORK PACKAGE DATA STRUCTURES
// ============================================================================

class NearPack
{
public:
        NearInt *nearInt;       // pointer to actual near int data
        int nNearInts;          // number of near interactions

        NearPack() : nearInt(NULL), nNearInts(0) {}
};

class lZAggPack
{
public:
        lZAgg *levZeroAgg;      // pointer to actual level zero agg
        int nLevZeroAgg;        // number of level zero aggregations

        lZAggPack(): levZeroAgg(NULL), nLevZeroAgg(0) {}
};

class AggPack
{
public:
        Agg *agg;               // actual aggregation data
        unsigned int nAgg;      // the number of aggregations

        AggPack() : agg(NULL), nAgg(0) {}
};

class TranslPack
{
public:
        Transl *transl;         // actual translation data
        unsigned int nTransl;   // the number of translations

        TranslPack() : transl(NULL), nTransl(0) {}
};

class DagPack
{
public:
        Dag *dag;               // actual disaggregation data
        unsigned int nDag;      // the number of disaggregations

        DagPack() : dag(NULL), nDag(0) {}
};

class lZDagPack
{
public:
        lZDag *levZeroDag;      // pointer to actual level zero disagg
        int nLevZeroDag;        // number of level zero disaggregations

        lZDagPack(): levZeroDag(NULL), nLevZeroDag(0) {}
};

// ============================================================================
// META DATA PACKAGE STRUCTURES
// ============================================================================

class NearMetaData
{
public:
        cplx *srcBase;          // pointer to the unknown data

        NearMetaData() : srcBase(NULL) {}
};

class LZAggMetaData
{
public:
        cplx *oSrcBase;         // pointer to the unknown data
        LevelHandler *lh;       // pointer to the level handler

        LZAggMetaData() : oSrcBase(NULL), lh(NULL) {}
};

class TranslMetaData
{
public:
        cplx *srcBase;          // pointer to the outgoing data
        cplx *dstBase;          // pointer to the incoming data
        LevelHandler *lh;       // pointer to the level handler 

        TranslMetaData() : srcBase(NULL), dstBase(NULL), lh(NULL) {}
};

class IntMetaData
{
public:
        // source information
        LevelHandler *chdLh;    // pointer to the child level handler
        uint chdPart;           // child partition
        uint chdSize;           // size of the child vector
        cplx *chdBase;          // pointer to the child data

        LevelHandler *parLh;    // pointer to the parent level handler
        uint parPart;           // parent partition
        uint parSize;           // size of the parent vector
        cplx *parBase;          // pointer to the parent data

        int *chdSect;           // sector of the children

        IntMetaData() : chdLh(NULL), chdPart(0), chdSize(0), chdBase(NULL),
                        parLh(NULL), parPart(0), parSize(0), parBase(NULL),
                        chdSect(NULL) {}
};

class LZDagMetaData
{
public:
        cplx *iSrcBase;         // pointer to the unknown data
        LevelHandler *lh;       // pointer to the level handler

        LZDagMetaData() : iSrcBase(NULL), lh(NULL) {}
};

#endif
