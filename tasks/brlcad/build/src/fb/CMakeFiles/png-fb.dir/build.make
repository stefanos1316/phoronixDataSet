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
include src/fb/CMakeFiles/png-fb.dir/depend.make

# Include the progress variables for this target.
include src/fb/CMakeFiles/png-fb.dir/progress.make

# Include the compile flags for this target's objects.
include src/fb/CMakeFiles/png-fb.dir/flags.make

src/fb/CMakeFiles/png-fb.dir/png-fb.c.o: src/fb/CMakeFiles/png-fb.dir/flags.make
src/fb/CMakeFiles/png-fb.dir/png-fb.c.o: ../src/fb/png-fb.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/fb/CMakeFiles/png-fb.dir/png-fb.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/png-fb.dir/png-fb.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/png-fb.c

src/fb/CMakeFiles/png-fb.dir/png-fb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/png-fb.dir/png-fb.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/png-fb.c > CMakeFiles/png-fb.dir/png-fb.c.i

src/fb/CMakeFiles/png-fb.dir/png-fb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/png-fb.dir/png-fb.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb/png-fb.c -o CMakeFiles/png-fb.dir/png-fb.c.s

src/fb/CMakeFiles/png-fb.dir/png-fb.c.o.requires:

.PHONY : src/fb/CMakeFiles/png-fb.dir/png-fb.c.o.requires

src/fb/CMakeFiles/png-fb.dir/png-fb.c.o.provides: src/fb/CMakeFiles/png-fb.dir/png-fb.c.o.requires
	$(MAKE) -f src/fb/CMakeFiles/png-fb.dir/build.make src/fb/CMakeFiles/png-fb.dir/png-fb.c.o.provides.build
.PHONY : src/fb/CMakeFiles/png-fb.dir/png-fb.c.o.provides

src/fb/CMakeFiles/png-fb.dir/png-fb.c.o.provides.build: src/fb/CMakeFiles/png-fb.dir/png-fb.c.o


# Object files for target png-fb
png__fb_OBJECTS = \
"CMakeFiles/png-fb.dir/png-fb.c.o"

# External object files for target png-fb
png__fb_EXTERNAL_OBJECTS =

bin/png-fb: src/fb/CMakeFiles/png-fb.dir/png-fb.c.o
bin/png-fb: src/fb/CMakeFiles/png-fb.dir/build.make
bin/png-fb: lib/libfb.so.20.0.1
bin/png-fb: lib/libpkg.so.20.0.1
bin/png-fb: lib/libbu.so.20.0.1
bin/png-fb: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/png-fb: lib/libregex.so.1.0.4
bin/png-fb: lib/libtcl.so.8.5.19
bin/png-fb: /usr/lib/x86_64-linux-gnu/libSM.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libICE.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libXi.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libGL.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libSM.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libICE.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libXi.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libGL.so
bin/png-fb: lib/libtk.so.8.5
bin/png-fb: lib/libpng16.so.16.29.0
bin/png-fb: lib/libz.so.1.2.11
bin/png-fb: /usr/lib/x86_64-linux-gnu/libX11.so
bin/png-fb: /usr/lib/x86_64-linux-gnu/libXext.so
bin/png-fb: lib/libtkstub.a
bin/png-fb: lib/libtclstub.a
bin/png-fb: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/png-fb: src/fb/CMakeFiles/png-fb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/png-fb"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/png-fb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/fb/CMakeFiles/png-fb.dir/build: bin/png-fb

.PHONY : src/fb/CMakeFiles/png-fb.dir/build

src/fb/CMakeFiles/png-fb.dir/requires: src/fb/CMakeFiles/png-fb.dir/png-fb.c.o.requires

.PHONY : src/fb/CMakeFiles/png-fb.dir/requires

src/fb/CMakeFiles/png-fb.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb && $(CMAKE_COMMAND) -P CMakeFiles/png-fb.dir/cmake_clean.cmake
.PHONY : src/fb/CMakeFiles/png-fb.dir/clean

src/fb/CMakeFiles/png-fb.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/fb/CMakeFiles/png-fb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/fb/CMakeFiles/png-fb.dir/depend
