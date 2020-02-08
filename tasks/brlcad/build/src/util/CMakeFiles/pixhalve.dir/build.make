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
include src/util/CMakeFiles/pixhalve.dir/depend.make

# Include the progress variables for this target.
include src/util/CMakeFiles/pixhalve.dir/progress.make

# Include the compile flags for this target's objects.
include src/util/CMakeFiles/pixhalve.dir/flags.make

src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o: src/util/CMakeFiles/pixhalve.dir/flags.make
src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o: ../src/util/pixhalve.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/pixhalve.dir/pixhalve.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixhalve.c

src/util/CMakeFiles/pixhalve.dir/pixhalve.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pixhalve.dir/pixhalve.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixhalve.c > CMakeFiles/pixhalve.dir/pixhalve.c.i

src/util/CMakeFiles/pixhalve.dir/pixhalve.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pixhalve.dir/pixhalve.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixhalve.c -o CMakeFiles/pixhalve.dir/pixhalve.c.s

src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o.requires:

.PHONY : src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o.requires

src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o.provides: src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o.requires
	$(MAKE) -f src/util/CMakeFiles/pixhalve.dir/build.make src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o.provides.build
.PHONY : src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o.provides

src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o.provides.build: src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o


# Object files for target pixhalve
pixhalve_OBJECTS = \
"CMakeFiles/pixhalve.dir/pixhalve.c.o"

# External object files for target pixhalve
pixhalve_EXTERNAL_OBJECTS =

bin/pixhalve: src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o
bin/pixhalve: src/util/CMakeFiles/pixhalve.dir/build.make
bin/pixhalve: lib/libfb.so.20.0.1
bin/pixhalve: lib/libpkg.so.20.0.1
bin/pixhalve: lib/libbu.so.20.0.1
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/pixhalve: lib/libregex.so.1.0.4
bin/pixhalve: lib/libtcl.so.8.5.19
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libSM.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libICE.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libXi.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libGL.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libSM.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libICE.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libXi.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libGL.so
bin/pixhalve: lib/libtk.so.8.5
bin/pixhalve: lib/libpng16.so.16.29.0
bin/pixhalve: lib/libz.so.1.2.11
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libX11.so
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libXext.so
bin/pixhalve: lib/libtkstub.a
bin/pixhalve: lib/libtclstub.a
bin/pixhalve: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/pixhalve: src/util/CMakeFiles/pixhalve.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/pixhalve"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pixhalve.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/util/CMakeFiles/pixhalve.dir/build: bin/pixhalve

.PHONY : src/util/CMakeFiles/pixhalve.dir/build

src/util/CMakeFiles/pixhalve.dir/requires: src/util/CMakeFiles/pixhalve.dir/pixhalve.c.o.requires

.PHONY : src/util/CMakeFiles/pixhalve.dir/requires

src/util/CMakeFiles/pixhalve.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -P CMakeFiles/pixhalve.dir/cmake_clean.cmake
.PHONY : src/util/CMakeFiles/pixhalve.dir/clean

src/util/CMakeFiles/pixhalve.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util/CMakeFiles/pixhalve.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/util/CMakeFiles/pixhalve.dir/depend

