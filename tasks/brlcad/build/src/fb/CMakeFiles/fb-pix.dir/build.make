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
include src/fb/CMakeFiles/fb-pix.dir/depend.make

# Include the progress variables for this target.
include src/fb/CMakeFiles/fb-pix.dir/progress.make

# Include the compile flags for this target's objects.
include src/fb/CMakeFiles/fb-pix.dir/flags.make

src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o: src/fb/CMakeFiles/fb-pix.dir/flags.make
src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o: ../src/fb/fb-pix.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fb-pix.dir/fb-pix.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fb-pix.c

src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fb-pix.dir/fb-pix.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fb-pix.c > CMakeFiles/fb-pix.dir/fb-pix.c.i

src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fb-pix.dir/fb-pix.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fb-pix.c -o CMakeFiles/fb-pix.dir/fb-pix.c.s

src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o.requires:

.PHONY : src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o.requires

src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o.provides: src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o.requires
	$(MAKE) -f src/fb/CMakeFiles/fb-pix.dir/build.make src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o.provides.build
.PHONY : src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o.provides

src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o.provides.build: src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o


src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o: src/fb/CMakeFiles/fb-pix.dir/flags.make
src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o: ../src/fb/cmap-crunch.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fb-pix.dir/cmap-crunch.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/cmap-crunch.c

src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fb-pix.dir/cmap-crunch.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/cmap-crunch.c > CMakeFiles/fb-pix.dir/cmap-crunch.c.i

src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fb-pix.dir/cmap-crunch.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/cmap-crunch.c -o CMakeFiles/fb-pix.dir/cmap-crunch.c.s

src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o.requires:

.PHONY : src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o.requires

src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o.provides: src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o.requires
	$(MAKE) -f src/fb/CMakeFiles/fb-pix.dir/build.make src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o.provides.build
.PHONY : src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o.provides

src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o.provides.build: src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o


# Object files for target fb-pix
fb__pix_OBJECTS = \
"CMakeFiles/fb-pix.dir/fb-pix.c.o" \
"CMakeFiles/fb-pix.dir/cmap-crunch.c.o"

# External object files for target fb-pix
fb__pix_EXTERNAL_OBJECTS =

bin/fb-pix: src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o
bin/fb-pix: src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o
bin/fb-pix: src/fb/CMakeFiles/fb-pix.dir/build.make
bin/fb-pix: lib/libfb.so.20.0.1
bin/fb-pix: lib/libpkg.so.20.0.1
bin/fb-pix: lib/libbu.so.20.0.1
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/fb-pix: lib/libregex.so.1.0.4
bin/fb-pix: lib/libtcl.so.8.5.19
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libSM.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libICE.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libXi.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libGL.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libSM.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libICE.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libXi.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libGL.so
bin/fb-pix: lib/libtk.so.8.5
bin/fb-pix: lib/libpng16.so.16.29.0
bin/fb-pix: lib/libz.so.1.2.11
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libX11.so
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libXext.so
bin/fb-pix: lib/libtkstub.a
bin/fb-pix: lib/libtclstub.a
bin/fb-pix: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/fb-pix: src/fb/CMakeFiles/fb-pix.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable ../../bin/fb-pix"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fb-pix.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/fb/CMakeFiles/fb-pix.dir/build: bin/fb-pix

.PHONY : src/fb/CMakeFiles/fb-pix.dir/build

src/fb/CMakeFiles/fb-pix.dir/requires: src/fb/CMakeFiles/fb-pix.dir/fb-pix.c.o.requires
src/fb/CMakeFiles/fb-pix.dir/requires: src/fb/CMakeFiles/fb-pix.dir/cmap-crunch.c.o.requires

.PHONY : src/fb/CMakeFiles/fb-pix.dir/requires

src/fb/CMakeFiles/fb-pix.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -P CMakeFiles/fb-pix.dir/cmake_clean.cmake
.PHONY : src/fb/CMakeFiles/fb-pix.dir/clean

src/fb/CMakeFiles/fb-pix.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb/CMakeFiles/fb-pix.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/fb/CMakeFiles/fb-pix.dir/depend

