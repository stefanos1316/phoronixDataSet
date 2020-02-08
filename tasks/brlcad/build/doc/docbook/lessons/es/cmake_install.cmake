# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es/images" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged01_commandwindow.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged01_graphicswindow.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged01_terminal.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_coordsys.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_defaultradio.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_flower_zooomin.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_flower_zooomout.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_multipane.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_radio_35_25.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_radio_front.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_radio_right.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_radio_top.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_0_0_14.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_270_-90.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_270_90.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_35_0.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_35_25.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_35_60.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_35_90.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_front.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_left.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_rear.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged02_truck_right.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged04_commandwindow.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged04_fb_overlay_mode.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged04_raytracedshapes.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_combinationeditor.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_intersectionspheres.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_raytraceddome.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_raytracedpart1.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_raytracedpart2.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_raytracedpart3.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_subtractionspheres.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_twoprimitivespheres.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged05_unionspheres.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged06_base_substracted_vol.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged06_goblet1stsphere.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged06_gobletbase.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged06_gobletbasestembasin.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged06_gobletstem.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged06_rtgoblet.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged06_rtgobletaz_35_el_25.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged07_goblet_complete_window.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged07_goblet_mater_complete.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged07_goblet_mirror.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged07_goblet_semitransparent.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged08_comb_editor_window_mater_prop.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged08_goblet_combeditor.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged08_goblet_reflectivity_1.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged08_goblet_reflectivity_2.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged08_refractive_index.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged08_spec_vs_diff_reflectivity.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged09_globe_base_box_raytraced.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged09_globe_base_box_wireframe.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged09_globe_inside_outside_box.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged09_globe_outside_display_box.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged09_globe_raytraced.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged09_globe_wireframe.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged10_mug_wireframe.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged11_mug_raytraced_norim.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged11_mug_raytraced_rim.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged12_cyls_frontview.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged12_mug_gui_finished_raytraced.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged12_mug_handle_frontview.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged12_mug_handle_topview.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged12_mug_rim_frontview.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_comb_ed_checker.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_complete_front.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_design.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_raytraced_overlay.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_tabletop_base_candle_front.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_tabletop_base_front.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_tabletop_eto1_rcc_wireframe_front.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_tabletop_eto1_wireframe_front.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged13_candle_tabletop_wireframe_front.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged14_candle_base_sphere_topview.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged14_candle_multipane.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged14_candle_spheres_az35el25.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged14_candle_spheres_frontview.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged14_candle_spheres_raytraced.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged14_candle_spheres_topview.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged14_primitive_editor.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged14_primitive_selection_dropdown.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_cameo_shader.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_prim_ed_wheel_well.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_2nd_wheel_wheel_place.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_ambient_lighting.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_cab1s.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_cab_body.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_cab_cutoff.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_default_lighting.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_design.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_multipane_1stwheel.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_wheel_wells_wireframe.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged15_truck_wheels.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_casecut_raytrace.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_cut_raytrace.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_cut_wireframe.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_cutaways.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_default_components_props.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_new_design.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_structure_1.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_structure_2.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_structure_3.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_transparent.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_wireframe_circ_board.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/lessons/es/images/mged16_radio_with_mater_props.png"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged01_crear_figuras_primitivas.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged02_opciones_vistas.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged03_utilizar_comando_in.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged04_prop_materiales.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged05_expresiones_booleanas.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged06_crear_una_copa.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged07_prop_materiales_copa.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged08_prop_materiales_copa2.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged09_esfera_en_caja_exhibidora.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged10_crear_taza.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged11_refinar_taza.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged12_taza_desde_gui.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged13_ubicar_figuras_en_3d.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged14_ubicar_figuras_en_3d_2.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged15_crear_camion_de_juguete.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/lessons/es" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/lessons/es/mged16_mod_tech_struct.html")
endif()

