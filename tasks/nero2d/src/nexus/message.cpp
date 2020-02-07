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
#include "message.h"

// ============================================================================
// OUTGOING COMMUNICATION
// ============================================================================

#ifdef HAVE_MPI

MPI_Request *OutComm::sendReq = NULL;

void OutComm::post()
{
        MPI_Isend(buffer, sendSize, MPI_CPLX, dstProc,
                  tag, *communicator, &sendReq[msgID]);
}

void OutComm::pack(const cplx *src)
{
        const int one = 1;

        for(uint i = 0, offset = 0; i < numSrc; i++) {
                memcpy(buffer + offset, src + srcOffset[i],
                       srcSize[i]*sizeof(cplx));
                offset += srcSize[i];
        }
}

// ============================================================================
// INCOMING COMMUNICATION
// ============================================================================

MPI_Request *InComm::recvReq = NULL;

void InComm::post() const
{
        MPI_Irecv(buffer, recvSize, MPI_CPLX, srcProc,
                  tag, *communicator, &recvReq[msgID]);

}
#endif
