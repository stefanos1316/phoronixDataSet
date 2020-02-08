# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/legal/embedded" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/ayam_icons.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/bullet.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/chull2d.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/chull3d.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/db_faa-info.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/db_nist-info.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/dehumanize.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/DejaVu_Fonts.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/ear_clipping.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/fnmatch.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/fontstash.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/gct.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/gdal_gcv_plugin.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/humanize.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/hv3.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/hv3_combobox.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/hv3_snit.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/msinttypes.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/nurbs_fit.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/obr.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/openimageio.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/OpenNURBS.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/osg.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/osl.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/pbrt.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/point_in_polygon.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/polygonizer.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/pstdint.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/qsort.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/randmt.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/realpath.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/scriptsort.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/search.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/sh_wood.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/sobolseq.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/SPSR.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/sscanf.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/STIX_Font_License_2010.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/tcl.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/tinythread.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/tkcon.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/uce_dirent.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/x24.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded/y2038.txt"
    )
endif()

