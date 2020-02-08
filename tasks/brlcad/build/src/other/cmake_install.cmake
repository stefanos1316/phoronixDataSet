# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/brlcad/rel-7.28.0")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libregex/regex.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libz/zlib.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libz/zconf.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/lz4/lz4.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/lz4/lz4frame.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/lz4/lz4hc.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libpng/png.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libpng/pngconf.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libutahrle/include/rle.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libutahrle/include/rle_code.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libutahrle/include/rle_config.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libutahrle/include/rle_put.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libutahrle/include/rle_raw.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tcl.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclDecls.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclPlatDecls.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclTomMath.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclTomMathDecls.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tk.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tkDecls.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tkPlatDecls.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itcl/generic/itcl.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itcl/generic/itclDecls.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itcl/generic/itclInt.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itcl/generic/itclIntDecls.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itk/generic/itk.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itk/generic/itkDecls.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/openNURBS" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_3dm.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_3dm_attributes.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_3dm_properties.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_3dm_settings.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_annotation.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_annotation2.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_arc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_arccurve.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_archive.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_array.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_array_defs.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_base32.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_base64.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_beam.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_bezier.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_bitmap.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_bounding_box.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_box.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_brep.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_circle.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_color.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_compress.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_cone.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_crc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_curve.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_curveonsurface.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_curveproxy.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_cylinder.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_defines.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_detail.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_dimstyle.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_dll_resource.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_ellipse.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_error.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_evaluate_nurbs.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_extensions.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_font.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_fpoint.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_fsp.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_fsp_defs.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_geometry.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_group.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_hatch.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_hsort_template.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_instance.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_intersect.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_knot.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_layer.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_light.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_line.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_linecurve.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_linestyle.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_linetype.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_lookup.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_mapchan.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_massprop.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_material.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_math.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_matrix.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_memory.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_mesh.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_nurbscurve.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_nurbssurface.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_object.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_object_history.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_objref.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_offsetsurface.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_optimize.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_plane.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_planesurface.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_pluginlist.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_point.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_pointcloud.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_pointgeometry.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_pointgrid.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_polycurve.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_polyedgecurve.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_polyline.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_polylinecurve.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_qsort_template.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_rand.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_rendering.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_revsurface.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_rtree.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_sphere.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_string.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_sumsurface.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_surface.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_surfaceproxy.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_system.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_textlog.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_texture.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_texture_mapping.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_torus.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_unicode.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_userdata.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_uuid.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_version.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_viewport.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_workspace.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_x.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_xform.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS/opennurbs_zlib.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/stepcode/src/base/sc_memmgr.h" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/base/sc_benchmark.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/stepcode/src/cldai/sdaiBinary.h" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cldai/sdaiApplication_instance_set.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/stepcode/src/cleditor/cmdmgr.h" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/STEPfile.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/stepcode/src/clstepcore/complexSupport.h" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/baseType.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/stepcode/src/clutils/errordesc.h" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clutils/dirobj.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/stepcode/include/express/basic.h" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/include/express/alg.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/stepcode/exppp" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/include/exppp/exppp.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/stepcode" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/include/ordered_attrs.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/stepcode" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/include/sc_export.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/stepcode" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/include/sc_stdbool.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/clipper/clipper.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/poly2tri" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/poly2tri/poly2tri/poly2tri.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/poly2tri/common" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/poly2tri/poly2tri/common/shapes.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/poly2tri/sweep" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/poly2tri/poly2tri/sweep/cdt.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/poly2tri/sweep" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/poly2tri/poly2tri/sweep/advancing_front.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/poly2tri/sweep" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/poly2tri/poly2tri/sweep/sweep.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/poly2tri/sweep" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/poly2tri/poly2tri/sweep/sweep_context.h")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libregex/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libz/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/lz4/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libnetpbm/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libpng/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libutahrle/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itk/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/iwidgets/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkhtml/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tktable/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/openNURBS/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/clipper/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libgdiam/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/poly2tri/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/rply/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/proj-4/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/cmake_install.cmake")

endif()

