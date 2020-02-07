bin_PROGRAMS = nero2d
nero2d_SOURCES = agghandler2d.cpp cnfgfile.cpp excitation.cpp geometry.cpp \
	handlman.cpp helm2d.cpp integrations.cpp inthandler2d.cpp levelhandler2d.cpp \
	mathlib.cpp matrix.cpp medium.cpp nearinthandler2d.cpp nero2d.cpp object.cpp \
	output.cpp scene2d.cpp segment.cpp solve.cpp translhandler2d.cpp

# set the include path found by configure
INCLUDES = $(all_includes)

blas_libs=@BLAS_LIBS@
lapack_libs=@LAPACK_LIBS@
mpe_libs=@MPE_LIBS@
fftw_libs=@FFTW_LIBS@

# the library search path.
nero2d_LTLDFLAGS = $(all_libraries)
noinst_LTHEADERS = scene2d.h nero2d.h mathlib.h helm2d.h excitation.h \
	integrations.h

nero2d_LDADD = $(top_builddir)/src/grafix/libgrafix.la \
	$(top_builddir)/src/nexus/libnexus.la $(top_builddir)/src/zofpack/libzofpack.la $(fftw_libs) $(lapack_libs) \
	$(blas_libs) $(FLIBS) $(mpe_libs) -lm
SUBDIRS = zofpack grafix nexus

CXX=@MPICXX@

noinst_HEADERS = base.h output.h agghandler2d.h translhandler2d.h \
	inthandler2d.h levelhandler2d.h nearinthandler2d.h splaytree.h matrix.h medium.h \
	geometry.h object.h segment.h cnfgfile.h handlman.h

nero2d_LDFLAGS = -static
