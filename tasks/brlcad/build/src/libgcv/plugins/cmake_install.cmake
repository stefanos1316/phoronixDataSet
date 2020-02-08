# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/decimate/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/fastgen4/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/gdal/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/obj/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/rhino/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/vrml/cmake_install.cmake")

endif()

