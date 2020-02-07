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

#ifndef BASENERO_H
#define BASENERO_H

#ifdef HAVE_CONFIG_H
        #include <config.h>
#endif

#include "nexus/pubbase.h"
#include <cassert>
#include <fftw3.h>
#include <complex>

typedef std::complex<double> dcomplex;

// ============================================================================
// BLAS FUNCTION PROTOTYPES
// ============================================================================

#ifdef USE_FLOAT
        #define copy_f77 F77_FUNC (ccopy, CCOPY)
        #define gemv_f77 F77_FUNC (cgemv, CGEMV)
        #define gemm_f77 F77_FUNC (cgemm, CGEMM)
        #define axpy_f77 F77_FUNC (caxpy, CAXPY)
        #define trmv_f77 F77_FUNC (ctrmv, CTRMV)
        #define trsv_f77 F77_FUNC (ctrsv, CTRSV)
        #define scal_f77 F77_FUNC (cscal, CSCAL)
#else
        #define copy_f77 F77_FUNC (zcopy, ZCOPY)
        #define gemv_f77 F77_FUNC (zgemv, ZGEMV)
        #define gemm_f77 F77_FUNC (zgemm, ZGEMM)
        #define axpy_f77 F77_FUNC (zaxpy, ZAXPY)
        #define trmv_f77 F77_FUNC (ztrmv, ZTRMV)
        #define trsv_f77 F77_FUNC (ztrsv, ZTRSV)
        #define scal_f77 F77_FUNC (zscal, ZSCAL)
#endif

// copy content of X to Y
extern "C" void copy_f77(const int *N, const void *X, const int *incx,
                         void *Y, const int *incy);
// general matrix-vector multiplication
extern "C" void gemv_f77(const char* transA, const int *M, const int *N,
                         const void *alpha, const void *A, const int *lda,
                         const void *X, const int *incx, const void *beta,
                         void *Y, const int *incy);
// general matrix-matrix multiplication
extern "C" void gemm_f77(const char* transA, const char* transB, const int* M,
                         const int* N, const int* K, const void* alpha,
                         const void* A, const int* lda, const void *B,
                         const int *ldb, const void *beta, void *C,
                         const int*ldc);
// triangular matrix-vector multiplication
extern "C" void trmv_f77(const char* upLo, const char* transA,
                         const char* diag, const int *N, const void *A,
                         const int *lda, const void *X, const int *incx);
// triangular matrix-vector multiplication
extern "C" void trsv_f77(const char* upLo, const char* transA,
                         const char* diag, const int *N, const void *A,
                         const int *lda, const void *X, const int *incx);
// adding a scaled vector to another
extern "C" void axpy_f77(const int *n, const void *alpha, const void *X,
                         const int *incx, const void *Y, const int *incy);
// scaling of a vector
extern "C" void scal_f77(const int *n, const void *alpha, const void *X,
                         const int *incx);

// ============================================================================
// LAPACK FUNCTION PROTOTYPES
// ============================================================================

#ifdef USE_FLOAT
        #define  gesv_f77 F77_FUNC (cgesv,  CGESV)
        #define getrf_f77 F77_FUNC (cgetrf, CGETRF)
        #define getri_f77 F77_FUNC (cgetri, CGETRI)
        #define geqpf_f77 F77_FUNC (cgeqpf, CGEQPF)
        #define ungqr_f77 F77_FUNC (cungqr, CUNGQR)
        #define gesvd_f77 F77_FUNC (cgesvd, CGESVD)
#else
        #define  gesv_f77 F77_FUNC (zgesv,  ZGESV)
        #define getrf_f77 F77_FUNC (zgetrf, ZGETRF)
        #define getri_f77 F77_FUNC (zgetri, ZGETRI)
        #define geqpf_f77 F77_FUNC (zgeqpf, ZGEQPF)
        #define ungqr_f77 F77_FUNC (zungqr, ZUNGQR)
        #define gesvd_f77 F77_FUNC (zgesvd, ZGESVD)
#endif

// solve equation Zx = y and store result in y
extern "C" void gesv_f77(int*, int*, void*, int*, int*, void*, int*, int* );
// calculates the LU deciomposition of an m x n matrix
extern "C" void getrf_f77(const int *m, const int *n, cplx *A, const int *lda,
                          int *ipivot, int *info);
// calculates the inverse of an n x n matrix A using its LU deciomposition
extern "C" void getri_f77(const int *n, cplx *A, const int *lda, int *ipivot,
                          cplx *work, int *lwork, int *info);
// calculation the QR factorization of matrix
extern "C" int geqpf_f77(int *m, int *n, cplx *A, int *lda, int *jpvt,
                         cplx *tau, cplx *work, deci *rwork, int *info);
// creates a Q matrix resulting for QR factorization in zqepqf
extern "C" int ungqr_f77(int *m, int *n, int *k, cplx *A, int *lda, cplx *tau,
                         cplx *work, int *lwork, int *info);
