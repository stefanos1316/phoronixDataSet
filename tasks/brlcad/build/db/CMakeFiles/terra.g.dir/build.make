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

# Utility rule file for terra.g.

# Include the progress variables for this target.
include db/CMakeFiles/terra.g.dir/progress.make

db/CMakeFiles/terra.g: share/db/terra.g


share/db/terra.g: bin/asc2g
share/db/terra.g: ../db/terra.asc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../share/db/terra.g"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db && ../bin/asc2g /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db/terra.asc /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/db/terra.g

terra.g: db/CMakeFiles/terra.g
terra.g: share/db/terra.g
terra.g: db/CMakeFiles/terra.g.dir/build.make

.PHONY : terra.g

# Rule to build all files generated by this target.
db/CMakeFiles/terra.g.dir/build: terra.g

.PHONY : db/CMakeFiles/terra.g.dir/build

db/CMakeFiles/terra.g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db && $(CMAKE_COMMAND) -P CMakeFiles/terra.g.dir/cmake_clean.cmake
.PHONY : db/CMakeFiles/terra.g.dir/clean

db/CMakeFiles/terra.g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/CMakeFiles/terra.g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : db/CMakeFiles/terra.g.dir/depend

