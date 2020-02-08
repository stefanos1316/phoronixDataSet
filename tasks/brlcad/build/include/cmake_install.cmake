# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/brlcad" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/RtServerImpl.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/analyze.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bg.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bio.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bnetwork.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bresource.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brlcad.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brlcad.i"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bsocket.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/common.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/cursor.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/dm.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/fb.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/fft.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/gcv.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/ged.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/icv.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/libtermio.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/nmg.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/optical.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/pc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/photonmap.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/pinttypes.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/pkg.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/pstdint.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/raytrace.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rtserver.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/tclcad.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/vmath.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/wdb.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/brlcad" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/brlcad/brlcad_ident.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/brlcad" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/brlcad/brlcad_version.h")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/bu/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/bn/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/bg/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/brep/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/dm/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/gcv/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/ged/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/icv/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/optical/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/rt/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/fb/cmake_install.cmake")

endif()

