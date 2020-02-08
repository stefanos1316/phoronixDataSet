# CMake generated Testfile for 
# Source directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad
# Build directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(NOTE:\ some\ 'test'\ tests\ are\ expected\ to\ fail,\ 'regress'\ must\ pass "/usr/bin/cmake" "--build" "." "--target" "print-warning-message")
subdirs("misc/tools")
subdirs("src/other")
subdirs("src")
subdirs("include")
subdirs("sh")
subdirs("misc")
subdirs("doc")
subdirs("db")
subdirs("bench")
subdirs("regress")
