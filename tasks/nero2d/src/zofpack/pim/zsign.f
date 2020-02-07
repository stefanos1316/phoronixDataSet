      DOUBLE COMPLEX FUNCTION ZSIGN(X)
      IMPLICIT NONE
*     .. Scalar Arguments ..
      DOUBLE COMPLEX X
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS
*     ..
      ZSIGN = X/ABS(X)
      RETURN

      END
