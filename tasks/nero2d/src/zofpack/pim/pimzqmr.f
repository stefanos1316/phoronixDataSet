      SUBROUTINE PIMZQMR(X,B,WRK,IPAR,DPAR,MATVEC,TMATVEC,PRECONL,
     +                   PRECONR,PDZSUM,PDZNRM,PROGRESS)
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
      EXTERNAL MATVEC,PDZSUM,PRECONL,PRECONR,PROGRESS,TMATVEC,PDZNRM
*     ..
*     .. Local Scalars ..
      DOUBLE COMPLEX ABSGAMMA2,ABSTAU02,DEN,EPSILON,EPSILON0,GAMMA,
     +               GAMMA0,KAPPA,KAPPA0,KSI,KSI0,LAMBDA,LAMBDA0,MU,MU0,
     +               RHO,RHO0,TAU,TAU0,THETA
      DOUBLE PRECISION EXITNORM,RHSSTOP
      INTEGER BASISDIM,BLKSZ,CNVRTX,IAP,IATWTILDE,ID,IP,IQ,IR,IS,ITNO,
     +        IVTILDE,IWTILDE,IXOLD,IZ,LDA,LOCLEN,MAXIT,N,NPROCS,
     +        PRECONTYPE,PROCID,STATUS,STEPERR,STOPTYPE
*     ..
*     .. Local Arrays ..
      DOUBLE COMPLEX DOTS(4)
*     ..
*     .. External Functions ..
      DOUBLE COMPLEX ZDOTC
      DOUBLE PRECISION DZSETRHSSTOP
      EXTERNAL ZDOTC,DZSETRHSSTOP
*     ..
*     .. External Subroutines ..
      EXTERNAL PIMDGETPAR,STOPCRIT,ZAXPY,ZCOPY,ZINIT,ZSCAL
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS,CONJG,SQRT
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
          GO TO 20

      END IF

*  Needs no conversion Y=Q2X for residual
      CNVRTX = 0

*  Set indices for mapping local vectors into wrk
      IR = 1
      IP = IR + LOCLEN
      IAP = IP + LOCLEN
      IQ = IAP + LOCLEN
      ID = IQ + LOCLEN
      IS = ID + LOCLEN
      IVTILDE = IS + LOCLEN
      IWTILDE = IVTILDE + LOCLEN
      IATWTILDE = IWTILDE + LOCLEN
      IXOLD = IATWTILDE + LOCLEN
      IZ = IXOLD + LOCLEN

*  Set RHS of stopping criteria
      RHSSTOP = DZSETRHSSTOP(B,WRK(IR),EPSILON,IPAR,PRECONL,PDZNRM)

*  1. lambda=1, kappa=-1, theta=-1
      LAMBDA = ZONE
      KAPPA = -ZONE
      THETA = -ZONE

*  2. wtilde=vtilde=r=Q1(b-AQ2x)
      IF (STOPTYPE.NE.6) THEN
          IF (PRECONTYPE.EQ.0) THEN
*     r=b-Ax
              CALL ZCOPY(LOCLEN,B,1,WRK(IR),1)
              CALL MATVEC(X,WRK(IAP),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IAP),1,WRK(IR),1)

          ELSE IF (PRECONTYPE.EQ.1) THEN
*     r=Q1(b-Ax)
              CALL ZCOPY(LOCLEN,B,1,WRK(IZ),1)
              CALL MATVEC(X,WRK(IAP),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IAP),1,WRK(IZ),1)
              CALL PRECONL(WRK(IZ),WRK(IR),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
*     r=b-AQ2x
              CALL ZCOPY(LOCLEN,B,1,WRK(IR),1)
              CALL PRECONR(X,WRK(IAP),IPAR)
              CALL MATVEC(WRK(IAP),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IR),1)

          ELSE IF (PRECONTYPE.EQ.3) THEN
*     r=Q1(b-AQ2x)
              CALL ZCOPY(LOCLEN,B,1,WRK(IP),1)
              CALL PRECONR(X,WRK(IAP),IPAR)
              CALL MATVEC(WRK(IAP),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IP),1)
              CALL PRECONL(WRK(IP),WRK(IR),IPAR)
          END IF

      ELSE
*     r has been set to Q1b in the call to dsetrhsstop
          IF (PRECONTYPE.EQ.1) THEN
*     r=Q1(b-Ax)
              CALL MATVEC(X,WRK(IAP),IPAR)
              CALL PRECONL(WRK(IAP),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IR),1)

          ELSE IF (PRECONTYPE.EQ.3) THEN
*     r=Q1(b-AQ2x)
              CALL PRECONR(X,WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IAP),IPAR)
              CALL PRECONL(WRK(IAP),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IR),1)
          END IF

      END IF

      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IWTILDE),1)
      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IVTILDE),1)

