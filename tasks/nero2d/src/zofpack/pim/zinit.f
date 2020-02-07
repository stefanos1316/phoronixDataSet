      SUBROUTINE ZINIT(N,ALPHA,CX,INCX)
      IMPLICIT NONE

*     Initialises a vector x with a scalar alpha.
*     Modified from scopy, BLAS Level 1.
*     Rudnei Dias da Cunha, 14/6/93.
*

*     copies a vector, x, to a vector, y.
*     uses unrolled loops for increments equal to one.
*     jack dongarra, linpack, 3/11/78.
*
*
*     .. Scalar Arguments ..
      DOUBLE COMPLEX ALPHA
      INTEGER INCX,N
*     ..
*     .. Array Arguments ..
      DOUBLE COMPLEX CX(*)
*     ..
*     .. Local Scalars ..
      INTEGER I,IX,M,MP1
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC MOD
*     ..
      IF (N.LE.0) RETURN
      IF (INCX.EQ.1) GO TO 20
*
*        code for unequal increments or equal increments
*          not equal to 1
*
      IX = 1
      IF (INCX.LT.0) IX = (-N+1)*INCX + 1
      DO 10 I = 1,N
          CX(IX) = ALPHA
          IX = IX + INCX
   10 CONTINUE
      RETURN
*
*        code for both increments equal to 1
*
*
*        clean-up loop
*
   20 M = MOD(N,7)
      IF (M.EQ.0) GO TO 40
      DO 30 I = 1,M
          CX(I) = ALPHA
   30 CONTINUE
      IF (N.LT.7) RETURN
   40 MP1 = M + 1
      DO 50 I = MP1,N,7
          CX(I) = ALPHA
          CX(I+1) = ALPHA
          CX(I+2) = ALPHA
          CX(I+3) = ALPHA
          CX(I+4) = ALPHA
          CX(I+5) = ALPHA
          CX(I+6) = ALPHA
   50 CONTINUE
      RETURN

      END
