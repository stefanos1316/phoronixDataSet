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
include src/conv/asc/CMakeFiles/asc2g.dir/depend.make

# Include the progress variables for this target.
include src/conv/asc/CMakeFiles/asc2g.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/asc/CMakeFiles/asc2g.dir/flags.make

src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o: src/conv/asc/CMakeFiles/asc2g.dir/flags.make
src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o: ../src/conv/asc/asc2g.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/asc && /usr/bin/cc $(C_DEFINES) -DDM_OGL -DDM_TK -DDM_X -DIF_OGL -DIF_TK -DIF_X $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/asc2g.dir/asc2g.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/asc/asc2g.c

src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/asc2g.dir/asc2g.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/asc && /usr/bin/cc $(C_DEFINES) -DDM_OGL -DDM_TK -DDM_X -DIF_OGL -DIF_TK -DIF_X $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/asc/asc2g.c > CMakeFiles/asc2g.dir/asc2g.c.i

src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/asc2g.dir/asc2g.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/asc && /usr/bin/cc $(C_DEFINES) -DDM_OGL -DDM_TK -DDM_X -DIF_OGL -DIF_TK -DIF_X $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/asc/asc2g.c -o CMakeFiles/asc2g.dir/asc2g.c.s

src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o.requires:

.PHONY : src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o.requires

src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o.provides: src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o.requires
	$(MAKE) -f src/conv/asc/CMakeFiles/asc2g.dir/build.make src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o.provides.build
.PHONY : src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o.provides

src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o.provides.build: src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o


# Object files for target asc2g
asc2g_OBJECTS = \
"CMakeFiles/asc2g.dir/asc2g.c.o"

# External object files for target asc2g
asc2g_EXTERNAL_OBJECTS =

bin/asc2g: src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o
bin/asc2g: src/conv/asc/CMakeFiles/asc2g.dir/build.make
bin/asc2g: lib/libtclcad.so.20.0.1
bin/asc2g: lib/libged.so.20.0.1
bin/asc2g: lib/libwdb.so.20.0.1
bin/asc2g: lib/libicv.so.20.0.1
bin/asc2g: lib/libnetpbm.so
bin/asc2g: lib/libanalyze.so.20.0.1
bin/asc2g: lib/libclipper.so.4.6.0
bin/asc2g: lib/libdm.so.20.0.1
bin/asc2g: lib/librt.so.20.0.1
bin/asc2g: lib/libnmg.so
bin/asc2g: lib/libgdiam.so
bin/asc2g: lib/libvds.so.1.0.1
bin/asc2g: lib/libbrep.so.20.0.1
bin/asc2g: lib/libbg.so.20.0.1
bin/asc2g: lib/libSPSR.so
bin/asc2g: lib/libopenNURBS.so.2012.10.245
bin/asc2g: lib/libp2t.so.1.0.1
bin/asc2g: lib/liblz4.so
bin/asc2g: lib/libfb.so.20.0.1
bin/asc2g: lib/libpkg.so.20.0.1
bin/asc2g: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/asc2g: /usr/lib/x86_64-linux-gnu/libGL.so
bin/asc2g: lib/libbn.so.20.0.1
bin/asc2g: lib/libbu.so.20.0.1
bin/asc2g: lib/libregex.so.1.0.4
bin/asc2g: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/asc2g: lib/libitk.so.3.4
bin/asc2g: lib/libtcl.so.8.5.19
bin/asc2g: lib/libtk.so.8.5
bin/asc2g: lib/libpng16.so.16.29.0
bin/asc2g: lib/libz.so.1.2.11
bin/asc2g: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/asc2g: lib/libitcl.so.3.4
bin/asc2g: lib/libtkstub.a
bin/asc2g: lib/libtclstub.a
bin/asc2g: /usr/lib/x86_64-linux-gnu/libSM.so
bin/asc2g: /usr/lib/x86_64-linux-gnu/libICE.so
bin/asc2g: /usr/lib/x86_64-linux-gnu/libX11.so
bin/asc2g: /usr/lib/x86_64-linux-gnu/libXext.so
bin/asc2g: /usr/lib/x86_64-linux-gnu/libXi.so
bin/asc2g: src/conv/asc/CMakeFiles/asc2g.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/asc2g"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/asc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/asc2g.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/asc/CMakeFiles/asc2g.dir/build: bin/asc2g

.PHONY : src/conv/asc/CMakeFiles/asc2g.dir/build

src/conv/asc/CMakeFiles/asc2g.dir/requires: src/conv/asc/CMakeFiles/asc2g.dir/asc2g.c.o.requires

.PHONY : src/conv/asc/CMakeFiles/asc2g.dir/requires

src/conv/asc/CMakeFiles/asc2g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/asc && $(CMAKE_COMMAND) -P CMakeFiles/asc2g.dir/cmake_clean.cmake
.PHONY : src/conv/asc/CMakeFiles/asc2g.dir/clean

src/conv/asc/CMakeFiles/asc2g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/asc /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/asc /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/asc/CMakeFiles/asc2g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/asc/CMakeFiles/asc2g.dir/depend
