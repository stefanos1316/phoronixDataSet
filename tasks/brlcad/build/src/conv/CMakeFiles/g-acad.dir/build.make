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
include src/conv/CMakeFiles/g-acad.dir/depend.make

# Include the progress variables for this target.
include src/conv/CMakeFiles/g-acad.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/CMakeFiles/g-acad.dir/flags.make

src/conv/CMakeFiles/g-acad.dir/g-acad.c.o: src/conv/CMakeFiles/g-acad.dir/flags.make
src/conv/CMakeFiles/g-acad.dir/g-acad.c.o: ../src/conv/g-acad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/CMakeFiles/g-acad.dir/g-acad.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/g-acad.dir/g-acad.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/g-acad.c

src/conv/CMakeFiles/g-acad.dir/g-acad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/g-acad.dir/g-acad.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/g-acad.c > CMakeFiles/g-acad.dir/g-acad.c.i

src/conv/CMakeFiles/g-acad.dir/g-acad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/g-acad.dir/g-acad.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/g-acad.c -o CMakeFiles/g-acad.dir/g-acad.c.s

src/conv/CMakeFiles/g-acad.dir/g-acad.c.o.requires:

.PHONY : src/conv/CMakeFiles/g-acad.dir/g-acad.c.o.requires

src/conv/CMakeFiles/g-acad.dir/g-acad.c.o.provides: src/conv/CMakeFiles/g-acad.dir/g-acad.c.o.requires
	$(MAKE) -f src/conv/CMakeFiles/g-acad.dir/build.make src/conv/CMakeFiles/g-acad.dir/g-acad.c.o.provides.build
.PHONY : src/conv/CMakeFiles/g-acad.dir/g-acad.c.o.provides

src/conv/CMakeFiles/g-acad.dir/g-acad.c.o.provides.build: src/conv/CMakeFiles/g-acad.dir/g-acad.c.o


# Object files for target g-acad
g__acad_OBJECTS = \
"CMakeFiles/g-acad.dir/g-acad.c.o"

# External object files for target g-acad
g__acad_EXTERNAL_OBJECTS =

bin/g-acad: src/conv/CMakeFiles/g-acad.dir/g-acad.c.o
bin/g-acad: src/conv/CMakeFiles/g-acad.dir/build.make
bin/g-acad: lib/librt.so.20.0.1
bin/g-acad: lib/libnmg.so
bin/g-acad: lib/libgdiam.so
bin/g-acad: lib/libvds.so.1.0.1
bin/g-acad: lib/libbrep.so.20.0.1
bin/g-acad: lib/libbg.so.20.0.1
bin/g-acad: lib/libSPSR.so
bin/g-acad: lib/libbn.so.20.0.1
bin/g-acad: lib/libbu.so.20.0.1
bin/g-acad: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/g-acad: lib/libopenNURBS.so.2012.10.245
bin/g-acad: lib/libp2t.so.1.0.1
bin/g-acad: lib/libz.so.1.2.11
bin/g-acad: lib/libregex.so.1.0.4
bin/g-acad: lib/liblz4.so
bin/g-acad: src/conv/CMakeFiles/g-acad.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/g-acad"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/g-acad.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/CMakeFiles/g-acad.dir/build: bin/g-acad

.PHONY : src/conv/CMakeFiles/g-acad.dir/build

src/conv/CMakeFiles/g-acad.dir/requires: src/conv/CMakeFiles/g-acad.dir/g-acad.c.o.requires

.PHONY : src/conv/CMakeFiles/g-acad.dir/requires

src/conv/CMakeFiles/g-acad.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -P CMakeFiles/g-acad.dir/cmake_clean.cmake
.PHONY : src/conv/CMakeFiles/g-acad.dir/clean

src/conv/CMakeFiles/g-acad.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/CMakeFiles/g-acad.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/CMakeFiles/g-acad.dir/depend
