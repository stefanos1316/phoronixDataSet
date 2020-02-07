info_TEXINFOS = nero2d.texi
EXTRA_DIST = nero2d.pdf

nero2d.pdf: geometry.pdf excitation.pdf output.pdf wxgbtool.pdf createbmp.pdf

.png.pdf:
	convert $< $@

.eps.pdf:
	convert $< $@

clean-local:
	rm -f *.pdf
