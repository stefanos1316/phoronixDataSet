# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pix" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/bldg391.pix"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/m35.pix"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/moss.pix"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/sphflake.pix"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/star.pix"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/world.pix"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pix" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/bldg391.log"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/m35.log"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/moss.log"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/sphflake.log"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/star.log"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench/ref/world.log"
    )
endif()

