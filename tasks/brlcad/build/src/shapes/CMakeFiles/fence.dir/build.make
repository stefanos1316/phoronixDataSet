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
include src/shapes/CMakeFiles/fence.dir/depend.make

# Include the progress variables for this target.
include src/shapes/CMakeFiles/fence.dir/progress.make

# Include the compile flags for this target's objects.
include src/shapes/CMakeFiles/fence.dir/flags.make

src/shapes/CMakeFiles/fence.dir/fence.c.o: src/shapes/CMakeFiles/fence.dir/flags.make
src/shapes/CMakeFiles/fence.dir/fence.c.o: ../src/shapes/fence.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/shapes/CMakeFiles/fence.dir/fence.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fence.dir/fence.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/shapes/fence.c

src/shapes/CMakeFiles/fence.dir/fence.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fence.dir/fence.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/shapes/fence.c > CMakeFiles/fence.dir/fence.c.i

src/shapes/CMakeFiles/fence.dir/fence.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fence.dir/fence.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/shapes/fence.c -o CMakeFiles/fence.dir/fence.c.s

src/shapes/CMakeFiles/fence.dir/fence.c.o.requires:

.PHONY : src/shapes/CMakeFiles/fence.dir/fence.c.o.requires

src/shapes/CMakeFiles/fence.dir/fence.c.o.provides: src/shapes/CMakeFiles/fence.dir/fence.c.o.requires
	$(MAKE) -f src/shapes/CMakeFiles/fence.dir/build.make src/shapes/CMakeFiles/fence.dir/fence.c.o.provides.build
.PHONY : src/shapes/CMakeFiles/fence.dir/fence.c.o.provides

src/shapes/CMakeFiles/fence.dir/fence.c.o.provides.build: src/shapes/CMakeFiles/fence.dir/fence.c.o


# Object files for target fence
fence_OBJECTS = \
"CMakeFiles/fence.dir/fence.c.o"

# External object files for target fence
fence_EXTERNAL_OBJECTS =

bin/fence: src/shapes/CMakeFiles/fence.dir/fence.c.o
bin/fence: src/shapes/CMakeFiles/fence.dir/build.make
bin/fence: lib/libwdb.so.20.0.1
bin/fence: lib/librt.so.20.0.1
bin/fence: lib/libgdiam.so
bin/fence: lib/libvds.so.1.0.1
bin/fence: lib/libbrep.so.20.0.1
bin/fence: lib/libp2t.so.1.0.1
bin/fence: lib/liblz4.so
bin/fence: lib/libnmg.so
bin/fence: lib/libbg.so.20.0.1
bin/fence: lib/libSPSR.so
bin/fence: lib/libbn.so.20.0.1
bin/fence: lib/libbu.so.20.0.1
bin/fence: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/fence: lib/libopenNURBS.so.2012.10.245
bin/fence: lib/libz.so.1.2.11
bin/fence: lib/libregex.so.1.0.4
bin/fence: src/shapes/CMakeFiles/fence.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/fence"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fence.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/shapes/CMakeFiles/fence.dir/build: bin/fence

.PHONY : src/shapes/CMakeFiles/fence.dir/build

src/shapes/CMakeFiles/fence.dir/requires: src/shapes/CMakeFiles/fence.dir/fence.c.o.requires

.PHONY : src/shapes/CMakeFiles/fence.dir/requires

src/shapes/CMakeFiles/fence.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes && $(CMAKE_COMMAND) -P CMakeFiles/fence.dir/cmake_clean.cmake
.PHONY : src/shapes/CMakeFiles/fence.dir/clean

src/shapes/CMakeFiles/fence.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/shapes /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/shapes/CMakeFiles/fence.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/shapes/CMakeFiles/fence.dir/depend
