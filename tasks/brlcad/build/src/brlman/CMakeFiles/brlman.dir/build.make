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
include src/brlman/CMakeFiles/brlman.dir/depend.make

# Include the progress variables for this target.
include src/brlman/CMakeFiles/brlman.dir/progress.make

# Include the compile flags for this target's objects.
include src/brlman/CMakeFiles/brlman.dir/flags.make

src/brlman/CMakeFiles/brlman.dir/brlman.c.o: src/brlman/CMakeFiles/brlman.dir/flags.make
src/brlman/CMakeFiles/brlman.dir/brlman.c.o: ../src/brlman/brlman.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/brlman/CMakeFiles/brlman.dir/brlman.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/brlman && /usr/bin/cc $(C_DEFINES) -DDM_OGL -DDM_TK -DDM_X -DIF_OGL -DIF_TK -DIF_X $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/brlman.dir/brlman.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/brlman/brlman.c

src/brlman/CMakeFiles/brlman.dir/brlman.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/brlman.dir/brlman.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/brlman && /usr/bin/cc $(C_DEFINES) -DDM_OGL -DDM_TK -DDM_X -DIF_OGL -DIF_TK -DIF_X $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/brlman/brlman.c > CMakeFiles/brlman.dir/brlman.c.i

src/brlman/CMakeFiles/brlman.dir/brlman.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/brlman.dir/brlman.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/brlman && /usr/bin/cc $(C_DEFINES) -DDM_OGL -DDM_TK -DDM_X -DIF_OGL -DIF_TK -DIF_X $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/brlman/brlman.c -o CMakeFiles/brlman.dir/brlman.c.s

src/brlman/CMakeFiles/brlman.dir/brlman.c.o.requires:

.PHONY : src/brlman/CMakeFiles/brlman.dir/brlman.c.o.requires

src/brlman/CMakeFiles/brlman.dir/brlman.c.o.provides: src/brlman/CMakeFiles/brlman.dir/brlman.c.o.requires
	$(MAKE) -f src/brlman/CMakeFiles/brlman.dir/build.make src/brlman/CMakeFiles/brlman.dir/brlman.c.o.provides.build
.PHONY : src/brlman/CMakeFiles/brlman.dir/brlman.c.o.provides

src/brlman/CMakeFiles/brlman.dir/brlman.c.o.provides.build: src/brlman/CMakeFiles/brlman.dir/brlman.c.o


# Object files for target brlman
brlman_OBJECTS = \
"CMakeFiles/brlman.dir/brlman.c.o"

# External object files for target brlman
brlman_EXTERNAL_OBJECTS =

bin/brlman: src/brlman/CMakeFiles/brlman.dir/brlman.c.o
bin/brlman: src/brlman/CMakeFiles/brlman.dir/build.make
bin/brlman: lib/libtclcad.so.20.0.1
bin/brlman: lib/libTkhtml.so.3.0
bin/brlman: lib/libged.so.20.0.1
bin/brlman: lib/libwdb.so.20.0.1
bin/brlman: lib/libicv.so.20.0.1
bin/brlman: lib/libnetpbm.so
bin/brlman: lib/libanalyze.so.20.0.1
bin/brlman: lib/libclipper.so.4.6.0
bin/brlman: lib/libdm.so.20.0.1
bin/brlman: lib/librt.so.20.0.1
bin/brlman: lib/libgdiam.so
bin/brlman: lib/libvds.so.1.0.1
bin/brlman: lib/libbrep.so.20.0.1
bin/brlman: lib/libopenNURBS.so.2012.10.245
bin/brlman: lib/libp2t.so.1.0.1
bin/brlman: lib/liblz4.so
bin/brlman: lib/libfb.so.20.0.1
bin/brlman: lib/libpkg.so.20.0.1
bin/brlman: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/brlman: /usr/lib/x86_64-linux-gnu/libGL.so
bin/brlman: lib/libnmg.so
bin/brlman: lib/libbg.so.20.0.1
bin/brlman: lib/libSPSR.so
bin/brlman: lib/libbn.so.20.0.1
bin/brlman: lib/libbu.so.20.0.1
bin/brlman: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/brlman: lib/libregex.so.1.0.4
bin/brlman: lib/libitk.so.3.4
bin/brlman: lib/libtcl.so.8.5.19
bin/brlman: lib/libtk.so.8.5
bin/brlman: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/brlman: lib/libpng16.so.16.29.0
bin/brlman: lib/libz.so.1.2.11
bin/brlman: lib/libitcl.so.3.4
bin/brlman: /usr/lib/x86_64-linux-gnu/libXi.so
bin/brlman: /usr/lib/x86_64-linux-gnu/libSM.so
bin/brlman: /usr/lib/x86_64-linux-gnu/libICE.so
bin/brlman: /usr/lib/x86_64-linux-gnu/libX11.so
bin/brlman: /usr/lib/x86_64-linux-gnu/libXext.so
bin/brlman: lib/libtkstub.a
bin/brlman: lib/libtclstub.a
bin/brlman: src/brlman/CMakeFiles/brlman.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/brlman"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/brlman && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/brlman.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/brlman/CMakeFiles/brlman.dir/build: bin/brlman

.PHONY : src/brlman/CMakeFiles/brlman.dir/build

src/brlman/CMakeFiles/brlman.dir/requires: src/brlman/CMakeFiles/brlman.dir/brlman.c.o.requires

.PHONY : src/brlman/CMakeFiles/brlman.dir/requires

src/brlman/CMakeFiles/brlman.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/brlman && $(CMAKE_COMMAND) -P CMakeFiles/brlman.dir/cmake_clean.cmake
.PHONY : src/brlman/CMakeFiles/brlman.dir/clean

src/brlman/CMakeFiles/brlman.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/brlman /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/brlman /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/brlman/CMakeFiles/brlman.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/brlman/CMakeFiles/brlman.dir/depend
