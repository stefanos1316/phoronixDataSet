      SUBROUTINE PIMZCG(X,B,WRK,IPAR,DPAR,MATVEC,PRECONL,PRECONR,PZSUM,
     +                  PDZNRM,PROGRESS)
      IMPLICIT NONE

*           PIM -- The Parallel Iterative Methods package
*           ---------------------------------------------
*
*                      Rudnei Dias da Cunha
*     National Supercomputing Centre and Mathematics Institute
*         Universidade Federal do Rio Grande do Sul, Brasil
*
*                          Tim Hopkins
*     Computing Laboratory, University of Kent at Canterbury, U.K.
*
* ----------------------------------------------------------------------
*
*     .. Parameters ..
      DOUBLE PRECISION ONE
      PARAMETER (ONE=1.0D0)
      DOUBLE COMPLEX ZZERO
      PARAMETER (ZZERO= (0.0D0,0.0D0))
      DOUBLE COMPLEX ZONE
      PARAMETER (ZONE= (1.0D0,0.0D0))
      INTEGER IPARSIZ
      PARAMETER (IPARSIZ=13)
      INTEGER DPARSIZ
      PARAMETER (DPARSIZ=2)
*     ..
*     .. Array Arguments ..
      DOUBLE COMPLEX B(*),WRK(*),X(*)
      DOUBLE PRECISION DPAR(DPARSIZ)
      INTEGER IPAR(IPARSIZ)
*     ..
*     .. Subroutine Arguments ..
      EXTERNAL MATVEC,PRECONL,PRECONR,PROGRESS,PZSUM,PDZNRM
*     ..
*     .. Local Scalars ..
      DOUBLE COMPLEX ALPHA,BETA,DELTA,RDOTR,RDOTR0,XI
      DOUBLE PRECISION EPSILON,EXITNORM,RHSSTOP
      INTEGER BASISDIM,BLKSZ,CNVRTX,IP,IR,IS,ITNO,IW,IXOLD,IZ,LDA,
     +        LOCLEN,MAXIT,N,NPROCS,PRECONTYPE,PROCID,STATUS,STEPERR,
     +        STOPTYPE
*     ..
*     .. Local Arrays ..
      DOUBLE COMPLEX DOTS(2)
*     ..
*     .. External Functions ..
      DOUBLE COMPLEX ZDOTC
      DOUBLE PRECISION DZSETRHSSTOP
      EXTERNAL ZDOTC,DZSETRHSSTOP
*     ..
*     .. External Subroutines ..
      EXTERNAL PIMDGETPAR,STOPCRIT,ZAXPY,ZCOPY
*     ..
      CALL PIMDGETPAR(IPAR,DPAR,LDA,N,BLKSZ,LOCLEN,BASISDIM,NPROCS,
     +                PROCID,PRECONTYPE,STOPTYPE,MAXIT,ITNO,STATUS,
     +                STEPERR,EPSILON,EXITNORM)

*  Check consistency of preconditioning and stop types
      IF (((PRECONTYPE.EQ.0).OR. (PRECONTYPE.EQ.2)) .AND.
     +    (STOPTYPE.EQ.6)) THEN
          ITNO = 0
          STATUS = -4
          STEPERR = 0
          GO TO 9999

      END IF

*  Does not need conversion Y=Q2X for residual
      CNVRTX = 0

*  Set indices for mapping local vectors into wrk
      IR = 1
      IP = IR + LOCLEN
      IW = IP + LOCLEN
      IZ = IW + LOCLEN
      IS = IZ + LOCLEN
      IXOLD = IS + LOCLEN

*  Set rhs of stopping criteria
      RHSSTOP = DZSETRHSSTOP(B,WRK(IR),EPSILON,IPAR,PRECONL,PDZNRM)

*  1. r=Q1(b-AQ2x)
      IF (STOPTYPE.NE.6) THEN
          IF (PRECONTYPE.EQ.0) THEN
*     r=b-Ax
              CALL ZCOPY(LOCLEN,B,1,WRK(IR),1)
              CALL MATVEC(X,WRK(IW),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IW),1,WRK(IR),1)

          ELSE IF (PRECONTYPE.EQ.1) THEN
*     r=Q1(b-Ax)
              CALL ZCOPY(LOCLEN,B,1,WRK(IZ),1)
              CALL MATVEC(X,WRK(IW),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IW),1,WRK(IZ),1)
              CALL PRECONL(WRK(IZ),WRK(IR),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
*     r=b-AQ2x
              CALL ZCOPY(LOCLEN,B,1,WRK(IR),1)
              CALL PRECONR(X,WRK(IW),IPAR)
              CALL MATVEC(WRK(IW),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IR),1)

          ELSE IF (PRECONTYPE.EQ.3) THEN
*     r=Q1(b-AQ2x)
              CALL ZCOPY(LOCLEN,B,1,WRK(IP),1)
              CALL PRECONR(X,WRK(IW),IPAR)
              CALL MATVEC(WRK(IW),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IP),1)
              CALL PRECONL(WRK(IP),WRK(IR),IPAR)
          END IF

      ELSE
*     r has been set to Qb in the call to dsetrhsstop
          IF (PRECONTYPE.EQ.1) THEN
*     r=Q1(b-Ax)
              CALL MATVEC(X,WRK(IW),IPAR)
              CALL PRECONL(WRK(IW),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IR),1)

          ELSE IF (PRECONTYPE.EQ.3) THEN
