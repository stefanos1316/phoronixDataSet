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
include src/rt/CMakeFiles/reshoot.dir/depend.make

# Include the progress variables for this target.
include src/rt/CMakeFiles/reshoot.dir/progress.make

# Include the compile flags for this target's objects.
include src/rt/CMakeFiles/reshoot.dir/flags.make

src/rt/CMakeFiles/reshoot.dir/reshoot.c.o: src/rt/CMakeFiles/reshoot.dir/flags.make
src/rt/CMakeFiles/reshoot.dir/reshoot.c.o: ../src/rt/reshoot.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/rt/CMakeFiles/reshoot.dir/reshoot.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/reshoot.dir/reshoot.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/reshoot.c

src/rt/CMakeFiles/reshoot.dir/reshoot.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/reshoot.dir/reshoot.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/reshoot.c > CMakeFiles/reshoot.dir/reshoot.c.i

src/rt/CMakeFiles/reshoot.dir/reshoot.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/reshoot.dir/reshoot.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/reshoot.c -o CMakeFiles/reshoot.dir/reshoot.c.s

src/rt/CMakeFiles/reshoot.dir/reshoot.c.o.requires:

.PHONY : src/rt/CMakeFiles/reshoot.dir/reshoot.c.o.requires

src/rt/CMakeFiles/reshoot.dir/reshoot.c.o.provides: src/rt/CMakeFiles/reshoot.dir/reshoot.c.o.requires
	$(MAKE) -f src/rt/CMakeFiles/reshoot.dir/build.make src/rt/CMakeFiles/reshoot.dir/reshoot.c.o.provides.build
.PHONY : src/rt/CMakeFiles/reshoot.dir/reshoot.c.o.provides

src/rt/CMakeFiles/reshoot.dir/reshoot.c.o.provides.build: src/rt/CMakeFiles/reshoot.dir/reshoot.c.o


# Object files for target reshoot
reshoot_OBJECTS = \
"CMakeFiles/reshoot.dir/reshoot.c.o"

# External object files for target reshoot
reshoot_EXTERNAL_OBJECTS =

bin/reshoot: src/rt/CMakeFiles/reshoot.dir/reshoot.c.o
bin/reshoot: src/rt/CMakeFiles/reshoot.dir/build.make
bin/reshoot: lib/libfb.so.20.0.1
bin/reshoot: lib/liboptical.so.20.0.1
bin/reshoot: lib/libicv.so.20.0.1
bin/reshoot: lib/libpkg.so.20.0.1
bin/reshoot: /usr/lib/x86_64-linux-gnu/libSM.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libICE.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libXi.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libGL.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libSM.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libICE.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libXi.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libGL.so
bin/reshoot: lib/libtk.so.8.5
bin/reshoot: /usr/lib/x86_64-linux-gnu/libX11.so
bin/reshoot: /usr/lib/x86_64-linux-gnu/libXext.so
bin/reshoot: lib/libtkstub.a
bin/reshoot: lib/libtclstub.a
bin/reshoot: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/reshoot: lib/librt.so.20.0.1
bin/reshoot: lib/libgdiam.so
bin/reshoot: lib/libvds.so.1.0.1
bin/reshoot: lib/libbrep.so.20.0.1
bin/reshoot: lib/libnmg.so
bin/reshoot: lib/libbg.so.20.0.1
bin/reshoot: lib/libSPSR.so
bin/reshoot: lib/libopenNURBS.so.2012.10.245
bin/reshoot: lib/libp2t.so.1.0.1
bin/reshoot: lib/liblz4.so
bin/reshoot: lib/libtcl.so.8.5.19
bin/reshoot: lib/libbn.so.20.0.1
bin/reshoot: lib/libbu.so.20.0.1
bin/reshoot: lib/libregex.so.1.0.4
bin/reshoot: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/reshoot: lib/libpng16.so.16.29.0
bin/reshoot: lib/libz.so.1.2.11
bin/reshoot: lib/libnetpbm.so
bin/reshoot: src/rt/CMakeFiles/reshoot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/reshoot"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/reshoot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/rt/CMakeFiles/reshoot.dir/build: bin/reshoot

.PHONY : src/rt/CMakeFiles/reshoot.dir/build

src/rt/CMakeFiles/reshoot.dir/requires: src/rt/CMakeFiles/reshoot.dir/reshoot.c.o.requires

.PHONY : src/rt/CMakeFiles/reshoot.dir/requires

src/rt/CMakeFiles/reshoot.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt && $(CMAKE_COMMAND) -P CMakeFiles/reshoot.dir/cmake_clean.cmake
.PHONY : src/rt/CMakeFiles/reshoot.dir/clean

src/rt/CMakeFiles/reshoot.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/rt/CMakeFiles/reshoot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/rt/CMakeFiles/reshoot.dir/depend
