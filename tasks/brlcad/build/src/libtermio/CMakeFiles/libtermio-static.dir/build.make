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

# Include any dependencies generated for this target.
include src/libtermio/CMakeFiles/libtermio-static.dir/depend.make

# Include the progress variables for this target.
include src/libtermio/CMakeFiles/libtermio-static.dir/progress.make

# Include the compile flags for this target's objects.
include src/libtermio/CMakeFiles/libtermio-static.dir/flags.make

# Object files for target libtermio-static
libtermio__static_OBJECTS =

# External object files for target libtermio-static
libtermio__static_EXTERNAL_OBJECTS = \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio/CMakeFiles/libtermio-obj.dir/termio.c.o"

lib/libtermio.a: src/libtermio/CMakeFiles/libtermio-obj.dir/termio.c.o
lib/libtermio.a: src/libtermio/CMakeFiles/libtermio-static.dir/build.make
lib/libtermio.a: src/libtermio/CMakeFiles/libtermio-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C static library ../../lib/libtermio.a"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio && $(CMAKE_COMMAND) -P CMakeFiles/libtermio-static.dir/cmake_clean_target.cmake
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libtermio-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libtermio/CMakeFiles/libtermio-static.dir/build: lib/libtermio.a

.PHONY : src/libtermio/CMakeFiles/libtermio-static.dir/build

src/libtermio/CMakeFiles/libtermio-static.dir/requires:

.PHONY : src/libtermio/CMakeFiles/libtermio-static.dir/requires

src/libtermio/CMakeFiles/libtermio-static.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio && $(CMAKE_COMMAND) -P CMakeFiles/libtermio-static.dir/cmake_clean.cmake
.PHONY : src/libtermio/CMakeFiles/libtermio-static.dir/clean

src/libtermio/CMakeFiles/libtermio-static.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libtermio /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio/CMakeFiles/libtermio-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libtermio/CMakeFiles/libtermio-static.dir/depend
