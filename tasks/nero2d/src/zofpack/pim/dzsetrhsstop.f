      DOUBLE PRECISION FUNCTION DZSETRHSSTOP(B,WRK,EPSILON,IPAR,PRECONL,
     +                 PDZNRM)
      IMPLICIT NONE

*     .. Scalar Arguments ..
      DOUBLE PRECISION EPSILON
*     ..
*     .. Array Arguments ..
      DOUBLE COMPLEX B(*),WRK(*)
      INTEGER IPAR(*)
*     ..
*     .. Subroutine Arguments ..
      EXTERNAL PRECONL,PDZNRM
*     ..
*     .. Local Scalars ..
      INTEGER LOCLEN,STOPTYPE
*     ..
      LOCLEN = IPAR(4)
      STOPTYPE = IPAR(9)
      IF ((STOPTYPE.EQ.1) .OR. (STOPTYPE.EQ.4) .OR.
     +    (STOPTYPE.EQ.7)) THEN
*  ||r||<epsilon or ||Q1r||<epsilon ||x(k)-x(k-1)||<epsilon
          DZSETRHSSTOP = EPSILON

      ELSE IF ((STOPTYPE.EQ.2) .OR. (STOPTYPE.EQ.3) .OR.
     +         (STOPTYPE.EQ.5)) THEN
*  ||r||<epsilon||b|| or sqrt(r(Q1r))<epsilon||b|| or
*  ||Q1r||<epsilon||b||
          CALL PDZNRM(DZSETRHSSTOP,LOCLEN,B,IPAR)
          DZSETRHSSTOP = EPSILON*DZSETRHSSTOP

      ELSE IF (STOPTYPE.EQ.6) THEN
*  ||Q1r||<epsilon||Q1b||
          CALL PRECONL(B,WRK,IPAR)
          CALL PDZNRM(DZSETRHSSTOP,LOCLEN,WRK,IPAR)
          DZSETRHSSTOP = EPSILON*DZSETRHSSTOP
      END IF

      RETURN

      END
