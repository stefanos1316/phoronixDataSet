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

# Utility rule file for ADA073408.g.

# Include the progress variables for this target.
include db/comgeom/CMakeFiles/ADA073408.g.dir/progress.make

db/comgeom/CMakeFiles/ADA073408.g: share/db/comgeom/ADA073408.g


share/db/comgeom/ADA073408.g: bin/comgeom-g
share/db/comgeom/ADA073408.g: ../db/comgeom/ADA073408.comgeom
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../share/db/comgeom/ADA073408.g"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/comgeom && /usr/bin/cmake -E remove /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/db/comgeom/ADA073408.g
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/comgeom && ../../bin/comgeom-g -v 5 /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db/comgeom/ADA073408.comgeom /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/db/comgeom/ADA073408.g > /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/comgeom/ADA073408.log 2>&1

ADA073408.g: db/comgeom/CMakeFiles/ADA073408.g
ADA073408.g: share/db/comgeom/ADA073408.g
ADA073408.g: db/comgeom/CMakeFiles/ADA073408.g.dir/build.make

.PHONY : ADA073408.g

# Rule to build all files generated by this target.
db/comgeom/CMakeFiles/ADA073408.g.dir/build: ADA073408.g

.PHONY : db/comgeom/CMakeFiles/ADA073408.g.dir/build

db/comgeom/CMakeFiles/ADA073408.g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/comgeom && $(CMAKE_COMMAND) -P CMakeFiles/ADA073408.g.dir/cmake_clean.cmake
.PHONY : db/comgeom/CMakeFiles/ADA073408.g.dir/clean

db/comgeom/CMakeFiles/ADA073408.g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db/comgeom /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/comgeom /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/comgeom/CMakeFiles/ADA073408.g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : db/comgeom/CMakeFiles/ADA073408.g.dir/depend
