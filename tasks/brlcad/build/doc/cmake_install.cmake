# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/." TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/IDEAS"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/PROJECTS"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/README.AIX"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/README.BSD"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/README.IRIX"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/README.Linux"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/README.MacOSX"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/README.Solaris"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/README.VAX"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/README.Windows"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/TODO.BREP"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/TODO.shaded_displays"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/archer_ack.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/benchmark.tr"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/bu_opt_design_notes.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/brep.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/BRL-CAD.bib"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/code_review.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/cvs.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/description.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/editors.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/ged.tr"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/history.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/hypot.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/irprep.tr"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mater.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/matrix.txt"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/mged_old" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/a.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/adc.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/all.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/axis-3525.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/b.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/buttonmenu.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/c.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/coord-axes.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/crod-close.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/crod.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/d.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/doit"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/e.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-arbrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-bgrp.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-bgrp311.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-cgrp.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-cgrp321.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-ellg.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-ellg2x.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-ellgxyz.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-gredit.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-grpath.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-scale.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-spread.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-stacked.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-start.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-tor111.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-xymove.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/eo-xyzmove.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-edge1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-edge2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-edge3.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-edge4.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-rot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-scale.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-sed.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-top.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-tr.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es5-xrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-edge1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-edge2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-edge3.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-ex1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-ex2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-rot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-scale.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-sed.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-top.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-tr0.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-xrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-yrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/es8-zrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-mh.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-mhrt.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-rot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-sa.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-sb.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-sc.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-scale.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-sd.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-sed.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-sh.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-top.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-tr.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-xrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-yrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/esc-zrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-sa.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-sb.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-sc.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-scale.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-sed.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-top.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-tr.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-xrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-yrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ese-zrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-scale.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-sed.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-sr1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-sr2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-top.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-tr.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-xrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-yrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/est-zrot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.arb4.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.arb8.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.box.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.ellg.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.raw.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.rcc.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.rpp.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.sph.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.tor.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ex.trc.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/f.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/faceplate.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/faceplate1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/fig-sgi-buttons.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/fig-sgi-knobs.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/fig-sgi.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/fig-vg-buttons.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/fig-vg-knobs.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/g.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/h.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/j.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/k.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/l.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/m.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/menu-arb-ctl.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/menu-arb4-edge.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/menu-arb4-face.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/menu-arb4-rot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/menu-arb8-edge.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/menu-arb8-face.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/menu-arb8-rot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/obj-edit.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/obj-path.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/obj-pick.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ped-ell.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ped-tgc.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/ped-tor.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-35a.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-35b.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-bot1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-bot2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-front1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-front2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-right1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-right2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-top1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/plane-top2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/rmit-3525.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/robot.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/sol-2pick.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/sol-ed.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/sol-pick.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1-2s-pk.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1-obj-ed.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1-obj-ph.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1-obj-pk.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1-rot-vw.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1-sol-ed.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1-sol-pk.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1-top-vw.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/t1.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/test.tex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/v-arb8-side.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/v-arb8-top.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-arm1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-arm2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-body.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-collar.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-final1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-hat-E.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-hat1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-hat2.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-hat3.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-head.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-leg1.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-prims.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mged/wm-tube.ps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/mk.tr"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/old-mged.tr"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/pkg.tr"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/regions.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/rounding.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/tool_categories.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/ecosystem.dot"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/pad_file.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/html/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/legal/cmake_install.cmake")

endif()

