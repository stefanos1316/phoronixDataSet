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
include src/fb/CMakeFiles/fbcmap.dir/depend.make

# Include the progress variables for this target.
include src/fb/CMakeFiles/fbcmap.dir/progress.make

# Include the compile flags for this target's objects.
include src/fb/CMakeFiles/fbcmap.dir/flags.make

src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o: src/fb/CMakeFiles/fbcmap.dir/flags.make
src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o: ../src/fb/fbcmap.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fbcmap.dir/fbcmap.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fbcmap.c

src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fbcmap.dir/fbcmap.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fbcmap.c > CMakeFiles/fbcmap.dir/fbcmap.c.i

src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fbcmap.dir/fbcmap.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fbcmap.c -o CMakeFiles/fbcmap.dir/fbcmap.c.s

src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o.requires:

.PHONY : src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o.requires

src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o.provides: src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o.requires
	$(MAKE) -f src/fb/CMakeFiles/fbcmap.dir/build.make src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o.provides.build
.PHONY : src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o.provides

src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o.provides.build: src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o


# Object files for target fbcmap
fbcmap_OBJECTS = \
"CMakeFiles/fbcmap.dir/fbcmap.c.o"

# External object files for target fbcmap
fbcmap_EXTERNAL_OBJECTS =

bin/fbcmap: src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o
bin/fbcmap: src/fb/CMakeFiles/fbcmap.dir/build.make
bin/fbcmap: lib/libfb.so.20.0.1
bin/fbcmap: lib/libpkg.so.20.0.1
bin/fbcmap: lib/libbu.so.20.0.1
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/fbcmap: lib/libregex.so.1.0.4
bin/fbcmap: lib/libtcl.so.8.5.19
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libSM.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libICE.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libXi.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libGL.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libSM.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libICE.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libXi.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libGL.so
bin/fbcmap: lib/libtk.so.8.5
bin/fbcmap: lib/libpng16.so.16.29.0
bin/fbcmap: lib/libz.so.1.2.11
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libX11.so
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libXext.so
bin/fbcmap: lib/libtkstub.a
bin/fbcmap: lib/libtclstub.a
bin/fbcmap: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/fbcmap: src/fb/CMakeFiles/fbcmap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/fbcmap"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fbcmap.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/fb/CMakeFiles/fbcmap.dir/build: bin/fbcmap

.PHONY : src/fb/CMakeFiles/fbcmap.dir/build

src/fb/CMakeFiles/fbcmap.dir/requires: src/fb/CMakeFiles/fbcmap.dir/fbcmap.c.o.requires

.PHONY : src/fb/CMakeFiles/fbcmap.dir/requires

src/fb/CMakeFiles/fbcmap.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -P CMakeFiles/fbcmap.dir/cmake_clean.cmake
.PHONY : src/fb/CMakeFiles/fbcmap.dir/clean

src/fb/CMakeFiles/fbcmap.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb/CMakeFiles/fbcmap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/fb/CMakeFiles/fbcmap.dir/depend
