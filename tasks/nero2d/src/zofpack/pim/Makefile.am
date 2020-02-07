METASOURCES = AUTO
noinst_LTLIBRARIES = libpim.la
libpim_la_SOURCES = decode.f dmachcons.f dzsetrhsstop.f encode.f givens.f \
	pimdgetpar.f pimdprtpar.f pimdsetpar.f pimzbicg.f pimzbicgstab.f pimzbicgstab2.f \
	pimzcg.f pimzcgne.f pimzcgnr.f pimzcgs.f pimzchebyshev.f pimzqmr.f \
	pimzrbicgstab.f pimzrgcr.f pimzrgmres.f pimzrgmresev.f pimztfqmr.f pimztfqmr2.f \
	stopcrit.f zinit.f zsign.f
# Conditionally compile zdotc.f
if COMPILE_ZDOTC
  libpim_la_SOURCES += zdotc.f
endif
