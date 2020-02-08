# Install script for directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgdal.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgdal.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgdal.so"
         RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib/libgdal.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgdal.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgdal.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgdal.so"
         OLD_RPATH "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/lib:"
         NEW_RPATH "/usr/brlcad/rel-7.28.0/lib:$ORIGIN/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgdal.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gdal" TYPE FILE FILES "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/LICENSE.TXT")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gdal" TYPE FILE FILES
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/GDALLogoBW.svg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/GDALLogoColor.svg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/GDALLogoGS.svg"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/compdcs.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/coordinate_axis.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/cubewerx_extra.wkt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/datum_shift.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/default.rsc"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ecw_cs.wkt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ellipsoid.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/epsg.wkt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/esri_StatePlane_extra.wkt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/esri_Wisconsin_extra.wkt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/esri_extra.wkt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gcs.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gcs.override.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gdal_datum.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gdalicon.png"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gdalvrt.xsd"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/geoccs.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gml_registry.xml"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gmlasconf.xml"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gmlasconf.xsd"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gt_datum.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/gt_ellips.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/header.dxf"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/inspire_cp_BasicPropertyUnit.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/inspire_cp_CadastralBoundary.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/inspire_cp_CadastralParcel.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/inspire_cp_CadastralZoning.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_AdmArea.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_AdmBdry.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_AdmPt.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_BldA.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_BldL.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_Cntr.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_CommBdry.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_CommPt.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_Cstline.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_ElevPt.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_GCP.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_LeveeEdge.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_RailCL.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_RdASL.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_RdArea.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_RdCompt.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_RdEdg.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_RdMgtBdry.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_RdSgmtA.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_RvrMgtBdry.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_SBAPt.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_SBArea.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_SBBdry.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_WA.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_WL.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_WStrA.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/jpfgdgml_WStrL.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/netcdf_config.xsd"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/nitf_spec.xml"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/nitf_spec.xsd"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ogrvrt.xsd"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/osmconf.ini"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ozi_datum.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ozi_ellips.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/pci_datum.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/pci_ellips.txt"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/pcs.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/pcs.override.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/plscenesconf.json"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/prime_meridian.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/projop_wparm.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ruian_vf_ob_v1.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ruian_vf_st_uvoh_v1.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ruian_vf_st_v1.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/ruian_vf_v1.gfs"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/s57agencies.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/s57attributes.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/s57expectedinput.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/s57objectclasses.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/seed_2d.dgn"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/seed_3d.dgn"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/stateplane.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/trailer.dxf"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/unit_of_measure.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/vdv452.xml"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/vdv452.xsd"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/vertcs.csv"
    "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/data/vertcs.override.csv"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/port/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/gcore/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/alg/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/gnm/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/apps/cmake_install.cmake")
  include("/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/progs/cmake_install.cmake")

endif()

