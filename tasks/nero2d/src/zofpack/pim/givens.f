      SUBROUTINE GIVENS(A,B,C,S)
      IMPLICIT NONE
*     .. Scalar Arguments ..
      DOUBLE COMPLEX A,B,C,S
*     ..
*     .. Local Scalars ..
      DOUBLE COMPLEX TAU
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS,SQRT
*     ..
*     .. Parameters ..
      DOUBLE COMPLEX ZZERO
      PARAMETER (ZZERO= (0.0D0,0.0D0))
      DOUBLE COMPLEX ZONE
      PARAMETER (ZONE= (1.0D0,0.0D0))
*     ..
      IF (B.EQ.ZZERO) THEN
          C = ZONE
          S = ZZERO

      ELSE IF (ABS(B).GT.ABS(A)) THEN
          TAU = -A/B
          S = ZONE/SQRT(ZONE+TAU**2)
          C = S*TAU

      ELSE
          TAU = -B/A
          C = ZONE/SQRT(ZONE+TAU**2)
          S = C*TAU
      END IF

      RETURN

      END
