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
include src/conv/CMakeFiles/g-stl.dir/depend.make

# Include the progress variables for this target.
include src/conv/CMakeFiles/g-stl.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/CMakeFiles/g-stl.dir/flags.make

src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o: src/conv/CMakeFiles/g-stl.dir/flags.make
src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o: ../src/conv/stl/g-stl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/g-stl.dir/stl/g-stl.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/stl/g-stl.c

src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/g-stl.dir/stl/g-stl.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/stl/g-stl.c > CMakeFiles/g-stl.dir/stl/g-stl.c.i

src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/g-stl.dir/stl/g-stl.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/stl/g-stl.c -o CMakeFiles/g-stl.dir/stl/g-stl.c.s

src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o.requires:

.PHONY : src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o.requires

src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o.provides: src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o.requires
	$(MAKE) -f src/conv/CMakeFiles/g-stl.dir/build.make src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o.provides.build
.PHONY : src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o.provides

src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o.provides.build: src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o


# Object files for target g-stl
g__stl_OBJECTS = \
"CMakeFiles/g-stl.dir/stl/g-stl.c.o"

# External object files for target g-stl
g__stl_EXTERNAL_OBJECTS =

bin/g-stl: src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o
bin/g-stl: src/conv/CMakeFiles/g-stl.dir/build.make
bin/g-stl: lib/libgcv.so.20.0.1
bin/g-stl: lib/libwdb.so.20.0.1
bin/g-stl: lib/librt.so.20.0.1
bin/g-stl: lib/libgdiam.so
bin/g-stl: lib/libvds.so.1.0.1
bin/g-stl: lib/libbrep.so.20.0.1
bin/g-stl: lib/libp2t.so.1.0.1
bin/g-stl: lib/liblz4.so
bin/g-stl: lib/libnmg.so
bin/g-stl: lib/libbg.so.20.0.1
bin/g-stl: lib/libSPSR.so
bin/g-stl: lib/libbn.so.20.0.1
bin/g-stl: lib/libbu.so.20.0.1
bin/g-stl: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/g-stl: lib/libopenNURBS.so.2012.10.245
bin/g-stl: lib/libz.so.1.2.11
bin/g-stl: lib/libregex.so.1.0.4
bin/g-stl: src/conv/CMakeFiles/g-stl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/g-stl"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/g-stl.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/CMakeFiles/g-stl.dir/build: bin/g-stl

.PHONY : src/conv/CMakeFiles/g-stl.dir/build

src/conv/CMakeFiles/g-stl.dir/requires: src/conv/CMakeFiles/g-stl.dir/stl/g-stl.c.o.requires

.PHONY : src/conv/CMakeFiles/g-stl.dir/requires

src/conv/CMakeFiles/g-stl.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -P CMakeFiles/g-stl.dir/cmake_clean.cmake
.PHONY : src/conv/CMakeFiles/g-stl.dir/clean

src/conv/CMakeFiles/g-stl.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/CMakeFiles/g-stl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/CMakeFiles/g-stl.dir/depend

