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
include src/mged/CMakeFiles/cad_boundp.dir/depend.make

# Include the progress variables for this target.
include src/mged/CMakeFiles/cad_boundp.dir/progress.make

# Include the compile flags for this target's objects.
include src/mged/CMakeFiles/cad_boundp.dir/flags.make

src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o: src/mged/CMakeFiles/cad_boundp.dir/flags.make
src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o: ../src/mged/cad_boundp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cad_boundp.dir/cad_boundp.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/mged/cad_boundp.c

src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cad_boundp.dir/cad_boundp.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/mged/cad_boundp.c > CMakeFiles/cad_boundp.dir/cad_boundp.c.i

src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cad_boundp.dir/cad_boundp.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/mged/cad_boundp.c -o CMakeFiles/cad_boundp.dir/cad_boundp.c.s

src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o.requires:

.PHONY : src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o.requires

src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o.provides: src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o.requires
	$(MAKE) -f src/mged/CMakeFiles/cad_boundp.dir/build.make src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o.provides.build
.PHONY : src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o.provides

src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o.provides.build: src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o


# Object files for target cad_boundp
cad_boundp_OBJECTS = \
"CMakeFiles/cad_boundp.dir/cad_boundp.c.o"

# External object files for target cad_boundp
cad_boundp_EXTERNAL_OBJECTS =

bin/cad_boundp: src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o
bin/cad_boundp: src/mged/CMakeFiles/cad_boundp.dir/build.make
bin/cad_boundp: lib/libbu.so.20.0.1
bin/cad_boundp: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/cad_boundp: lib/libregex.so.1.0.4
bin/cad_boundp: src/mged/CMakeFiles/cad_boundp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/cad_boundp"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cad_boundp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/mged/CMakeFiles/cad_boundp.dir/build: bin/cad_boundp

.PHONY : src/mged/CMakeFiles/cad_boundp.dir/build

src/mged/CMakeFiles/cad_boundp.dir/requires: src/mged/CMakeFiles/cad_boundp.dir/cad_boundp.c.o.requires

.PHONY : src/mged/CMakeFiles/cad_boundp.dir/requires

src/mged/CMakeFiles/cad_boundp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && $(CMAKE_COMMAND) -P CMakeFiles/cad_boundp.dir/cmake_clean.cmake
.PHONY : src/mged/CMakeFiles/cad_boundp.dir/clean

src/mged/CMakeFiles/cad_boundp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/mged /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged/CMakeFiles/cad_boundp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/mged/CMakeFiles/cad_boundp.dir/depend
