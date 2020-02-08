# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sample_applications" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/nurb_example.c")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sample_applications" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/raydebug.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencl" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/bool.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/common.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/rt.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/solver.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/arb8/arb8_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/bot/bot_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/ebm/ebm_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/ehy/ehy_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/ell/ell_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/epa/epa_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/eto/eto_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/hrt/hrt_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/part/part_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/rec/rec_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/rhc/rhc_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/rpc/rpc_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/sph/sph_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/tgc/tgc_shot.cl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/primitives/tor/tor_shot.cl"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/librt.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librt.so.20.0.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librt.so.20"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librt.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/librt.so.20.0.1"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/librt.so.20"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/librt.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librt.so.20.0.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librt.so.20"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librt.so"
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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/librt/tests/cmake_install.cmake")

endif()

