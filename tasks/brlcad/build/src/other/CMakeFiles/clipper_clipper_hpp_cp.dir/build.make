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

# Utility rule file for clipper_clipper_hpp_cp.

# Include the progress variables for this target.
include src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/progress.make

src/other/CMakeFiles/clipper_clipper_hpp_cp: src/other/clipper_clipper_hpp.sentinel


src/other/clipper_clipper_hpp.sentinel: ../src/other/clipper/clipper.hpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating clipper_clipper_hpp.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/clipper_clipper_hpp.sentinel

clipper_clipper_hpp_cp: src/other/CMakeFiles/clipper_clipper_hpp_cp
clipper_clipper_hpp_cp: src/other/clipper_clipper_hpp.sentinel
clipper_clipper_hpp_cp: src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/build.make

.PHONY : clipper_clipper_hpp_cp

# Rule to build all files generated by this target.
src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/build: clipper_clipper_hpp_cp

.PHONY : src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/build

src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other && $(CMAKE_COMMAND) -P CMakeFiles/clipper_clipper_hpp_cp.dir/cmake_clean.cmake
.PHONY : src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/clean

src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/CMakeFiles/clipper_clipper_hpp_cp.dir/depend

