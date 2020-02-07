      SUBROUTINE PIMZRBICGSTAB(X,B,WRK,IPAR,DPAR,MATVEC,PRECONL,PRECONR,
     +                         PZSUM,PDZNRM2,PROGRESS)
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
      INTEGER IBDIM
      PARAMETER (IBDIM=10)
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
      DOUBLE PRECISION ALPHA,BETA,EPSILON,EXITNORM,KSI,OMEGA,RHO0,RHO1,
     +                 RHSSTOP,S
      INTEGER BASISDIM,BLKSZ,CNVRTX,I,I0,I1,I2,I3,I4,IR,IRTILDE,ITNO,IU,
     +        IW,IXOLD,IZ,J,LDA,LOCLEN,MAXIT,N,NPROCS,PRECONTYPE,PROCID,
     +        STATUS,STEPERR,STOPTYPE
*     ..
*     .. Local Arrays ..
      DOUBLE COMPLEX DOTS(IBDIM)
      DOUBLE PRECISION GAMMA(IBDIM),GAMMA1(IBDIM),GAMMA2(IBDIM),
     +                 SIGMA(IBDIM),TAU(IBDIM,IBDIM)
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
      INTRINSIC DCMPLX
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
      IRTILDE = 1
      IW = IRTILDE + LOCLEN
      IZ = IW + LOCLEN
      IXOLD = IZ + LOCLEN
      IR = IXOLD + LOCLEN
      IU = IR + (BASISDIM+1)*LOCLEN

*  Set rhs of stopping criteria
      RHSSTOP = DZSETRHSSTOP(B,WRK(IR),EPSILON,IPAR,PRECONL,PDZNRM2)

*  1. r=Q1(b-AQ2x)
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
          CALL ZCOPY(LOCLEN,B,1,WRK(IW),1)
          CALL PRECONR(X,WRK(IR),IPAR)
          CALL MATVEC(WRK(IR),WRK(IZ),IPAR)
          CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IW),1)
          CALL PRECONL(WRK(IW),WRK(IR),IPAR)
      END IF

*  2. rtilde=r
      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IRTILDE),1)

*  3. u0=0
      CALL ZINIT(LOCLEN,ZZERO,WRK(IU),1)

*  4. rho0=1, alpha=0, omega=1
      RHO0 = ONE
      ALPHA = ZERO
      OMEGA = ONE

*  Loop
      STATUS = 0
      STEPERR = -1
      EXITNORM = -ONE
      DO 120 ITNO = 1,MAXIT

*  5. rho0=-omega*rho0
          RHO0 = -OMEGA*RHO0

*  BiCG loop
          I1 = 0
          I2 = LOCLEN
          DO 30 J = 0,BASISDIM - 1

*  6. rho1=r(j)^{T}rtilde
              DOTS(1) = ZDOTC(LOCLEN,WRK(IR+I1),1,WRK(IRTILDE),1)
              CALL PZSUM(1,DOTS,IPAR)
              RHO1 = DOTS(1)

*  7. beta=alpha*rho1/rho0
              IF (RHO0.EQ.ZERO) THEN
                  STATUS = -3
                  STEPERR = 7
                  GO TO 9999

              END IF

              BETA = ALPHA*RHO1/RHO0

*  8. rho0=rho1
              RHO0 = RHO1

*  9. u(i)=r(i)-beta*u(i), i=0:j
              I3 = 0
              DO 10 I = 0,J
                  CALL ZCOPY(LOCLEN,WRK(IU+I3),1,WRK(IZ),1)
                  CALL ZCOPY(LOCLEN,WRK(IR+I3),1,WRK(IU+I3),1)
                  CALL ZAXPY(LOCLEN,DCMPLX(-BETA),WRK(IZ),1,WRK(IU+I3),
     +                       1)
                  I3 = I3 + LOCLEN
   10         CONTINUE

