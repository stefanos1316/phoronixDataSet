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
include src/rt/CMakeFiles/rtshot.dir/depend.make

# Include the progress variables for this target.
include src/rt/CMakeFiles/rtshot.dir/progress.make

# Include the compile flags for this target's objects.
include src/rt/CMakeFiles/rtshot.dir/flags.make

src/rt/CMakeFiles/rtshot.dir/rtshot.c.o: src/rt/CMakeFiles/rtshot.dir/flags.make
src/rt/CMakeFiles/rtshot.dir/rtshot.c.o: ../src/rt/rtshot.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/rt/CMakeFiles/rtshot.dir/rtshot.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtshot.dir/rtshot.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/rtshot.c

src/rt/CMakeFiles/rtshot.dir/rtshot.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtshot.dir/rtshot.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/rtshot.c > CMakeFiles/rtshot.dir/rtshot.c.i

src/rt/CMakeFiles/rtshot.dir/rtshot.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtshot.dir/rtshot.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/rtshot.c -o CMakeFiles/rtshot.dir/rtshot.c.s

src/rt/CMakeFiles/rtshot.dir/rtshot.c.o.requires:

.PHONY : src/rt/CMakeFiles/rtshot.dir/rtshot.c.o.requires

src/rt/CMakeFiles/rtshot.dir/rtshot.c.o.provides: src/rt/CMakeFiles/rtshot.dir/rtshot.c.o.requires
	$(MAKE) -f src/rt/CMakeFiles/rtshot.dir/build.make src/rt/CMakeFiles/rtshot.dir/rtshot.c.o.provides.build
.PHONY : src/rt/CMakeFiles/rtshot.dir/rtshot.c.o.provides

src/rt/CMakeFiles/rtshot.dir/rtshot.c.o.provides.build: src/rt/CMakeFiles/rtshot.dir/rtshot.c.o


# Object files for target rtshot
rtshot_OBJECTS = \
"CMakeFiles/rtshot.dir/rtshot.c.o"

# External object files for target rtshot
rtshot_EXTERNAL_OBJECTS =

bin/rtshot: src/rt/CMakeFiles/rtshot.dir/rtshot.c.o
bin/rtshot: src/rt/CMakeFiles/rtshot.dir/build.make
bin/rtshot: lib/libfb.so.20.0.1
bin/rtshot: lib/liboptical.so.20.0.1
bin/rtshot: lib/libicv.so.20.0.1
bin/rtshot: lib/libpkg.so.20.0.1
bin/rtshot: /usr/lib/x86_64-linux-gnu/libSM.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libICE.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libXi.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libGL.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libSM.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libICE.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libXi.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libGL.so
bin/rtshot: lib/libtk.so.8.5
bin/rtshot: /usr/lib/x86_64-linux-gnu/libX11.so
bin/rtshot: /usr/lib/x86_64-linux-gnu/libXext.so
bin/rtshot: lib/libtkstub.a
bin/rtshot: lib/libtclstub.a
bin/rtshot: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/rtshot: lib/librt.so.20.0.1
bin/rtshot: lib/libnmg.so
bin/rtshot: lib/libgdiam.so
bin/rtshot: lib/libvds.so.1.0.1
bin/rtshot: lib/libbrep.so.20.0.1
bin/rtshot: lib/libbg.so.20.0.1
bin/rtshot: lib/libSPSR.so
bin/rtshot: lib/libopenNURBS.so.2012.10.245
bin/rtshot: lib/libp2t.so.1.0.1
bin/rtshot: lib/liblz4.so
bin/rtshot: lib/libtcl.so.8.5.19
bin/rtshot: lib/libbn.so.20.0.1
bin/rtshot: lib/libbu.so.20.0.1
bin/rtshot: lib/libregex.so.1.0.4
bin/rtshot: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/rtshot: lib/libpng16.so.16.29.0
bin/rtshot: lib/libz.so.1.2.11
bin/rtshot: lib/libnetpbm.so
bin/rtshot: src/rt/CMakeFiles/rtshot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/rtshot"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rtshot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/rt/CMakeFiles/rtshot.dir/build: bin/rtshot

.PHONY : src/rt/CMakeFiles/rtshot.dir/build

src/rt/CMakeFiles/rtshot.dir/requires: src/rt/CMakeFiles/rtshot.dir/rtshot.c.o.requires

.PHONY : src/rt/CMakeFiles/rtshot.dir/requires

src/rt/CMakeFiles/rtshot.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && $(CMAKE_COMMAND) -P CMakeFiles/rtshot.dir/cmake_clean.cmake
.PHONY : src/rt/CMakeFiles/rtshot.dir/clean

src/rt/CMakeFiles/rtshot.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt/CMakeFiles/rtshot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/rt/CMakeFiles/rtshot.dir/depend

