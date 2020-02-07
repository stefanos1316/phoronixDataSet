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
#include "matrix.h"
#include "nexus/util.h"
#include <iostream>
#include <cstdlib>
#include <cstring>

using namespace std;

// ===========================================================================
// MATRIX CLASS
// ===========================================================================

/**
 * Specialized invert function for cplx types with LAPACK
 */
template <>
void Matrix<cplx>::invert()
{
        assert(isInitialized());
        int rw = nRows(), cl = nCols();

        assert(rw == cl);

        int* iPivot = new int[rw];
        int info, lwork = rw*rw;
        cplx* work = new cplx[lwork];

        getrf_f77(&rw, &rw, data, &rw, iPivot, &info);
        assert(info == 0);
        getri_f77(&rw, data, &rw, iPivot, work, &lwork, &info);
        assert(info == 0);

        delete [] iPivot;
        delete [] work;
}

/**
 * Specialized gemm function for cplx types with BLAS
 * @param A Left-hand n x p matrix
 * @param B Right-hand p x m matrix
 */
template <>
void Matrix<cplx>::gemm(const Matrix &A, const Matrix &B)
{
        assert(isInitialized());
        assert(A.isInitialized());
        assert(B.isInitialized());
        // check dimensions
        assert(A.nRows() == nRows());
        assert(B.nCols() == nCols());
        assert(A.nCols() == B.nRows());

        const cplx zero = 0;
        const cplx one = 1;

        int rw = nRows(), cl = nCols();
        int Arw = A.nRows(), Acl = A.nCols(), Brw = B.nRows();
        gemm_f77("N", "N", &rw, &cl, &Acl, &one, A.data, &Arw,
                 B.data, &Brw, &zero, data, &rw);
}

/**
 * Specialized QR factorization function for cplx types with LAPACK
 * @param Q Q matrix (output)
 * @param R R matrix (output)
 * @param P P permutation vector (output)
 */
template <>
void Matrix<cplx>::QR(Matrix &Q, Matrix &R, Vector<int> &P) const
{
        assert(isInitialized());
        int info;

        // on entry, the M-by-N matrix A. On exit, the upper triangle of the
        // array contains the min(M,N)-by-N upper triangular matrix R; the
        // elements below the diagonal, together with the array TAU, represent
        // the unitary matrix Q as a product of min(m,n) elementary reflectors

        // make a working copy of the matrix
        Matrix<cplx> A = *this;
        // M = the number of rows of the input matrix
        // N = the number of columns of the input matrix
        int m = A.nRows();
        int n = A.nCols();
        int mn=m; if (n < m) mn=n;

        Q = Matrix<cplx>(m,m);
        R = Matrix<cplx>(m,n);
        P = Vector<int>(n,0);

        // the scalar factors of the elementary reflectors
        cplx *tau = new cplx[mn];

        // workspace
        cplx* work = new cplx[n];
        deci* rwork = new deci[2*n];

        // calculate the QR decomposition
        geqpf_f77(&m, &n, A.data, &m, P.data, tau, work, rwork, &info);
        if (info != 0) cerr << "Error during QR factorization" << endl;

        delete [] work;
        delete [] rwork;

        // fix the permutation matrix
        for(int ikol = 0 ; ikol < n ; ++ikol)
                --P.data[ikol];

        // fill matrix R
        for(int irow = 0 ; irow < m ; ++irow) {
                for(int ikol = 0 ; ikol < irow ; ++ikol)
                        R(irow,ikol) = 0.0;
                for(int ikol = irow ; ikol < n ; ++ikol)
                        R(irow,ikol) = A(irow,ikol);
        }

        // construct Q
        for(int irow = 0 ; irow < m ; ++irow)
                for(int ikol = 0 ; ikol < irow ; ++ikol)
                        Q(irow,ikol) = A(irow,ikol);
        int lwork = 10*n;
        work = new cplx[lwork];
        ungqr_f77(&m, &m, &mn, Q.data, &m, tau, work, &lwork, &info);
        if (info != 0) cerr << "Error during QR factorization" << endl;

        delete [] work;
        delete [] tau;
}


