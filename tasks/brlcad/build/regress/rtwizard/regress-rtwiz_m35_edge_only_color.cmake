set(CBDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard")
set(INPUTFILE "share/db/m35.g")
set(CTRLIMG "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/m35_edge_only_color_ref.pix")
set(TGTIMG "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/m35_edge_only_color.pix")
set(LOGFILE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/m35_edge_only_color.log")
set(TGTNAME "rtwiz_m35_edge_only_color")

set(SBDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bin")
set(DBDIR "")
set(RBDIR "")
# Use the mechanism created to allow multiconfig builds to
# know what the current build type is.
if(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")
  set(BDIR "${RBDIR}")
  set(test_suffix "-Release")
elseif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Debug")
  set(BDIR "${DBDIR}")
  set(test_suffix "-Debug")
else(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")
  set(BDIR "${SBDIR}")
  set(test_suffix "")
endif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")

get_filename_component(EXE "/usr/bin/cmake" EXT)
set(RWIZ "${BDIR}/rtwizard${EXE}")
set(PIXCMP "${BDIR}/pixcmp${EXE}")

# Now that we know where the binary directory is, set the .g input path
set(SRCFILE "${BDIR}/../${INPUTFILE}")

# Clean up in case we've run before
execute_process(COMMAND "/usr/bin/cmake" -E remove "${TGTIMG}")

# Start with the file using standard UNIX line endings
file(APPEND "${LOGFILE}" "Generating ${TGTIMG}:\n")
execute_process(
  COMMAND "${RWIZ}" --no-gui -i "${SRCFILE}" -o "${TGTIMG}" -l component --benchmark -z 2 --line-color 100/200/255 -C 30/30/30
  OUTPUT_VARIABLE rtwiz_log ERROR_VARIABLE rtwiz_log
  )
file(APPEND "${LOGFILE}" "${rtwiz_log}")
set(rtwiz_log)
if(NOT EXISTS "${TGTIMG}")
  message(FATAL_ERROR "Unable to generate ${TGTIMG} with ${RWIZ}, aborting.\nSee ${LOGFILE} for more details.")
endif(NOT EXISTS "${TGTIMG}")

# pixcmp the results with the control image to make sure rtwiz got it right
file(APPEND "${LOGFILE}" "\nComparing ${TGTIMG} to ${CTRLIMG}:\n")
execute_process(
  COMMAND "${PIXCMP}" "${TGTIMG}" "${CTRLIMG}"
  RESULT_VARIABLE pixcmp_val OUTPUT_VARIABLE rtwiz_log ERROR_VARIABLE rtwiz_log
  )
file(APPEND "${LOGFILE}" "${rtwiz_log}")

if(${pixcmp_val} GREATER 0)
  message(FATAL_ERROR "Differences found between ${TGTIMG} and ${CTRLIMG} with ${PIXCMP}, aborting.\nSee ${LOGFILE} for more details.")
else(${pixcmp_val} GREATER 0)
  execute_process(COMMAND "/usr/bin/cmake" -E remove ${TGTIMG})
  execute_process(COMMAND "/usr/bin/cmake" -E touch "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/${TGTNAME}${test_suffix}.done")
endif(${pixcmp_val} GREATER 0)

# Local Variables:
# tab-width: 8
# mode: cmake
# indent-tabs-mode: t
# End:
# ex: shiftwidth=2 tabstop=8

