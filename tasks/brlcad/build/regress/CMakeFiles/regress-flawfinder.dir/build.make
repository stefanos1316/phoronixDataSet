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

# Utility rule file for regress-flawfinder.

# Include the progress variables for this target.
include regress/CMakeFiles/regress-flawfinder.dir/progress.make

regress/CMakeFiles/regress-flawfinder:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress && /usr/bin/ctest -R ^regress-flawfinder --output-on-failure

regress-flawfinder: regress/CMakeFiles/regress-flawfinder
regress-flawfinder: regress/CMakeFiles/regress-flawfinder.dir/build.make

.PHONY : regress-flawfinder

# Rule to build all files generated by this target.
regress/CMakeFiles/regress-flawfinder.dir/build: regress-flawfinder

.PHONY : regress/CMakeFiles/regress-flawfinder.dir/build

regress/CMakeFiles/regress-flawfinder.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress && $(CMAKE_COMMAND) -P CMakeFiles/regress-flawfinder.dir/cmake_clean.cmake
.PHONY : regress/CMakeFiles/regress-flawfinder.dir/clean

regress/CMakeFiles/regress-flawfinder.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/CMakeFiles/regress-flawfinder.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : regress/CMakeFiles/regress-flawfinder.dir/depend

