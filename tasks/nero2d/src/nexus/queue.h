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

#ifndef QUEUE_H
#define QUEUE_H

#include <cstdlib>

// ============================================================================
// TRAIN CLASS
// ============================================================================

/**
 * Generic train class
 */
template <class P>
class Train
{
public:
        Train *next;            // pointer to next train of packages
        P *package;             // near interaction work packages
        int nPackages;          // the number of packages
        int currPackage;        // next package to process

        void *metaData;         // metaData of this Train

        /**
         * Default constructor
         */
        Train();

        /**
         * Destructor
         */
        ~Train();
};

template <class P>
Train<P>::Train() : next(NULL), package(NULL), nPackages(0), currPackage(0), 
                    metaData(NULL)
{

}

template <class P>
Train<P>::~Train()
{
        delete [] package;
}

// ============================================================================
// QUEUE CLASS
// ============================================================================

/**
 * Generic template queue class
 */
template <class P>
class Queue
{
private:
        Train<P>* first;        // first train in the queue
        Train<P>* last;         // last train in the queue

public:

        /**
         * Default constructor
         */
        Queue();

        /**
         * Add a new train to the front of the queue
         * @param el Train to add
         */
        void addToFront(Train<P>* el);

        /**
         * Add a new train to the back of the queue
         * @param el Train to add
         */
        void addToBack(Train<P>* el);

        /**
         * Pop the first work package of the queue
         * @return First work package in the queue, NULL if empty
         */
        P* getNextPackage();

        /**
         * Pop the first work package of the queue and give metadata
         * @param metaData Meta data associated with this package
         * @return First work package in the queue, NULL if empty
         */
        P* getNextPackage(void *&metaData);
};

template <class P>
Queue<P>::Queue() : first(NULL), last(NULL)
{

}

template <class P>
void Queue<P>::addToFront(Train<P>* el)
{
        if (el == NULL) return;
        assert(el->nPackages != 0);
        el->next = first;
        if (last == NULL)
                last = el;
        first = el;
}

template <class P>
void Queue<P>::addToBack(Train<P>* el)
{
        if (el == NULL) return;
        assert(el->nPackages != 0);
        if (last != NULL) {
                last->next = el;
                last = el;
        } else
                first = last = el;
}

template <class P>
P* Queue<P>::getNextPackage()
{
        P *package = NULL;
        Train<P>* train = first;

        if (train != NULL) {
                package = &train->package[train->currPackage];
                train->currPackage++;

                if (train->currPackage == train->nPackages) {
                        train->currPackage = 0;
                        first = train->next;
                        if (first == NULL) last = NULL;
                        train->next = NULL;
                }
        }

        return package;
}

template <class P>
P* Queue<P>::getNextPackage(void *& metaData)
{
        if (first != NULL)
                metaData = first->metaData;
        return getNextPackage();
}

#endif
