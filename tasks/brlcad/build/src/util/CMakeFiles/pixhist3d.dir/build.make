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
include src/util/CMakeFiles/pixhist3d.dir/depend.make

# Include the progress variables for this target.
include src/util/CMakeFiles/pixhist3d.dir/progress.make

# Include the compile flags for this target's objects.
include src/util/CMakeFiles/pixhist3d.dir/flags.make

src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o: src/util/CMakeFiles/pixhist3d.dir/flags.make
src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o: ../src/util/pixhist3d.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/pixhist3d.dir/pixhist3d.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixhist3d.c

src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pixhist3d.dir/pixhist3d.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixhist3d.c > CMakeFiles/pixhist3d.dir/pixhist3d.c.i

src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pixhist3d.dir/pixhist3d.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixhist3d.c -o CMakeFiles/pixhist3d.dir/pixhist3d.c.s

src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o.requires:

.PHONY : src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o.requires

src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o.provides: src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o.requires
	$(MAKE) -f src/util/CMakeFiles/pixhist3d.dir/build.make src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o.provides.build
.PHONY : src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o.provides

src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o.provides.build: src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o


# Object files for target pixhist3d
pixhist3d_OBJECTS = \
"CMakeFiles/pixhist3d.dir/pixhist3d.c.o"

# External object files for target pixhist3d
pixhist3d_EXTERNAL_OBJECTS =

bin/pixhist3d: src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o
bin/pixhist3d: src/util/CMakeFiles/pixhist3d.dir/build.make
bin/pixhist3d: lib/libfb.so.20.0.1
bin/pixhist3d: lib/libpkg.so.20.0.1
bin/pixhist3d: lib/libbu.so.20.0.1
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/pixhist3d: lib/libregex.so.1.0.4
bin/pixhist3d: lib/libtcl.so.8.5.19
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libSM.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libICE.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libXi.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libGL.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libSM.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libICE.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libXi.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libGL.so
bin/pixhist3d: lib/libtk.so.8.5
bin/pixhist3d: lib/libpng16.so.16.29.0
bin/pixhist3d: lib/libz.so.1.2.11
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libX11.so
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libXext.so
bin/pixhist3d: lib/libtkstub.a
bin/pixhist3d: lib/libtclstub.a
bin/pixhist3d: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/pixhist3d: src/util/CMakeFiles/pixhist3d.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/pixhist3d"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pixhist3d.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/util/CMakeFiles/pixhist3d.dir/build: bin/pixhist3d

.PHONY : src/util/CMakeFiles/pixhist3d.dir/build

src/util/CMakeFiles/pixhist3d.dir/requires: src/util/CMakeFiles/pixhist3d.dir/pixhist3d.c.o.requires

.PHONY : src/util/CMakeFiles/pixhist3d.dir/requires

src/util/CMakeFiles/pixhist3d.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -P CMakeFiles/pixhist3d.dir/cmake_clean.cmake
.PHONY : src/util/CMakeFiles/pixhist3d.dir/clean

src/util/CMakeFiles/pixhist3d.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util/CMakeFiles/pixhist3d.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/util/CMakeFiles/pixhist3d.dir/depend

