# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtcl.so.8.5.19"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtcl.so.8.5"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtcl.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libtcl.so.8.5.19"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libtcl.so.8.5"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libtcl.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtcl.so.8.5.19"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtcl.so.8.5"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtcl.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH ":::::::::::::::::::::::::::::::::::::::::"
           NEW_RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libtclstub.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tclsh-8.5"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tclsh"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bin/tclsh-8.5"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bin/tclsh"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tclsh-8.5"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tclsh"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tcl.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclDecls.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclPlatDecls.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclTomMath.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclTomMathDecls.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl/library/cmake_install.cmake")

endif()

