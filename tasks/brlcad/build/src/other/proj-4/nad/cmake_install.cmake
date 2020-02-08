# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/proj" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/epsg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/esri"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/world"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/esri.extra"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/other.extra"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/IGNF"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/nad27"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/GL27"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/nad83"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/nad.lst"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/proj_def.dat"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/proj-4/nad/CH"
    )
endif()
