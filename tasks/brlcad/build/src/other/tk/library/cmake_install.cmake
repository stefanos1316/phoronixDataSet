# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tk8.5" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/bgerror.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/button.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/choosedir.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/clrpick.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/comdlg.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/console.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/dialog.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/entry.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/focus.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/listbox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/menu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/mkpsenc.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgbox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/obsolete.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/optMenu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/palette.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/panedwindow.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/safetk.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/scale.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/scrlbar.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/spinbox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/tearoff.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/text.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/tk.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/tkfbox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/unsupported.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/xmfbox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/tclIndex"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tk8.5/images" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/README"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/logo.eps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/logo100.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/logo64.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/logoLarge.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/logoMed.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/pwrdLogo.eps"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/pwrdLogo100.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/pwrdLogo150.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/pwrdLogo175.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/pwrdLogo200.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/pwrdLogo75.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/images/tai-ku.gif"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tk8.5/msgs" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/cs.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/da.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/de.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/el.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/en.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/en_gb.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/eo.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/es.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/fr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/hu.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/it.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/nl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/pl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/pt.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/ru.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/msgs/sv.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tk8.5/ttk" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/altTheme.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/aquaTheme.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/button.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/clamTheme.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/classicTheme.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/combobox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/cursors.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/defaults.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/entry.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/fonts.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/menubutton.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/notebook.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/panedwindow.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/progress.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/scale.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/scrollbar.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/sizegrip.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/spinbox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/treeview.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/ttk.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/utils.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/vistaTheme.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/winTheme.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/ttk/xpTheme.tcl"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tk8.5/demos" TYPE PROGRAM FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/browse"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/hello"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ixset"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/rmt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/rolodex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/tcolor"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/timer"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/widget"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tk8.5/demos" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/README"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/anilabel.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/aniwave.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/arrow.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/bind.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/bitmap.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/button.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/check.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/clrpick.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/colors.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/combo.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/cscroll.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ctext.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/dialog1.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/dialog2.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/en.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/entry1.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/entry2.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/entry3.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/filebox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/floor.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/form.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/goldberg.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/hscale.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/icon.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/image1.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/image2.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/items.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/knightstour.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/label.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/labelframe.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/license.terms"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/mclist.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/menu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/menubu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/msgbox.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/nl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/paned1.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/paned2.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/pendulum.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/plot.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/puzzle.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/radio.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ruler.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/sayings.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/search.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/spin.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/square"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/states.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/style.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/tclIndex"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/text.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/textpeer.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/toolbar.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/tree.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ttkbut.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ttkmenu.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ttknote.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ttkpane.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ttkprogress.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/ttkscale.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/twind.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/unicodeout.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/vscale.tcl"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tk8.5/demos/images" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/earth.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/earthris.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/face.xbm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/flagdown.xbm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/flagup.xbm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/gray25.xbm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/letters.xbm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/noletter.xbm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/pattern.xbm"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/tcllogo.gif"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/library/demos/images/teapot.ppm"
    )
endif()

