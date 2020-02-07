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

#ifndef MESSAGE_H
#define MESSAGE_H

#include "pubbase.h"

// ============================================================================
// CLASS PROTOTYPES
// ============================================================================

class NearPack;
class AggPack;
class TranslPack;
class DagPack;
template <class T> class Train;

// ============================================================================
// ENUMERATIONS
// ============================================================================

typedef enum { NEAR_COMM, AGG_COMM, DAG_COMM } MsgType;

// ============================================================================
// MESSAGE CLASS
// ============================================================================

class RecvMsg
{
public:
        RecvMsg() : msgType(NEAR_COMM), nearTrain(NULL), aggTrain(NULL), 
                    translTrain(NULL), dagTrain(NULL) {}

        MsgType msgType;                // type of message that is received
        Train<NearPack> *nearTrain;     // near train that can be scheduled
        Train<AggPack> *aggTrain;       // agg train that can be scheduled
        Train<TranslPack> *translTrain; // transl train that can be scheduled
        Train<DagPack> *dagTrain;       // dag train that can be scheduled
};

// ============================================================================
// COMMUNICATION STRUCTURES
// ============================================================================

class OutComm
{
public:
        /**
         * Default constructor
         */
        OutComm() : buffer(NULL), sendSize(0), dstProc(0), tag(0), msgID(0), 
                    isCompressed(false), numSrc(0), srcOffset(NULL), 
                    srcSize(NULL) {
#ifdef HAVE_MPI
                communicator = NULL;
#endif
        }

        /**
         * Destructor
         */
        ~OutComm() { delete [] srcOffset; delete [] srcSize; }

        cplx *buffer;                   // outgoing data (pointer)
        int sendSize;                   // size of send buffer
        int dstProc;                    // process to send data to
        int tag;                        // enveloppe tag
        int msgID;                      // unique identifier for this message
        bool isCompressed;              // is the data compressed

        int numSrc;                     // number of sources to copy
        int *srcOffset;                 // offset of the src to be copied
        int *srcSize;                   // sizes of the src to be copied

#ifdef HAVE_MPI
        /**
         * Pack the necessary data from src to the send buffer
         * @param src Source buffer (input)
         */
        void pack(const cplx *src);

        /**
         * Schedule this message for sending
         */
        void post();

        MPI_Comm *communicator;         // pointer to the MPI communicator
        static MPI_Request *sendReq;    // pointer to the MPI send request
#endif
};

class InComm
{
public:
        /**
         * Default constructor
         */
        InComm() : buffer(NULL), recvSize(0), srcProc(0), tag(0), msgID(0) {
#ifdef HAVE_MPI
                communicator = NULL;
#endif
        }

        cplx *buffer;                   // incoming data (pointer)
        uint recvSize;                  // size of recv buffer
        uint srcProc;                   // process to recieve data from
        int tag;                        // enveloppe tag
        uint msgID;                     // unique identifier for this message

#ifdef HAVE_MPI
        /**
         * Schedule this message for receival
         */
        void post() const;

        MPI_Comm *communicator;         // pointer to the MPI communicator
        static MPI_Request *recvReq;    // pointer to the MPI send request
#endif
};


#endif

