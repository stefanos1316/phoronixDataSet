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

# Utility rule file for compat_libs.

# Include the progress variables for this target.
include src/CMakeFiles/compat_libs.dir/progress.make

src/CMakeFiles/compat_libs: src/libdnnl.so
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src && /usr/bin/cmake -E remove -f libmkldnn.so
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src && /usr/bin/cmake -E create_symlink libdnnl.so libmkldnn.so

compat_libs: src/CMakeFiles/compat_libs
compat_libs: src/CMakeFiles/compat_libs.dir/build.make

.PHONY : compat_libs

# Rule to build all files generated by this target.
src/CMakeFiles/compat_libs.dir/build: compat_libs

.PHONY : src/CMakeFiles/compat_libs.dir/build

src/CMakeFiles/compat_libs.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src && $(CMAKE_COMMAND) -P CMakeFiles/compat_libs.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/compat_libs.dir/clean

src/CMakeFiles/compat_libs.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/src /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/src/CMakeFiles/compat_libs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/compat_libs.dir/depend