*  3. p=q=d=s=0
      CALL ZINIT(LOCLEN,ZZERO,WRK(IP),1)
      CALL ZINIT(LOCLEN,ZZERO,WRK(IQ),1)
      CALL ZINIT(LOCLEN,ZZERO,WRK(ID),1)
      CALL ZINIT(LOCLEN,ZZERO,WRK(IS),1)

*  4. gamma=||vtilde||_{2}, ksi=||wtilde||_{2},
*     rho=wtilde^{T}vtilde, epsilon=(A^{T}wtilde)^{T}vtilde, mu=0
      DOTS(1) = ZDOTC(LOCLEN,WRK(IVTILDE),1,WRK(IVTILDE),1)
      DOTS(2) = ZDOTC(LOCLEN,WRK(IWTILDE),1,WRK(IWTILDE),1)
      DOTS(3) = ZDOTC(LOCLEN,WRK(IWTILDE),1,WRK(IVTILDE),1)

*  Compute A^{T}wtilde
      IF (PRECONTYPE.EQ.0) THEN
          CALL TMATVEC(WRK(IWTILDE),WRK(IATWTILDE),IPAR)

      ELSE IF (PRECONTYPE.EQ.1) THEN
          CALL TMATVEC(WRK(IWTILDE),WRK(IZ),IPAR)
          CALL PRECONL(WRK(IZ),WRK(IATWTILDE),IPAR)

      ELSE IF (PRECONTYPE.EQ.2) THEN
          CALL PRECONR(WRK(IWTILDE),WRK(IZ),IPAR)
          CALL TMATVEC(WRK(IZ),WRK(IATWTILDE),IPAR)

      ELSE IF (PRECONTYPE.EQ.3) THEN
          CALL PRECONR(WRK(IWTILDE),WRK(IATWTILDE),IPAR)
          CALL TMATVEC(WRK(IATWTILDE),WRK(IZ),IPAR)
          CALL PRECONL(WRK(IZ),WRK(IATWTILDE),IPAR)
      END IF

      DOTS(4) = ZDOTC(LOCLEN,WRK(IATWTILDE),1,WRK(IVTILDE),1)

*  Accumulate simultaneously partial inner-products
      CALL PDZSUM(4,DOTS)

      GAMMA = SQRT(DOTS(1))
      KSI = SQRT(DOTS(2))
      RHO = DOTS(3)
      EPSILON = DOTS(4)
      MU = ZZERO

*  5. tau=epsilon/rho
      IF (RHO.EQ.ZZERO) THEN
          ITNO = 0
          STATUS = -3
          STEPERR = 5
          GO TO 20
      END IF

      TAU = EPSILON/RHO

*  Loop
      STATUS = 0
      EXITNORM = -ONE
      STEPERR = -1
      DO 10 ITNO = 1,MAXIT

*  6. p=1/gamma*vtilde-mu*p
          IF (GAMMA.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 6
              GO TO 20

          END IF
          CALL ZSCAL(LOCLEN,-MU,WRK(IP),1)
          CALL ZAXPY(LOCLEN,ZONE/GAMMA,WRK(IVTILDE),1,WRK(IP),1)

*  7. q=1/ksi*A^{T}wtilde-(gamma*mu)/ksi*q
          IF (KSI.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 7
              GO TO 20

          END IF
          CALL ZSCAL(LOCLEN,- (GAMMA*MU)/KSI,WRK(IQ),1)
          CALL ZAXPY(LOCLEN,ZONE/KSI,WRK(IATWTILDE),1,WRK(IQ),1)

* 8. vtilde=Ap-tau/gamma*vtilde
          IF (PRECONTYPE.EQ.0) THEN
              CALL MATVEC(WRK(IP),WRK(IAP),IPAR)

          ELSE IF (PRECONTYPE.EQ.1) THEN
              CALL MATVEC(WRK(IP),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IAP),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
              CALL PRECONR(WRK(IP),WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IAP),IPAR)

          ELSE IF (PRECONTYPE.EQ.3) THEN
              CALL PRECONR(WRK(IP),WRK(IAP),IPAR)
              CALL MATVEC(WRK(IAP),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IAP),IPAR)
          END IF

          CALL ZSCAL(LOCLEN,-TAU/GAMMA,WRK(IVTILDE),1)
          CALL ZAXPY(LOCLEN,ZONE,WRK(IAP),1,WRK(IVTILDE),1)

*  9. wtilde=q-tau/ksi*wtilde
          CALL ZSCAL(LOCLEN,-TAU/KSI,WRK(IWTILDE),1)
          CALL ZAXPY(LOCLEN,ZONE,WRK(IQ),1,WRK(IWTILDE),1)

