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
include src/gtools/tests/CMakeFiles/bigdb.dir/depend.make

# Include the progress variables for this target.
include src/gtools/tests/CMakeFiles/bigdb.dir/progress.make

# Include the compile flags for this target's objects.
include src/gtools/tests/CMakeFiles/bigdb.dir/flags.make

src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o: src/gtools/tests/CMakeFiles/bigdb.dir/flags.make
src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o: ../src/gtools/tests/bigdb.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bigdb.dir/bigdb.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/gtools/tests/bigdb.c

src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bigdb.dir/bigdb.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/gtools/tests/bigdb.c > CMakeFiles/bigdb.dir/bigdb.c.i

src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bigdb.dir/bigdb.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/gtools/tests/bigdb.c -o CMakeFiles/bigdb.dir/bigdb.c.s

src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o.requires:

.PHONY : src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o.requires

src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o.provides: src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o.requires
	$(MAKE) -f src/gtools/tests/CMakeFiles/bigdb.dir/build.make src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o.provides.build
.PHONY : src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o.provides

src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o.provides.build: src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o


# Object files for target bigdb
bigdb_OBJECTS = \
"CMakeFiles/bigdb.dir/bigdb.c.o"

# External object files for target bigdb
bigdb_EXTERNAL_OBJECTS =

src/gtools/tests/bigdb: src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o
src/gtools/tests/bigdb: src/gtools/tests/CMakeFiles/bigdb.dir/build.make
src/gtools/tests/bigdb: lib/libged.so.20.0.1
src/gtools/tests/bigdb: lib/libwdb.so.20.0.1
src/gtools/tests/bigdb: lib/libfb.so.20.0.1
src/gtools/tests/bigdb: lib/libpkg.so.20.0.1
src/gtools/tests/bigdb: lib/libtcl.so.8.5.19
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libSM.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libICE.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libXi.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libGLU.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libGL.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libSM.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libICE.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libXi.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libGLU.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libGL.so
src/gtools/tests/bigdb: lib/libtk.so.8.5
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libX11.so
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libXext.so
src/gtools/tests/bigdb: lib/libtkstub.a
src/gtools/tests/bigdb: lib/libtclstub.a
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libXrender.so
src/gtools/tests/bigdb: lib/libicv.so.20.0.1
src/gtools/tests/bigdb: lib/libpng16.so.16.29.0
src/gtools/tests/bigdb: lib/libnetpbm.so
src/gtools/tests/bigdb: lib/libanalyze.so.20.0.1
src/gtools/tests/bigdb: lib/librt.so.20.0.1
src/gtools/tests/bigdb: lib/libnmg.so
src/gtools/tests/bigdb: lib/libgdiam.so
src/gtools/tests/bigdb: lib/libvds.so.1.0.1
src/gtools/tests/bigdb: lib/libbrep.so.20.0.1
src/gtools/tests/bigdb: lib/libbg.so.20.0.1
src/gtools/tests/bigdb: lib/libSPSR.so
src/gtools/tests/bigdb: lib/libbn.so.20.0.1
src/gtools/tests/bigdb: lib/libopenNURBS.so.2012.10.245
src/gtools/tests/bigdb: lib/libp2t.so.1.0.1
src/gtools/tests/bigdb: lib/libz.so.1.2.11
src/gtools/tests/bigdb: lib/liblz4.so
src/gtools/tests/bigdb: lib/libbu.so.20.0.1
src/gtools/tests/bigdb: /usr/lib/x86_64-linux-gnu/libuuid.so
src/gtools/tests/bigdb: lib/libregex.so.1.0.4
src/gtools/tests/bigdb: lib/libclipper.so.4.6.0
src/gtools/tests/bigdb: src/gtools/tests/CMakeFiles/bigdb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bigdb"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bigdb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/gtools/tests/CMakeFiles/bigdb.dir/build: src/gtools/tests/bigdb

.PHONY : src/gtools/tests/CMakeFiles/bigdb.dir/build

src/gtools/tests/CMakeFiles/bigdb.dir/requires: src/gtools/tests/CMakeFiles/bigdb.dir/bigdb.c.o.requires

.PHONY : src/gtools/tests/CMakeFiles/bigdb.dir/requires

src/gtools/tests/CMakeFiles/bigdb.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools/tests && $(CMAKE_COMMAND) -P CMakeFiles/bigdb.dir/cmake_clean.cmake
.PHONY : src/gtools/tests/CMakeFiles/bigdb.dir/clean

src/gtools/tests/CMakeFiles/bigdb.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/gtools/tests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools/tests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools/tests/CMakeFiles/bigdb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gtools/tests/CMakeFiles/bigdb.dir/depend

