# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/legal/other" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/clipper.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/gct.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/gdal.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/incrTcl.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libbson.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libbson_yajl.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libgdiam.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libnetpbm.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libpng.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libregex.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libtermlib.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libutahrle.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libvds.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/libz.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/linenoise.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/lz4.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/OpenNURBS.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/openscenegraph.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/poly2tri.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/proj-4.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/rply.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/SPSR.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/stepcode.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/tcl.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/tkhtml.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/tkpng.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/other/tktable.txt"
    )
endif()

