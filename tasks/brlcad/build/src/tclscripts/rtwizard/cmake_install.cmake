# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/RaytraceWizard.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/rtwizard"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/tclscripts/rtwizard/pkgIndex.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/tclscripts/rtwizard/tclIndex")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/examples/PictureTypeA" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeA/desc.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeA/helpstr.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeA/intro.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeA/title.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeA/preview.small.gif"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/examples/PictureTypeB" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeB/desc.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeB/helpstr.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeB/intro.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeB/title.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeB/preview.small.gif"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/examples/PictureTypeC" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeC/desc.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeC/helpstr.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeC/intro.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeC/title.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeC/preview.small.gif"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/examples/PictureTypeD" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeD/desc.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeD/helpstr.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeD/intro.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeD/title.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeD/preview.small.gif"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/examples/PictureTypeE" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeE/desc.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeE/helpstr.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeE/intro.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeE/title.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeE/preview.small.gif"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/examples/PictureTypeF" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeF/desc.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeF/helpstr.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeF/intro.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeF/title.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/examples/PictureTypeF/preview.small.gif"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/rtwizard/lib/cmake_install.cmake")

endif()

