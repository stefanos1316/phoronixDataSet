      SUBROUTINE PIMZRGCR(X,B,WRK,IPAR,DPAR,MATVEC,PRECONL,PRECONR,
     +                    PZSUM,PDZNRM,PROGRESS)
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
      DOUBLE COMPLEX ALPHA,BETA,XI
      DOUBLE PRECISION EPSILON,EXITNORM,RHSSTOP
      INTEGER BASISDIM,BLKSZ,CNVRTX,I,IDOTS,IP,IQ,IR,ITNO,IW,IXOLD,IZ,
     +        IZETA,J,J0,K,K1,LDA,LOCLEN,MAXIT,N,NPROCS,PRECONTYPE,
     +        PROCID,STATUS,STEPERR,STOPTYPE
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
      EXTERNAL PIMDGETPAR,STOPCRIT,ZAXPY,ZCOPY,ZINIT
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
      IW = IP + BASISDIM*LOCLEN
      IZETA = IW + BASISDIM*LOCLEN
      IZ = IZETA + BASISDIM
      IQ = IZ + LOCLEN
      IXOLD = IQ + LOCLEN
      IDOTS = IXOLD + LOCLEN

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

*  Loop
      STATUS = 0
      EXITNORM = -ONE
      STEPERR = -1
      DO 20 ITNO = 1,MAXIT

*  2. p(1)=r
          CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IP),1)

          K = 0
          DO 40 J = 1,BASISDIM
              J0 = J - 1

*  3. w(j)=Q1AQ2p(j)
              IF (PRECONTYPE.EQ.0) THEN
                  CALL MATVEC(WRK(IP+K),WRK(IW+K),IPAR)

              ELSE IF (PRECONTYPE.EQ.1) THEN
                  CALL MATVEC(WRK(IP+K),WRK(IZ),IPAR)
                  CALL PRECONL(WRK(IZ),WRK(IW+K),IPAR)

              ELSE IF (PRECONTYPE.EQ.2) THEN
                  CALL PRECONR(WRK(IP+K),WRK(IZ),IPAR)
                  CALL MATVEC(WRK(IZ),WRK(IW+K),IPAR)

              ELSE IF (PRECONTYPE.EQ.3) THEN
                  CALL PRECONR(WRK(IP+K),WRK(IW+K),IPAR)
                  CALL MATVEC(WRK(IW+K),WRK(IZ),IPAR)
                  CALL PRECONL(WRK(IZ),WRK(IW+K),IPAR)
              END IF

*  4. zeta(j)=dot(w(j),w(j))
              DOTS(1) = ZDOTC(LOCLEN,WRK(IW+K),1,WRK(IW+K),1)

*  5. xi=dot(r,w(j))
              DOTS(2) = ZDOTC(LOCLEN,WRK(IR),1,WRK(IW+K),1)

*  Accumulate simultaneously partial values
              CALL PZSUM(2,DOTS,IPAR)
              WRK(IZETA+J0) = DOTS(1)
              XI = DOTS(2)

*  5. alpha=xi/zeta(j)
              IF (WRK(IZETA+J0).EQ.ZZERO) THEN
                  STATUS = -3
                  STEPERR = 5
                  GO TO 9999

              END IF

              ALPHA = XI/WRK(IZETA+J0)

*  6. x=x+alpha*p(j)
              CALL ZCOPY(LOCLEN,X,1,WRK(IXOLD),1)
              CALL ZAXPY(LOCLEN,ALPHA,WRK(IP+K),1,X,1)

*  7. r=r-alpha*w(j)
              CALL ZAXPY(LOCLEN,-ALPHA,WRK(IW+K),1,WRK(IR),1)

*  8. check stopping criterion
              CALL STOPCRIT(B,WRK(IR),WRK(IZ),X,WRK(IXOLD),WRK(IQ),
     +                      RHSSTOP,CNVRTX,EXITNORM,STATUS,IPAR,MATVEC,
     +                      MATVEC,PRECONR,PZSUM,PDZNRM)

*  Call monitoring routine
              CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IR),WRK(IZ))

              IF (STATUS.EQ.0) THEN
                  GO TO 9999
              END IF

*  9. q=Q1AQ2r
              IF (PRECONTYPE.EQ.0) THEN
                  CALL MATVEC(WRK(IR),WRK(IQ),IPAR)

              ELSE IF (PRECONTYPE.EQ.1) THEN
                  CALL MATVEC(WRK(IR),WRK(IZ),IPAR)
                  CALL PRECONL(WRK(IZ),WRK(IQ),IPAR)

              ELSE IF (PRECONTYPE.EQ.2) THEN
                  CALL PRECONR(WRK(IR),WRK(IZ),IPAR)
                  CALL MATVEC(WRK(IZ),WRK(IQ),IPAR)

              ELSE IF (PRECONTYPE.EQ.3) THEN
                  CALL PRECONR(WRK(IR),WRK(IQ),IPAR)
                  CALL MATVEC(WRK(IQ),WRK(IZ),IPAR)
                  CALL PRECONL(WRK(IZ),WRK(IQ),IPAR)
              END IF

* 10. p(j+1)=r-sum_{i=1}^{j}{dot(q,w(i))/zeta(i)*p(i)}
              IF (J.LT.BASISDIM) THEN

*  Compute partial inner-products
                  K1 = 0
                  DO 50 I = 0,J - 1
                      WRK(IDOTS+I) = ZDOTC(LOCLEN,WRK(IQ),1,WRK(IW+K1),
     +                               1)
                      K1 = K1 + LOCLEN
   50             CONTINUE

*  Accumulate simultaneously partial values
                  CALL PZSUM(J,WRK(IDOTS),IPAR)

*  Compute summation
                  CALL ZINIT(LOCLEN,ZZERO,WRK(IZ),1)
                  K1 = 0
                  DO 60 I = 0,J - 1
                      BETA = WRK(IDOTS+I)/WRK(IZETA+I)
                      CALL ZAXPY(LOCLEN,BETA,WRK(IP+K1),1,WRK(IZ),1)
                      K1 = K1 + LOCLEN
   60             CONTINUE

*  Compute p(j+1)
                  K = K + LOCLEN
                  CALL ZCOPY(LOCLEN,WRK(IR),1,WRK(IP+K),1)
                  CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IP+K),1)
              END IF

   40     CONTINUE

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
