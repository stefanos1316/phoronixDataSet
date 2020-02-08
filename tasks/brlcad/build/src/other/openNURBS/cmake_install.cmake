# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/openNURBS

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
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopenNURBS.so.2012.10.245"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopenNURBS.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libopenNURBS.so.2012.10.245"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libopenNURBS.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopenNURBS.so.2012.10.245"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopenNURBS.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib:"
           NEW_RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libopenNURBS.a")
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

