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

# Utility rule file for lod_TCLSCRIPTS_cp.

# Include the progress variables for this target.
include src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/progress.make

src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp: src/tclscripts/lod/lod_TCLSCRIPTS.sentinel


src/tclscripts/lod/lod_TCLSCRIPTS.sentinel: ../src/tclscripts/lod/LODDialog.tcl
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating lod_TCLSCRIPTS.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lod && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lod/lod_TCLSCRIPTS.sentinel

lod_TCLSCRIPTS_cp: src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp
lod_TCLSCRIPTS_cp: src/tclscripts/lod/lod_TCLSCRIPTS.sentinel
lod_TCLSCRIPTS_cp: src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/build.make

.PHONY : lod_TCLSCRIPTS_cp

# Rule to build all files generated by this target.
src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/build: lod_TCLSCRIPTS_cp

.PHONY : src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/build

src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lod && $(CMAKE_COMMAND) -P CMakeFiles/lod_TCLSCRIPTS_cp.dir/cmake_clean.cmake
.PHONY : src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/clean

src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/lod /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lod /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tclscripts/lod/CMakeFiles/lod_TCLSCRIPTS_cp.dir/depend
