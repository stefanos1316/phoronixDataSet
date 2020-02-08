# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore

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
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libstepcore.so.2.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libstepcore.so.2"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libstepcore.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libstepcore.so.2.0.0"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libstepcore.so.2"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libstepcore.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libstepcore.so.2.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libstepcore.so.2"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libstepcore.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib:"
           NEW_RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/stepcode/clstepcore" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/baseType.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/complexSupport.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/dictdefs.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/ExpDict.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/read_func.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/Registry.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/sdaiApplication_instance.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/sdai.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/sdaiSelect.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/SingleLinkList.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/STEPaggregate.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/STEPattribute.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/STEPattributeList.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/STEPcomplex.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/STEPundefined.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/instmgr.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/mgrnode.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/mgrnodearray.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/mgrnodelist.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/dispnode.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/dispnodelist.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/needFunc.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/clstepcore/SubSuperIterators.h"
    )
endif()

