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
include src/fb/CMakeFiles/fbfade.dir/depend.make

# Include the progress variables for this target.
include src/fb/CMakeFiles/fbfade.dir/progress.make

# Include the compile flags for this target's objects.
include src/fb/CMakeFiles/fbfade.dir/flags.make

src/fb/CMakeFiles/fbfade.dir/fbfade.c.o: src/fb/CMakeFiles/fbfade.dir/flags.make
src/fb/CMakeFiles/fbfade.dir/fbfade.c.o: ../src/fb/fbfade.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/fb/CMakeFiles/fbfade.dir/fbfade.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fbfade.dir/fbfade.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fbfade.c

src/fb/CMakeFiles/fbfade.dir/fbfade.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fbfade.dir/fbfade.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fbfade.c > CMakeFiles/fbfade.dir/fbfade.c.i

src/fb/CMakeFiles/fbfade.dir/fbfade.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fbfade.dir/fbfade.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fbfade.c -o CMakeFiles/fbfade.dir/fbfade.c.s

src/fb/CMakeFiles/fbfade.dir/fbfade.c.o.requires:

.PHONY : src/fb/CMakeFiles/fbfade.dir/fbfade.c.o.requires

src/fb/CMakeFiles/fbfade.dir/fbfade.c.o.provides: src/fb/CMakeFiles/fbfade.dir/fbfade.c.o.requires
	$(MAKE) -f src/fb/CMakeFiles/fbfade.dir/build.make src/fb/CMakeFiles/fbfade.dir/fbfade.c.o.provides.build
.PHONY : src/fb/CMakeFiles/fbfade.dir/fbfade.c.o.provides

src/fb/CMakeFiles/fbfade.dir/fbfade.c.o.provides.build: src/fb/CMakeFiles/fbfade.dir/fbfade.c.o


src/fb/CMakeFiles/fbfade.dir/ioutil.c.o: src/fb/CMakeFiles/fbfade.dir/flags.make
src/fb/CMakeFiles/fbfade.dir/ioutil.c.o: ../src/fb/ioutil.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/fb/CMakeFiles/fbfade.dir/ioutil.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fbfade.dir/ioutil.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/ioutil.c

src/fb/CMakeFiles/fbfade.dir/ioutil.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fbfade.dir/ioutil.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/ioutil.c > CMakeFiles/fbfade.dir/ioutil.c.i

src/fb/CMakeFiles/fbfade.dir/ioutil.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fbfade.dir/ioutil.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/ioutil.c -o CMakeFiles/fbfade.dir/ioutil.c.s

src/fb/CMakeFiles/fbfade.dir/ioutil.c.o.requires:

.PHONY : src/fb/CMakeFiles/fbfade.dir/ioutil.c.o.requires

src/fb/CMakeFiles/fbfade.dir/ioutil.c.o.provides: src/fb/CMakeFiles/fbfade.dir/ioutil.c.o.requires
	$(MAKE) -f src/fb/CMakeFiles/fbfade.dir/build.make src/fb/CMakeFiles/fbfade.dir/ioutil.c.o.provides.build
.PHONY : src/fb/CMakeFiles/fbfade.dir/ioutil.c.o.provides

src/fb/CMakeFiles/fbfade.dir/ioutil.c.o.provides.build: src/fb/CMakeFiles/fbfade.dir/ioutil.c.o


# Object files for target fbfade
fbfade_OBJECTS = \
"CMakeFiles/fbfade.dir/fbfade.c.o" \
"CMakeFiles/fbfade.dir/ioutil.c.o"

# External object files for target fbfade
fbfade_EXTERNAL_OBJECTS =

bin/fbfade: src/fb/CMakeFiles/fbfade.dir/fbfade.c.o
bin/fbfade: src/fb/CMakeFiles/fbfade.dir/ioutil.c.o
bin/fbfade: src/fb/CMakeFiles/fbfade.dir/build.make
bin/fbfade: lib/libfb.so.20.0.1
bin/fbfade: lib/libpkg.so.20.0.1
bin/fbfade: lib/libbu.so.20.0.1
bin/fbfade: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/fbfade: lib/libregex.so.1.0.4
bin/fbfade: lib/libtcl.so.8.5.19
bin/fbfade: /usr/lib/x86_64-linux-gnu/libSM.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libICE.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libXi.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libGL.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libSM.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libICE.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libXi.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libGL.so
bin/fbfade: lib/libtk.so.8.5
bin/fbfade: lib/libpng16.so.16.29.0
bin/fbfade: lib/libz.so.1.2.11
bin/fbfade: /usr/lib/x86_64-linux-gnu/libX11.so
bin/fbfade: /usr/lib/x86_64-linux-gnu/libXext.so
bin/fbfade: lib/libtkstub.a
bin/fbfade: lib/libtclstub.a
bin/fbfade: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/fbfade: src/fb/CMakeFiles/fbfade.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable ../../bin/fbfade"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fbfade.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/fb/CMakeFiles/fbfade.dir/build: bin/fbfade

.PHONY : src/fb/CMakeFiles/fbfade.dir/build

src/fb/CMakeFiles/fbfade.dir/requires: src/fb/CMakeFiles/fbfade.dir/fbfade.c.o.requires
src/fb/CMakeFiles/fbfade.dir/requires: src/fb/CMakeFiles/fbfade.dir/ioutil.c.o.requires

.PHONY : src/fb/CMakeFiles/fbfade.dir/requires

src/fb/CMakeFiles/fbfade.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -P CMakeFiles/fbfade.dir/cmake_clean.cmake
.PHONY : src/fb/CMakeFiles/fbfade.dir/clean

src/fb/CMakeFiles/fbfade.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb/CMakeFiles/fbfade.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/fb/CMakeFiles/fbfade.dir/depend
