# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/archer" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Arb4EditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Arb5EditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Arb6EditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Arb7EditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Arb8EditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Archer.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/ArcherCore.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/AttrGroupsDisplayUtility.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/BotEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/BotUtility.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/BrepEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/CombEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/DataUtils.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/EhyEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/EllEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/EpaEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/EtoEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/ExtrudeEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/GeometryEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/GripEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/HalfEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/HypEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/JointEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/LoadArcherLibs.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/LODUtility.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/MetaballEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/PartEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/PipeEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Plugin.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/RhcEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/RpcEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/ShaderEdit.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/SketchEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/SphereEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/SuperellEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/TgcEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/TorusEditFrame.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Utility.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/Wizard.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/bgerror.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/itk_redefines.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/tabwindow.itk"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/archer" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/tclscripts/archer/pkgIndex.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/archer" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/tclscripts/archer/tclIndex")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/archer/images/cmake_install.cmake")

endif()