* 10. check stopping criterion
          CALL ZCOPY(LOCLEN,X,1,WRK(IXOLD),1)

          CALL STOPCRIT(B,WRK(IR),WRK(IZ),X,WRK(IXOLD),WRK(IATWTILDE),
     +                  RHSSTOP,CNVRTX,EXITNORM,STATUS,IPAR,MATVEC,
     +                  TMATVEC,PRECONR,PDZSUM,PDZNRM)

*  Call monitoring routine
          CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IR),WRK(IZ))

          IF (STATUS.EQ.-5) THEN
              STEPERR = 10
              GO TO 20
          ELSE IF (STATUS.EQ.0) THEN
              GO TO 20
          END IF

* 11. gamma=||vtilde||_{2}, ksi=||wtilde||_{2},
*     rho=wtilde^{T}vtilde, epsilon=(A^{T}wtilde)^{T}vtilde
          DOTS(1) = ZDOTC(LOCLEN,WRK(IVTILDE),1,WRK(IVTILDE),1)
          DOTS(2) = ZDOTC(LOCLEN,WRK(IWTILDE),1,WRK(IWTILDE),1)
          DOTS(3) = ZDOTC(LOCLEN,WRK(IWTILDE),1,WRK(IVTILDE),1)

*  Compute A^{T}wtilde
          IF (PRECONTYPE.EQ.0) THEN
              CALL TMATVEC(WRK(IWTILDE),WRK(IATWTILDE),IPAR)

          ELSE IF (PRECONTYPE.EQ.1) THEN
              CALL TMATVEC(WRK(IWTILDE),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IATWTILDE),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
              CALL PRECONR(WRK(IWTILDE),WRK(IZ),IPAR)
              CALL TMATVEC(WRK(IZ),WRK(IATWTILDE),IPAR)

          ELSE IF (PRECONTYPE.EQ.3) THEN
              CALL PRECONR(WRK(IWTILDE),WRK(IATWTILDE),IPAR)
              CALL TMATVEC(WRK(IATWTILDE),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IATWTILDE),IPAR)
          END IF

          DOTS(4) = ZDOTC(LOCLEN,WRK(IATWTILDE),1,WRK(IVTILDE),1)

*  Accumulate simultaneously partial inner-products
          CALL PDZSUM(4,DOTS)

          GAMMA0 = GAMMA
          GAMMA = SQRT(DOTS(1))
          KSI0 = KSI
          KSI = SQRT(DOTS(2))
          RHO0 = RHO
          RHO = DOTS(3)
          EPSILON0 = EPSILON
          EPSILON = DOTS(4)

* 12. mu=(gamma0*ksi0*rho)/(gamma*tau*rho0)
          DEN = GAMMA*TAU*RHO0
          IF (DEN.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 12
              GO TO 20

          END IF
          MU0 = MU
          MU = (GAMMA0*KSI0*RHO)/DEN

* 13. tau=epsilon/rho-gamma*mu
          IF (RHO.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 13
              GO TO 20

          END IF
          TAU0 = TAU
          TAU = EPSILON/RHO - GAMMA*MU

* 14. theta=(|tau0|^2*(1-lambda))/(lambda*|tau|^2+|gamma|^2)
          ABSTAU02 = ABS(TAU0)**2
          ABSGAMMA2 = ABS(GAMMA)**2
          DEN = LAMBDA*ABSTAU02 + ABSGAMMA2
          IF (DEN.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 14
              GO TO 20

          END IF
          THETA = (ABSTAU02* (ZONE-LAMBDA))/DEN

* 15. kappa=(-gamma0*CONJG(tau0)*kappa0)/(gamma0*|tau|^2+|gamma|^2)
          KAPPA0 = KAPPA
          KAPPA = - (GAMMA0*CONJG(TAU0)*KAPPA0)/DEN

* 16. lambda=(lambda0*|tau0|^2)/(gamma0*|tau|^2+|gamma|^2)
          LAMBDA0 = LAMBDA
          LAMBDA = LAMBDA0*ABSTAU02/DEN

* 17. d=theta*d+kappa*p
          CALL ZSCAL(LOCLEN,THETA,WRK(ID),1)
          CALL ZAXPY(LOCLEN,KAPPA,WRK(IP),1,WRK(ID),1)

* 18. s=theta*s+kappa*A*p
          CALL ZSCAL(LOCLEN,THETA,WRK(IS),1)
          CALL ZAXPY(LOCLEN,KAPPA,WRK(IAP),1,WRK(IS),1)

* 19. x=x+d
          CALL ZAXPY(LOCLEN,ZONE,WRK(ID),1,X,1)

* 20. r=r-s
          CALL ZAXPY(LOCLEN,-ZONE,WRK(IS),1,WRK(IR),1)

   10 CONTINUE

      IF (ITNO.GT.MAXIT) THEN
          STATUS = -1
          ITNO = MAXIT
      END IF

   20 CONTINUE

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
