      SUBROUTINE PIMZBICGSTAB2(X,B,WRK,IPAR,DPAR,MATVEC,PRECONL,PRECONR,
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
      DOUBLE COMPLEX ALPHA,BETA,KAPPA,OMEGA,RHO,RHO0,XI
      DOUBLE PRECISION EPSILON,EXITNORM,MACHEPS,RHSSTOP
      INTEGER BASISDIM,BLKSZ,CNVRTX,IP,IQ,IR,IRTILDE,IS,IT,ITNO,IV,IW,
     +        IXOLD,IZ,LDA,LOCLEN,MAXIT,N,NPROCS,PRECONTYPE,PROCID,
     +        STATUS,STEPERR,STOPTYPE
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
      EXTERNAL DMACHCONS,PIMDGETPAR,STOPCRIT,ZAXPY,ZCOPY,ZINIT
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS
*     ..
      CALL DMACHCONS('M',MACHEPS)

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
      IRTILDE = IR + LOCLEN
      IP = IRTILDE + LOCLEN
      IQ = IP + LOCLEN
      IS = IQ + LOCLEN
      IT = IS + LOCLEN
      IV = IT + LOCLEN
      IW = IV + LOCLEN
      IZ = IW + LOCLEN
      IXOLD = IZ + LOCLEN

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

*  2. rtilde=r
      CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IRTILDE),1)

*  3. p=v=0
      CALL ZINIT(LOCLEN,ZZERO,WRK(IP),1)
      CALL ZINIT(LOCLEN,ZZERO,WRK(IV),1)

*  4. rho=alpha=omega=1
      RHO = ZONE
      ALPHA = ZONE
      OMEGA = ZONE

*  Loop
      STATUS = 0
      EXITNORM = -ONE
      STEPERR = -1
      DO 20 ITNO = 1,MAXIT

*  5. rho=dot(rtilde,r)
          RHO0 = RHO
          DOTS(1) = ZDOTC(LOCLEN,WRK(IRTILDE),1,WRK(IR),1)
          CALL PZSUM(1,DOTS,IPAR)
          RHO = DOTS(1)

*  6. beta=rho*alpha/(rho0*omega)
          KAPPA = RHO0*OMEGA
          IF (KAPPA.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 6
              GO TO 9999

          END IF

          BETA = RHO*ALPHA/KAPPA

*  7. p=r+beta*(p-omega*v)
          CALL ZAXPY(LOCLEN,-OMEGA,WRK(IV),1,WRK(IP),1)
          CALL ZCOPY(LOCLEN,WRK(IP),1,WRK(IW),1)
          CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IP),1)
          CALL ZAXPY(LOCLEN,BETA,WRK(IW),1,WRK(IP),1)

*  8. v=Q1AQ2p
          IF (PRECONTYPE.EQ.0) THEN
              CALL MATVEC(WRK(IP),WRK(IV),IPAR)

          ELSE IF (PRECONTYPE.EQ.1) THEN
              CALL MATVEC(WRK(IP),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IV),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
              CALL PRECONR(WRK(IP),WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IV),IPAR)

          ELSE IF (PRECONTYPE.EQ.3) THEN
              CALL PRECONR(WRK(IP),WRK(IV),IPAR)
              CALL MATVEC(WRK(IV),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IV),IPAR)
          END IF

*  9. xi=dot(rtilde,v)
          DOTS(1) = ZDOTC(LOCLEN,WRK(IRTILDE),1,WRK(IV),1)
          CALL PZSUM(1,DOTS,IPAR)
          XI = DOTS(1)

* 10. alpha=rho/xi
          IF (XI.EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 10
              GO TO 9999

          END IF

          ALPHA = RHO/XI

* 11. s=r-alpha*v
          CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IS),1)
          CALL ZAXPY(LOCLEN,-ALPHA,WRK(IV),1,WRK(IS),1)

* 12. if ||s||<breaktol then soft-breakdown has occurred
          KAPPA = ZZERO
          CALL PDZNRM(KAPPA,LOCLEN,WRK(IS),IPAR)
          IF (ABS(KAPPA).LT.MACHEPS) THEN
              STATUS = -2
              STEPERR = 12
              CALL ZAXPY(LOCLEN,ALPHA,WRK(IP),1,X,1)
              GO TO 9999

          END IF

* 13. t=Q1AQ2s
          IF (PRECONTYPE.EQ.0) THEN
              CALL MATVEC(WRK(IS),WRK(IT),IPAR)

          ELSE IF (PRECONTYPE.EQ.1) THEN
              CALL MATVEC(WRK(IS),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IT),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
              CALL PRECONR(WRK(IS),WRK(IZ),IPAR)
              CALL MATVEC(WRK(IZ),WRK(IT),IPAR)

          ELSE IF (PRECONTYPE.EQ.3) THEN
              CALL PRECONR(WRK(IS),WRK(IT),IPAR)
              CALL MATVEC(WRK(IT),WRK(IZ),IPAR)
              CALL PRECONL(WRK(IZ),WRK(IT),IPAR)
          END IF

* 14. omega=dot(t,s)/dot(t,t)
          DOTS(1) = ZDOTC(LOCLEN,WRK(IT),1,WRK(IT),1)
          DOTS(2) = ZDOTC(LOCLEN,WRK(IT),1,WRK(IS),1)

*  Accumulate simultaneously partial values
          CALL PZSUM(2,DOTS,IPAR)

          IF (DOTS(1).EQ.ZZERO) THEN
              STATUS = -3
              STEPERR = 14
              GO TO 9999

          END IF

          OMEGA = DOTS(2)/DOTS(1)

* 15. x=x+alpha*p+omega*s
          CALL ZCOPY(LOCLEN,X,1,WRK(IXOLD),1)
          CALL ZAXPY(LOCLEN,ALPHA,WRK(IP),1,X,1)
          CALL ZAXPY(LOCLEN,OMEGA,WRK(IS),1,X,1)

* 16. r=s-omega*t
          CALL ZCOPY(LOCLEN,WRK(IS),1,WRK(IR),1)
          CALL ZAXPY(LOCLEN,-OMEGA,WRK(IT),1,WRK(IR),1)

* 17. check stopping criterion
          CALL STOPCRIT(B,WRK(IR),WRK(IZ),X,WRK(IXOLD),WRK(IW),RHSSTOP,
     +                  CNVRTX,EXITNORM,STATUS,IPAR,MATVEC,MATVEC,
     +                  PRECONR,PZSUM,PDZNRM)

*  Call monitoring routine
          CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IR),WRK(IZ))

          IF (STATUS.EQ.0) THEN
              GO TO 9999
          END IF

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
