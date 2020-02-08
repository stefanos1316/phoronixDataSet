# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/brlcad/bu" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/app.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/avs.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/bitv.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/cmd.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/color.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/cv.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/debug.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/defines.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/dylib.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/endian.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/env.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/exit.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/file.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/getopt.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/glob.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/hash.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/hist.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/hook.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/interrupt.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/list.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/log.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/magic.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/malloc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/mapped_file.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/mime.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/observer.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/opt.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/parallel.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/parse.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/path.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/ptbl.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/redblack.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/simd.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/snooze.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/sort.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/str.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/tc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/time.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/units.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/uuid.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/version.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/vfont.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/vlb.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/bu/vls.h"
    )
endif()

