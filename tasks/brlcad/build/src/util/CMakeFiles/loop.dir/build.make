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
include src/util/CMakeFiles/loop.dir/depend.make

# Include the progress variables for this target.
include src/util/CMakeFiles/loop.dir/progress.make

# Include the compile flags for this target's objects.
include src/util/CMakeFiles/loop.dir/flags.make

src/util/CMakeFiles/loop.dir/loop.c.o: src/util/CMakeFiles/loop.dir/flags.make
src/util/CMakeFiles/loop.dir/loop.c.o: ../src/util/loop.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/util/CMakeFiles/loop.dir/loop.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/loop.dir/loop.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/loop.c

src/util/CMakeFiles/loop.dir/loop.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/loop.dir/loop.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/loop.c > CMakeFiles/loop.dir/loop.c.i

src/util/CMakeFiles/loop.dir/loop.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/loop.dir/loop.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/loop.c -o CMakeFiles/loop.dir/loop.c.s

src/util/CMakeFiles/loop.dir/loop.c.o.requires:

.PHONY : src/util/CMakeFiles/loop.dir/loop.c.o.requires

src/util/CMakeFiles/loop.dir/loop.c.o.provides: src/util/CMakeFiles/loop.dir/loop.c.o.requires
	$(MAKE) -f src/util/CMakeFiles/loop.dir/build.make src/util/CMakeFiles/loop.dir/loop.c.o.provides.build
.PHONY : src/util/CMakeFiles/loop.dir/loop.c.o.provides

src/util/CMakeFiles/loop.dir/loop.c.o.provides.build: src/util/CMakeFiles/loop.dir/loop.c.o


# Object files for target loop
loop_OBJECTS = \
"CMakeFiles/loop.dir/loop.c.o"

# External object files for target loop
loop_EXTERNAL_OBJECTS =

bin/loop: src/util/CMakeFiles/loop.dir/loop.c.o
bin/loop: src/util/CMakeFiles/loop.dir/build.make
bin/loop: lib/libbu.so.20.0.1
bin/loop: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/loop: lib/libregex.so.1.0.4
bin/loop: src/util/CMakeFiles/loop.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/loop"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/loop.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/util/CMakeFiles/loop.dir/build: bin/loop

.PHONY : src/util/CMakeFiles/loop.dir/build

src/util/CMakeFiles/loop.dir/requires: src/util/CMakeFiles/loop.dir/loop.c.o.requires

.PHONY : src/util/CMakeFiles/loop.dir/requires

src/util/CMakeFiles/loop.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -P CMakeFiles/loop.dir/cmake_clean.cmake
.PHONY : src/util/CMakeFiles/loop.dir/clean

src/util/CMakeFiles/loop.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util/CMakeFiles/loop.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/util/CMakeFiles/loop.dir/depend
