      SUBROUTINE PIMZCHEBYSHEV(X,B,WRK,IPAR,DPAR,MATVEC,PRECONL,PRECONR,
     +                         PZSUM,PDZNRM,PROGRESS)
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
      DOUBLE PRECISION ZERO
      PARAMETER (ZERO=0.0D0)
      DOUBLE COMPLEX ZONE
      PARAMETER (ZONE= (1.0D0,0.0D0))
      DOUBLE PRECISION ONE
      PARAMETER (ONE=1.0D0)
      DOUBLE PRECISION TWO
      PARAMETER (TWO=2.0)
      INTEGER IPARSIZ
      PARAMETER (IPARSIZ=13)
      INTEGER DPARSIZ
      PARAMETER (DPARSIZ=6)
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
      DOUBLE PRECISION AXISISQ,AXISRSQ,D,DELTA,EPSILON,EXITNORM,GAMMA,
     +                 LENGTHI,LENGTHR,RHO,RHSSTOP,SIGMA,SIGMASQ
      INTEGER BASISDIM,BLKSZ,CNVRTX,IK,IR,ITNO,IW,IXOLD,IZ,LDA,LOCLEN,
     +        MAXIT,N,NPROCS,PRECONTYPE,PROCID,STATUS,STEPERR,STOPTYPE
*     ..
*     .. External Functions ..
      DOUBLE PRECISION DZSETRHSSTOP
      EXTERNAL DZSETRHSSTOP
*     ..
*     .. External Subroutines ..
      EXTERNAL PIMDGETPAR,STOPCRIT,ZAXPY,ZCOPY,ZSCAL,ZSWAP
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC DCMPLX,MAX
*     ..
      CALL PIMDGETPAR(IPAR,DPAR,LDA,N,BLKSZ,LOCLEN,BASISDIM,NPROCS,
     +                PROCID,PRECONTYPE,STOPTYPE,MAXIT,ITNO,STATUS,
     +                STEPERR,EPSILON,EXITNORM)

*  Check consistency of stop types
      IF ((STOPTYPE.NE.1) .AND. (STOPTYPE.NE.2) .AND.
     +    (STOPTYPE.NE.7)) THEN
          ITNO = 0
          STATUS = -6
          STEPERR = 0
          GO TO 9999

      END IF

*  Does not need conversion Y=Q2X for residual
      CNVRTX = 0

*  Set indices for mapping local vectors into wrk
      IW = 1
      IK = IW + LOCLEN
      IZ = IK + LOCLEN
      IR = IZ + LOCLEN
      IXOLD = IR + LOCLEN

*  Set rhs of stopping criteria
      RHSSTOP = DZSETRHSSTOP(B,WRK(IR),EPSILON,IPAR,PRECONL,PDZNRM)

*  1. Set parameters for iteration
      IF ((DPAR(3).EQ.ZERO) .AND. (DPAR(4).EQ.ZERO) .AND.
     +    (DPAR(5).EQ.ZERO) .AND. (DPAR(6).EQ.ZERO)) THEN
          STATUS = -7
          STEPERR = 1
          GO TO 9999

      ELSE IF (DPAR(5).EQ.DPAR(6)) THEN
*     Eigenvalues are contained in the interval [DPAR(3),DPAR(4)] on
*     the real axis:
*         sigma=(dpar(4)-dpar(3))/(2-dpar(4)-dpar(3))
*         gamma=2/(2-dpar(4)-dpar(3))
          SIGMA = (DPAR(4)-DPAR(3))/ (TWO-DPAR(4)-DPAR(3))
          SIGMASQ = SIGMA*SIGMA
          GAMMA = TWO/ (TWO-DPAR(4)-DPAR(3))

      ELSE IF (DPAR(3).EQ.DPAR(4)) THEN
*     Eigenvalues are contained in the interval [DPAR(5),DPAR(6)] on
*     the imaginary axis:
*         sigma^2=-max(dpar(5),dpar(6))
*         gamma=1
          SIGMASQ = -MAX(DPAR(5),DPAR(6))
          GAMMA = ONE

      ELSE
