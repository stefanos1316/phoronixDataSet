# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build

# Utility rule file for test_benchdnn_ip_bf16.

# Include the progress variables for this target.
include tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/progress.make

tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16:


test_benchdnn_ip_bf16: tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16
test_benchdnn_ip_bf16: tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/build.make

.PHONY : test_benchdnn_ip_bf16

# Rule to build all files generated by this target.
tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/build: test_benchdnn_ip_bf16

.PHONY : tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/build

tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/benchdnn && $(CMAKE_COMMAND) -P CMakeFiles/test_benchdnn_ip_bf16.dir/cmake_clean.cmake
.PHONY : tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/clean

tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests/benchdnn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/benchdnn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/benchdnn/CMakeFiles/test_benchdnn_ip_bf16.dir/depend

