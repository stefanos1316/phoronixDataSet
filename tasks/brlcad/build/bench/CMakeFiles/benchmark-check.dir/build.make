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
CMAKE_SOURCE_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build

# Utility rule file for benchmark-check.

# Include the progress variables for this target.
include bench/CMakeFiles/benchmark-check.dir/progress.make

bench/CMakeFiles/benchmark-check: bin/rt
bench/CMakeFiles/benchmark-check: bin/pixcmp
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bench && /usr/bin/ctest -L Benchmark --output-on-failure

benchmark-check: bench/CMakeFiles/benchmark-check
benchmark-check: bench/CMakeFiles/benchmark-check.dir/build.make

.PHONY : benchmark-check

# Rule to build all files generated by this target.
bench/CMakeFiles/benchmark-check.dir/build: benchmark-check

.PHONY : bench/CMakeFiles/benchmark-check.dir/build

bench/CMakeFiles/benchmark-check.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bench && $(CMAKE_COMMAND) -P CMakeFiles/benchmark-check.dir/cmake_clean.cmake
.PHONY : bench/CMakeFiles/benchmark-check.dir/clean

bench/CMakeFiles/benchmark-check.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/bench /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bench /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bench/CMakeFiles/benchmark-check.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bench/CMakeFiles/benchmark-check.dir/depend

