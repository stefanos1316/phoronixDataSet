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
include src/fb/CMakeFiles/fb-cmap.dir/depend.make

# Include the progress variables for this target.
include src/fb/CMakeFiles/fb-cmap.dir/progress.make

# Include the compile flags for this target's objects.
include src/fb/CMakeFiles/fb-cmap.dir/flags.make

src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o: src/fb/CMakeFiles/fb-cmap.dir/flags.make
src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o: ../src/fb/fb-cmap.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fb-cmap.dir/fb-cmap.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fb-cmap.c

src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fb-cmap.dir/fb-cmap.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fb-cmap.c > CMakeFiles/fb-cmap.dir/fb-cmap.c.i

src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fb-cmap.dir/fb-cmap.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/fb-cmap.c -o CMakeFiles/fb-cmap.dir/fb-cmap.c.s

src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o.requires:

.PHONY : src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o.requires

src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o.provides: src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o.requires
	$(MAKE) -f src/fb/CMakeFiles/fb-cmap.dir/build.make src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o.provides.build
.PHONY : src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o.provides

src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o.provides.build: src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o


# Object files for target fb-cmap
fb__cmap_OBJECTS = \
"CMakeFiles/fb-cmap.dir/fb-cmap.c.o"

# External object files for target fb-cmap
fb__cmap_EXTERNAL_OBJECTS =

bin/fb-cmap: src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o
bin/fb-cmap: src/fb/CMakeFiles/fb-cmap.dir/build.make
bin/fb-cmap: lib/libfb.so.20.0.1
bin/fb-cmap: lib/libpkg.so.20.0.1
bin/fb-cmap: lib/libbu.so.20.0.1
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/fb-cmap: lib/libregex.so.1.0.4
bin/fb-cmap: lib/libtcl.so.8.5.19
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libSM.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libICE.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libXi.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libGL.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libSM.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libICE.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libXi.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libGL.so
bin/fb-cmap: lib/libtk.so.8.5
bin/fb-cmap: lib/libpng16.so.16.29.0
bin/fb-cmap: lib/libz.so.1.2.11
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libX11.so
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libXext.so
bin/fb-cmap: lib/libtkstub.a
bin/fb-cmap: lib/libtclstub.a
bin/fb-cmap: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/fb-cmap: src/fb/CMakeFiles/fb-cmap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/fb-cmap"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fb-cmap.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/fb/CMakeFiles/fb-cmap.dir/build: bin/fb-cmap

.PHONY : src/fb/CMakeFiles/fb-cmap.dir/build

src/fb/CMakeFiles/fb-cmap.dir/requires: src/fb/CMakeFiles/fb-cmap.dir/fb-cmap.c.o.requires

.PHONY : src/fb/CMakeFiles/fb-cmap.dir/requires

src/fb/CMakeFiles/fb-cmap.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -P CMakeFiles/fb-cmap.dir/cmake_clean.cmake
.PHONY : src/fb/CMakeFiles/fb-cmap.dir/clean

src/fb/CMakeFiles/fb-cmap.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb/CMakeFiles/fb-cmap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/fb/CMakeFiles/fb-cmap.dir/depend

