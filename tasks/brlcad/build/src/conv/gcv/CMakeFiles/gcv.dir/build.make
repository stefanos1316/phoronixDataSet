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
include src/conv/gcv/CMakeFiles/gcv.dir/depend.make

# Include the progress variables for this target.
include src/conv/gcv/CMakeFiles/gcv.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/gcv/CMakeFiles/gcv.dir/flags.make

src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o: src/conv/gcv/CMakeFiles/gcv.dir/flags.make
src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o: ../src/conv/gcv/gcv.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/gcv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/gcv.dir/gcv.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/gcv/gcv.c

src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gcv.dir/gcv.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/gcv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/gcv/gcv.c > CMakeFiles/gcv.dir/gcv.c.i

src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gcv.dir/gcv.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/gcv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/gcv/gcv.c -o CMakeFiles/gcv.dir/gcv.c.s

src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o.requires:

.PHONY : src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o.requires

src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o.provides: src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o.requires
	$(MAKE) -f src/conv/gcv/CMakeFiles/gcv.dir/build.make src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o.provides.build
.PHONY : src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o.provides

src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o.provides.build: src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o


# Object files for target gcv
gcv_OBJECTS = \
"CMakeFiles/gcv.dir/gcv.c.o"

# External object files for target gcv
gcv_EXTERNAL_OBJECTS =

bin/gcv: src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o
bin/gcv: src/conv/gcv/CMakeFiles/gcv.dir/build.make
bin/gcv: lib/libgcv.so.20.0.1
bin/gcv: lib/libwdb.so.20.0.1
bin/gcv: lib/librt.so.20.0.1
bin/gcv: lib/libgdiam.so
bin/gcv: lib/libvds.so.1.0.1
bin/gcv: lib/libbrep.so.20.0.1
bin/gcv: lib/libp2t.so.1.0.1
bin/gcv: lib/liblz4.so
bin/gcv: lib/libopenNURBS.so.2012.10.245
bin/gcv: lib/libz.so.1.2.11
bin/gcv: lib/libnmg.so
bin/gcv: lib/libbg.so.20.0.1
bin/gcv: lib/libbn.so.20.0.1
bin/gcv: lib/libbu.so.20.0.1
bin/gcv: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/gcv: lib/libregex.so.1.0.4
bin/gcv: lib/libSPSR.so
bin/gcv: src/conv/gcv/CMakeFiles/gcv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/gcv"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/gcv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gcv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/gcv/CMakeFiles/gcv.dir/build: bin/gcv

.PHONY : src/conv/gcv/CMakeFiles/gcv.dir/build

src/conv/gcv/CMakeFiles/gcv.dir/requires: src/conv/gcv/CMakeFiles/gcv.dir/gcv.c.o.requires

.PHONY : src/conv/gcv/CMakeFiles/gcv.dir/requires

src/conv/gcv/CMakeFiles/gcv.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/gcv && $(CMAKE_COMMAND) -P CMakeFiles/gcv.dir/cmake_clean.cmake
.PHONY : src/conv/gcv/CMakeFiles/gcv.dir/clean

src/conv/gcv/CMakeFiles/gcv.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/gcv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/gcv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/gcv/CMakeFiles/gcv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/gcv/CMakeFiles/gcv.dir/depend
