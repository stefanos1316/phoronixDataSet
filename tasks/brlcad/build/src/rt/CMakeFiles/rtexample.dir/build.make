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
include src/rt/CMakeFiles/rtexample.dir/depend.make

# Include the progress variables for this target.
include src/rt/CMakeFiles/rtexample.dir/progress.make

# Include the compile flags for this target's objects.
include src/rt/CMakeFiles/rtexample.dir/flags.make

src/rt/CMakeFiles/rtexample.dir/rtexample.c.o: src/rt/CMakeFiles/rtexample.dir/flags.make
src/rt/CMakeFiles/rtexample.dir/rtexample.c.o: ../src/rt/rtexample.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/rt/CMakeFiles/rtexample.dir/rtexample.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtexample.dir/rtexample.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/rtexample.c

src/rt/CMakeFiles/rtexample.dir/rtexample.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtexample.dir/rtexample.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/rtexample.c > CMakeFiles/rtexample.dir/rtexample.c.i

src/rt/CMakeFiles/rtexample.dir/rtexample.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtexample.dir/rtexample.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/rtexample.c -o CMakeFiles/rtexample.dir/rtexample.c.s

src/rt/CMakeFiles/rtexample.dir/rtexample.c.o.requires:

.PHONY : src/rt/CMakeFiles/rtexample.dir/rtexample.c.o.requires

src/rt/CMakeFiles/rtexample.dir/rtexample.c.o.provides: src/rt/CMakeFiles/rtexample.dir/rtexample.c.o.requires
	$(MAKE) -f src/rt/CMakeFiles/rtexample.dir/build.make src/rt/CMakeFiles/rtexample.dir/rtexample.c.o.provides.build
.PHONY : src/rt/CMakeFiles/rtexample.dir/rtexample.c.o.provides

src/rt/CMakeFiles/rtexample.dir/rtexample.c.o.provides.build: src/rt/CMakeFiles/rtexample.dir/rtexample.c.o


# Object files for target rtexample
rtexample_OBJECTS = \
"CMakeFiles/rtexample.dir/rtexample.c.o"

# External object files for target rtexample
rtexample_EXTERNAL_OBJECTS =

src/rt/rtexample: src/rt/CMakeFiles/rtexample.dir/rtexample.c.o
src/rt/rtexample: src/rt/CMakeFiles/rtexample.dir/build.make
src/rt/rtexample: lib/libfb.so.20.0.1
src/rt/rtexample: lib/liboptical.so.20.0.1
src/rt/rtexample: lib/libicv.so.20.0.1
src/rt/rtexample: lib/libpkg.so.20.0.1
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libSM.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libICE.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libXi.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libGLU.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libGL.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libSM.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libICE.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libXi.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libGLU.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libGL.so
src/rt/rtexample: lib/libtk.so.8.5
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libX11.so
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libXext.so
src/rt/rtexample: lib/libtkstub.a
src/rt/rtexample: lib/libtclstub.a
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libXrender.so
src/rt/rtexample: lib/librt.so.20.0.1
src/rt/rtexample: lib/libgdiam.so
src/rt/rtexample: lib/libvds.so.1.0.1
src/rt/rtexample: lib/libbrep.so.20.0.1
src/rt/rtexample: lib/libnmg.so
src/rt/rtexample: lib/libbg.so.20.0.1
src/rt/rtexample: lib/libSPSR.so
src/rt/rtexample: lib/libopenNURBS.so.2012.10.245
src/rt/rtexample: lib/libp2t.so.1.0.1
src/rt/rtexample: lib/liblz4.so
src/rt/rtexample: lib/libtcl.so.8.5.19
src/rt/rtexample: lib/libbn.so.20.0.1
src/rt/rtexample: lib/libbu.so.20.0.1
src/rt/rtexample: lib/libregex.so.1.0.4
src/rt/rtexample: /usr/lib/x86_64-linux-gnu/libuuid.so
src/rt/rtexample: lib/libpng16.so.16.29.0
src/rt/rtexample: lib/libz.so.1.2.11
src/rt/rtexample: lib/libnetpbm.so
src/rt/rtexample: src/rt/CMakeFiles/rtexample.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable rtexample"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rtexample.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/rt/CMakeFiles/rtexample.dir/build: src/rt/rtexample

.PHONY : src/rt/CMakeFiles/rtexample.dir/build

src/rt/CMakeFiles/rtexample.dir/requires: src/rt/CMakeFiles/rtexample.dir/rtexample.c.o.requires

.PHONY : src/rt/CMakeFiles/rtexample.dir/requires

src/rt/CMakeFiles/rtexample.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && $(CMAKE_COMMAND) -P CMakeFiles/rtexample.dir/cmake_clean.cmake
.PHONY : src/rt/CMakeFiles/rtexample.dir/clean

src/rt/CMakeFiles/rtexample.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt/CMakeFiles/rtexample.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/rt/CMakeFiles/rtexample.dir/depend

