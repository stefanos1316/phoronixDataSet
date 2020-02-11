# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdnnl.so.1.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdnnl.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdnnl.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/libdnnl.so.1.1"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/libdnnl.so.1"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/libdnnl.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdnnl.so.1.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdnnl.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdnnl.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/include/dnnl_config.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/include/dnnl_version.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/dnnl.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/dnnl_debug.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/dnnl_types.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/mkldnn.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/mkldnn_config.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/mkldnn_debug.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/mkldnn_dnnl_mangling.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/mkldnn_types.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/mkldnn_version.h"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/dnnl.hpp"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src/../include/mkldnn.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/dnnl" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/generated/dnnl-config.cmake"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/generated/dnnl-config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/dnnl/dnnl-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/dnnl/dnnl-targets.cmake"
         "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/CMakeFiles/Export/lib/cmake/dnnl/dnnl-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/dnnl/dnnl-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/dnnl/dnnl-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/dnnl" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/CMakeFiles/Export/lib/cmake/dnnl/dnnl-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/dnnl" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/CMakeFiles/Export/lib/cmake/dnnl/dnnl-targets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND /usr/bin/cmake
    -DDIR=/usr/local/lib/cmake
    -P /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/cmake/gen_mkldnn_compat_cmakes.cmake)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libmkldnn.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/libmkldnn.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libmkldnn.so.1")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/libmkldnn.so.1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libmkldnn.so.1.1")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/libmkldnn.so.1.1")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/common/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/cpu/cmake_install.cmake")

endif()

