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
include src/conv/raw/CMakeFiles/g-raw.dir/depend.make

# Include the progress variables for this target.
include src/conv/raw/CMakeFiles/g-raw.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/raw/CMakeFiles/g-raw.dir/flags.make

src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o: src/conv/raw/CMakeFiles/g-raw.dir/flags.make
src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o: ../src/conv/raw/g-raw.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/raw && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/g-raw.dir/g-raw.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/raw/g-raw.c

src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/g-raw.dir/g-raw.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/raw && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/raw/g-raw.c > CMakeFiles/g-raw.dir/g-raw.c.i

src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/g-raw.dir/g-raw.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/raw && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/raw/g-raw.c -o CMakeFiles/g-raw.dir/g-raw.c.s

src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o.requires:

.PHONY : src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o.requires

src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o.provides: src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o.requires
	$(MAKE) -f src/conv/raw/CMakeFiles/g-raw.dir/build.make src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o.provides.build
.PHONY : src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o.provides

src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o.provides.build: src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o


# Object files for target g-raw
g__raw_OBJECTS = \
"CMakeFiles/g-raw.dir/g-raw.c.o"

# External object files for target g-raw
g__raw_EXTERNAL_OBJECTS =

bin/g-raw: src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o
bin/g-raw: src/conv/raw/CMakeFiles/g-raw.dir/build.make
bin/g-raw: lib/libgcv.so.20.0.1
bin/g-raw: lib/libwdb.so.20.0.1
bin/g-raw: lib/librt.so.20.0.1
bin/g-raw: lib/libgdiam.so
bin/g-raw: lib/libvds.so.1.0.1
bin/g-raw: lib/libbrep.so.20.0.1
bin/g-raw: lib/libp2t.so.1.0.1
bin/g-raw: lib/liblz4.so
bin/g-raw: lib/libnmg.so
bin/g-raw: lib/libbg.so.20.0.1
bin/g-raw: lib/libSPSR.so
bin/g-raw: lib/libbn.so.20.0.1
bin/g-raw: lib/libbu.so.20.0.1
bin/g-raw: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/g-raw: lib/libopenNURBS.so.2012.10.245
bin/g-raw: lib/libz.so.1.2.11
bin/g-raw: lib/libregex.so.1.0.4
bin/g-raw: src/conv/raw/CMakeFiles/g-raw.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/g-raw"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/raw && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/g-raw.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/raw/CMakeFiles/g-raw.dir/build: bin/g-raw

.PHONY : src/conv/raw/CMakeFiles/g-raw.dir/build

src/conv/raw/CMakeFiles/g-raw.dir/requires: src/conv/raw/CMakeFiles/g-raw.dir/g-raw.c.o.requires

.PHONY : src/conv/raw/CMakeFiles/g-raw.dir/requires

src/conv/raw/CMakeFiles/g-raw.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/raw && $(CMAKE_COMMAND) -P CMakeFiles/g-raw.dir/cmake_clean.cmake
.PHONY : src/conv/raw/CMakeFiles/g-raw.dir/clean

src/conv/raw/CMakeFiles/g-raw.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/raw /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/raw /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/raw/CMakeFiles/g-raw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/raw/CMakeFiles/g-raw.dir/depend

