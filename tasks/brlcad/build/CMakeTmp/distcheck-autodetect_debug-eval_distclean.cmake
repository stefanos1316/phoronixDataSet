file(GLOB_RECURSE BUILD_DIR_CONTENTS RELATIVE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-autodetect_debug/build" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-autodetect_debug/build/*")
if(BUILD_DIR_CONTENTS)
  message("Files present after distclean in /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-autodetect_debug/build:")
  foreach(filename ${BUILD_DIR_CONTENTS})
    message("${filename}")
  endforeach(filename ${BUILD_DIR_CONTENTS})
  message(FATAL_ERROR "distclean failed in /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-autodetect_debug/build")
endif(BUILD_DIR_CONTENTS)
