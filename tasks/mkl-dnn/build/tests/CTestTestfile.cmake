# CMake generated Testfile for 
# Source directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests
# Build directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(api-c "api-c")
add_test(test_c_symbols-c "test_c_symbols-c")
subdirs("gtests")
subdirs("benchdnn")
subdirs("mkldnn_compat")
