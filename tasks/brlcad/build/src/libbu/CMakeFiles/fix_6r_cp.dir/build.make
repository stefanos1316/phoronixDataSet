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

# Utility rule file for fix_6r_cp.

# Include the progress variables for this target.
include src/libbu/CMakeFiles/fix_6r_cp.dir/progress.make

src/libbu/CMakeFiles/fix_6r_cp: src/libbu/fix_6r.sentinel


src/libbu/fix_6r.sentinel: ../src/libbu/fix.6r
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating fix_6r.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/fix_6r.sentinel

fix_6r_cp: src/libbu/CMakeFiles/fix_6r_cp
fix_6r_cp: src/libbu/fix_6r.sentinel
fix_6r_cp: src/libbu/CMakeFiles/fix_6r_cp.dir/build.make

.PHONY : fix_6r_cp

# Rule to build all files generated by this target.
src/libbu/CMakeFiles/fix_6r_cp.dir/build: fix_6r_cp

.PHONY : src/libbu/CMakeFiles/fix_6r_cp.dir/build

src/libbu/CMakeFiles/fix_6r_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu && $(CMAKE_COMMAND) -P CMakeFiles/fix_6r_cp.dir/cmake_clean.cmake
.PHONY : src/libbu/CMakeFiles/fix_6r_cp.dir/clean

src/libbu/CMakeFiles/fix_6r_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libbu /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/CMakeFiles/fix_6r_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libbu/CMakeFiles/fix_6r_cp.dir/depend

