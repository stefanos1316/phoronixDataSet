set(CBDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv")
set(SRCIMG "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/m35.bw")
set(CTRLIMG "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/icv/m35_bw.png")
set(TGTIMG "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/m35_bw_png.png")
set(LOGFILE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/bw_png.log")
set(TGT "bw_png")

set(SBDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bin")
set(DBDIR "")
set(RBDIR "")
# Use the mechanism created to allow multiconfig builds to
# know what the current build type is.
if(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")
  set(BDIR "${RBDIR}")
elseif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Debug")
  set(BDIR "${DBDIR}")
else(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")
  set(BDIR "${SBDIR}")
endif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")

get_filename_component(EXE "/usr/bin/cmake" EXT)
set(ICV "${BDIR}/icv${EXE}")
set(PIXCMP "${BDIR}/pixcmp${EXE}")

# Start with the file using standard UNIX line endings
file(APPEND "${LOGFILE}" "Converting ${SRCIMG} to ${TGTIMG}:\n")
execute_process(
  COMMAND "${ICV}" "${SRCIMG}" "${TGTIMG}"
  OUTPUT_VARIABLE icv_log ERROR_VARIABLE icv_log
  )
file(APPEND "${LOGFILE}" "${icv_log}")
set(icv_log)
if(NOT EXISTS "${TGTIMG}")
  message(FATAL_ERROR "Unable to convert ${SRCIMG} to ${TGTIMG} with ${ICV}, aborting.\nSee ${LOGFILE} for more details.")
endif(NOT EXISTS "${TGTIMG}")

# Because we are exporting, we need to convert both the control image
# and the target image to PIX format for pixcmp to do its check.
execute_process(
  COMMAND "${ICV}" "${CTRLIMG}" "${CMAKE_CURRENT_BINARY_DIR}/${TGT}-ctrl.pix"
  OUTPUT_VARIABLE icv_log ERROR_VARIABLE icv_log
  )
file(APPEND "${LOGFILE}" "${icv_log}")
set(icv_log)
execute_process(
  COMMAND "${ICV}" "${TGTIMG}" "${CMAKE_CURRENT_BINARY_DIR}/${TGT}-out.pix"
  OUTPUT_VARIABLE icv_log ERROR_VARIABLE icv_log
  )
file(APPEND "${LOGFILE}" "${icv_log}")
set(icv_log)

# pixcmp the results with the control image to make sure icv got it right
file(APPEND "${LOGFILE}" "\nComparing ${CMAKE_CURRENT_BINARY_DIR}/${TGT}-ctrl.pix to ${CMAKE_CURRENT_BINARY_DIR}/${TGT}-out.pix:\n")
execute_process(
  COMMAND "${PIXCMP}" "${CMAKE_CURRENT_BINARY_DIR}/${TGT}-ctrl.pix" "${CMAKE_CURRENT_BINARY_DIR}/${TGT}-out.pix"
  RESULT_VARIABLE pixcmp_val OUTPUT_VARIABLE icv_log ERROR_VARIABLE icv_log
  )
file(APPEND "${LOGFILE}" "${icv_log}")

if(${pixcmp_val} GREATER 0)
  message(FATAL_ERROR "Differences found between ${CMAKE_CURRENT_BINARY_DIR}/${TGT}-ctrl.pix and ${CMAKE_CURRENT_BINARY_DIR}/${TGT}-out.pix with ${PIXCMP}, aborting.\nSee ${LOGFILE} for more details.")
else(${pixcmp_val} GREATER 0)
  execute_process(COMMAND "/usr/bin/cmake" -E remove ${TGTIMG})
  execute_process(COMMAND "/usr/bin/cmake" -E remove ${CMAKE_CURRENT_BINARY_DIR}/${TGT}-ctrl.pix)
  execute_process(COMMAND "/usr/bin/cmake" -E remove ${CMAKE_CURRENT_BINARY_DIR}/${TGT}-out.pix)
  execute_process(COMMAND "/usr/bin/cmake" -E touch "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/bw_png.done")
endif(${pixcmp_val} GREATER 0)

# Local Variables:
# tab-width: 8
# mode: cmake
# indent-tabs-mode: t
# End:
# ex: shiftwidth=2 tabstop=8

