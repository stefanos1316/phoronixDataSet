METASOURCES = AUTO
noinst_LTLIBRARIES = 
# Conditional compilation of the BLAS
if COMPILE_BLAS
  noinst_LTLIBRARIES += libblas.la
endif
libblas_la_SOURCES = dasum.f daxpy.f dcabs1.f dcopy.f ddot.f dgemm.f dgemv.f\
	dger.f dmach.f dnrm2.f drot.f dscal.f dswap.f dsymv.f dsyr.f dsyr2.f\
	dsyr2k.f dsyrk.f dtbsv.f dtrmm.f dtrmv.f dtrsm.f dtrsv.f dzasum.f\
	dznrm2.f idamax.f izamax.f lsame.f sdot.f sgemm.f sgemv.f sscal.f\
	ssyrk.f strsm.f zaxpy.f zcopy.f zdotu.f zdrot.f zdscal.f zgemm.f\
	zgemv.f zgerc.f zgeru.f zhemv.f zher.f zher2.f zher2k.f zherk.f zscal.f\
	zswap.f ztbsv.f ztrmm.f ztrmv.f ztrsm.f ztrsv.f zdotc.f
libblas_la_LDFLAGS = -avoid-version