template <>
void Matrix<cplx>::QR_overwrite(Matrix &Q, Matrix &R, Vector<int> &P)
{
        assert(isInitialized());
        int info;

        // on entry, the M-by-N matrix A. On exit, the upper triangle of the
        // array contains the min(M,N)-by-N upper triangular matrix R; the
        // elements below the diagonal, together with the array TAU, represent
        // the unitary matrix Q as a product of min(m,n) elementary reflectors

        // make a working copy of the matrix
        //Matrix<cplx> A = *this;
        // M = the number of rows of the input matrix
        // N = the number of columns of the input matrix
        int m = this->nRows();
        int n = this->nCols();
        int mn=m; if (n < m) mn=n;
	
	//cout << "m: " << m << endl;
	//cout << "n: " << n << endl;

        Q = Matrix<cplx>(m,m);
        R = Matrix<cplx>(m,n);
        P = Vector<int>(n,0);

        // the scalar factors of the elementary reflectors
        cplx *tau = new cplx[mn];

        // workspace
        cplx* work = new cplx[n];
        deci* rwork = new deci[2*n];

        // calculate the QR decomposition
        geqpf_f77(&m, &n, this->data, &m, P.data, tau, work, rwork, &info);
        if (info != 0) cerr << "Error during QR factorization" << endl;

        delete [] work;
        delete [] rwork;

        // fix the permutation matrix
        for(int ikol = 0 ; ikol < n ; ++ikol)
                --P.data[ikol];

        // fill matrix R
        for(int irow = 0 ; irow < m ; ++irow) {
                for(int ikol = 0 ; ikol < irow ; ++ikol)
                        R(irow,ikol) = 0.0;
                for(int ikol = irow ; ikol < n ; ++ikol)
                        R(irow,ikol) = (*this)(irow,ikol);
        }

        // construct Q
        for(int irow = 0 ; irow < m ; ++irow)
                for(int ikol = 0 ; ikol < irow ; ++ikol)
                        Q(irow,ikol) = (*this)(irow,ikol);
        int lwork = 10*n;
        work = new cplx[lwork];
        ungqr_f77(&m, &m, &mn, Q.data, &m, tau, work, &lwork, &info);
        if (info != 0) cerr << "Error during QR factorization" << endl;

        delete [] work;
        delete [] tau;
}


template <>
int Matrix<dcomplex>::SVD(Matrix &U, Vector<deci> &S, Matrix &VH) const
{
        Matrix<dcomplex> A = (*this);
        char JOBU, JOBVH;
        int M, N, LDA, LDU, LDVH, mn, MN;
        int WORK, LDWORK, INFO;
        int irow, ikol, R;
        clock_t t1;
        double *work2;
        dcomplex *work;
        Matrix<dcomplex> result;

        JOBU = 'S';
        JOBVH = 'S';

        M = A.nRows();
        N = A.nCols();

        mn=M;if (N<M) mn=N;
        MN=M;if (N>M) MN=N;

        U = Matrix<dcomplex>(M,mn,0.0);
        S = Vector<double>(mn,0.0);
        VH = Matrix<dcomplex>(mn,N);

        LDA = M;
        LDU = M;
        LDVH = mn;

        int sub=3*mn + MN;
        if (5*mn>3*mn + MN)sub=5*mn;
        LDWORK = 2*sub;
        work = new dcomplex[LDWORK];
        work2 = new double[5*mn];

        gesvd_f77(&JOBU, &JOBVH, &M, &N, A.data, &LDA, S.data, U.data, &LDU,
                  VH.data, &LDVH, work, &LDWORK, work2, &INFO);

        delete [] work;
        delete [] work2;

        return(INFO);
}

