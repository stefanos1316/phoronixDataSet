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
include src/libtermio/CMakeFiles/libtermio.dir/depend.make

# Include the progress variables for this target.
include src/libtermio/CMakeFiles/libtermio.dir/progress.make

# Include the compile flags for this target's objects.
include src/libtermio/CMakeFiles/libtermio.dir/flags.make

# Object files for target libtermio
libtermio_OBJECTS =

# External object files for target libtermio
libtermio_EXTERNAL_OBJECTS = \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio/CMakeFiles/libtermio-obj.dir/termio.c.o"

lib/libtermio.so.20.0.1: src/libtermio/CMakeFiles/libtermio-obj.dir/termio.c.o
lib/libtermio.so.20.0.1: src/libtermio/CMakeFiles/libtermio.dir/build.make
lib/libtermio.so.20.0.1: lib/libtermlib.so.1.7.1
lib/libtermio.so.20.0.1: src/libtermio/CMakeFiles/libtermio.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C shared library ../../lib/libtermio.so"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libtermio.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libtermio.so.20.0.1 ../../lib/libtermio.so.20 ../../lib/libtermio.so

lib/libtermio.so.20: lib/libtermio.so.20.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libtermio.so.20

lib/libtermio.so: lib/libtermio.so.20.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libtermio.so

# Rule to build all files generated by this target.
src/libtermio/CMakeFiles/libtermio.dir/build: lib/libtermio.so

.PHONY : src/libtermio/CMakeFiles/libtermio.dir/build

src/libtermio/CMakeFiles/libtermio.dir/requires:

.PHONY : src/libtermio/CMakeFiles/libtermio.dir/requires

src/libtermio/CMakeFiles/libtermio.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio && $(CMAKE_COMMAND) -P CMakeFiles/libtermio.dir/cmake_clean.cmake
.PHONY : src/libtermio/CMakeFiles/libtermio.dir/clean

src/libtermio/CMakeFiles/libtermio.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libtermio /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libtermio/CMakeFiles/libtermio.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libtermio/CMakeFiles/libtermio.dir/depend

