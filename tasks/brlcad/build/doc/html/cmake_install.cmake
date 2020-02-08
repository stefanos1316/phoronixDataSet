# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/bookmarks.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/toc.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals/Anim_Tutorial" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/Lee_tux.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/animtbl.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chans.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt0.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt1.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt2.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt3.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt4.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt5.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt6.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt7.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt8.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/chapt9.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/dagtbl.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/ell.mpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/ell_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/ell_ssm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/equation.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/film.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/fn.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_Deitz89.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_Muuss88a.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_Muuss90a.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_Shoemake85.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_frames.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_gamma.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_graphics.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_hdtv.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_libfb.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_ntsc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/foot_size.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/matrix.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/moss.mpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/moss_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/moss_ssm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/trans.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/transboth.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/transboth_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/v_eqn1.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Anim_Tutorial/v_eqn2.gif"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals/cadwidgets" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/Command.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/Database.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/Db.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/Display.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/Dm.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/Drawable.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/Mged.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/QuadDisplay.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/Splash.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/View.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/contents.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/cadwidgets/skeleton.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals/libbu" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libbu/cmdhist_obj.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libbu/contents.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libbu/index.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals/libdm" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libdm/api.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libdm/contents.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libdm/dm_obj.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libdm/index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libdm/preface.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/libdm/tcl.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals/librt" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/librt/contents.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/librt/dg_obj.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/librt/index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/librt/view_obj.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/librt/wdb_obj.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/BRL-CAD_gear_logo.ico"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Install.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Obtain.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/Overview.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/eagleCAD.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/eagleCAD.bmp"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/small-eagleCAD.gif"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals/mged/animmate" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_cascade.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_doc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_fly.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_hardtrack.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_keyread.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_lookat.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_man_pages.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_offset.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_orient.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_script.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_sort.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_time.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_track.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_turn.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/anim_tut.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/animate.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/ceditor.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/chan_mult.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/chan_permute.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/combine_doc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/cscripts.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/curve_doc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/end_tut.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/etime.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/fbanim.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/left.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/left_wheels.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/mmenu.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/object_tut.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/oscript.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/oscript_doc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/pixtile.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/prep_tut.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/right.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/right_wheels.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/rt.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/rt_tut.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/scriptsort.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/show_doc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/sscripts.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tabinterp.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/table_doc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tabsub.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tank_path.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/teditor.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/track.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/track_tut.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tscript.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tscript_doc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tut.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tut1.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tut2.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tut4.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tut5.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tut6.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tut7.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/tut8.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/vcdwidget.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/vceditor.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/vcurve_doc.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/vdraw.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/view_tut.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/viewget.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/animmate/vscript_doc.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals/mged" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/az_el.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/az_el.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/az_el_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/azel.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/base.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/base.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/bool.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/brlcad_glossary.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/brlcad_solids.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/build_def_index.sh"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/cmd_line_ed.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/concl.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/contents.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/coord-axes.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/cup.g"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/cup.sh"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/cup_and_mug.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/cup_and_mug_small.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/cup_out+in.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/cup_outside.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/cup_w_handle.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/default_key_bindings.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/default_mouse_bindings.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/faceplate.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/faceplate_menu.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/faceplate_menu_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/faceplate_sm.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/fillet.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/fillet.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/ged.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/ged.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/handle.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/handle.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged1.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged2.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged3.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged_callbacks.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged_cmd_index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged_env_vars.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged_gui.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mged_tcl_vars.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mug"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mug.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mug_camo"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mug_camo.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mug_camo.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mug_green.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/mug_green.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/notes.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/outline"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/peewee.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/peewee.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/preface.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/prims.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/rim.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/rim.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/shaders.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/skipped"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/mged/tex-html.tcl"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/manuals/shaders" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/manuals/shaders/camo.html")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/ReleaseNotes" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/email2.0.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/email3.0.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/email3.1.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/email4.0.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/email4.4.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/email5.0.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/index.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/ReleaseNotes/Rel5.0" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/deprecated.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/new_cmds.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/new_libs.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/ReleaseNotes/Rel5.0/Summary" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/activem.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/activep.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/collapse.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/expand.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/first.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/home.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/ielogo.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img001.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img002.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img003.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img004.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img005.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img006.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img007.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img008.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img009.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img010.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img011.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img012.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img013.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img014.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img015.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img016.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img017.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img018.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/img019.jpg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/index.html"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/info.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/last.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/next.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/pptani.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/prev.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld001.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld002.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld003.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld004.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld005.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld006.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld007.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld008.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld009.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld010.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld011.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld012.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld013.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld014.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld015.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld016.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld017.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld018.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/sld019.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/space.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/text.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld001.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld002.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld003.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld004.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld005.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld006.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld007.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld008.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld009.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld010.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld011.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld012.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld013.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld014.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld015.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld016.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld017.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld018.htm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel5.0/Summary/tsld019.htm"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html/ReleaseNotes/Rel6.0" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html/ReleaseNotes/Rel6.0/index.html")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/html/manuals/mged/animmate/cmake_install.cmake")

endif()

