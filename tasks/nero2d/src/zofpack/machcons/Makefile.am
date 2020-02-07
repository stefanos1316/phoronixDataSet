METASOURCES = AUTO
noinst_LTLIBRARIES =
# Conditionally compile LAPACK
if COMPILE_LAPACK
  noinst_LTLIBRARIES += libmachcons.la
endif

libmachcons_la_SOURCES = dlamc1.f dlamc2.f dlamc3.f dlamc4.f dlamc5.f dlamch.f

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Make sure this part of LAPACK gets compiled without any optimization
# You may edit these flags only if you know what you are doing.
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

FFLAGS =
AM_FFLAGS =
libmachcons_la_FFLAGS =
