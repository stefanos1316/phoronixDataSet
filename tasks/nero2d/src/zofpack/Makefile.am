METASOURCES = AUTO
SUBDIRS = amos blas lapack machcons pim

noinst_LTLIBRARIES = libzofpack.la
libzofpack_la_LIBADD = $(top_builddir)/src/zofpack/pim/libpim.la\
	$(top_builddir)/src/zofpack/amos/libamos.la

# Conditionally compile LAPACK
if COMPILE_LAPACK
  libzofpack_la_LIBADD += $(top_builddir)/src/zofpack/lapack/liblapack.la
  libzofpack_la_LIBADD += $(top_builddir)/src/zofpack/machcons/libmachcons.la
endif

# Conditionally compile BLAS
if COMPILE_BLAS
  libzofpack_la_LIBADD += $(top_builddir)/src/zofpack/blas/libblas.la
endif

libzofpack_la_SOURCES =
libzofpack_la_LDFLAGS = -static
