      SUBROUTINE PIMZTFQMR(X,B,WRK,IPAR,DPAR,MATVEC,PRECONL,PRECONR,
     +                     PZSUM,PDZNRM2,PROGRESS)
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
      EXTERNAL MATVEC,PRECONL,PRECONR,PROGRESS,PZSUM,PDZNRM2
*     ..
*     .. Local Scalars ..
      DOUBLE COMPLEX ALPHA,BETA,C,ETA,ETA0,RHO,RHO0,SIGMA,TAU,TAU0,
     +               THETA,THETA0
      DOUBLE PRECISION EPSILON,EXITNORM,KAPPA,RHSSTOP
      INTEGER BASISDIM,BLKSZ,CNVRTX,ID,IG,IH,IM,IM0,IP,IR,IRTILDE,ITNO,
     +        IV,IW,IXOLD,IY,IY0,IZ,LDA,LOCLEN,MAXIT,N,NPROCS,
     +        PRECONTYPE,PROCID,STATUS,STEPERR,STOPTYPE
*     ..
*     .. Local Arrays ..
      DOUBLE COMPLEX DOTS(1)
*     ..
*     .. External Functions ..
      DOUBLE COMPLEX ZDOTC
      DOUBLE PRECISION DZSETRHSSTOP
      EXTERNAL ZDOTC,DZSETRHSSTOP
*     ..
*     .. External Subroutines ..
      EXTERNAL PIMDGETPAR,STOPCRIT,ZAXPY,ZCOPY,ZINIT
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS,DBLE,SQRT
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
          GO TO 30

      END IF

*  Initialize TAU and THETA
      TAU = ZZERO
      THETA = ZZERO

*  Does not need conversion Y=Q2X for residual
      CNVRTX = 0

*  Set indices for mapping local vectors into wrk
      IR = 1
      IRTILDE = IR + LOCLEN
      IY = IRTILDE + LOCLEN
      IY0 = IY + LOCLEN
      IW = IY0 + LOCLEN
      IV = IW + LOCLEN
      ID = IV + LOCLEN
      IZ = ID + LOCLEN
      IP = IZ + LOCLEN
      IG = IP + LOCLEN
      IH = IG + LOCLEN
      IXOLD = IH + LOCLEN

*  Set rhs of stopping criteria
      RHSSTOP = DZSETRHSSTOP(B,WRK(IR),EPSILON,IPAR,PRECONL,PDZNRM2)

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

*  2. w=y=r
      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IW),1)
      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IY),1)

*  3. v=g=Q1AQ2y
      IF (PRECONTYPE.EQ.0) THEN
          CALL MATVEC(WRK(IY),WRK(IG),IPAR)

      ELSE IF (PRECONTYPE.EQ.1) THEN
          CALL MATVEC(WRK(IY),WRK(IZ),IPAR)
          CALL PRECONL(WRK(IZ),WRK(IG),IPAR)

      ELSE IF (PRECONTYPE.EQ.2) THEN
          CALL PRECONR(WRK(IY),WRK(IZ),IPAR)
          CALL MATVEC(WRK(IZ),WRK(IG),IPAR)

      ELSE IF (PRECONTYPE.EQ.3) THEN
          CALL PRECONR(WRK(IY),WRK(IG),IPAR)
          CALL MATVEC(WRK(IG),WRK(IZ),IPAR)
          CALL PRECONL(WRK(IZ),WRK(IG),IPAR)
      END IF

      CALL ZCOPY(LOCLEN,WRK(IG),1,WRK(IV),1)

*  4. d=0
      CALL ZINIT(LOCLEN,ZZERO,WRK(ID),1)

*  5. tau=||r||2
      CALL PDZNRM2(TAU,LOCLEN,WRK(IR),IPAR)

*  6. theta=eta=0
      THETA = ZZERO
      ETA = ZZERO

*  7. rtilde=r
      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IRTILDE),1)

*  8. rho=dot(rtilde,r)
      DOTS(1) = ZDOTC(LOCLEN,WRK(IRTILDE),1,WRK(IR),1)
      CALL PZSUM(1,DOTS,IPAR)
      RHO = DOTS(1)

*  Loop
      STATUS = 0
      EXITNORM = -ONE
      STEPERR = -1
      IM0 = 1
      DO 20 ITNO = 1,MAXIT