template <>
double Matrix<dcomplex>::norm() const
{
	double result = 0.0;
	for (int cr=0;cr<nRows();cr++)
		for (int cc=0;cc<nCols();cc++)
			result += abs((*this)(cr,cc)) * abs((*this)(cr,cc));
	return sqrt(result);
}




/**
 * Specialized print matrix elements to the output stream for deci complex
 * @param os Output stream to add to
 * @param M Matrix to print
 * @return Output stream with the matrix elements
 */
template <>
std::ostream& operator<<(std::ostream& os, const Matrix<cplx> &M)
{
        int oldPrec = os.precision();
        os.precision(15);
        for (int r = 0; r < M.nRows(); r++) {
                for (int c = 0; c < (M.nCols()-1); c++) {
                        cplx el = M.data[c*M.nRows()+r];
                        os << real(el) << "\t" << imag(el) << "\t";
                }
                cplx el = M.data[(M.nCols()-1)*M.nRows()+r];
                os << real(el) << "\t" << imag(el) << endl;
        }
        cout.precision(oldPrec);
        return os;
}

/**
 * Specialized print matrix elements to the output stream for decis
 * @param os Output stream to add to
 * @param M Matrix to print
 * @return Output stream with the matrix elements
 */
template <>
std::ostream& operator<<(std::ostream& os, const Matrix<deci> &M)
{
        int oldPrec = os.precision();
        os.precision(15);
        for (int r = 0; r < M.nRows(); r++) {
                for (int c = 0; c < (M.nCols()-1); c++)
                        os << M.data[c*M.nRows()+r] << "\t";
                os << M.data[(M.nCols()-1)*M.nRows()+r] << endl;
        }
        cout.precision(oldPrec);
        return os;
}

// ===========================================================================
// VECTOR CLASS
// ===========================================================================

/**
 * Specialized solver for Z*X=B for deci complex types with LAPACK
 * @param Z System n x n matrix
 * @param B Right-hand side vector of size n
 * @param X Unknown vector of size n
 */
template <>
void Vector<cplx>::solve(Matrix<cplx > &Z, const Vector &B, Vector &X)
{
        assert(Z.isInitialized());
        // check dimensions
        assert(Z.nCols() == Z.nRows());
        assert(Z.nRows() == B.size());
        assert(X.size() == B.size());

        int n = Z.nRows();
        int lda = n, ldb = n, nrhs = 1, info = 0;

        int* iPivot = new int[n];
        X = B;
        gesv_f77(&n, &nrhs, Z.data, &lda, iPivot, X.data, &ldb, &info);
        delete [] iPivot;
}

/**
 * Specialized gemv function for deci complex types with BLAS
 * @param Z Left-hand side m x n matrix
 * @param X Right-hand side vector of size n
 */
template <>
void Vector<cplx>::gemv(const Matrix<cplx >&Z, const Vector &X)
{
        assert(Z.isInitialized());
        // check dimensions
        assert(Z.nRows() == size());
        assert(Z.nCols() == X.size());

        const cplx zero = 0;
        const cplx one = 1;
        const int ione = 1;
        int Zrw = Z.nRows(), Zcl = Z.nCols();

        gemv_f77("N", &Zrw, &Zcl, &one, Z.data, &Zrw, X.data, &ione,
                 &zero, data, &ione);
}


/**
 * Specialized gemTv function for deci complex types with BLAS
 * @param Z Left-hand side n x m matrix
 * @param X Right-hand side vector of size n
 */
template <>
void Vector<cplx>::gemTv(const Matrix<cplx >&Z, const Vector &X)
{
        assert(Z.isInitialized());
        // check dimensions

        //assert(Z.nRows() == size());
        //assert(Z.nCols() == X.size());

        assert(Z.nCols() == size());
        assert(Z.nRows() == X.size());

        const cplx zero = 0;
        const cplx one = 1;
        const int ione = 1;
        int Zrw = Z.nRows(), Zcl = Z.nCols();

        gemv_f77("T", &Zrw, &Zcl, &one, Z.data, &Zrw, X.data, &ione,
                 &zero, data, &ione);
}


