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
include src/conv/iges/CMakeFiles/g-iges.dir/depend.make

# Include the progress variables for this target.
include src/conv/iges/CMakeFiles/g-iges.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/iges/CMakeFiles/g-iges.dir/flags.make

src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o: src/conv/iges/CMakeFiles/g-iges.dir/flags.make
src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o: ../src/conv/iges/g-iges.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/g-iges.dir/g-iges.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/iges/g-iges.c

src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/g-iges.dir/g-iges.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/iges/g-iges.c > CMakeFiles/g-iges.dir/g-iges.c.i

src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/g-iges.dir/g-iges.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/iges/g-iges.c -o CMakeFiles/g-iges.dir/g-iges.c.s

src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o.requires:

.PHONY : src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o.requires

src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o.provides: src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o.requires
	$(MAKE) -f src/conv/iges/CMakeFiles/g-iges.dir/build.make src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o.provides.build
.PHONY : src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o.provides

src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o.provides.build: src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o


src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o: src/conv/iges/CMakeFiles/g-iges.dir/flags.make
src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o: ../src/conv/iges/iges.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/g-iges.dir/iges.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/iges/iges.c

src/conv/iges/CMakeFiles/g-iges.dir/iges.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/g-iges.dir/iges.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/iges/iges.c > CMakeFiles/g-iges.dir/iges.c.i

src/conv/iges/CMakeFiles/g-iges.dir/iges.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/g-iges.dir/iges.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/iges/iges.c -o CMakeFiles/g-iges.dir/iges.c.s

src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o.requires:

.PHONY : src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o.requires

src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o.provides: src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o.requires
	$(MAKE) -f src/conv/iges/CMakeFiles/g-iges.dir/build.make src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o.provides.build
.PHONY : src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o.provides

src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o.provides.build: src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o


# Object files for target g-iges
g__iges_OBJECTS = \
"CMakeFiles/g-iges.dir/g-iges.c.o" \
"CMakeFiles/g-iges.dir/iges.c.o"

# External object files for target g-iges
g__iges_EXTERNAL_OBJECTS =

bin/g-iges: src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o
bin/g-iges: src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o
bin/g-iges: src/conv/iges/CMakeFiles/g-iges.dir/build.make
bin/g-iges: lib/librt.so.20.0.1
bin/g-iges: lib/libnmg.so
bin/g-iges: lib/libgdiam.so
bin/g-iges: lib/libvds.so.1.0.1
bin/g-iges: lib/libbrep.so.20.0.1
bin/g-iges: lib/libbg.so.20.0.1
bin/g-iges: lib/libSPSR.so
bin/g-iges: lib/libbn.so.20.0.1
bin/g-iges: lib/libbu.so.20.0.1
bin/g-iges: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/g-iges: lib/libopenNURBS.so.2012.10.245
bin/g-iges: lib/libp2t.so.1.0.1
bin/g-iges: lib/libz.so.1.2.11
bin/g-iges: lib/libregex.so.1.0.4
bin/g-iges: lib/liblz4.so
bin/g-iges: src/conv/iges/CMakeFiles/g-iges.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable ../../../bin/g-iges"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/g-iges.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/iges/CMakeFiles/g-iges.dir/build: bin/g-iges

.PHONY : src/conv/iges/CMakeFiles/g-iges.dir/build

src/conv/iges/CMakeFiles/g-iges.dir/requires: src/conv/iges/CMakeFiles/g-iges.dir/g-iges.c.o.requires
src/conv/iges/CMakeFiles/g-iges.dir/requires: src/conv/iges/CMakeFiles/g-iges.dir/iges.c.o.requires

.PHONY : src/conv/iges/CMakeFiles/g-iges.dir/requires

src/conv/iges/CMakeFiles/g-iges.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges && $(CMAKE_COMMAND) -P CMakeFiles/g-iges.dir/cmake_clean.cmake
.PHONY : src/conv/iges/CMakeFiles/g-iges.dir/clean

src/conv/iges/CMakeFiles/g-iges.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/iges /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/iges/CMakeFiles/g-iges.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/iges/CMakeFiles/g-iges.dir/depend