*  9. sigma=dot(rtilde,v)
          DOTS(1) = ZDOTC(LOCLEN,WRK(IRTILDE),1,WRK(IV),1)
          CALL PZSUM(1,DOTS,IPAR)
          SIGMA = DOTS(1)

* 10. alpha=rho/sigma
          IF (SIGMA.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 10
              GO TO 30

          END IF

          ALPHA = RHO/SIGMA

* 11. y=y0-alpha*v
          CALL ZCOPY(LOCLEN,WRK(IY),1,WRK(IY0),1)
          CALL ZAXPY(LOCLEN,-ALPHA,WRK(IV),1,WRK(IY),1)

* 12. h=Q1AQ2y
          IF (PRECONTYPE.EQ.0) THEN
              CALL MATVEC(WRK(IY),WRK(IH),IPAR)

          ELSE IF (PRECONTYPE.EQ.1) THEN
              CALL MATVEC(WRK(IY),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IH),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
              CALL PRECONR(WRK(IY),WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IH),IPAR)

          ELSE IF (PRECONTYPE.EQ.3) THEN
              CALL PRECONR(WRK(IY),WRK(IH),IPAR)
              CALL MATVEC(WRK(IH),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IH),IPAR)
          END IF

          DO 10 IM = IM0,IM0 + 1

* 13. w=w-alpha*Q1AQ2y0
              CALL ZAXPY(LOCLEN,-ALPHA,WRK(IG),1,WRK(IW),1)

* 14. theta=||w||_2/tau0
              THETA0 = THETA
              TAU0 = TAU
              IF (TAU0.EQ.ZZERO) THEN
                  STATUS = -3
                  STEPERR = 14
                  GO TO 30

              END IF

              CALL PDZNRM2(THETA,LOCLEN,WRK(IW),IPAR)
              THETA = THETA/TAU

* 15. c=1/sqrt(1+theta^2)
              C = ZONE/SQRT(ZONE+THETA*THETA)

* 16. tau=tau0*theta*c
              TAU = TAU0*THETA*C

* 17. eta=(c^2)*alpha
              ETA0 = ETA
              ETA = C*C*ALPHA

* 18. d=y0+((theta0^2)*eta0/alpha)*d
              IF (ALPHA.EQ.ZZERO) THEN
                  STATUS = -3
                  STEPERR = 18
                  GO TO 30

              END IF

              CALL ZCOPY(LOCLEN,WRK(ID),1,WRK(IP),1)
              CALL ZCOPY(LOCLEN,WRK(IY0),1,WRK(ID),1)
              CALL ZAXPY(LOCLEN,THETA0*THETA0*ETA0/ALPHA,WRK(IP),1,
     +                   WRK(ID),1)

* 19. x=x+eta*d
              CALL ZCOPY(LOCLEN,X,1,WRK(IXOLD),1)
              CALL ZAXPY(LOCLEN,ETA,WRK(ID),1,X,1)

* 20. kappa=tau*sqrt(m+1)
              KAPPA = ABS(SQRT(DBLE(IM+1))*TAU)

* 21. check stopping criterion
              IF (KAPPA.LT.EPSILON) THEN

*     r=Q1(b-AQ2x)
                  IF (PRECONTYPE.EQ.0) THEN
*     r=b-Ax
                      CALL ZCOPY(LOCLEN,B,1,WRK(IR),1)
                      CALL MATVEC(X,WRK(IP),IPAR)
                      CALL ZAXPY(LOCLEN,-ZONE,WRK(IP),1,WRK(IR),1)
                      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IZ),1)

                  ELSE IF (PRECONTYPE.EQ.1) THEN
*     r=Q1(b-Ax)
                      CALL ZCOPY(LOCLEN,B,1,WRK(IZ),1)
                      CALL MATVEC(X,WRK(IP),IPAR)
                      CALL ZAXPY(LOCLEN,-ZONE,WRK(IP),1,WRK(IZ),1)
                      CALL PRECONL(WRK(IZ),WRK(IR),IPAR)

                  ELSE IF (PRECONTYPE.EQ.2) THEN
