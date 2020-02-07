      SUBROUTINE STOPCRIT(B,R,RTRUE,X,XOLD,WRK,RHSSTOP,CNVRTX,EXITNORM,
     +                    STATUS,IPAR,MATVEC,TMATVEC,PRECONR,PZSUM,
     +                    PDZNRM)
      IMPLICIT NONE

*     .. Scalar Arguments ..
      DOUBLE PRECISION EXITNORM,RHSSTOP
      INTEGER CNVRTX,STATUS
*     ..
*     .. Array Arguments ..
      DOUBLE COMPLEX B(*),R(*),RTRUE(*),WRK(*),X(*),XOLD(*)
      INTEGER IPAR(*)
*     ..
*     .. Subroutine Arguments ..
      EXTERNAL MATVEC,PRECONR,PZSUM,TMATVEC
*     ..
*     .. Local Scalars ..
      INTEGER LOCLEN,PRECONTYPE,STOPTYPE
*     ..
*     .. Local Arrays ..
      DOUBLE COMPLEX DOTS(1)
*     ..
*     .. External Functions ..
      DOUBLE COMPLEX ZDOTC
      EXTERNAL ZDOTC
*     ..
*     .. External Subroutines ..
      EXTERNAL ZAXPY,ZCOPY
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS,SQRT
*     ..
*     .. Parameters ..
      DOUBLE COMPLEX ZONE
      PARAMETER (ZONE= (1.0D0,0.0D0))
*     ..
      LOCLEN = IPAR(4)
      PRECONTYPE = IPAR(8)
      STOPTYPE = IPAR(9)

      IF ((STOPTYPE.EQ.1) .OR. (STOPTYPE.EQ.2) .OR.
     +    (STOPTYPE.EQ.3)) THEN

*  Compute true residual if needed
          CALL ZCOPY(LOCLEN,B,1,RTRUE,1)

          IF ((PRECONTYPE.EQ.2) .OR. (PRECONTYPE.EQ.3)) THEN
              CALL PRECONR(X,WRK,IPAR)
              IF (CNVRTX.EQ.1) THEN
                  CALL TMATVEC(WRK,XOLD,IPAR)
                  CALL MATVEC(XOLD,WRK,IPAR)
                  CALL ZAXPY(LOCLEN,-ZONE,WRK,1,RTRUE,1)
              ELSE
                  CALL MATVEC(WRK,XOLD,IPAR)
                  CALL ZAXPY(LOCLEN,-ZONE,XOLD,1,RTRUE,1)
              END IF
          ELSE IF (CNVRTX.EQ.1) THEN
              CALL TMATVEC(X,XOLD,IPAR)
              CALL MATVEC(XOLD,WRK,IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK,1,RTRUE,1)
          ELSE
              CALL MATVEC(X,WRK,IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK,1,RTRUE,1)
          END IF
      END IF

      IF ((STOPTYPE.EQ.1) .OR. (STOPTYPE.EQ.2)) THEN

*  ||r||<epsilon or ||r||<epsilon||b||
          CALL PDZNRM(EXITNORM,LOCLEN,RTRUE,IPAR)
          IF (EXITNORM.LT.RHSSTOP) THEN
              STATUS = 0
          ELSE
              STATUS = -99
          END IF

      ELSE IF (STOPTYPE.EQ.3) THEN

*  sqrt(r(Q1r))<epsilon||b||
          DOTS(1) = ZDOTC(LOCLEN,RTRUE,1,R,1)
          CALL PZSUM(1,DOTS(1),IPAR)

          EXITNORM = ABS(SQRT(DOTS(1)))
          IF (EXITNORM.LT.RHSSTOP) THEN
              STATUS = 0
          ELSE
              STATUS = -99
          END IF

      ELSE IF ((STOPTYPE.EQ.4) .OR. (STOPTYPE.EQ.5) .OR.
     +         (STOPTYPE.EQ.6)) THEN

*  ||Q1r||<epsilon or ||Q1r||<epsilon||b|| or ||Q1r||<epsilon||Q1b||
          CALL PDZNRM(EXITNORM,LOCLEN,R,IPAR)
          IF (EXITNORM.LT.RHSSTOP) THEN
              STATUS = 0
          ELSE
              STATUS = -99
          END IF

      ELSE IF (STOPTYPE.EQ.7) THEN

*  ||x-x0||<epsilon
          CALL ZCOPY(LOCLEN,X,1,WRK,1)
          CALL ZAXPY(LOCLEN,-ZONE,XOLD,1,WRK,1)
          CALL PDZNRM(EXITNORM,LOCLEN,WRK,IPAR)
          IF (EXITNORM.LT.RHSSTOP) THEN
              STATUS = 0
          ELSE
              STATUS = -99
          END IF
      END IF

      RETURN

      END
