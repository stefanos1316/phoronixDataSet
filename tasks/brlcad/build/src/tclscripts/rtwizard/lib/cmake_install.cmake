# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/lib" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/DbPage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/ExamplePage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/FbPage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/FeedbackDialog.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/FullColorPage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/GhostPage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/HelpPage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/HighlightedPage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/IntroPage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/LinePage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/MGEDpage.itk"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/PictureTypeA.itcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/PictureTypeB.itcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/PictureTypeBase.itcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/PictureTypeC.itcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/PictureTypeD.itcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/PictureTypeE.itcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/PictureTypeF.itcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard/lib/Wizard.itk"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/lib" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/tclscripts/rtwizard/lib/pkgIndex.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/rtwizard/lib" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/tclscripts/rtwizard/lib/tclIndex")
endif()