*     r=b-AQ2x
                      CALL ZCOPY(LOCLEN,B,1,WRK(IR),1)
                      CALL PRECONR(X,WRK(IP),IPAR)
                      CALL MATVEC(WRK(IP),WRK(IZ),IPAR)
                      CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IR),1)

                  ELSE IF (PRECONTYPE.EQ.3) THEN
*     r=Q1(b-AQ2x)
                      CALL ZCOPY(LOCLEN,B,1,WRK(IR),1)
                      CALL PRECONR(X,WRK(IZ),IPAR)
                      CALL MATVEC(WRK(IZ),WRK(IP),IPAR)
                      CALL ZAXPY(LOCLEN,-ZONE,WRK(IP),1,WRK(IR),1)
                      CALL PRECONL(WRK(IR),WRK(IZ),IPAR)
                      CALL ZCOPY(LOCLEN,WRK(IZ),1,WRK(IR),1)
                  END IF

                  CALL STOPCRIT(B,WRK(IR),WRK(IZ),X,WRK(IXOLD),WRK(IP),
     +                          RHSSTOP,CNVRTX,EXITNORM,STATUS,IPAR,
     +                          MATVEC,MATVEC,PRECONR,PZSUM,PDZNRM2)

*  Call monitoring routine
                  CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IR),WRK(IZ))

                  IF (STATUS.EQ.0) THEN
                      GO TO 30
                  END IF

              ELSE
*  Call monitoring routine
                  CALL PROGRESS(LOCLEN,ITNO,ABS(KAPPA),X,WRK(IR),
     +                          WRK(IZ))

              END IF

*  y0=y
              CALL ZCOPY(LOCLEN,WRK(IY),1,WRK(IY0),1)

*  g=h
              CALL ZCOPY(LOCLEN,WRK(IH),1,WRK(IG),1)

   10     CONTINUE

* 22. rho=dot(rtilde,w)
          RHO0 = RHO
          DOTS(1) = ZDOTC(LOCLEN,WRK(IRTILDE),1,WRK(IW),1)
          CALL PZSUM(1,DOTS,IPAR)
          RHO = DOTS(1)

* 23. beta=rho/rho0
          IF (RHO0.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 23
              GO TO 30

          END IF

          BETA = RHO/RHO0

* 24. y=w+beta*y0
          CALL ZCOPY(LOCLEN,WRK(IW),1,WRK(IY),1)
          CALL ZAXPY(LOCLEN,BETA,WRK(IY0),1,WRK(IY),1)

* 25. g=Q1AQ2y
          IF (PRECONTYPE.EQ.0) THEN
              CALL MATVEC(WRK(IY),WRK(IG),IPAR)

          ELSE IF (PRECONTYPE.EQ.1) THEN
              CALL MATVEC(WRK(IY),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IG),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
              CALL PRECONR(WRK(IY),WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IG),IPAR)

          ELSE IF (PRECONTYPE.EQ.3) THEN
              CALL PRECONR(WRK(IY),WRK(IG),IPAR)
              CALL MATVEC(WRK(IG),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IG),IPAR)
          END IF

* 26. v=Q1AQ2y+beta*(Q1AQ2y0+beta*v)
          CALL ZCOPY(LOCLEN,WRK(IG),1,WRK(IZ),1)
          CALL ZAXPY(LOCLEN,BETA,WRK(IH),1,WRK(IZ),1)
          CALL ZAXPY(LOCLEN,BETA*BETA,WRK(IV),1,WRK(IZ),1)
          CALL ZCOPY(LOCLEN,WRK(IZ),1,WRK(IV),1)

          IM0 = IM0 + 2

   20 CONTINUE

      IF (ITNO.GT.MAXIT) THEN
          STATUS = -1
          ITNO = MAXIT
          IF (EXITNORM.EQ. (-ONE)) THEN
              EXITNORM = KAPPA
          END IF

      END IF

   30 CONTINUE

      IF ((PRECONTYPE.EQ.2) .OR. (PRECONTYPE.EQ.3)) THEN
          CALL ZCOPY(LOCLEN,X,1,WRK(IZ),1)
          CALL PRECONR(WRK(IZ),X,IPAR)
      END IF

*  Call monitoring routine
      CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IR),WRK(IZ))

*  Set output parameters
      IPAR(11) = ITNO
      IPAR(12) = STATUS
      IPAR(13) = STEPERR
      DPAR(2) = EXITNORM

      RETURN

      END
