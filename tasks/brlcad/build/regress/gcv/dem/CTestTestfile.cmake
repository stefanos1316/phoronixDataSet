# CMake generated Testfile for 
# Source directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/gcv/dem
# Build directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/gcv/dem
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(regress-gcv-dem "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/gcv/dem/regress-dem.cmake")
set_tests_properties(regress-gcv-dem PROPERTIES  LABELS "Regression" TIMEOUT "60")