* 10. u(j+1)=Q1AQ2u(j)
              IF (PRECONTYPE.EQ.0) THEN
                  CALL MATVEC(WRK(IU+I1),WRK(IU+I2),IPAR)

              ELSE IF (PRECONTYPE.EQ.1) THEN
                  CALL MATVEC(WRK(IU+I1),WRK(IW),IPAR)
                  CALL PRECONL(WRK(IW),WRK(IU+I2),IPAR)

              ELSE IF (PRECONTYPE.EQ.2) THEN
                  CALL PRECONR(WRK(IU+I1),WRK(IW),IPAR)
                  CALL MATVEC(WRK(IW),WRK(IU+I2),IPAR)

              ELSE IF (PRECONTYPE.EQ.3) THEN
                  CALL PRECONR(WRK(IU+I1),WRK(IZ),IPAR)
                  CALL MATVEC(WRK(IZ),WRK(IW),IPAR)
                  CALL PRECONL(WRK(IW),WRK(IU+I2),IPAR)
              END IF

* 11. ksi=u(j+1)^{T}rtilde
              DOTS(1) = ZDOTC(LOCLEN,WRK(IU+I2),1,WRK(IRTILDE),1)
              CALL PZSUM(1,DOTS,IPAR)
              KSI = DOTS(1)

* 12. alpha=rho0/ksi
              IF (KSI.EQ.ZERO) THEN
                  STATUS = -3
                  STEPERR = 12
                  GO TO 9999

              END IF

              ALPHA = RHO0/KSI

* 13. r(i)=r(i)-alpha*u(i+1), i=0:j
              I3 = 0
              I4 = LOCLEN
              DO 20 I = 0,J
                  CALL ZAXPY(LOCLEN,DCMPLX(-ALPHA),WRK(IU+I4),1,
     +                       WRK(IR+I3),1)
                  I3 = I3 + LOCLEN
                  I4 = I4 + LOCLEN
   20         CONTINUE

* 14. r(j+1)=Q1AQ2r(j)
              IF (PRECONTYPE.EQ.0) THEN
                  CALL MATVEC(WRK(IR+I1),WRK(IR+I2),IPAR)

              ELSE IF (PRECONTYPE.EQ.1) THEN
                  CALL MATVEC(WRK(IR+I1),WRK(IW),IPAR)
                  CALL PRECONL(WRK(IW),WRK(IR+I2),IPAR)

              ELSE IF (PRECONTYPE.EQ.2) THEN
                  CALL PRECONR(WRK(IR+I1),WRK(IW),IPAR)
                  CALL MATVEC(WRK(IW),WRK(IR+I2),IPAR)

              ELSE IF (PRECONTYPE.EQ.3) THEN
                  CALL PRECONR(WRK(IR+I1),WRK(IZ),IPAR)
                  CALL MATVEC(WRK(IZ),WRK(IW),IPAR)
                  CALL PRECONL(WRK(IW),WRK(IR+I2),IPAR)
              END IF

* 15. x0=x0+alpha*u0
              CALL ZCOPY(LOCLEN,X,1,WRK(IXOLD),1)
              CALL ZAXPY(LOCLEN,DCMPLX(ALPHA),WRK(IU),1,X,1)
              I1 = I1 + LOCLEN
              I2 = I2 + LOCLEN
   30     CONTINUE

* 16. check stopping criterion
          CALL STOPCRIT(B,WRK(IR),WRK(IZ),X,WRK(IXOLD),WRK(IW),RHSSTOP,
     +                  CNVRTX,EXITNORM,STATUS,IPAR,MATVEC,MATVEC,
     +                  PRECONR,PZSUM,PDZNRM2)

*  Call monitoring routine
          CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IR),WRK(IZ))

          IF (STATUS.EQ.0) THEN
              GO TO 9999
          END IF

*  MR loop

* 17. sigma(1)=r(1)^{T}r(1), gamma'(1)=r(0)^{T}r(1)/sigma(1)
          DOTS(1) = ZDOTC(LOCLEN,WRK(IR+LOCLEN),1,WRK(IR+LOCLEN),1)
          DOTS(2) = ZDOTC(LOCLEN,WRK(IR),1,WRK(IR+LOCLEN),1)
          CALL PZSUM(2,DOTS,IPAR)
          SIGMA(1) = DOTS(1)

          IF (SIGMA(1).EQ.ZERO) THEN
              STATUS = -3
              STEPERR = 17
              GO TO 9999

          END IF

          GAMMA1(1) = DOTS(2)/SIGMA(1)

          I0 = LOCLEN + LOCLEN
          DO 60 J = 2,BASISDIM

