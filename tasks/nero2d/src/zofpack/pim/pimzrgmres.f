      SUBROUTINE PIMZRGMRES(X,B,WRK,IPAR,DPAR,MATVEC,PRECONL,PRECONR,
     +                      PZSUM,PDZNRM2,PROGRESS)
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
      PARAMETER (IBDIM=50)
      INTEGER LDR
      PARAMETER (LDR=IBDIM+1)
      INTEGER LDG
      PARAMETER (LDG=IBDIM+2)
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
      DOUBLE COMPLEX ETA,KSI,TAU1,TAU2
      DOUBLE PRECISION BETA,EPSILON,EXITNORM,RHSSTOP
      INTEGER BASISDIM,BLKSZ,I,IRES,ITNO,IV,IW,IZ,J,K0,K1,LDA,LOCLEN,
     +        MAXIT,N,NPROCS,PRECONTYPE,PROCID,STATUS,STEPERR,STOPTYPE
      LOGICAL ENDED
*     ..
*     .. Local Arrays ..
      DOUBLE COMPLEX G(LDG),R(LDR,LDR),RHO(IBDIM)
*     ..
*     .. External Functions ..
      DOUBLE COMPLEX ZDOTC
      DOUBLE PRECISION DZSETRHSSTOP
      EXTERNAL ZDOTC,DZSETRHSSTOP
*     ..
*     .. External Subroutines ..
      EXTERNAL DECODE,ENCODE,GIVENS,PIMDGETPAR,ZAXPY,ZCOPY,ZINIT,ZSCAL,
     +         ZTRSV
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC ABS,DCMPLX
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

*  Set indices for mapping local vectors into wrk
      IRES = 1
      IZ = IRES + LOCLEN
      IW = IZ + LOCLEN
      IV = IW + LOCLEN

*  Set rhs of stopping criteria
      RHSSTOP = DZSETRHSSTOP(B,WRK(IRES),EPSILON,IPAR,PRECONL,PDZNRM2)

*  1. r=Q1(b-AQ2x)
      IF (PRECONTYPE.EQ.0) THEN
*     r=b-Ax
          CALL ZCOPY(LOCLEN,B,1,WRK(IRES),1)
          CALL MATVEC(X,WRK(IW),IPAR)
          CALL ZAXPY(LOCLEN,-ZONE,WRK(IW),1,WRK(IRES),1)

      ELSE IF (PRECONTYPE.EQ.1) THEN
*     r=Q1(b-Ax)
          CALL ZCOPY(LOCLEN,B,1,WRK(IZ),1)
          CALL MATVEC(X,WRK(IW),IPAR)
          CALL ZAXPY(LOCLEN,-ZONE,WRK(IW),1,WRK(IZ),1)
          CALL PRECONL(WRK(IZ),WRK(IRES),IPAR)

      ELSE IF (PRECONTYPE.EQ.2) THEN
*     r=b-AQ2x
          CALL ZCOPY(LOCLEN,B,1,WRK(IRES),1)
          CALL PRECONR(X,WRK(IW),IPAR)
          CALL MATVEC(WRK(IW),WRK(IZ),IPAR)
          CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IRES),1)

      ELSE IF (PRECONTYPE.EQ.3) THEN
*     r=Q1(b-AQ2x)
          CALL ZCOPY(LOCLEN,B,1,WRK(IW),1)
          CALL PRECONR(X,WRK(IRES),IPAR)
          CALL MATVEC(WRK(IRES),WRK(IZ),IPAR)
          CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IW),1)
          CALL PRECONL(WRK(IW),WRK(IRES),IPAR)
      END IF

*  2. beta=||r||_2
      BETA = ZZERO
      CALL PDZNRM2(BETA,LOCLEN,WRK(IRES),IPAR)

*  Loop
      STATUS = 0
      STEPERR = -1
      EXITNORM = -ONE
      ENDED = .FALSE.
      DO 20 ITNO = 1,MAXIT

*  3. g=(beta,beta,...)
          G(1) = DCMPLX(BETA)
          G(2) = DCMPLX(BETA)

*  4. V(1)=r/beta
          IF (BETA.EQ.ZERO) THEN
              STATUS = -3
              STEPERR = 4
              GO TO 9999

          END IF

          CALL ZCOPY(LOCLEN,WRK(IRES),1,WRK(IV),1)
          CALL ZSCAL(LOCLEN,DCMPLX(ONE/BETA),WRK(IV),1)

          K0 = 0
          DO 40 J = 1,BASISDIM

*     z=Q1AQ2V(j)
              IF (PRECONTYPE.EQ.0) THEN
                  CALL MATVEC(WRK(IV+K0),WRK(IZ),IPAR)

              ELSE IF (PRECONTYPE.EQ.1) THEN
                  CALL MATVEC(WRK(IV+K0),WRK(IW),IPAR)
                  CALL PRECONL(WRK(IW),WRK(IZ),IPAR)

              ELSE IF (PRECONTYPE.EQ.2) THEN
                  CALL PRECONR(WRK(IV+K0),WRK(IW),IPAR)
                  CALL MATVEC(WRK(IW),WRK(IZ),IPAR)

              ELSE IF (PRECONTYPE.EQ.3) THEN
                  CALL PRECONR(WRK(IV+K0),WRK(IZ),IPAR)
                  CALL MATVEC(WRK(IZ),WRK(IW),IPAR)
                  CALL PRECONL(WRK(IW),WRK(IZ),IPAR)
              END IF


