##############################################################################
#               Makefile.am
#
# Process this file with automake to produce Makefile.in
#
# ---------------------------------------------------------------------------
# Persistence of Vision Ray Tracer ('POV-Ray') version 3.7.
# Copyright 1991-2013 Persistence of Vision Raytracer Pty. Ltd.
#
# POV-Ray is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# POV-Ray is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# ---------------------------------------------------------------------------
# POV-Ray is based on the popular DKB raytracer version 2.12.
# DKBTrace was originally written by David K. Buck.
# DKBTrace Ver 2.0-2.12 were written by David K. Buck & Aaron A. Collins.
##############################################################################

# Makefile.am for the source distribution of POV-Ray 3.7 for UNIX
# Written by POV-Ray Bugtracker http://bugs.povray.org/

# Libraries to build.
noinst_LIBRARIES = libpovray.a

# Source files.
libpovray_a_SOURCES = \
statspov.h base/povmscpp.cpp base/povms.h base/pointer.h base/path.h base/safemath.h base/textstream.cpp base/textstreambuffer.cpp base/image/gifdecod.cpp base/image/gif.cpp base/image/metadata.h base/image/jpeg_pov.h base/image/openexr.cpp base/image/hdr.h base/image/colourspace.h base/image/jpeg.cpp base/image/ppm.h base/image/tiff_pov.h base/image/hdr.cpp base/image/bmp.cpp base/image/pgm.cpp base/image/gif.h base/image/iff.h base/image/iff.cpp base/image/png.cpp base/image/bmp.h base/image/image.cpp base/image/png_pov.h base/image/targa.cpp base/image/targa.h base/image/encoding.h base/image/tiff.cpp base/image/image.h base/image/pgm.h base/image/encoding.cpp base/image/openexr.h base/image/colourspace.cpp base/image/ppm.cpp base/font/povlogo.h base/font/povlogo.cpp base/font/cyrvetic.h base/font/cyrvetic.cpp base/font/timrom.cpp base/font/crystal.cpp base/font/crystal.h base/font/timrom.h base/pov_err.h base/stringutilities.h base/stringutilities.cpp base/processoptions.h base/processoptions.cpp base/povmsgid.h base/timer.h base/timer.cpp base/precomp.cpp base/textstreambuffer.h base/povms.cpp base/fileinputoutput.h base/animation/moov.cpp base/animation/animation.cpp base/animation/moov.h base/animation/animation.h base/pov_err.cpp base/povmscpp.h base/path.cpp base/textstream.h base/types.h base/configbase.h base/precomp.h base/fileinputoutput.cpp base/platformbase.h base/povdebug.h lightgrp.cpp backend/parser/reswords.h backend/parser/express.cpp backend/parser/fnsyntax.cpp backend/parser/parse.cpp backend/parser/parstxtr.cpp backend/parser/function.cpp backend/parser/parse.h backend/parser/tokenize.cpp backend/parser/reswords.cpp backend/parser/parsestr.cpp backend/frame.h backend/configbackend.h backend/lighting/photonshootingtask.h backend/lighting/radiosity.h backend/lighting/photonsortingtask.cpp backend/lighting/subsurface.h backend/lighting/photons.h backend/lighting/photonestimationtask.h backend/lighting/photonestimationtask.cpp backend/lighting/photonshootingstrategy.cpp backend/lighting/rad_data.cpp backend/lighting/subsurface.cpp backend/lighting/photonstrategytask.h backend/lighting/photonshootingstrategy.h backend/lighting/photonstrategytask.cpp backend/lighting/photons.cpp backend/lighting/point.h backend/lighting/photonsortingtask.h backend/lighting/radiosity.cpp backend/lighting/point.cpp backend/lighting/photonshootingtask.cpp backend/colour/spectral.h backend/colour/colour.h backend/colour/colutils.cpp backend/colour/colutils.h backend/colour/spectral.cpp backend/colour/colour.cpp backend/support/fileutil.cpp backend/support/task.cpp backend/support/task.h backend/support/taskqueue.cpp backend/support/msgutil.cpp backend/support/fileutil.h backend/support/fixedallocator.h backend/support/imageutil.h backend/support/taskqueue.h backend/support/randomsequences.cpp backend/support/jitter.cpp backend/support/randomsequences.h backend/support/simplevector.h backend/support/msgutil.h backend/support/imageutil.cpp backend/support/statistics.cpp backend/support/jitter.h backend/support/bsptree.h backend/support/octree.h backend/support/octree.cpp backend/support/bsptree.cpp backend/support/statistics.h backend/math/hcmplx.h backend/math/splines.h backend/math/polysolv.h backend/math/mathutil.cpp backend/math/matrices.h backend/math/quatern.h backend/math/chi2.h backend/math/vector.h backend/math/matrices.cpp backend/math/splines.cpp backend/math/chi2.cpp backend/math/mathutil.h backend/math/quatern.cpp backend/math/polysolv.cpp backend/math/hcmplx.cpp backend/render/tracetask.h backend/render/tracepixel.cpp backend/render/radiositytask.cpp backend/render/trace.cpp backend/render/tracetask.cpp backend/render/rendertask.h backend/render/tracepixel.h backend/render/ray.h backend/render/rendertask.cpp backend/render/trace.h backend/render/radiositytask.h backend/render/ray.cpp backend/precomp.cpp backend/povray.cpp backend/texture/pigment.cpp backend/texture/normal.h backend/texture/avxfma4check.h backend/texture/texture.cpp backend/texture/normal.cpp backend/texture/texture.h backend/texture/pigment.h backend/bounding/boundingtask.cpp backend/bounding/bsphere.h backend/bounding/bbox.h backend/bounding/bsphere.cpp backend/bounding/bcyl.cpp backend/bounding/bbox.cpp backend/bounding/boundingtask.h backend/bounding/bcyl.h backend/vm/fnintern.h backend/vm/fnintern.cpp backend/vm/fnpovfpu.h backend/vm/fncode.cpp backend/vm/fnpovfpu.cpp backend/vm/fncode.h backend/povray.h backend/precomp.h backend/interior/media.cpp backend/interior/interior.cpp backend/interior/media.h backend/interior/interior.h backend/pattern/pattern.h backend/pattern/warps.h backend/pattern/warps.cpp backend/pattern/pattern.cpp backend/scene/threaddata.cpp backend/scene/objects.cpp backend/scene/objects.h backend/scene/view.cpp backend/scene/camera.cpp backend/scene/atmosph.cpp backend/scene/view.h backend/scene/threaddata.h backend/scene/atmosph.h backend/scene/scene.cpp backend/scene/scene.h backend/scene/camera.h backend/control/benchmark.h backend/control/renderbackend.h backend/control/messagefactory.h backend/control/renderbackend.cpp backend/control/messagefactory.cpp backend/control/benchmark.cpp backend/shape/truetype.cpp backend/shape/ovus.cpp backend/shape/discs.cpp backend/shape/polygon.h backend/shape/poly.cpp backend/shape/prism.h backend/shape/isosurf.cpp backend/shape/torus.cpp backend/shape/cones.h backend/shape/sor.cpp backend/shape/fpmetric.cpp backend/shape/bezier.cpp backend/shape/isosurf.h backend/shape/super.h backend/shape/mesh.h backend/shape/triangle.cpp backend/shape/lathe.cpp backend/shape/lathe.h backend/shape/poly.h backend/shape/spheres.cpp backend/shape/sphsweep.cpp backend/shape/boxes.h backend/shape/triangle.h backend/shape/quadrics.cpp backend/shape/mesh.cpp backend/shape/csg.h backend/shape/truetype.h backend/shape/prism.cpp backend/shape/fractal.h backend/shape/fractal.cpp backend/shape/planes.h backend/shape/quadrics.h backend/shape/hfield.cpp backend/shape/bezier.h backend/shape/csg.cpp backend/shape/sphsweep.h backend/shape/boxes.cpp backend/shape/ovus.h backend/shape/fpmetric.h backend/shape/spheres.h backend/shape/sor.h backend/shape/discs.h backend/shape/cones.cpp backend/shape/blob.cpp backend/shape/hfield.h backend/shape/planes.cpp backend/shape/polygon.cpp backend/shape/blob.h backend/shape/torus.h backend/shape/super.cpp optout.cpp povrayold.h lightgrp.h pov_mem.cpp pov_mem.h frontend/processrenderoptions.h frontend/imagemessagehandler.h frontend/display.cpp frontend/filemessagehandler.cpp frontend/imageprocessing.cpp frontend/imagemessagehandler.cpp frontend/display.h frontend/filemessagehandler.h frontend/rendermessagehandler.h frontend/rendermessagehandler.cpp frontend/animationprocessing.cpp frontend/console.h frontend/renderfrontend.h frontend/parsermessagehandler.h frontend/shelloutprocessing.h frontend/precomp.cpp frontend/console.cpp frontend/animationprocessing.h frontend/processrenderoptions.cpp frontend/defaultplatformbase.h frontend/shelloutprocessing.cpp frontend/precomp.h frontend/parsermessagehandler.cpp frontend/configfrontend.h frontend/renderfrontend.cpp frontend/simplefrontend.h frontend/defaultplatformbase.cpp frontend/imageprocessing.h

# Include paths for headers.
AM_CPPFLAGS = \
  -I$(top_srcdir) \
  -I$(top_srcdir)/source/backend \
  -I$(top_srcdir)/source/base \
  -I$(top_srcdir)/source/frontend \
  -I$(top_srcdir)/unix \
  -I$(top_srcdir)/vfe \
  -I$(top_srcdir)/vfe/unix
