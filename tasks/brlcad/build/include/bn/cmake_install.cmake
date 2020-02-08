# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/brlcad/bn" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/adc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/anim.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/clip.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/complex.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/defines.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/dvec.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/mat.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/msr.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/multipoly.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/noise.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/plane.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/plot3.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/poly.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/qmath.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/rand.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/randmt.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/spm.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/tabdata.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/sobol.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/str.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/tol.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/vectfont.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/vector_fpu.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/vector_x86.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/version.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/vert_tree.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/vlist.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bn/wavelet.h"
    )
endif()

