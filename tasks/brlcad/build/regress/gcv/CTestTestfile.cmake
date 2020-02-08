# CMake generated Testfile for 
# Source directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/gcv
# Build directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/gcv
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(regress-gcv-fastgen "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/gcv/regress-fastgen.cmake")
set_tests_properties(regress-gcv-fastgen PROPERTIES  LABELS "Regression" TIMEOUT "60")
subdirs("dem")
