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
include src/shapes/CMakeFiles/window_frame.dir/depend.make

# Include the progress variables for this target.
include src/shapes/CMakeFiles/window_frame.dir/progress.make

# Include the compile flags for this target's objects.
include src/shapes/CMakeFiles/window_frame.dir/flags.make

src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o: src/shapes/CMakeFiles/window_frame.dir/flags.make
src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o: ../src/shapes/window_frame.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/window_frame.dir/window_frame.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/shapes/window_frame.c

src/shapes/CMakeFiles/window_frame.dir/window_frame.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/window_frame.dir/window_frame.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/shapes/window_frame.c > CMakeFiles/window_frame.dir/window_frame.c.i

src/shapes/CMakeFiles/window_frame.dir/window_frame.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/window_frame.dir/window_frame.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/shapes/window_frame.c -o CMakeFiles/window_frame.dir/window_frame.c.s

src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o.requires:

.PHONY : src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o.requires

src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o.provides: src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o.requires
	$(MAKE) -f src/shapes/CMakeFiles/window_frame.dir/build.make src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o.provides.build
.PHONY : src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o.provides

src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o.provides.build: src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o


# Object files for target window_frame
window_frame_OBJECTS = \
"CMakeFiles/window_frame.dir/window_frame.c.o"

# External object files for target window_frame
window_frame_EXTERNAL_OBJECTS =

bin/window_frame: src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o
bin/window_frame: src/shapes/CMakeFiles/window_frame.dir/build.make
bin/window_frame: lib/libwdb.so.20.0.1
bin/window_frame: lib/librt.so.20.0.1
bin/window_frame: lib/libgdiam.so
bin/window_frame: lib/libvds.so.1.0.1
bin/window_frame: lib/libbrep.so.20.0.1
bin/window_frame: lib/libp2t.so.1.0.1
bin/window_frame: lib/liblz4.so
bin/window_frame: lib/libnmg.so
bin/window_frame: lib/libbg.so.20.0.1
bin/window_frame: lib/libSPSR.so
bin/window_frame: lib/libbn.so.20.0.1
bin/window_frame: lib/libbu.so.20.0.1
bin/window_frame: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/window_frame: lib/libopenNURBS.so.2012.10.245
bin/window_frame: lib/libz.so.1.2.11
bin/window_frame: lib/libregex.so.1.0.4
bin/window_frame: src/shapes/CMakeFiles/window_frame.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/window_frame"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/window_frame.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/shapes/CMakeFiles/window_frame.dir/build: bin/window_frame

.PHONY : src/shapes/CMakeFiles/window_frame.dir/build

src/shapes/CMakeFiles/window_frame.dir/requires: src/shapes/CMakeFiles/window_frame.dir/window_frame.c.o.requires

.PHONY : src/shapes/CMakeFiles/window_frame.dir/requires

src/shapes/CMakeFiles/window_frame.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && $(CMAKE_COMMAND) -P CMakeFiles/window_frame.dir/cmake_clean.cmake
.PHONY : src/shapes/CMakeFiles/window_frame.dir/clean

src/shapes/CMakeFiles/window_frame.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/shapes /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes/CMakeFiles/window_frame.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/shapes/CMakeFiles/window_frame.dir/depend