*     Eigenvalues are complex and contained in the box
*     DPAR(3)<= Real(e) <= DPAR(4) and DPAR(5)<= Imag(e) <= DPAR(6).
*     Compute the minimum bounding ellipse that circumscribes the box;
*     this is defined by its axes a=sqrt(2)*(dpar(4)-dpar(3))/2 (along
*     the real axis) and b=sqrt(2)*(dpar(6)-dpar(5))/2 (along the
*     imaginary axis). The center of the ellipse is d.
*         sigma^2=(a^2+b^2)/(1-d)^2
*         gamma=1/(1-d)
          LENGTHR = (DPAR(4)-DPAR(3))/TWO
          LENGTHI = (DPAR(6)-DPAR(5))/TWO
          AXISRSQ = LENGTHR*LENGTHR*TWO
          AXISISQ = LENGTHI*LENGTHI*TWO
          D = (DPAR(6)+DPAR(5))/TWO
          SIGMASQ = (AXISRSQ-AXISISQ)/ (ONE-D)**2
          GAMMA = ONE/ (ONE-D)

      END IF

*  2. k=gamma*Q1b
      IF (PRECONTYPE.EQ.0) THEN
          CALL ZCOPY(LOCLEN,B,1,WRK(IK),1)
          CALL ZSCAL(LOCLEN,DCMPLX(GAMMA),WRK(IK),1)

      ELSE IF ((PRECONTYPE.EQ.1) .OR. (PRECONTYPE.EQ.3)) THEN
          CALL PRECONL(B,WRK(IK),IPAR)
          CALL ZSCAL(LOCLEN,DCMPLX(GAMMA),WRK(IK),1)
      END IF

*    xold=x
      CALL ZCOPY(LOCLEN,X,1,WRK(IXOLD),1)

*  Loop
      STATUS = 0
      EXITNORM = -ONE
      STEPERR = -1
      DO 10 ITNO = 1,MAXIT

*  3. rho
          IF (ITNO.EQ.1) THEN
              RHO = ONE

          ELSE IF (ITNO.EQ.2) THEN
              RHO = ONE/ (ONE-SIGMASQ/TWO)

          ELSE
              RHO = ONE/ (ONE-RHO*SIGMASQ/4.0)
          END IF

*  4. w=(I-Q1AQ2)x
          IF (PRECONTYPE.EQ.0) THEN
              CALL MATVEC(X,WRK(IZ),IPAR)

          ELSE IF (PRECONTYPE.EQ.1) THEN
              CALL MATVEC(X,WRK(IW),IPAR)
              CALL PRECONL(WRK(IW),WRK(IZ),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
              CALL PRECONR(X,WRK(IW),IPAR)
              CALL MATVEC(WRK(IW),WRK(IZ),IPAR)

          ELSE IF (PRECONTYPE.EQ.3) THEN
              CALL PRECONR(X,WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IW),IPAR)
              CALL PRECONL(WRK(IW),WRK(IZ),IPAR)
          END IF

          CALL ZCOPY(LOCLEN,X,1,WRK(IW),1)
          CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IW),1)

*  5. x=rho*(gamma*((I-Q1A)x+Q1b)+(1-gamma)*x)+(1-rho)*xold
          DELTA = RHO*GAMMA
          CALL ZSCAL(LOCLEN,DCMPLX(ONE-RHO),WRK(IXOLD),1)
          CALL ZAXPY(LOCLEN,DCMPLX(RHO),WRK(IK),1,WRK(IXOLD),1)
          CALL ZAXPY(LOCLEN,DCMPLX(RHO-DELTA),X,1,WRK(IXOLD),1)
          CALL ZAXPY(LOCLEN,DCMPLX(DELTA),WRK(IW),1,WRK(IXOLD),1)
          CALL ZSWAP(LOCLEN,WRK(IXOLD),1,X,1)

*  6. check stopping criterion
          CALL STOPCRIT(B,WRK(IZ),WRK(IR),X,WRK(IXOLD),WRK(IW),RHSSTOP,
     +                  CNVRTX,EXITNORM,STATUS,IPAR,MATVEC,MATVEC,
     +                  PRECONR,PZSUM,PDZNRM)

*  Call monitoring routine
          CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IR),WRK(IR))

          IF (STATUS.EQ.0) THEN
              GO TO 9999
          END IF

   10 CONTINUE

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