*     r=Q1(b-AQ2x)
              CALL PRECONR(X,WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IW),IPAR)
              CALL PRECONL(WRK(IW),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IR),1)
          END IF

      END IF

*  2. p=r
      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IP),1)

*  3. rdotr=dot(r,r)
      DOTS(1) = ZDOTC(LOCLEN,WRK(IR),1,WRK(IR),1)
      CALL PZSUM(1,DOTS,IPAR)
      RDOTR = DOTS(1)

*  4. w=Q1AQ2p
      IF (PRECONTYPE.EQ.0) THEN
          CALL MATVEC(WRK(IP),WRK(IW),IPAR)

      ELSE IF (PRECONTYPE.EQ.1) THEN
          CALL MATVEC(WRK(IP),WRK(IZ),IPAR)
          CALL PRECONL(WRK(IZ),WRK(IW),IPAR)

      ELSE IF (PRECONTYPE.EQ.2) THEN
          CALL PRECONR(WRK(IP),WRK(IZ),IPAR)
          CALL MATVEC(WRK(IZ),WRK(IW),IPAR)

      ELSE IF (PRECONTYPE.EQ.3) THEN
          CALL PRECONR(WRK(IP),WRK(IW),IPAR)
          CALL MATVEC(WRK(IW),WRK(IZ),IPAR)
          CALL PRECONL(WRK(IZ),WRK(IW),IPAR)
      END IF

*  5. xi=dot(p,w)
      DOTS(1) = ZDOTC(LOCLEN,WRK(IP),1,WRK(IW),1)
      CALL PZSUM(1,DOTS,IPAR)
      XI = DOTS(1)

*  Loop
      STATUS = 0
      EXITNORM = -ONE
      STEPERR = -1
      DO 20 ITNO = 1,MAXIT

*  6. alpha=rdotr/xi
          IF (XI.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 6
              GO TO 9999

          END IF

          ALPHA = RDOTR/XI

*  7. x=x+alpha*p
          CALL ZCOPY(LOCLEN,X,1,WRK(IXOLD),1)
          CALL ZAXPY(LOCLEN,ALPHA,WRK(IP),1,X,1)

*  8. r=r-alpha*w
          CALL ZAXPY(LOCLEN,-ALPHA,WRK(IW),1,WRK(IR),1)

*  9. check stopping criterion
          CALL STOPCRIT(B,WRK(IR),WRK(IZ),X,WRK(IXOLD),WRK(IS),RHSSTOP,
     +                  CNVRTX,EXITNORM,STATUS,IPAR,MATVEC,MATVEC,
     +                  PRECONR,PZSUM,PDZNRM)

*  Call monitoring routine
          CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IR),WRK(IZ))

          IF (STATUS.EQ.0) THEN
              GO TO 9999
          END IF

* 10. s=Q1AQ2r
          IF (PRECONTYPE.EQ.0) THEN
              CALL MATVEC(WRK(IR),WRK(IS),IPAR)

          ELSE IF (PRECONTYPE.EQ.1) THEN
              CALL MATVEC(WRK(IR),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IS),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
              CALL PRECONR(WRK(IR),WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IS),IPAR)

          ELSE IF (PRECONTYPE.EQ.3) THEN
              CALL PRECONR(WRK(IR),WRK(IS),IPAR)
              CALL MATVEC(WRK(IS),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IS),IPAR)
          END IF

* 11. rdotr=dot(r,r)
          RDOTR0 = RDOTR
          DOTS(1) = ZDOTC(LOCLEN,WRK(IR),1,WRK(IR),1)

* 12. delta=dot(r,s)
          DOTS(2) = ZDOTC(LOCLEN,WRK(IR),1,WRK(IS),1)

*  Accumulate simultaneously partial values
          CALL PZSUM(2,DOTS,IPAR)
          RDOTR = DOTS(1)
          DELTA = DOTS(2)

* 13. beta=rdotr/rdotr0
          IF (RDOTR0.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 13
              GO TO 9999

          END IF

          BETA = RDOTR/RDOTR0

* 14. p=r+beta*p
          CALL ZCOPY(LOCLEN,WRK(IP),1,WRK(IZ),1)
          CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IP),1)
          CALL ZAXPY(LOCLEN,BETA,WRK(IZ),1,WRK(IP),1)

* 15. w=s+beta*w
          CALL ZCOPY(LOCLEN,WRK(IW),1,WRK(IZ),1)
          CALL ZCOPY(LOCLEN,WRK(IS),1,WRK(IW),1)
          CALL ZAXPY(LOCLEN,BETA,WRK(IZ),1,WRK(IW),1)

* 16. xi=delta-beta^2*xi
          XI = DELTA - BETA**2*XI

   20 CONTINUE

      IF (ITNO.GT.MAXIT) THEN
          STATUS = -1
          ITNO = MAXIT
      END IF

 9999 CONTINUE

      IF ((PRECONTYPE.EQ.2) .OR. (PRECONTYPE.EQ.3)) THEN
          CALL ZCOPY(LOCLEN,X,1,WRK(IZ),1)
          CALL PRECONR(WRK(IZ),X,IPAR)
      END IF

*  Set output parameters
      IPAR(11) = ITNO
      IPAR(12) = STATUS
      IPAR(13) = STEPERR
      DPAR(2) = EXITNORM

      RETURN

      END
