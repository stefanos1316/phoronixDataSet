      SUBROUTINE PIMDPRTPAR(IPAR,DPAR)

c           PIM -- The Parallel Iterative Methods package
c           ---------------------------------------------
c
c                      Rudnei Dias da Cunha
c               Centro de Processamento de Dados,
c         Universidade Federal do Rio Grande do Sul, Brasil
c                              and
c     Computing Laboratory, University of Kent at Canterbury, U.K.
c
c                          Tim Hopkins
c     Computing Laboratory, University of Kent at Canterbury, U.K.
c
c ----------------------------------------------------------------------
c
c  Description of parameter arrays
c   IPAR (INPUT)  : integer
c     ipar( 1): lda    (Leading dimension of a)
c           2 : n      (Number of rows/columns of a)
c           3 : blksz  (Size of block of data; used when data is
c                       partitioned using cyclic mode)
c           4 : loclen (Number of elements stored locally;
c                       *PARALLEL: Equal to at least m/nprocs or
c                                  n/procs depending if row or
c                                  column partitioning is used or,
c                                  in the case of cyclic partitioning,
c                                  it is a multiple of either
c                                  m/(blksz*nprocs) or n/(blksz*nprocs).
c                       *SEQUENTIAL: equal to n)
c           5 : basisdim (Dimension of orthogonal basis, used in
c                       GMRES)
c           6 : nprocs (Number of processors)
c           7 : procid (Processor identification)
c           8 : precontype (Type of preconditioning; one of
c                           0 : No preconditioning,
c                           1 : Left preconditioning,
c                           2 : Right preconditioning,
c                           3 : Symmetric preconditioning)
c           9 : stoptype (Type of stopping criteria used)
c          10 : maxit  (Maximum number of iterations allowed)
c
c   IPAR (OUTPUT) : integer
c     ipar(11): itno   (Number of iterations executed)
c          12 : status (On exit of iterative method, one of
c                        0: converged to solution
c                       -1: no convergence has been achieved
c                       -2: "soft"-breakdown, solution may have
c                           been found
c                       -3: "hard"-breakdown, no solution)
c                       -4: conflict in preconditioner and stopping
c                           criterion selected
c                       -5: error in stopping criterion 3, r^{T}z<0)
c          13 : steperr (If status is either -2 or -3, it gives
c                         the step number of the respective algorithm
c                         where a breakdown has occurred. Refer to the
c                         User's Guide for further information)
c
c   RPAR/DPAR (INPUT)  : real/double precision
c     dpar( 1): epsilon (The value of epsilon for use in the
c                        stopping criterion)
c
c   RPAR/DPAR (OUTPUT) : real/double precision
c     dpar( 2): exitnorm (The value of a norm of either the residual
c                         vector or the difference between two 
c                         successive solution estimates according to 
c                         the value of stoptype)
c           3,
c           4 : smallest and largest eigenvalues of Q1AQ2 (in the
c               symmetric case) OR smallest and largest real parts
c               (in the nonsymmetric case)
c           5,
c           6 : smallest and largest imaginary parts (only in the
c               nonsymmetric case)
c

C     .. Parameters ..
      INTEGER IPARSIZ
      PARAMETER (IPARSIZ=13)
      INTEGER DPARSIZ
      PARAMETER (DPARSIZ=6)
C     ..
C     .. Array Arguments ..
      DOUBLE PRECISION DPAR(DPARSIZ)
      INTEGER IPAR(IPARSIZ)
C     ..
C     .. Local Scalars ..
      INTEGER I
C     ..
      WRITE (6,FMT=10) (IPAR(I),I=1,IPARSIZ)

   10 FORMAT ('lda=',i6,/,'n=',i6,/,'blksz=',i6,/,'loclen=',i4,/,
     +       'basisdim=',i4,/,'nprocs=',i4,/,'procid=',i4,/,
     +       'precontype=',i4,/,'stoptype=',i4,/,'maxit=',i4,/,'itno=',
     +       i4,/,'status=',i4,/,'steperr=',i4)

      WRITE (6,FMT=20) (DPAR(I),I=1,DPARSIZ)

   20 FORMAT ('epsilon=',d20.12,/,'exitnorm=',d20.12,/,
     +       'eigenvalues region:',/,4(d20.12,1x))

      RETURN

      END
