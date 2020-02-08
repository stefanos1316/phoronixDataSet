# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/brlcad/rt" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/anim.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/application.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/arb_edit.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/binunif.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/boolweave.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/calc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/cmd.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/comb.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db4.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db5.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db_attr.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db_attr.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db_diff.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db_fullpath.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db_instance.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db_internal.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/db_io.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/debug.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/defines.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/directory.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/dspline.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/func.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/functab.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/geom.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/global.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/hit.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/htbl.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/mater.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/misc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/mem.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/nmg.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/nongeom.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/op.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/overlap.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/pattern.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/piece.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/prep.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/private.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/ray_partition.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/region.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/resource.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/rt_instance.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/search.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/seg.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/shoot.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/solid.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/soltab.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/space_partition.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/tie.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/timer.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/tol.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/tree.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/version.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/view.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/vlist.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/wdb.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/xray.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/rt/primitives/cmake_install.cmake")

endif()

