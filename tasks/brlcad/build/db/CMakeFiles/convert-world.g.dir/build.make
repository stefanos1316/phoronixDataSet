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

# Utility rule file for convert-world.g.

# Include the progress variables for this target.
include db/CMakeFiles/convert-world.g.dir/progress.make

db/CMakeFiles/convert-world.g:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db && /bin/sh /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/conversion.sh GED=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bin/mged /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/db/world.g

convert-world.g: db/CMakeFiles/convert-world.g
convert-world.g: db/CMakeFiles/convert-world.g.dir/build.make

.PHONY : convert-world.g

# Rule to build all files generated by this target.
db/CMakeFiles/convert-world.g.dir/build: convert-world.g

.PHONY : db/CMakeFiles/convert-world.g.dir/build

db/CMakeFiles/convert-world.g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db && $(CMAKE_COMMAND) -P CMakeFiles/convert-world.g.dir/cmake_clean.cmake
.PHONY : db/CMakeFiles/convert-world.g.dir/clean

db/CMakeFiles/convert-world.g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/CMakeFiles/convert-world.g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : db/CMakeFiles/convert-world.g.dir/depend

