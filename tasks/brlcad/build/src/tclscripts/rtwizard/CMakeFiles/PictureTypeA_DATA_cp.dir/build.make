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

# Utility rule file for PictureTypeA_DATA_cp.

# Include the progress variables for this target.
include src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/progress.make

src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp: src/tclscripts/rtwizard/PictureTypeA_DATA.sentinel


src/tclscripts/rtwizard/PictureTypeA_DATA.sentinel: ../src/tclscripts/rtwizard/examples/PictureTypeA/desc.txt
src/tclscripts/rtwizard/PictureTypeA_DATA.sentinel: ../src/tclscripts/rtwizard/examples/PictureTypeA/helpstr.txt
src/tclscripts/rtwizard/PictureTypeA_DATA.sentinel: ../src/tclscripts/rtwizard/examples/PictureTypeA/intro.txt
src/tclscripts/rtwizard/PictureTypeA_DATA.sentinel: ../src/tclscripts/rtwizard/examples/PictureTypeA/title.txt
src/tclscripts/rtwizard/PictureTypeA_DATA.sentinel: ../src/tclscripts/rtwizard/examples/PictureTypeA/preview.small.gif
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating PictureTypeA_DATA.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/rtwizard && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/rtwizard/PictureTypeA_DATA.sentinel

PictureTypeA_DATA_cp: src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp
PictureTypeA_DATA_cp: src/tclscripts/rtwizard/PictureTypeA_DATA.sentinel
PictureTypeA_DATA_cp: src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/build.make

.PHONY : PictureTypeA_DATA_cp

# Rule to build all files generated by this target.
src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/build: PictureTypeA_DATA_cp

.PHONY : src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/build

src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/rtwizard && $(CMAKE_COMMAND) -P CMakeFiles/PictureTypeA_DATA_cp.dir/cmake_clean.cmake
.PHONY : src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/clean

src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/rtwizard /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/rtwizard /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tclscripts/rtwizard/CMakeFiles/PictureTypeA_DATA_cp.dir/depend

