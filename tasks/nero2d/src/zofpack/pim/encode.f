      SUBROUTINE ENCODE(RHO,C,S)
      IMPLICIT NONE
*     .. Scalar Arguments ..
      DOUBLE COMPLEX C,RHO,S
*     ..
*     .. External Functions ..
      DOUBLE COMPLEX ZSIGN
      EXTERNAL ZSIGN
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS
*     ..
*     .. Parameters ..
      DOUBLE COMPLEX ZZERO
      PARAMETER (ZZERO= (0.0D0,0.0D0))
      DOUBLE COMPLEX ZONE
      PARAMETER (ZONE= (1.0D0,0.0D0))
*     ..
      IF (C.EQ.ZZERO) THEN
          RHO = ZONE

      ELSE IF (ABS(S).LT.ABS(C)) THEN
          RHO = ZSIGN(C)*S/2.0

      ELSE
          RHO = 2.0*ZSIGN(S)/C
      END IF

      RETURN

      END
