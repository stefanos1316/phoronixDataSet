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

# Utility rule file for queen.g.

# Include the progress variables for this target.
include db/chess/CMakeFiles/queen.g.dir/progress.make

db/chess/CMakeFiles/queen.g: share/db/chess/queen.g


share/db/chess/queen.g: bin/asc2g
share/db/chess/queen.g: ../db/chess/queen.asc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../share/db/chess/queen.g"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/chess && ../../bin/asc2g /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db/chess/queen.asc /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/db/chess/queen.g

queen.g: db/chess/CMakeFiles/queen.g
queen.g: share/db/chess/queen.g
queen.g: db/chess/CMakeFiles/queen.g.dir/build.make

.PHONY : queen.g

# Rule to build all files generated by this target.
db/chess/CMakeFiles/queen.g.dir/build: queen.g

.PHONY : db/chess/CMakeFiles/queen.g.dir/build

db/chess/CMakeFiles/queen.g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/chess && $(CMAKE_COMMAND) -P CMakeFiles/queen.g.dir/cmake_clean.cmake
.PHONY : db/chess/CMakeFiles/queen.g.dir/clean

db/chess/CMakeFiles/queen.g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db/chess /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/chess /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/chess/CMakeFiles/queen.g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : db/chess/CMakeFiles/queen.g.dir/depend
