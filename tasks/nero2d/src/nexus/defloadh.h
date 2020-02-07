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

#ifndef DEFAULT_LOADHANDLER_H
#define DEFUALT_LOADHANDLER_H

#include "loadhandler.h"

// ===========================================================================
// SPACE FILLING CURVES
// ===========================================================================

class SpaceFillCurve
{
public:
        /**
         * Calculate the next HSFC state based
         * @param state Current state
         * @param sector Sector in the state
         * @return The state corresponding to the sector of the parent state
         */
        static int hilbertState(int state, int sector);

        /**
         * Calculate the next HSFC position
         * @param state Current state
         * @param sector Sector in the state
         * @return The position corresponding to the sector of the parent state
         */
        static int hilbertPos(int state, int sector);

        /**
         * Calculate the next MSFC state
         * @param state Current state
         * @param sector Sector in the state
         * @return The state corresponding to the sector of the parent state
         */
        static int mortonState(int state, int sector);

        /**
         * Calculate the next MSFC position
         * @param state Current state
         * @param sector Sector in the state
         * @return The position corresponding to the sector of the parent state
         */
        static int mortonPos(int state, int sector);
};

// ===========================================================================
// DEFAULT LOAD BALANCING
// ===========================================================================

class DefaultLoadHandler : public LoadHandler
{
private:
        // static function pointers to corresponding space filling curves
        static int (*sfStateFunc)(int,int);
        static int (*sfPosFunc)(int,int);

        /**
         * Recursively connect the boxes according a space filling curve
         * @param parent Pointer to the parent box
         * @param state State of the curve of the parent
         */
        static void recOrderSpaceFill(Box *parent, int state);

        /**
         * Connect the boxes at each level
         */
        void connectBoxes();

public:
        /**
         * Order the boxes in the tree according a certain space filling curve
         */
        void orderBoxes();

        /**
         * Set an owner for each box in the FMM tree
         */
        void loadDivision();
};

#endif
