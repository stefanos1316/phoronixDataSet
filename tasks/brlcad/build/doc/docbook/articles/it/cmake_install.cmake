# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles/it/images" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/bc2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/brlcad-overview-benchmark-Bldg_391.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/brlcad-overview-benchmark-M35.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/brlcad-overview-benchmark-Moss.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/brlcad-overview-benchmark-Sphflake.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/brlcad-overview-benchmark-Star.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/brlcad-overview-benchmark-World.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/brlcad-overview-data-flow.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/it/images/sflogo.png"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles/it" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/it/about_it.html")
endif()

