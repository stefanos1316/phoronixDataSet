set(CBDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/gcv")
set(CSDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/gcv")

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
  set(test_suffix)
endif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")

get_filename_component(EXE "/usr/bin/cmake" EXT)
set(FAST4G "${BDIR}/fast4-g${EXE}")
set(GDIFF "${BDIR}/gdiff${EXE}")

# Clean up in case we've run before
execute_process(COMMAND "/usr/bin/cmake" -E remove "${CBDIR}/fastgen_unix.g")
execute_process(COMMAND "/usr/bin/cmake" -E remove "${CBDIR}/fastgen_dos.g")

# Start with the file using standard UNIX line endings
file(WRITE "${CBDIR}/fastgen.log" "Converting ${CSDIR}/fastgen_box.fast4 (UNIX line endings):\n")
# We need the titles of the .g files to be the same, so copy the file into a "standard" position
execute_process(COMMAND "/usr/bin/cmake" -E remove "${CBDIR}/fastgen.fast4")
execute_process(COMMAND "/usr/bin/cmake" -E copy "${CSDIR}/fastgen_box.fast4" "${CBDIR}/fastgen.fast4")
execute_process(
  COMMAND "${FAST4G}" "${CBDIR}/fastgen.fast4" "${CBDIR}/fastgen_unix.g"
  OUTPUT_VARIABLE fastgen_log ERROR_VARIABLE fastgen_log
  )
file(APPEND "${CBDIR}/fastgen.log" "${fastgen_log}")
set(fastgen_log)
if(NOT EXISTS "${CBDIR}/fastgen_unix.g")
  message(FATAL_ERROR "Unable to convert ${CSDIR}/fastgen_box.fast4 to ${CBDIR}/fastgen_unix.g with ${FAST4G}, aborting.\nSee ${CBDIR}/fastgen.log for more details.")
endif(NOT EXISTS "${CBDIR}/fastgen_unix.g")


# Now the conversion with DOS line endings
file(APPEND "${CBDIR}/fastgen.log" "\nConverting ${CSDIR}/fastgen_dos.fast4 (DOS line endings):\n")
# We need the titles of the .g files to be the same, so copy the file into a "standard" position
execute_process(COMMAND "/usr/bin/cmake" -E remove "${CBDIR}/fastgen.fast4")
execute_process(COMMAND "/usr/bin/cmake" -E copy "${CSDIR}/fastgen_dos.fast4" "${CBDIR}/fastgen.fast4")
execute_process(
  COMMAND "${FAST4G}" "${CBDIR}/fastgen.fast4" "${CBDIR}/fastgen_dos.g"
  OUTPUT_VARIABLE fastgen_log ERROR_VARIABLE fastgen_log
  )
file(APPEND "${CBDIR}/fastgen.log" "${fastgen_log}")
set(fastgen_log)
if(NOT EXISTS "${CBDIR}/fastgen_dos.g")
  message(FATAL_ERROR "Unable to convert ${CSDIR}/fastgen_dos.fast4 to ${CBDIR}/fastgen_dos.g with ${BDIR}/fast4-g${EXE}, aborting.\nSee ${CBDIR}/fastgen.log for more details.")
endif(NOT EXISTS "${CBDIR}/fastgen_dos.g")

# Clean up temp file
execute_process(COMMAND "/usr/bin/cmake" -E remove "${CBDIR}/fastgen.fast4")

# Check for differences (should be none)
file(APPEND "${CBDIR}/fastgen.log" "\nComparing conversions from sources with DOS and UNIX line endings:\n")
execute_process(
  COMMAND "${GDIFF}" "${CBDIR}/fastgen_unix.g" "${CBDIR}/fastgen_dos.g" RESULT_VARIABLE gdiff_result
  OUTPUT_VARIABLE fastgen_log ERROR_VARIABLE fastgen_log
  )
file(APPEND "${CBDIR}/fastgen.log" "${fastgen_log}")
set(fastgen_log)
if(gdiff_result)
  file(APPEND "${CBDIR}/fastgen.log" "\n\ngdiff reports differences between ${CBDIR}/fastgen_unix.g and ${CBDIR}/fastgen_dos.g")
  message(FATAL_ERROR "[fast4-g] Failure, see ${CBDIR}/fastgen.log for more info.\n")
else(gdiff_result)
  execute_process(COMMAND "/usr/bin/cmake" -E touch "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/gcv/fastgen${test_suffix}.done")
endif(gdiff_result)

# Local Variables:
# tab-width: 8
# mode: cmake
# indent-tabs-mode: t
# End:
# ex: shiftwidth=2 tabstop=8

