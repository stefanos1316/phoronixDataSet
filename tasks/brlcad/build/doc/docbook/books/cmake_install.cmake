# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/books/images" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volI_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volI_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volI_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volI_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volI_fig05.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volI_fig06.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volI_fig07.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig05.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig06.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig07.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig08.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig09.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig10.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig11.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig12.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig13.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig14.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig15.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig16.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig17.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig18.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig19.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig20.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig21.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig22.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig23.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig24.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig25.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig26.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig27.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig28.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig29.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_fig30.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/tutorial_series_volIII_table_image_1.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image001.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image002.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image003.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image004.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image005.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image006.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image007.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image008.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image009.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image010.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/books/images/v4-image011.jpg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/books" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/books/BRL-CAD_Tutorial_Series-VolumeI.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/books" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/books/BRL-CAD_Tutorial_Series-VolumeII.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/books" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/books/BRL-CAD_Tutorial_Series-VolumeIII.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/books" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/books/BRL-CAD_Tutorial_Series-VolumeIV.html")
endif()

