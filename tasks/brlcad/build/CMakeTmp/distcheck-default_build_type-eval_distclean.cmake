file(GLOB_RECURSE BUILD_DIR_CONTENTS RELATIVE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-default_build_type/build" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-default_build_type/build/*")
if(BUILD_DIR_CONTENTS)
  message("Files present after distclean in /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-default_build_type/build:")
  foreach(filename ${BUILD_DIR_CONTENTS})
    message("${filename}")
  endforeach(filename ${BUILD_DIR_CONTENTS})
  message(FATAL_ERROR "distclean failed in /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-default_build_type/build")
endif(BUILD_DIR_CONTENTS)