// calculates the singular value decomposition of a matrix
extern "C" void gesvd_f77(char *jobu, char *jobvt, int *m, int *n,
                          cplx *A, int *lda, deci *s, cplx *U,
                          int *ldu, cplx *Vt, int *ldvt, cplx *work,
                          int *lwork, deci *rwork, int *info);

// ===========================================================================
// PARALLEL ITERATIVE METHODS (PIM) PROTOTYPES
// ===========================================================================

#ifdef USE_FLOAT
        #define pim_setpar_f77 F77_FUNC (pimssetpar, PIMSSETPAR)
        #define init_f77 F77_FUNC (cinit, CINIT)
        #define pim_tfqmr2_f77 F77_FUNC (pimctfqmr2, PIMCTFQMR2)
        #define pim_bicgstab_f77 F77_FUNC (pimcbicgstab, PIMCBICGSTAB)
        #define pim_rgmres_f77 F77_FUNC (pimcrgmres, PIMCRGMRES)
#else
        #define pim_setpar_f77 F77_FUNC (pimdsetpar, PIMDSETPAR)
        #define init_f77 F77_FUNC (zinit, ZINIT)
        #define pim_tfqmr2_f77 F77_FUNC (pimztfqmr2, PIMZTFQMR2)
        #define pim_bicgstab_f77 F77_FUNC (pimzbicgstab, PIMZBICGSTAB)
        #define pim_rgmres_f77 F77_FUNC (pimzrgmres, PIMZRGMRES)
#endif

// set parameters for iterative solving
extern "C" void pim_setpar_f77(int *ipar, deci *dpar, int *lda, int *n,
                               int *blksz, int *loclen, int *basisdim,
                               int *nprocs, int *procid, int *precontype,
                               int *stoptype, int *maxit, deci *epsilon);
// initialises a vector of length n with value alpha
extern "C" void init_f77(int *n, cplx *alpha, cplx *x, int *incx);
// iterative solving using tfqmr
extern "C" void pim_tfqmr2_f77(cplx *X, const cplx *B, cplx *WRK,
                              int *IPAR, deci *DPAR,
                              void (*matvec_)(cplx *, cplx *, int *),
                              void (*preconl_)(cplx *, cplx *, int *),
                              void (*preconr_)(cplx *, cplx *, int *),
                              void (*pzsum_)(int *, cplx *, int *),
                              void (*pdznrm)(deci*, int *, const cplx *, int *),
                              void (*progress)(int *, deci *, deci *),
                              int*);
// iterative solving using bi-cgstab
extern "C" void pim_bicgstab_f77(cplx *X, const cplx *B, cplx *WRK,
                                 int *IPAR, deci *DPAR,
                                 void (*matvec_)(cplx *, cplx *, int *),
                                 void (*preconl)(cplx *, cplx *, int *),
                                 void (*preconr)(cplx *, cplx *, int *),
                                 void (*pzsum_)(int *, cplx *, int *),
                                 void (*pdznrm)(deci *, int *, const cplx *,
                                 int *), void (*progress)(int *, int *, deci *,
                                 cplx *, cplx *, cplx *));
// iterative solving using restarted-gmres
extern "C" void pim_rgmres_f77(cplx *X, const cplx *B, cplx *WRK,
                               int *IPAR, deci *DPAR,
                               void (* matvec_)(cplx *, cplx *, int *),
                               void (*preconl_)(cplx *, cplx *, int *),
                               void (*preconr_)(cplx *, cplx *, int *),
                               void (*pzsum_)(int *, cplx *, int *),
                               void (*pdznrm)(deci*, int *, const cplx *,
                               int *), void (*progress)(int *, int *, deci *,
                               cplx *, cplx *, cplx *));

// ===========================================================================
// FFTW
// ===========================================================================

#ifdef USE_FLOAT
        typedef fftwf_complex fft_complex;
        typedef fftwf_plan fft_plan;
        #define fft_free fftwf_free
        #define fft_destroy_plan fftwf_destroy_plan
        #define fft_plan_dft_1d fftwf_plan_dft_1d
        #define fft_malloc fftwf_malloc
        #define fft_execute_dft fftwf_execute_dft
        #define fft_execute fftwf_execute
        #define fft_flops fftwf_flops
        #define fft_plan_many_dft fftwf_plan_many_dft
#else
        typedef fftw_complex fft_complex;
        typedef fftw_plan fft_plan;
        #define fft_free fftw_free
        #define fft_destroy_plan fftw_destroy_plan
        #define fft_plan_dft_1d fftw_plan_dft_1d
        #define fft_malloc fftw_malloc
        #define fft_execute_dft fftw_execute_dft
        #define fft_execute fftw_execute
        #define fft_flops fftw_flops
        #define fft_plan_many_dft fftw_plan_many_dft
#endif

#endif
