# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/brlcad/rt/primitives" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/arb8.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/annot.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/bot.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/brep.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/cline.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/dsp.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/ell.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/epa.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/hf.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/metaball.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/pg.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/pipe.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/rhc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/rpc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/script.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/sketch.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/tgc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/rt/primitives/tor.h"
    )
endif()

