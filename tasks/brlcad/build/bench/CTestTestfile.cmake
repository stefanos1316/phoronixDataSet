# CMake generated Testfile for 
# Source directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench
# Build directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bench
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(benchmark "/bin/sh" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bin/benchmark" "run" "TIMEFRAME=1")
set_tests_properties(benchmark PROPERTIES  LABELS "Benchmark")
subdirs("ref")
