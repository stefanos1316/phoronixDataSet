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

# Utility rule file for convert-pic.g.

# Include the progress variables for this target.
include db/CMakeFiles/convert-pic.g.dir/progress.make

db/CMakeFiles/convert-pic.g:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db && /bin/sh /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/sh/conversion.sh GED=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bin/mged /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/db/pic.g

convert-pic.g: db/CMakeFiles/convert-pic.g
convert-pic.g: db/CMakeFiles/convert-pic.g.dir/build.make

.PHONY : convert-pic.g

# Rule to build all files generated by this target.
db/CMakeFiles/convert-pic.g.dir/build: convert-pic.g

.PHONY : db/CMakeFiles/convert-pic.g.dir/build

db/CMakeFiles/convert-pic.g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db && $(CMAKE_COMMAND) -P CMakeFiles/convert-pic.g.dir/cmake_clean.cmake
.PHONY : db/CMakeFiles/convert-pic.g.dir/clean

db/CMakeFiles/convert-pic.g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/db/CMakeFiles/convert-pic.g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : db/CMakeFiles/convert-pic.g.dir/depend

