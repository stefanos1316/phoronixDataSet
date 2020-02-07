dnl @synopsis ACX_BLAS([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])
dnl
dnl This macro looks for a library that implements the BLAS
dnl linear-algebra interface (see http://www.netlib.org/blas/).
dnl On success, it sets the BLAS_LIBS output variable to
dnl hold the requisite library linkages.
dnl
dnl To link with BLAS, you should link with:
dnl
dnl 	$BLAS_LIBS $LIBS $FCLIBS
dnl
dnl in that order.  FCLIBS is the output variable of the
dnl AC_FC_LIBRARY_LDFLAGS macro (called if necessary by ACX_BLAS),
dnl and is sometimes necessary in order to link with FC libraries.
dnl Users will also need to use AC_FC_DUMMY_MAIN (see the autoconf
dnl manual), for the same reason.
dnl
dnl Many libraries are searched for, from ATLAS to CXML to ESSL.
dnl The user may also use --with-blas=<lib> in order to use some
dnl specific BLAS library <lib>.  In order to link successfully,
dnl however, be aware that you will probably need to use the same
dnl Fortran compiler (which can be set via the FC env. var.) as
dnl was used to compile the BLAS library.
dnl
dnl ACTION-IF-FOUND is a list of shell commands to run if a BLAS
dnl library is found, and ACTION-IF-NOT-FOUND is a list of commands
dnl to run it if it is not found.  If ACTION-IF-FOUND is not specified,
dnl the default action will define HAVE_BLAS.
dnl
dnl This macro requires autoconf 2.50 or later.
dnl
dnl @version $Id: acx_f77blas.m4,v 1.2 2005/06/10 12:08:55 juselius Exp $
dnl @author Steven G. Johnson <stevenj@alum.mit.edu>
dnl
dnl Modified by Jonas Juselius <jonas@iki.fi>
dnl
dnl Modified by Jan Fostier <jan.fostier@intec.ugent.be>
dnl
AC_DEFUN([ACX_BLAS], [
AC_PREREQ(2.61)

acx_blas_ok=no
acx_blas_save_LIBS="$LIBS"
acx_blas_save_LDFLAGS="$LDFLAGS"
acx_blas_save_FFLAGS="$FFLAGS"
acx_blas_libs=""
acx_blas_dir=""

# Parse "--with-blas=<lib>" option
AC_ARG_WITH(blas,
  [AS_HELP_STRING([--with-blas@<:@=LIB@:>@],
                  [use BLAS library, optionally specified by LIB])])
case $with_blas in
	yes | "") ;;
	no) acx_blas_ok=disable ;;
	-l* | */* | *.a | *.so | *.so.* | *.o) acx_blas_libs="$with_blas" ;;
	*) acx_blas_libs="-l$with_blas" ;;
esac

# Parse "--with-blas-dir=<dir>" option
AC_ARG_WITH(blas_dir,
	[AS_HELP_STRING([--with-blas-dir@<:@=DIR@:>@],
	[look for BLAS library in a directory, optionally specified by DIR])])
case $with_blas_dir in
      yes | no | "") ;;
     -L*) LDFLAGS="$LDFLAGS $with_blas_dir"
	      acx_blas_dir="$with_blas_dir" ;;
      *) LDFLAGS="$LDFLAGS -L$with_blas_dir"
	      acx_blas_dir="-L$with_blas_dir" ;;
esac

# Are we linking from C?
case "$ac_ext" in
  f*|F*) sgemm="sgemm" ;;
  *)
   AC_F77_FUNC([sgemm])
   LIBS="$LIBS $FLIBS"
   ;;
esac

# If --with-blas is defined, then look for THIS AND ONLY THIS blas lib
if test "x$acx_blas_ok" = "xno"; then
case $with_blas in
    ""|yes) ;;
	*) save_LIBS="$LIBS"; LIBS="$acx_blas_libs $LIBS"
	AC_MSG_CHECKING([for $sgemm in $acx_blas_libs])
	AC_TRY_LINK_FUNC($sgemm, [acx_blas_ok=yes])
	AC_MSG_RESULT($acx_blas_ok)
	if test "x$acx_blas_ok" = "xno"; then
		LIBS="$save_LIBS"
		acx_blas_libs=""
		acx_blas_ok="failed"
	fi
	;;
esac
fi

# First, check BLAS_LIBS environment variable
if test "x$acx_blas_ok" = "xno"; then
if test "x$BLAS_LIBS" != "x"; then
	save_LIBS="$LIBS"; LIBS="$BLAS_LIBS $LIBS"
	AC_MSG_CHECKING([for $sgemm in $BLAS_LIBS])
	AC_TRY_LINK_FUNC([$sgemm], [acx_blas_ok="yes"; acx_blas_libs="$BLAS_LIBS"])
	AC_MSG_RESULT($acx_blas_ok)
	LIBS="$save_LIBS"
fi
fi

# BLAS linked to by default?  (happens on some supercomputers)
if test "x$acx_blas_ok" = "xno"; then
	AC_MSG_CHECKING([for builtin $sgemm])
	AC_TRY_LINK_FUNC([$sgemm], [acx_blas_ok=yes])
	AC_MSG_RESULT($acx_blas_ok)
fi

# BLAS in MKL library?
# (http://www.intel.com/cd/software/products/asmo-na/eng/perflib/mkl/index.htm)
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying INTEL MKL:])
	AC_CHECK_LIB([mkl], [$sgemm], 
		[acx_blas_ok="yes"; acx_blas_libs="-lmkl -lguide -lpthread"],
		[], [-lguide -lpthread])
fi

# BLAS in ACML library? (http://developer.amd.com/acml.aspx)
# +------------+-----------+---------------------+
# |            |  32-bit   |       64-bit        |
# +------------+-----------+---------------------+
# | GCC <  4.2 | -lacml    | -lacml -lacml_mv    |
# | GCC >= 4.2 | -lacml_mp | -lacml_mp -lacml_mv |
# +------------+-----------+---------------------+
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying AMD ACML:])
	AC_CHECK_LIB([acml], [$sgemm], 
		[acx_blas_ok="yes"; acx_blas_libs="-lacml"],
		[], [])
fi
if test "x$acx_blas_ok" = "xno"; then
        AC_CHECK_LIB([acml_mp], [$sgemm],
                [acx_blas_ok="yes"; acx_blas_libs="-lacml_mp"],
                [], [])
fi
if test "x$acx_blas_ok" = "xno"; then
        AC_CHECK_LIB([acml], [$sgemm],
                [acx_blas_ok="yes"; acx_blas_libs="-lacml -lacml_mv"],
                [], [-lacml_mv])
fi
if test "x$acx_blas_ok" = "xno"; then
        AC_CHECK_LIB([acml_mp], [$sgemm],
                [acx_blas_ok="yes"; acx_blas_libs="-lacml_mp -lacml_mv"],
                [], [-lacml_mv])
fi

# BLAS in ATLAS library? (http://math-atlas.sourceforge.net/)
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying ATLAS:])
	AC_CHECK_LIB([f77blas], [$sgemm],
		[acx_blas_ok="yes"; acx_blas_libs="-lf77blas -latlas"],
		[], [-latlas])
fi

# ia64-hp-hpux11.22 BLAS library?
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying VECLIB:])
        AC_CHECK_LIB([veclib], [$sgemm],
		[acx_blas_ok="yes"; acx_blas_libs="-lveclib8"], 
		[], [])
fi

# BLAS in PhiPACK libraries? (requires generic BLAS lib, too)
if test "x$acx_blas_ok" = "xno"; then
	AC_MSG_NOTICE([Trying PhiPACK:])
	AC_CHECK_LIB(blas, $sgemm,
		[AC_CHECK_LIB(dgemm, dgemm,
			[AC_CHECK_LIB(sgemm, $sgemm,
			[acx_blas_ok="yes"; acx_blas_libs="-lsgemm -ldgemm -lblas"],
			[], [-lblas])],
		[], [-lblas])
	])
fi

# BLAS in Alpha CXML library?
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying ALPHA CXML:])
	AC_CHECK_LIB([cxml], [$sgemm], 
		[acx_blas_ok="yes"; acx_blas_libs="-lcxml"],
		[], [])
fi

# BLAS in Alpha DXML library? (now called CXML, see above)
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying ALPHA DXML:])
	AC_CHECK_LIB([dxml], [$sgemm], 
		[acx_blas_ok="yes"; acx_blas_libs="-ldxml"],
		[], [])
fi

# BLAS in Sun Performance library?
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying SUN Performance Library:])
	if test "x$GCC" != "xyes"; then # only works with Sun CC
		AC_CHECK_LIB([sunmath], [acosp],
			[AC_CHECK_LIB([sunperf], [$sgemm],
        			[acx_blas_libs="-xlic_lib=sunperf -lsunmath"; acx_blas_ok=yes],
				[], [-lsunmath])],
			[], [])
	fi
fi

# BLAS in SCSL library?  (SGI/Cray Scientific Library)
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying SGI/Cray Scientific Library:])
	AC_CHECK_LIB([scs], [$sgemm], 
		[acx_blas_ok="yes"; acx_blas_libs="-lscs"],
		[], [])
fi

# BLAS in SGIMATH library?
if test "x$acx_blas_ok" = "xno"; then
        AC_MSG_NOTICE([Trying SGIMATH:])
	AC_CHECK_LIB([complib.sgimath], [$sgemm],
		[acx_blas_ok="yes"; acx_blas_libs="-lcomplib.sgimath"],
		[], [])
fi

# BLAS in IBM ESSL library? (requires generic BLAS lib, too)
if test "x$acx_blas_ok" = "xno"; then
	unset ac_cv_lib_blas_sgemm
	AC_MSG_NOTICE([Trying IBM ESSL:])
	AC_CHECK_LIB([blas], [$sgemm],
		[AC_CHECK_LIB([essl], [$sgemm],
			[acx_blas_ok="yes"; acx_blas_libs="-lessl -lblas"],
			[], [-lblas])],
		[], [])
fi

# Generic BLAS library?
if test "x$acx_blas_ok" = "xno"; then
	unset ac_cv_lib_blas_sgemm
        AC_MSG_NOTICE([Desperately trying generic libblas:])
	AC_CHECK_LIB([blas], [$sgemm], 
		[acx_blas_ok="yes"; acx_blas_libs="-lblas"],
		[], [])
fi

# blas on SGI/CRAY
if test "x$acx_blas_ok" = "xno"; then
        unset ac_cv_lib_blas_sgemm
        AC_CHECK_LIB([blas], [$sgemm],
                [acx_blas_ok="yes"; acx_blas_libs="-lblas -lcraylibs"],
                [], [-lcraylibs])
fi

BLAS_LIBS="$acx_blas_libs"
AC_SUBST(BLAS_LIBS)

LIBS="$acx_blas_save_LIBS"
LDFLAGS="$acx_blas_save_LDFLAGS $acx_blas_dir"

# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
if test "x$acx_blas_ok" = "xyes"; then
        ifelse([$1],,AC_DEFINE(HAVE_BLAS,1,[Define if you have a BLAS library.]),[$1])
        :
else
        acx_blas_ok="no"
        $2
fi
])dnl ACX_BLAS
