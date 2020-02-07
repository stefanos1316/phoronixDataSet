      SUBROUTINE DECODE(RHO,C,S)
      IMPLICIT NONE
*     .. Scalar Arguments ..
      DOUBLE COMPLEX C,RHO,S
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS,SQRT
*     ..
*     .. Parameters ..
      DOUBLE PRECISION ONE
      PARAMETER (ONE=1.0D0)
      DOUBLE COMPLEX ZZERO
      PARAMETER (ZZERO= (0.0D0,0.0D0))
      DOUBLE COMPLEX ZONE
      PARAMETER (ZONE= (1.0D0,0.0D0))
*     ..
      IF (RHO.EQ.ZONE) THEN
          C = ZZERO
          S = ZONE

      ELSE IF (ABS(RHO).LT.ONE) THEN
          S = 2.0*RHO
          C = SQRT(ZONE-S**2)

      ELSE
          C = 2.0/RHO
          S = SQRT(ZONE-C**2)
      END IF

      RETURN

      END
