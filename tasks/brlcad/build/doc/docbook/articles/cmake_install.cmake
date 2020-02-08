# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/articles/images" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/Lee_tux.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/animtbl.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_pattern_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_pattern_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_pattern_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_pattern_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_pattern_fig05.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_pattern_fig06.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_pattern_fig07.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_region_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_region_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_region_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/build_region_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/dagtbl.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/ebm_primitive_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/ebm_primitive_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/ebm_primitive_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/ell.mpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/ell_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/ell_ssm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/equation.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/film.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/fn.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/gcv_architecture.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/gcv_unsupported_tessellation.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/gcv_using_gdiff.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/matrix.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/mgedrc_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/mgedrc_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/mgedrc_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/moss.mpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/moss_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/moss_ssm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig05.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig06.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig07.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig08.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig09.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig10.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig11.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig12.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig13.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig14.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig15.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig16.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig17.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig18.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig19.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig20.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig21.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig22.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig23.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/nirt_fig24.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig05.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig06.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig07.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig08.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig09.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig10.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig11.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig12.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/oed_fig13.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/overlap_tool_fig01.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/overlap_tool_fig02.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/overlap_tool_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig05.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig06.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig07.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig08.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig09.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig10.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig11.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig12.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/pipes_fig13.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/projection_shader_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/projection_shader_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/projection_shader_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/projection_shader_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/projection_shader_fig05.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/projection_shader_fig06.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/projection_shader_fig07.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig01.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig02.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig03.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig04.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig05.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig06.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig07.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig08.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig09.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig10.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig11.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig12.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig13.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/tire_fig14.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/trans.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/transboth.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/transboth_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/v_eqn1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/v_eqn2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/azel.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/az_el.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/az_el.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/az_el_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/base.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/base.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/bool.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/coord-axes.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/cup_and_mug.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/cup_and_mug_small.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/cup_out+in.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/cup_outside.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/cup_w_handle.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/faceplate.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/faceplate_menu.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/faceplate_menu_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/faceplate_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/fillet.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/fillet.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/handle.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/handle.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/mug_camo.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/mug_camo.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/mug_green.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/mug_green.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/prims.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/rim.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/articles/images/rim.jpg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/TEMPLATE.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/about.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/animation_tutorial.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/build_pattern.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/build_region.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/camo_shader.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/ebm_primitive.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/gcv.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/ged.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/mgedrc.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/nirt.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/oed.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/pipes.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/projection_shader.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/tire.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/mged.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/main_menu.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/articles" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/articles/overlap_tool.html")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/articles/hy/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/articles/it/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/articles/ru/cmake_install.cmake")

endif()

