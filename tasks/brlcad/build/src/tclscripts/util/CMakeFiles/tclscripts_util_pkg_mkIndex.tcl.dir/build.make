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

# Utility rule file for tclscripts_util_pkg_mkIndex.tcl.

# Include the progress variables for this target.
include src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/progress.make

src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl: share/tclscripts/util/pkgIndex.tcl


share/tclscripts/util/pkgIndex.tcl: bin/btclsh
share/tclscripts/util/pkgIndex.tcl: ../src/tclscripts/util/expand_int_ranges.tcl
share/tclscripts/util/pkgIndex.tcl: ../src/tclscripts/util/luniq.tcl
share/tclscripts/util/pkgIndex.tcl: ../src/tclscripts/util/regionstobots.tcl
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../../share/tclscripts/util/pkgIndex.tcl"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/util && ../../../bin/btclsh /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/pkg_mkIndex.tcl /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/tclscripts/util >> /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/util/pkg_mkIndex_index_gen.log 2>&1

tclscripts_util_pkg_mkIndex.tcl: src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl
tclscripts_util_pkg_mkIndex.tcl: share/tclscripts/util/pkgIndex.tcl
tclscripts_util_pkg_mkIndex.tcl: src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/build.make

.PHONY : tclscripts_util_pkg_mkIndex.tcl

# Rule to build all files generated by this target.
src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/build: tclscripts_util_pkg_mkIndex.tcl

.PHONY : src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/build

src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/util && $(CMAKE_COMMAND) -P CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/cmake_clean.cmake
.PHONY : src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/clean

src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tclscripts/util/CMakeFiles/tclscripts_util_pkg_mkIndex.tcl.dir/depend
