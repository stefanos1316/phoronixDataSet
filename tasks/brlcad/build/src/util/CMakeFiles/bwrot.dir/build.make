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
include src/util/CMakeFiles/bwrot.dir/depend.make

# Include the progress variables for this target.
include src/util/CMakeFiles/bwrot.dir/progress.make

# Include the compile flags for this target's objects.
include src/util/CMakeFiles/bwrot.dir/flags.make

src/util/CMakeFiles/bwrot.dir/bwrot.c.o: src/util/CMakeFiles/bwrot.dir/flags.make
src/util/CMakeFiles/bwrot.dir/bwrot.c.o: ../src/util/bwrot.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/util/CMakeFiles/bwrot.dir/bwrot.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bwrot.dir/bwrot.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/bwrot.c

src/util/CMakeFiles/bwrot.dir/bwrot.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bwrot.dir/bwrot.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/bwrot.c > CMakeFiles/bwrot.dir/bwrot.c.i

src/util/CMakeFiles/bwrot.dir/bwrot.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bwrot.dir/bwrot.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/bwrot.c -o CMakeFiles/bwrot.dir/bwrot.c.s

src/util/CMakeFiles/bwrot.dir/bwrot.c.o.requires:

.PHONY : src/util/CMakeFiles/bwrot.dir/bwrot.c.o.requires

src/util/CMakeFiles/bwrot.dir/bwrot.c.o.provides: src/util/CMakeFiles/bwrot.dir/bwrot.c.o.requires
	$(MAKE) -f src/util/CMakeFiles/bwrot.dir/build.make src/util/CMakeFiles/bwrot.dir/bwrot.c.o.provides.build
.PHONY : src/util/CMakeFiles/bwrot.dir/bwrot.c.o.provides

src/util/CMakeFiles/bwrot.dir/bwrot.c.o.provides.build: src/util/CMakeFiles/bwrot.dir/bwrot.c.o


# Object files for target bwrot
bwrot_OBJECTS = \
"CMakeFiles/bwrot.dir/bwrot.c.o"

# External object files for target bwrot
bwrot_EXTERNAL_OBJECTS =

bin/bwrot: src/util/CMakeFiles/bwrot.dir/bwrot.c.o
bin/bwrot: src/util/CMakeFiles/bwrot.dir/build.make
bin/bwrot: lib/libbu.so.20.0.1
bin/bwrot: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/bwrot: lib/libregex.so.1.0.4
bin/bwrot: src/util/CMakeFiles/bwrot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/bwrot"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bwrot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/util/CMakeFiles/bwrot.dir/build: bin/bwrot

.PHONY : src/util/CMakeFiles/bwrot.dir/build

src/util/CMakeFiles/bwrot.dir/requires: src/util/CMakeFiles/bwrot.dir/bwrot.c.o.requires

.PHONY : src/util/CMakeFiles/bwrot.dir/requires

src/util/CMakeFiles/bwrot.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -P CMakeFiles/bwrot.dir/cmake_clean.cmake
.PHONY : src/util/CMakeFiles/bwrot.dir/clean

src/util/CMakeFiles/bwrot.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util/CMakeFiles/bwrot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/util/CMakeFiles/bwrot.dir/depend
