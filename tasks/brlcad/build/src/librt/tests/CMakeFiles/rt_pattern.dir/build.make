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
include src/librt/tests/CMakeFiles/rt_pattern.dir/depend.make

# Include the progress variables for this target.
include src/librt/tests/CMakeFiles/rt_pattern.dir/progress.make

# Include the compile flags for this target's objects.
include src/librt/tests/CMakeFiles/rt_pattern.dir/flags.make

src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o: src/librt/tests/CMakeFiles/rt_pattern.dir/flags.make
src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o: ../src/librt/tests/rt_pattern.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/librt/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rt_pattern.dir/rt_pattern.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/tests/rt_pattern.c

src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rt_pattern.dir/rt_pattern.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/librt/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/tests/rt_pattern.c > CMakeFiles/rt_pattern.dir/rt_pattern.c.i

src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rt_pattern.dir/rt_pattern.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/librt/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/tests/rt_pattern.c -o CMakeFiles/rt_pattern.dir/rt_pattern.c.s

src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o.requires:

.PHONY : src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o.requires

src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o.provides: src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o.requires
	$(MAKE) -f src/librt/tests/CMakeFiles/rt_pattern.dir/build.make src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o.provides.build
.PHONY : src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o.provides

src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o.provides.build: src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o


# Object files for target rt_pattern
rt_pattern_OBJECTS = \
"CMakeFiles/rt_pattern.dir/rt_pattern.c.o"

# External object files for target rt_pattern
rt_pattern_EXTERNAL_OBJECTS =

src/librt/tests/rt_pattern: src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o
src/librt/tests/rt_pattern: src/librt/tests/CMakeFiles/rt_pattern.dir/build.make
src/librt/tests/rt_pattern: lib/librt.so.20.0.1
src/librt/tests/rt_pattern: lib/libgdiam.so
src/librt/tests/rt_pattern: lib/libvds.so.1.0.1
src/librt/tests/rt_pattern: lib/libbrep.so.20.0.1
src/librt/tests/rt_pattern: lib/libnmg.so
src/librt/tests/rt_pattern: lib/libbg.so.20.0.1
src/librt/tests/rt_pattern: lib/libSPSR.so
src/librt/tests/rt_pattern: lib/libbn.so.20.0.1
src/librt/tests/rt_pattern: lib/libbu.so.20.0.1
src/librt/tests/rt_pattern: /usr/lib/x86_64-linux-gnu/libuuid.so
src/librt/tests/rt_pattern: lib/libopenNURBS.so.2012.10.245
src/librt/tests/rt_pattern: lib/libp2t.so.1.0.1
src/librt/tests/rt_pattern: lib/libz.so.1.2.11
src/librt/tests/rt_pattern: lib/libregex.so.1.0.4
src/librt/tests/rt_pattern: lib/liblz4.so
src/librt/tests/rt_pattern: src/librt/tests/CMakeFiles/rt_pattern.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable rt_pattern"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/librt/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rt_pattern.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/librt/tests/CMakeFiles/rt_pattern.dir/build: src/librt/tests/rt_pattern

.PHONY : src/librt/tests/CMakeFiles/rt_pattern.dir/build

src/librt/tests/CMakeFiles/rt_pattern.dir/requires: src/librt/tests/CMakeFiles/rt_pattern.dir/rt_pattern.c.o.requires

.PHONY : src/librt/tests/CMakeFiles/rt_pattern.dir/requires

src/librt/tests/CMakeFiles/rt_pattern.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/librt/tests && $(CMAKE_COMMAND) -P CMakeFiles/rt_pattern.dir/cmake_clean.cmake
.PHONY : src/librt/tests/CMakeFiles/rt_pattern.dir/clean

src/librt/tests/CMakeFiles/rt_pattern.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/librt/tests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/librt/tests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/librt/tests/CMakeFiles/rt_pattern.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/librt/tests/CMakeFiles/rt_pattern.dir/depend

