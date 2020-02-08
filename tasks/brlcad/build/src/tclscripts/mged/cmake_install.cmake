# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/mged" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/accel.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/adc.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/anim.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/apply.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/asc2g.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/attr_edit.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/bindings.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/bot_face_select.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/bot_vertex_fuse_all.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/bots.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/botedit.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/build_region.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/calipers.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/callbacks.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/clear.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/collaborate.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/color.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/color_scheme.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/comb.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/combmenu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/cycle.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/dbfindtree.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/dbupgrade.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/dmtype.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/e_id.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/edit_menu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/edit_solid.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/edit_solid_int.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/editmenu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/editobj.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/eobjmenu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/expand_comb.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/extract.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/facetize_all_regions.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/font.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/g2asc.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/garbage_collect.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/get_regions.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/grid.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/grouper.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/help.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/helpdevel.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/icreate.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/illum.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/lc.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/lgt_mat.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/list.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/lodconfig.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/make_solid.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/man.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/menu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/mged.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/mgedrc.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/mike.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/mouse.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/mview.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/openw.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/plot.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/points.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/prj_add.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/ps.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/qray.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/ray.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/raypick.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/reid.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/relos.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/remap_mater.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/remat.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/rt.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/rt_script.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/sample.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/shaders.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/skt_ed.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/solclick.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/solcreate.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/solid.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/text.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/titles.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/tree.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/xclone.tcl"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/mged" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/tclscripts/mged/tclIndex")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tclscripts/mged" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s0.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s3.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s6.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s7.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s8.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v0_s9.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s0.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s3.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s6.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s7.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s8.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i0_v1_s9.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s0.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s3.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s6.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s7.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s8.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v0_s9.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s0.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s2.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s3.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s6.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s7.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s8.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/l_i1_v1_s9.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/mike-dedication.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/mike-tux.ppm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/mged/mike-tux.png"
    )
endif()