/**
 * Specialized gaemv function for deci complex types with BLAS
 * @param Z Left-hand side m x n matrix
 * @param X Right-hand side vector of size n
 */
template <>
void Vector<cplx>::geamv(const Matrix<cplx >&Z, const Vector &X)
{
        assert(Z.isInitialized());
        // check dimensions
        assert(Z.nRows() == size());
        assert(Z.nCols() == X.size());

        const cplx cone = 1;
        const cplx one = 1;
        const int ione = 1;
        int Zrw = Z.nRows(), Zcl = Z.nCols();

        gemv_f77("N", &Zrw, &Zcl, &one, Z.data, &Zrw, X.data, &ione,
                 &cone, data, &ione);
}

/**
 * Specialized copy function for deci complex types with BLAS
 * @param X Right-hand side vector
 */
template <>
void Vector<cplx>::copy(const Vector &X)
{
        // check dimensions
        assert(X.size() == size());

        // cblas_zcopy(size, X.data, 1, data, 1);
        memcpy(data, X.data, size()*sizeof(cplx));
}

/**
 * Print vector elements to the output stream
 * @param os Output stream to add to
 * @param V Vector to print
 * @return Output stream with the vector elements
 */
template <>
std::ostream& operator<<(std::ostream& os, const Vector<cplx>& V)
{
        int oldPrec = os.precision();
        os.precision(15);
        for (int r = 0; r < V.size(); r++) {
                cplx el = V.data[r];
                os << real(el) << "\t" << imag(el) << endl;
        }
        os.precision(oldPrec);
        return os;
}

template <>
std::istream& operator>>(std::istream& is, const Vector<cplx>& V)
{
        for (int r = 0; r < V.size(); r++) {
                double real, imag;
                is >> real >> imag;
                V.data[r] = cplx(real, imag);
        }
        return is;
}

/**
 * Print vector elements to the output stream
 * @param os Output stream to add to
 * @param V Vector to print
 * @return Output stream with the vector elements
 */
template <>
std::ostream& operator<<(std::ostream& os, const Vector<deci>& V)
{
        int oldPrec = os.precision();
        os.precision(15);
        for (int r = 0; r < V.size(); r++)
                os << V.data[r] << endl;
        os.precision(oldPrec);
        return os;
}

// ===========================================================================
// TESTROUTINES FOR MATRICES AND VECTORS
// ===========================================================================

void testMatrixClass(int m, int n)
{
        cout << "size of Matrix: " << sizeof(Matrix<cplx>) << endl;

        Matrix<cplx> A(m, n);
        for (int r = 0; r < m; r++)
                for(int c = 0; c < n; c++)
                        A(r, c) = complex<deci>(r, c);

        cout << "Testing constructor A:" << endl << A << endl;

        Matrix<cplx> B(A);
        cout << "Testing copy constructor B(A):" << endl << B << endl;

        B = A;
        cout << "Testing equal sign B = A:" << endl << B << endl;

        Matrix<cplx> D = A + B;
        cout << "Testing matrix multiplication D = A+B:" << endl << D << endl;

        D = A - B;
        cout << "Testing matrix multiplication D = A-B:" << endl << D << endl;

        Matrix<cplx> C(n,m);
        C.fill(cplx(1, -1));
        cout << "Testing fill element C = 1-I:" << endl << C << endl;

        D = B * C;
        cout << "Testing matrix multiplication D = B*C:" << endl << D << endl;

        D.gemm(B, C);
        cout << "Testing BLAS matrix multiplication:" << endl << D << endl;

        Matrix<cplx> E(n,n);
        for (int r = 0; r < n; r++)
                E(r, r) = complex<deci>(r+1, 0);

        cout << "Matrix E:" << endl << E << endl;
        C = E;
        E.invert();
        cout << "Testing inverse E * inv(E)" << endl << C * E << endl;

        Matrix<cplx> Q;
        Q.setDimensions(2, 4);
        Q.allocateMemory(0);


        Vector<cplx> X(n);
        for (int r = 0; r < n; r++)
                X(r) = cplx(r, 2*r);
        Vector<cplx> Y(m);

        Y = C*X;
        cout << "Testing matvec" << endl << Y << endl;

        Y.gemv(C, X);
        cout << "Testing BLAS matvec" << endl << Y << endl;

        Vector<cplx>::solve(C, X, Y);
        cout << "Solving system" << endl << Y << endl;

        cout << "Check: " << endl << E*X << endl;
}

