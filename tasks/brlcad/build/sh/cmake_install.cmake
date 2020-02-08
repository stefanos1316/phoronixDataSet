# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ GROUP_EXECUTE GROUP_READ WORLD_EXECUTE WORLD_READ FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/elapsed.sh"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/cmp.sh"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/conversion.sh"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/facetall.sh"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/orbit.sh"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/pixinfo.sh"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/show.sh"
    )
endif()