* 18. tau(i,j)=r(j)^{T}r(i)/sigma(i), r(j)=r(j)-tau(i,j)r(i)
              I1 = LOCLEN
              DO 40 I = 1,J - 1
                  DOTS(I) = ZDOTC(LOCLEN,WRK(IR+I0),1,WRK(IR+I1),1)
                  I1 = I1 + LOCLEN
   40         CONTINUE
              CALL PZSUM(J-1,DOTS,IPAR)
              I1 = LOCLEN
              DO 50 I = 1,J - 1
                  TAU(I,J) = DOTS(I)/SIGMA(I)
                  CALL ZAXPY(LOCLEN,DCMPLX(-TAU(I,J)),WRK(IR+I1),1,
     +                       WRK(IR+I0),1)
   50         CONTINUE

* 19. sigma(j)=r(j)^{T}r(j), gamma'(j)=r(0)^{T}r(j)/sigma(j)
              DOTS(1) = ZDOTC(LOCLEN,WRK(IR+I0),1,WRK(IR+I0),1)
              DOTS(2) = ZDOTC(LOCLEN,WRK(IR),1,WRK(IR+I0),1)
              CALL PZSUM(2,DOTS,IPAR)
              SIGMA(J) = DOTS(1)

              IF (SIGMA(J).EQ.ZERO) THEN
                  STATUS = -3
                  STEPERR = 19
                  GO TO 9999

              END IF

              GAMMA1(J) = DOTS(2)/SIGMA(J)
              I0 = I0 + LOCLEN
   60     CONTINUE

* 20. gamma_{l}=omega=gamma'_{l}
*     gamma_{j}=gamma'_{j}-\sum_{i=j+1}^{l}{tau_{j,i}gamma_{i}}
          GAMMA(BASISDIM) = GAMMA1(BASISDIM)
          OMEGA = GAMMA(BASISDIM)
          DO 80 J = BASISDIM - 1,1,-1
              S = ZERO
              DO 70 I = J + 1,BASISDIM
                  S = S + TAU(J,I)*GAMMA(I)
   70         CONTINUE
              GAMMA(J) = GAMMA1(J) - S
   80     CONTINUE

* 21. gamma''=gamma_{j+1}+\sum_{i=j+1}^{l-1}{tau_{j,i}gamma_{i+1}}
          DO 100 J = 1,BASISDIM - 1
              S = ZERO
              DO 90 I = J + 1,BASISDIM - 1
                  S = S + TAU(J,I)*GAMMA(I+1)
   90         CONTINUE
              GAMMA2(J) = GAMMA(J+1) + S
  100     CONTINUE

*  Update

* 22. x(0)=x(0)+gamma(1)r(0)
          CALL ZAXPY(LOCLEN,DCMPLX(GAMMA(1)),WRK(IR),1,X,1)

* 23. r(0)=r(0)-gamma'(l)r(l)
          CALL ZAXPY(LOCLEN,DCMPLX(-GAMMA1(BASISDIM)),
     +               WRK(IR+BASISDIM*LOCLEN),1,WRK(IR),1)

* 24. u(0)=u(0)-gamma(l)u(l)
          CALL ZAXPY(LOCLEN,DCMPLX(-GAMMA(BASISDIM)),
     +               WRK(IU+BASISDIM*LOCLEN),1,WRK(IU),1)

          I0 = LOCLEN
          DO 110 J = 1,BASISDIM - 1

* 25. u(0)=u(0)-gamma(j)u(j), j=1:l-1
              CALL ZAXPY(LOCLEN,DCMPLX(-GAMMA(J)),WRK(IU+I0),1,WRK(IU),
     +                   1)

* 26. x(0)=x(0)+gamma''(j)r(j), j=1:l-1
              CALL ZAXPY(LOCLEN,DCMPLX(GAMMA2(J)),WRK(IR+I0),1,X,1)

* 27. r(0)=r(0)-gamma'(j)r(j), j=1:l-1
              CALL ZAXPY(LOCLEN,DCMPLX(-GAMMA1(J)),WRK(IR+I0),1,WRK(IR),
     +                   1)
              I0 = I0 + LOCLEN
  110     CONTINUE

  120 CONTINUE

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
