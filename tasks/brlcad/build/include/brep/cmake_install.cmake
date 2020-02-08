# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/brlcad/brep" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/defines.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/bbnode.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/boolean.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/brnode.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/csg.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/curvetree.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/intersect.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/pullback.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/ray.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/surfacetree.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/brep/util.h"
    )
endif()

