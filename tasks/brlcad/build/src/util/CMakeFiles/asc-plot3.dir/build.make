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
include src/util/CMakeFiles/asc-plot3.dir/depend.make

# Include the progress variables for this target.
include src/util/CMakeFiles/asc-plot3.dir/progress.make

# Include the compile flags for this target's objects.
include src/util/CMakeFiles/asc-plot3.dir/flags.make

src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o: src/util/CMakeFiles/asc-plot3.dir/flags.make
src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o: ../src/util/asc-plot3.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/asc-plot3.dir/asc-plot3.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/asc-plot3.c

src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/asc-plot3.dir/asc-plot3.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/asc-plot3.c > CMakeFiles/asc-plot3.dir/asc-plot3.c.i

src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/asc-plot3.dir/asc-plot3.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/asc-plot3.c -o CMakeFiles/asc-plot3.dir/asc-plot3.c.s

src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o.requires:

.PHONY : src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o.requires

src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o.provides: src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o.requires
	$(MAKE) -f src/util/CMakeFiles/asc-plot3.dir/build.make src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o.provides.build
.PHONY : src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o.provides

src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o.provides.build: src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o


# Object files for target asc-plot3
asc__plot3_OBJECTS = \
"CMakeFiles/asc-plot3.dir/asc-plot3.c.o"

# External object files for target asc-plot3
asc__plot3_EXTERNAL_OBJECTS =

bin/asc-plot3: src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o
bin/asc-plot3: src/util/CMakeFiles/asc-plot3.dir/build.make
bin/asc-plot3: lib/libbn.so.20.0.1
bin/asc-plot3: lib/libbu.so.20.0.1
bin/asc-plot3: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/asc-plot3: lib/libregex.so.1.0.4
bin/asc-plot3: src/util/CMakeFiles/asc-plot3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/asc-plot3"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/asc-plot3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/util/CMakeFiles/asc-plot3.dir/build: bin/asc-plot3

.PHONY : src/util/CMakeFiles/asc-plot3.dir/build

src/util/CMakeFiles/asc-plot3.dir/requires: src/util/CMakeFiles/asc-plot3.dir/asc-plot3.c.o.requires

.PHONY : src/util/CMakeFiles/asc-plot3.dir/requires

src/util/CMakeFiles/asc-plot3.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -P CMakeFiles/asc-plot3.dir/cmake_clean.cmake
.PHONY : src/util/CMakeFiles/asc-plot3.dir/clean

src/util/CMakeFiles/asc-plot3.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util/CMakeFiles/asc-plot3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/util/CMakeFiles/asc-plot3.dir/depend