void testVectorClass(int n)
{
        cout << "size of Vector: " << sizeof(Vector<cplx>) << endl;

        Vector<cplx> A(n);
        for (int r = 0; r < n; r++)
                A(r) = complex<deci>(r);

        cout << "Testing constructor A:" << endl << A << endl;

        Vector<cplx> B(A);
        cout << "Testing copy constructor B(A):" << endl << B << endl;

        B = A;
        cout << "Testing equal sign B = A:" << endl << B << endl;

        B.copy(A);
        cout << "Testing copy B = A:" << endl << B << endl;

        Vector<cplx> D = A + B;
        cout << "Testing vector addition D = A+B:" << endl << D << endl;

        D = A - B;
        cout << "Testing vector subtraction D = A-B:" << endl << D << endl;

        Vector<cplx> C(n);
        C.fill(cplx(1, -1));
        cout << "Testing fill element C = 1-I:" << endl << C << endl;
}

void timeMatrixClass(int m, int p, int n, int number)
{
        Matrix<cplx> A(m, p);
        Matrix<cplx> B(p, n);
        Matrix<cplx> C(m, n);
        Vector<cplx> Y(m);
        Vector<cplx> X(p);

        cout << "Starting benchmarking m = " << m << ", p = " << p << ", n = "
                        << n << endl << endl;
        Util::startChrono();
        cout << "Performing benchmark MATRIX-MATRIX" << endl;
        C.gemm(A, B);

        Util::startChrono();
        for (int i = 0; i < number; i++)
                C.gemm(A, B);
        cout << "\tBlas time: " << Util::stopChrono() << endl;

        Util::startChrono();
        for (int i = 0; i < number; i++)
                C = A * B;
        cout << "\tOperator overloading time: " << Util::stopChrono() << endl;

        cout << "Performing benchmark MATRIX-VECTOR" << endl;
        Y.gemv(A, X);

        Util::startChrono();
        for (int i = 0; i < p*number; i++)
                Y.gemv(A, X);
        cout << "\tBlas time: " << Util::stopChrono() << endl;

        Util::startChrono();
        for (int i = 0; i < p*number; i++)
                Y = A * X;
        cout << "\tOperator overloading time: " << Util::stopChrono() << endl;

        cout << "Performing benchmark MATRIX-VECTOR (2)" << endl;
        Y.geamv(A, X);

        Util::startChrono();
        for (int i = 0; i < p*number; i++)
                Y.geamv(A, X);
        cout << "\tBlas time: " << Util::stopChrono() << endl;

        Util::startChrono();
        for (int i = 0; i < p*number; i++)
                Y = Y + A * X;
        cout << "\tOperator overloading time: " << Util::stopChrono() << endl;

        cout << "Performing benchmark VECTOR COPY" << endl;
        Y = X;

        Util::startChrono();
        for (int i = 0; i < n*m*number; i++)
                Y.copy(X);
        cout << "\tBlas time: " << Util::stopChrono() << endl;

        Util::startChrono();
        for (int i = 0; i < n*m*number; i++)
                Y = X;
        cout << "\tOperator overloading time: " << Util::stopChrono() << endl;

        cout << endl << "Total benchmark time: " << Util::stopChrono() << endl;
}
