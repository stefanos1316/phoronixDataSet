set(CBDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv")
set(SRCIMG "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/m35.ppm")
set(CTRLIMG "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/icv/../../bench/ref/m35.pix")
set(TGTIMG "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/m35_ppm.pix")
set(LOGFILE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/ppm_pix.log")

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

# pixcmp the results with the control image to make sure icv got it right
file(APPEND "${LOGFILE}" "\nComparing ${TGTIMG} to ${CTRLIMG}:\n")
execute_process(
  COMMAND "${PIXCMP}" "${TGTIMG}" "${CTRLIMG}"
  RESULT_VARIABLE pixcmp_val OUTPUT_VARIABLE icv_log ERROR_VARIABLE icv_log
  )
file(APPEND "${LOGFILE}" "${icv_log}")

if(${pixcmp_val} GREATER 0)
  message(FATAL_ERROR "Differences found between ${TGTIMG} and ${CTRLIMG} with ${PIXCMP}, aborting.\nSee ${LOGFILE} for more details.")
else(${pixcmp_val} GREATER 0)
  execute_process(COMMAND "/usr/bin/cmake" -E remove ${TGTIMG})
  execute_process(COMMAND "/usr/bin/cmake" -E touch "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/ppm_pix.done")
endif(${pixcmp_val} GREATER 0)

# Local Variables:
# tab-width: 8
# mode: cmake
# indent-tabs-mode: t
# End:
# ex: shiftwidth=2 tabstop=8

