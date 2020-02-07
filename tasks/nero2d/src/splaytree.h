/***************************************************************************
 *   Copyright (C) 2006, 2007, 2008 by Jan Fostier, Joris Peeters          *
 *   jan.fostier@intec.ugent.be, joris.peeters@intec.ugent.be              *
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

#ifndef SPLAYTREE_H
#define SPLAYTREE_H

// ===========================================================================
// TEMPLATE PROTOTYPES
// ===========================================================================

template <class T>
class SplayTree;

// ===========================================================================
// SPLAY ELEMENT
// ===========================================================================

template <class T>
class SplayEl
{
private:
        SplayEl *left;
        SplayEl *right;
        T data;

public:
        /**
         * Default constructor
         */
        SplayEl();

        /**
         * Destructor
         */
        ~SplayEl();

        friend class SplayTree<T>;
};

template <class T>
SplayEl<T>::SplayEl() : left(NULL), right(NULL)
{

}

template <class T>
SplayEl<T>::~SplayEl()
{

}

// ===========================================================================
// SPLAY TREE
// ===========================================================================

template <class T>
class SplayTree
{
private:
        SplayEl<T> *el;
        SplayEl<T> *root;
        int numEl;
        int maxEl;
        int numRequests;
        int numHits;
	int deleteMethod;	// 0 = rightpreferred
                                // 1 = random
                                // 2 = leftpreferred
                                // 3 = killthehighest

	 /**
         * Perform a top-down splay operation on the tree
         * @param data Data to bring to the root
         */
        void splay(const T& data);

        /**
         * Find a leaf element in the tree
         * @return A leaf element
         */
        SplayEl<T>* findLeafElement();

        /**
         * Check if an element is a leaf
         * @return True if it's a leaf, false otherwise
         */
        bool isLeaf(const SplayEl<T> *el);



public:
        /**
         * Default constructor
         * @param maxEl Maximum number of elements in the tree
         * @param deleteMethod Method to delete a leaf from the tree
         */
	SplayTree(int maxEl, int deleteMethod);

        /**
         * Destructor
         */
        ~SplayTree();

        /**
         * Insert a new element into the splay tree
         * @param data Pointer to the element to add
         * @return False if the element was already in the tree, true otherwise
         */
        bool insert(const T& data);

        /**
         * Search an element from the tree
         * @param data Element that is searched for (input and output)
         * @return True if the element is found, false otherwise
         */
        bool find(T& data);

        /**
         * Check if the tree is empty
         * @return
         */
        bool isEmpty();

        /**
         * Get the number of elements in the splay tree
         * @return Number of elements in the splay tree
         */
        int getSize() { return numEl; };

        /**
         * Get the number of search operations on the tree
         * @return Number of search operations on the tree
         */
        int getNumRequests() { return numRequests; };

        /**
         * Get the number of successful search operations on the tree
         * @return Number of successful search operations on the tree
         */
        int getNumHits() { return numHits; };

        /**
         * Get the maximum number of elements in the tree
         * @return The maximum number of elements in the tree
         */
        int getMaxEl() { return maxEl; };

	/**
	 * Change the root
	 */
	void setRoot(const T& r);

	// get the nth element-data from the list
	T * getData(int n);


};

template <class T>
SplayTree<T>::SplayTree(int maxEl_, int deleteMethod_) : el(NULL),
        root(NULL), numEl(0), maxEl(maxEl_), numRequests(0), numHits(0),
        deleteMethod(deleteMethod_)
{
        assert((deleteMethod >= 0) && (deleteMethod < 4));
        if (maxEl > 0) el = new SplayEl<T>[maxEl];
        srand((unsigned)time(0));
}

template <class T>
SplayTree<T>::~SplayTree()
{
        delete [] el;
}

