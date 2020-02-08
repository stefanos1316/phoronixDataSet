set(CBDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/gcv/dem")
set(CSDIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/gcv/dem")

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
set(DEMG "${BDIR}/gcv${EXE}")

# Unpack
execute_process(COMMAND "/usr/bin/cmake" -E tar xjf "${CSDIR}/hawaii-c.tar.bz2" WORKING_DIRECTORY "${CBDIR}")

# Run the converter
execute_process(COMMAND "${DEMG}" "${CBDIR}/hawaii-c" "${CBDIR}/hawaii-c.g" OUTPUT_VARIABLE dem_g_log ERROR_VARIABLE dem_g_log)
file(WRITE "${CBDIR}/regress-dem.log" "${dem_g_log}")

# Known "good" md5sum of output for comparison
set(EXPECTED_MD5 "80f98f409514586e0be12884e2118230")

# get and clean up md5sum from generated output
execute_process(COMMAND "/usr/bin/cmake" -E md5sum "${CBDIR}/hawaii-c.g" OUTPUT_VARIABLE genmd5)
string(REPLACE " ${CBDIR}/hawaii-c.g" "" genmd5 "${genmd5}")
string(STRIP "${genmd5}" genmd5)

# Check md5sum for a match
if("${EXPECTED_MD5}" STREQUAL "${genmd5}")
  execute_process(COMMAND "/usr/bin/cmake" -E touch "${CBDIR}/dem.done")
else("${EXPECTED_MD5}" STREQUAL "${genmd5}")
  file(APPEND "${CBDIR}/regress-dem.log" "\n\ndem results differ for ${CBDIR}/hawaii-c.dsp: expected ${EXPECTED_MD5}, got ${genmd5}")
  message(FATAL_ERROR "[dem-g] Failure while converting ${CBDIR}/hawaii-c, see ${CBDIR}/regress-dem.log for more info.\n")
endif("${EXPECTED_MD5}" STREQUAL "${genmd5}")

# Local Variables:
# tab-width: 8
# mode: cmake
# indent-tabs-mode: t
# End:
# ex: shiftwidth=2 tabstop=8