*  5. R(i,j)=dot(V(i),Q1AQ2V(j))
              K1 = 0
              DO 50 I = 1,J
                  R(I,J) = ZDOTC(LOCLEN,WRK(IV+K1),1,WRK(IZ),1)
                  K1 = K1 + LOCLEN
   50         CONTINUE
              CALL PZSUM(J,R(1,J),IPAR)

*  6. Vhat(j)=Q1AQ2V(j)-sum_{i=1}^{j}{R(i,j)V(i)}
              K1 = 0
              CALL ZINIT(LOCLEN,ZZERO,WRK(IW),1)
              DO 60 I = 1,J
                  CALL ZAXPY(LOCLEN,R(I,J),WRK(IV+K1),1,WRK(IW),1)
                  K1 = K1 + LOCLEN
   60         CONTINUE
              CALL ZSCAL(LOCLEN,-ZONE,WRK(IW),1)
              CALL ZAXPY(LOCLEN,ZONE,WRK(IZ),1,WRK(IW),1)

*  From this point, w holds the (j+1)-st column of vhat

*  7. R(j+1,j)=||Vhat(j)||_2
              CALL PDZNRM2(R(J+1,J),LOCLEN,WRK(IW))

*  8. V(j+1)=Vhat(j)/R(j+1,j)
              IF (R(J+1,J).EQ.ZZERO) THEN
                  STATUS = -2
                  STEPERR = 8
                  GO TO 9999

              END IF

              K0 = K0 + LOCLEN
              CALL ZSCAL(LOCLEN,ZONE/R(J+1,J),WRK(IW),1)
              CALL ZCOPY(LOCLEN,WRK(IW),1,WRK(IV+K0),1)

*  9. Apply previous Givens' rotations to column j of R
              DO 70 I = 1,J - 1
                  CALL DECODE(RHO(I),KSI,ETA)
                  TAU1 = R(I,J)
                  TAU2 = R(I+1,J)
                  R(I,J) = KSI*TAU1 - ETA*TAU2
                  R(I+1,J) = ETA*TAU1 + KSI*TAU2
   70         CONTINUE

* 10. Compute Givens' rotation to zero element R(j+1,j)
              CALL GIVENS(R(J,J),R(J+1,J),KSI,ETA)
              TAU1 = R(J,J)
              TAU2 = R(J+1,J)
              R(J,J) = KSI*TAU1 - ETA*TAU2
              R(J+1,J) = ETA*TAU1 + KSI*TAU2
              CALL ENCODE(RHO(J),KSI,ETA)

*  11. Update g
              G(J) = G(J)*KSI
              G(J+1) = G(J+1)*ETA
              G(J+2) = G(J+1)

*  12. If |g(j+1)|<rhsstop stop
              EXITNORM = ABS(G(J+1))
              IF (EXITNORM.LT.RHSSTOP) THEN
                  BASISDIM = J
                  ENDED = .TRUE.
                  GO TO 80

              END IF

   40     CONTINUE
   80     CONTINUE

*  13. Solve Ry=g (solution to least-squares problem)
          CALL ZTRSV('U','N','N',BASISDIM,R,LDR,G,1)

*  14. x=x+Vy (Form approximate solution after a c-cycle)
          K1 = 0
          DO 100 I = 1,BASISDIM
              CALL ZAXPY(LOCLEN,G(I),WRK(IV+K1),1,X,1)
              K1 = K1 + LOCLEN
  100     CONTINUE

*  Call monitoring routine
          CALL PROGRESS(LOCLEN,ITNO,EXITNORM,X,WRK(IRES),WRK(IRES))

          IF (ENDED) GO TO 9999

*  15. r=Q1(b-AQ2x)
          IF (PRECONTYPE.EQ.0) THEN
*     r=b-Ax
              CALL ZCOPY(LOCLEN,B,1,WRK(IRES),1)
              CALL MATVEC(X,WRK(IW),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IW),1,WRK(IRES),1)

          ELSE IF (PRECONTYPE.EQ.1) THEN
*     r=Q1(b-Ax)
              CALL ZCOPY(LOCLEN,B,1,WRK(IZ),1)
              CALL MATVEC(X,WRK(IW),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IW),1,WRK(IZ),1)
              CALL PRECONL(WRK(IZ),WRK(IRES),IPAR)

          ELSE IF (PRECONTYPE.EQ.2) THEN
*     r=b-AQ2x
              CALL ZCOPY(LOCLEN,B,1,WRK(IRES),1)
              CALL PRECONR(X,WRK(IW),IPAR)
              CALL MATVEC(WRK(IW),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IRES),1)

          ELSE IF (PRECONTYPE.EQ.3) THEN
*     r=Q1(b-AQ2x)
              CALL ZCOPY(LOCLEN,B,1,WRK(IW),1)
              CALL PRECONR(X,WRK(IRES),IPAR)
              CALL MATVEC(WRK(IRES),WRK(IZ),IPAR)
              CALL ZAXPY(LOCLEN,-ZONE,WRK(IZ),1,WRK(IW),1)
              CALL PRECONL(WRK(IW),WRK(IRES),IPAR)
          END IF

*  16. beta=||r||_2
          CALL PDZNRM2(BETA,LOCLEN,WRK(IRES),IPAR)

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
