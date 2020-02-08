# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/archer/images" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/aboutArcher.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/air.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/air_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/air_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/air_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/air_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/airregion.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/airregion_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/airregion_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/airregion_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb4.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb4_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb4_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb4_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb4_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb5.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb5_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb5_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb5_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb5_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb6.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb6_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb6_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb6_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb6_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb7.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb7_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb7_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb7_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb7_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb8.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb8_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb8_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb8_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arb8_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arbn.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arbn_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arbn_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arbn_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arbn_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/archer.bmp"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arrow_back.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/arrow_forward.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ars.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ars_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ars_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ars_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ars_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/assembly.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/assembly_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/assembly_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/assembly_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/assembly_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/blank.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/bot.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/bot_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/bot_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/bot_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/bot_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/bug.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/brep.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/brep_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/brep_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/brep_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/brep_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/checkpoint.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/closeall.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/closedf.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/comb.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/comb_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/comb_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/comb_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/comb_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/combination.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/command.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/component_pick.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/component_erase.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/component_select.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/configure.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_az.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_el.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_kx.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_ky.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_kz.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_s.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_sx.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_sy.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_sz.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_tw.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_tx.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_ty.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/cycle_tz.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/dsp.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/dsp_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/dsp_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/dsp_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/dsp_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/edit_copy.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/edit_cut.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/edit_paste.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/edit_rotate.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/edit_scale.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/edit_select.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/edit_translate.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ehy.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ehy_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ehy_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ehy_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ehy_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ell.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ell_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ell_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ell_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/ell_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/epa.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/epa_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/epa_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/epa_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/epa_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/eto.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/eto_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/eto_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/eto_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/eto_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/extrude.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/extrude_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/extrude_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/extrude_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/extrude_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/file_new.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/file_text_small.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/file_text_small_disabled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/find.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/folder_closed_small.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/folder_closed_small_disabled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/folder_open_small.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/folder_open_small_disabled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/framebuffer.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/framebuffer_clear.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/framebuffer_off.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/framebuffer_underlay.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/framebuffer_interlay.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/framebuffer_overlay.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/global_undo.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/half.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/half_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/half_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/half_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/half_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/hyp.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/hyp_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/hyp_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/hyp_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/hyp_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/invalid.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/invalid_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/invalid_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/invalid_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/matrixModeAbove.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/matrixModeBelow.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/measure.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/metaball.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/metaball_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/metaball_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/metaball_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/metaball_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/nmg.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/nmg_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/nmg_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/nmg_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/nmg_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/node.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/object_undo.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/open.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/openf.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/option_text.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/option_edit.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/other.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/other_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/other_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/other_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/pane_blank.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/pane_collapse.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/pane_expand.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/part.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/part_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/part_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/part_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/part_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/pipe.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/pipe_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/pipe_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/pipe_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/pipe_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_arb6.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_arb8.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_bot.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_cone.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_ehy.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_ell.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_epa.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_eto.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_extrude.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_grip.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_half.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_hyp.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_list.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_other.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_part.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_pipe.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_rhc.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_rpc.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_sketch.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_sph.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_superell.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_tgc.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/primitive_tor.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/raytrace.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/raytrace_abort.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/refresh.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/region.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/region_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/region_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/region_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/region_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/revert.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rhc.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rhc_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rhc_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rhc_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rhc_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rpc.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rpc_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rpc_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rpc_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rpc_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/rtimage.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/run.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/save.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sketch.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sketch_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sketch_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sketch_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sketch_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sph.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sph_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sph_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sph_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/sph_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tgc.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tgc_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tgc_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tgc_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tgc_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tools.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tor.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tor_intersect.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tor_labeled.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tor_subtract.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/tor_union.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/view_center.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/view_left_right_small.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/view_obj_select.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/view_rotate.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/view_scale.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/view_top_bottom_small.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/view_translate.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/wizard.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s0.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s3.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s6.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s7.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s8.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v0_s9.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s0.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s3.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s6.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s7.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s8.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i0_v1_s9.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s0.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s3.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s6.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s7.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s8.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v0_s9.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s0.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s3.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s6.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s7.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s8.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/archer/images/l_i1_v1_s9.gif"
    )
endif()
