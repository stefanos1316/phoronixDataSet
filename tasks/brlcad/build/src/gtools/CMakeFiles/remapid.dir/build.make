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
include src/gtools/CMakeFiles/remapid.dir/depend.make

# Include the progress variables for this target.
include src/gtools/CMakeFiles/remapid.dir/progress.make

# Include the compile flags for this target's objects.
include src/gtools/CMakeFiles/remapid.dir/flags.make

src/gtools/CMakeFiles/remapid.dir/remapid.c.o: src/gtools/CMakeFiles/remapid.dir/flags.make
src/gtools/CMakeFiles/remapid.dir/remapid.c.o: ../src/gtools/remapid.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/gtools/CMakeFiles/remapid.dir/remapid.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/remapid.dir/remapid.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/gtools/remapid.c

src/gtools/CMakeFiles/remapid.dir/remapid.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/remapid.dir/remapid.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/gtools/remapid.c > CMakeFiles/remapid.dir/remapid.c.i

src/gtools/CMakeFiles/remapid.dir/remapid.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/remapid.dir/remapid.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/gtools/remapid.c -o CMakeFiles/remapid.dir/remapid.c.s

src/gtools/CMakeFiles/remapid.dir/remapid.c.o.requires:

.PHONY : src/gtools/CMakeFiles/remapid.dir/remapid.c.o.requires

src/gtools/CMakeFiles/remapid.dir/remapid.c.o.provides: src/gtools/CMakeFiles/remapid.dir/remapid.c.o.requires
	$(MAKE) -f src/gtools/CMakeFiles/remapid.dir/build.make src/gtools/CMakeFiles/remapid.dir/remapid.c.o.provides.build
.PHONY : src/gtools/CMakeFiles/remapid.dir/remapid.c.o.provides

src/gtools/CMakeFiles/remapid.dir/remapid.c.o.provides.build: src/gtools/CMakeFiles/remapid.dir/remapid.c.o


# Object files for target remapid
remapid_OBJECTS = \
"CMakeFiles/remapid.dir/remapid.c.o"

# External object files for target remapid
remapid_EXTERNAL_OBJECTS =

bin/remapid: src/gtools/CMakeFiles/remapid.dir/remapid.c.o
bin/remapid: src/gtools/CMakeFiles/remapid.dir/build.make
bin/remapid: lib/librt.so.20.0.1
bin/remapid: lib/libgdiam.so
bin/remapid: lib/libvds.so.1.0.1
bin/remapid: lib/libbrep.so.20.0.1
bin/remapid: lib/libnmg.so
bin/remapid: lib/libbg.so.20.0.1
bin/remapid: lib/libSPSR.so
bin/remapid: lib/libbn.so.20.0.1
bin/remapid: lib/libbu.so.20.0.1
bin/remapid: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/remapid: lib/libopenNURBS.so.2012.10.245
bin/remapid: lib/libp2t.so.1.0.1
bin/remapid: lib/libz.so.1.2.11
bin/remapid: lib/libregex.so.1.0.4
bin/remapid: lib/liblz4.so
bin/remapid: src/gtools/CMakeFiles/remapid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/remapid"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/remapid.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/gtools/CMakeFiles/remapid.dir/build: bin/remapid

.PHONY : src/gtools/CMakeFiles/remapid.dir/build

src/gtools/CMakeFiles/remapid.dir/requires: src/gtools/CMakeFiles/remapid.dir/remapid.c.o.requires

.PHONY : src/gtools/CMakeFiles/remapid.dir/requires

src/gtools/CMakeFiles/remapid.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools && $(CMAKE_COMMAND) -P CMakeFiles/remapid.dir/cmake_clean.cmake
.PHONY : src/gtools/CMakeFiles/remapid.dir/clean

src/gtools/CMakeFiles/remapid.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/gtools /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/gtools/CMakeFiles/remapid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gtools/CMakeFiles/remapid.dir/depend

