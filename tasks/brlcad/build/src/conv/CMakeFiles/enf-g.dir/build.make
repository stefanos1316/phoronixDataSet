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
include src/conv/CMakeFiles/enf-g.dir/depend.make

# Include the progress variables for this target.
include src/conv/CMakeFiles/enf-g.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/CMakeFiles/enf-g.dir/flags.make

src/conv/CMakeFiles/enf-g.dir/enf-g.c.o: src/conv/CMakeFiles/enf-g.dir/flags.make
src/conv/CMakeFiles/enf-g.dir/enf-g.c.o: ../src/conv/enf-g.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/CMakeFiles/enf-g.dir/enf-g.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enf-g.dir/enf-g.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/enf-g.c

src/conv/CMakeFiles/enf-g.dir/enf-g.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enf-g.dir/enf-g.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/enf-g.c > CMakeFiles/enf-g.dir/enf-g.c.i

src/conv/CMakeFiles/enf-g.dir/enf-g.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enf-g.dir/enf-g.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/enf-g.c -o CMakeFiles/enf-g.dir/enf-g.c.s

src/conv/CMakeFiles/enf-g.dir/enf-g.c.o.requires:

.PHONY : src/conv/CMakeFiles/enf-g.dir/enf-g.c.o.requires

src/conv/CMakeFiles/enf-g.dir/enf-g.c.o.provides: src/conv/CMakeFiles/enf-g.dir/enf-g.c.o.requires
	$(MAKE) -f src/conv/CMakeFiles/enf-g.dir/build.make src/conv/CMakeFiles/enf-g.dir/enf-g.c.o.provides.build
.PHONY : src/conv/CMakeFiles/enf-g.dir/enf-g.c.o.provides

src/conv/CMakeFiles/enf-g.dir/enf-g.c.o.provides.build: src/conv/CMakeFiles/enf-g.dir/enf-g.c.o


# Object files for target enf-g
enf__g_OBJECTS = \
"CMakeFiles/enf-g.dir/enf-g.c.o"

# External object files for target enf-g
enf__g_EXTERNAL_OBJECTS =

bin/enf-g: src/conv/CMakeFiles/enf-g.dir/enf-g.c.o
bin/enf-g: src/conv/CMakeFiles/enf-g.dir/build.make
bin/enf-g: lib/libwdb.so.20.0.1
bin/enf-g: lib/libtcl.so.8.5.19
bin/enf-g: lib/librt.so.20.0.1
bin/enf-g: lib/libgdiam.so
bin/enf-g: lib/libvds.so.1.0.1
bin/enf-g: lib/libbrep.so.20.0.1
bin/enf-g: lib/libp2t.so.1.0.1
bin/enf-g: lib/liblz4.so
bin/enf-g: lib/libnmg.so
bin/enf-g: lib/libbg.so.20.0.1
bin/enf-g: lib/libSPSR.so
bin/enf-g: lib/libbn.so.20.0.1
bin/enf-g: lib/libbu.so.20.0.1
bin/enf-g: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/enf-g: lib/libopenNURBS.so.2012.10.245
bin/enf-g: lib/libz.so.1.2.11
bin/enf-g: lib/libregex.so.1.0.4
bin/enf-g: src/conv/CMakeFiles/enf-g.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/enf-g"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/enf-g.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/CMakeFiles/enf-g.dir/build: bin/enf-g

.PHONY : src/conv/CMakeFiles/enf-g.dir/build

src/conv/CMakeFiles/enf-g.dir/requires: src/conv/CMakeFiles/enf-g.dir/enf-g.c.o.requires

.PHONY : src/conv/CMakeFiles/enf-g.dir/requires

src/conv/CMakeFiles/enf-g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -P CMakeFiles/enf-g.dir/cmake_clean.cmake
.PHONY : src/conv/CMakeFiles/enf-g.dir/clean

src/conv/CMakeFiles/enf-g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/CMakeFiles/enf-g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/CMakeFiles/enf-g.dir/depend

