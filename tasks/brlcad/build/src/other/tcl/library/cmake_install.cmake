# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8.5" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/auto.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/clock.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/history.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/init.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/package.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/parray.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/safe.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/tm.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/word.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/tclIndex"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8.5/http1.0" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/http1.0/http.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/http1.0/pkgIndex.tcl"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8.5/opt0.4" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/opt/optparse.tcl"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/opt/pkgIndex.tcl"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8/8.4" TYPE FILE RENAME "http-2.7.13.tm" FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/http/http.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8/8.4" TYPE FILE RENAME "platform-1.0.14.tm" FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/platform/platform.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8/8.4/platform" TYPE FILE RENAME "shell-1.1.4.tm" FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/platform/shell.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8/8.5" TYPE FILE RENAME "msgcat-1.5.2.tm" FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgcat/msgcat.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8/8.5" TYPE FILE RENAME "tcltest-2.3.8.tm" FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/tcltest/tcltest.tcl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8.5" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/../unix/tclAppInit.c")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8.5/msgs" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/af.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/af_za.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ar.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ar_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ar_jo.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ar_lb.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ar_sy.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/be.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/bg.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/bn.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/bn_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ca.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/cs.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/da.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/de.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/de_at.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/de_be.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/el.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_au.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_be.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_bw.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_ca.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_gb.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_hk.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_ie.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_nz.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_ph.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_sg.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_za.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/en_zw.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/eo.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_ar.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_bo.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_cl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_co.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_cr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_do.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_ec.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_gt.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_hn.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_mx.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_ni.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_pa.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_pe.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_pr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_py.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_sv.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_uy.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/es_ve.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/et.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/eu.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/eu_es.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fa.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fa_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fa_ir.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fi.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fo.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fo_fo.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fr_be.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fr_ca.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/fr_ch.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ga.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ga_ie.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/gl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/gl_es.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/gv.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/gv_gb.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/he.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/hi.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/hi_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/hr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/hu.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/id.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/id_id.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/is.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/it.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/it_ch.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ja.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/kl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/kl_gl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ko.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ko_kr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/kok.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/kok_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/kw.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/kw_gb.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/lt.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/lv.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/mk.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/mr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/mr_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ms.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ms_my.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/mt.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/nb.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/nl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/nl_be.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/nn.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/pl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/pt.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/pt_br.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ro.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ru.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ru_ua.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/sh.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/sk.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/sl.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/sq.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/sr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/sv.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/sw.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ta.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/ta_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/te.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/te_in.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/th.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/tr.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/uk.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/vi.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/zh.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/zh_cn.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/zh_hk.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/zh_sg.msg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/msgs/zh_tw.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tcl8.5/encoding" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/ascii.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/big5.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1250.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1251.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1252.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1253.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1254.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1255.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1256.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1257.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp1258.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp437.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp737.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp775.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp850.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp852.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp855.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp857.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp860.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp861.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp862.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp863.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp864.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp865.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp866.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp869.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp874.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp932.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp936.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp949.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/cp950.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/dingbats.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/ebcdic.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/euc-cn.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/euc-jp.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/euc-kr.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/gb12345.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/gb1988.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/gb2312-raw.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/gb2312.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso2022-jp.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso2022-kr.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso2022.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-1.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-10.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-13.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-14.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-15.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-16.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-2.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-3.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-4.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-5.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-6.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-7.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-8.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/iso8859-9.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/jis0201.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/jis0208.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/jis0212.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/koi8-r.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/koi8-u.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/ksc5601.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macCentEuro.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macCroatian.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macCyrillic.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macDingbats.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macGreek.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macIceland.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macJapan.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macRoman.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macRomania.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macThai.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macTurkish.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/macUkraine.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/shiftjis.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/symbol.enc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/library/encoding/tis-620.enc"
    )
endif()

