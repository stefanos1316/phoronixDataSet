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

# Utility rule file for pinewood.g.

# Include the progress variables for this target.
include db/CMakeFiles/pinewood.g.dir/progress.make

db/CMakeFiles/pinewood.g: share/db/pinewood.g


share/db/pinewood.g: bin/asc2g
share/db/pinewood.g: ../db/pinewood.asc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../share/db/pinewood.g"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db && ../bin/asc2g /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db/pinewood.asc /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/db/pinewood.g

pinewood.g: db/CMakeFiles/pinewood.g
pinewood.g: share/db/pinewood.g
pinewood.g: db/CMakeFiles/pinewood.g.dir/build.make

.PHONY : pinewood.g

# Rule to build all files generated by this target.
db/CMakeFiles/pinewood.g.dir/build: pinewood.g

.PHONY : db/CMakeFiles/pinewood.g.dir/build

db/CMakeFiles/pinewood.g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db && $(CMAKE_COMMAND) -P CMakeFiles/pinewood.g.dir/cmake_clean.cmake
.PHONY : db/CMakeFiles/pinewood.g.dir/clean

db/CMakeFiles/pinewood.g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/CMakeFiles/pinewood.g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : db/CMakeFiles/pinewood.g.dir/depend