template <class T>
bool SplayTree<T>::insert(const T& data)
{
        if (maxEl <= 0) return false;
        // special case if the tree is empty
        if (isEmpty()) {
                root = el;
                root->data = data;
                numEl = 1;
                return true;
        }

        // tree is non-empty: splay the tree
        splay(data);

        bool smaller = (data < root->data);
        bool bigger = (data > root->data);
        // special case if the element already excists
        if (!(smaller || bigger)) return false;

        SplayEl<T> *newEl = NULL;
        // search for a good spot to store the data
        if (numEl < maxEl) {    // tree is not full
                newEl = &el[numEl];
                numEl++;
        } else {                // tree is full: delete one element
                newEl = findLeafElement();
                newEl->left = NULL;
                newEl->right = NULL;
        }
        newEl->data = data;

        // update the root
        if (smaller) {
                newEl->left = root->left;
                newEl->right = root;
                root->left = NULL;
                root = newEl;
                return true;
        } else { // (bigger)
                newEl->right = root->right;
                newEl->left = root;
                root->right = NULL;
                root = newEl;
                return true;
        }
}

template <class T>
SplayEl<T>* SplayTree<T>::findLeafElement()
{
        SplayEl<T> *curr = root;
        if (maxEl == 1) return curr;

	if (deleteMethod == 0) {
		while (true) {
                        bool goLeft = (curr->right == NULL);
                        SplayEl<T> *chd = (goLeft) ? curr->left : curr->right;
			if (isLeaf(chd)) {
                                if (goLeft)
                                        curr->left = NULL;
                                else
                                        curr->right = NULL;
                                return chd;
			}
			curr = chd;
		}
	} else if (deleteMethod == 1) {
		while (true) {
                        bool goLeft;
                        if (curr->right == NULL)
                                goLeft = true;
                        else if (curr->left == NULL)
                                goLeft = false;
                        else
                                goLeft = rand() % 2;

			SplayEl<T> *chd = (goLeft) ? curr->left : curr->right;
			if (isLeaf(chd)) {
				if (goLeft)
                                        curr->left = NULL;
				else
                                        curr->right = NULL;
				return chd;
			}
			curr = chd;
		}
	} else if (deleteMethod == 2) {
		while (true) {
                        bool goLeft = (curr->left != NULL);
                        SplayEl<T> *chd = (goLeft) ? curr->left : curr->right;
                        if (isLeaf(chd)) {
                                if (goLeft)
                                        curr->left = NULL;
                                else
                                        curr->right = NULL;
                                return chd;
                        }
                        curr = chd;
		}
	} else { // (deleteMethod == 3)
                // special case if the root has no right
                if (curr->right == NULL) {
                        root = curr->left;
                        return curr;
                }
                while (true) {
			SplayEl<T> *chd = curr->right;
			if (chd->right == NULL) {
                                curr->right = chd->left;
                                return chd;
			}
                        curr = chd;
		}
	}
}

template <class T>
inline bool SplayTree<T>::isLeaf(const SplayEl<T> *el)
{
        return ((el->left == NULL) && (el->right == NULL));
}

template <class T>
bool SplayTree<T>::find(T& data)
{
        numRequests++;
        if (isEmpty()) return false;
        splay(data);
        if (root->data == data) {
                data = root->data;
                numHits++;
                return true;
        }
        return false;
}

template <class T>
void SplayTree<T>::splay(const T& data)
{
        if (root == NULL) return;
        SplayEl<T> N, *l, *r, *y;
        l = r = &N;

        for (;;) {
                if (data < root->data) {
                        if (root->left == NULL) break;
                        if (data < root->left->data) {
                                y = root->left;         // rotate right
                                root->left = y->right;
                                y->right = root;
                                root = y;
                                if (root->left == NULL) break;
                        }
                        r->left = root;                 // link right
                        r = root;
                        root = root->left;
                } else if (data > root->data) {
                        if (root->right == NULL) break;
                        if (data > root->right->data) {
                                y = root->right;        // rotate left
                                root->right = y->left;
                                y->left = root;
                                root = y;
                                if (root->right == NULL) break;
                        }
                        l->right = root;                // link left
                        l = root;
                        root = root->right;
                } else {
                        break;
                }
        }
        l->right = root->left;                          // assemble
        r->left = root->right;
        root->left = N.right;
        root->right = N.left;
}

template <class T>
inline bool SplayTree<T>::isEmpty()
{
        return (numEl == 0);
}

template <class T>
void SplayTree<T>::setRoot(const T& r)
{
	root->data = r;
}

template <class T>
T * SplayTree<T>::getData(int n)
{
	return &(el[n].data);
}




#endif
