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
include src/util/CMakeFiles/bwmod.dir/depend.make

# Include the progress variables for this target.
include src/util/CMakeFiles/bwmod.dir/progress.make

# Include the compile flags for this target's objects.
include src/util/CMakeFiles/bwmod.dir/flags.make

src/util/CMakeFiles/bwmod.dir/bwmod.c.o: src/util/CMakeFiles/bwmod.dir/flags.make
src/util/CMakeFiles/bwmod.dir/bwmod.c.o: ../src/util/bwmod.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/util/CMakeFiles/bwmod.dir/bwmod.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bwmod.dir/bwmod.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/bwmod.c

src/util/CMakeFiles/bwmod.dir/bwmod.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bwmod.dir/bwmod.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/bwmod.c > CMakeFiles/bwmod.dir/bwmod.c.i

src/util/CMakeFiles/bwmod.dir/bwmod.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bwmod.dir/bwmod.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/bwmod.c -o CMakeFiles/bwmod.dir/bwmod.c.s

src/util/CMakeFiles/bwmod.dir/bwmod.c.o.requires:

.PHONY : src/util/CMakeFiles/bwmod.dir/bwmod.c.o.requires

src/util/CMakeFiles/bwmod.dir/bwmod.c.o.provides: src/util/CMakeFiles/bwmod.dir/bwmod.c.o.requires
	$(MAKE) -f src/util/CMakeFiles/bwmod.dir/build.make src/util/CMakeFiles/bwmod.dir/bwmod.c.o.provides.build
.PHONY : src/util/CMakeFiles/bwmod.dir/bwmod.c.o.provides

src/util/CMakeFiles/bwmod.dir/bwmod.c.o.provides.build: src/util/CMakeFiles/bwmod.dir/bwmod.c.o


# Object files for target bwmod
bwmod_OBJECTS = \
"CMakeFiles/bwmod.dir/bwmod.c.o"

# External object files for target bwmod
bwmod_EXTERNAL_OBJECTS =

bin/bwmod: src/util/CMakeFiles/bwmod.dir/bwmod.c.o
bin/bwmod: src/util/CMakeFiles/bwmod.dir/build.make
bin/bwmod: lib/libbu.so.20.0.1
bin/bwmod: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/bwmod: lib/libregex.so.1.0.4
bin/bwmod: src/util/CMakeFiles/bwmod.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/bwmod"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bwmod.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/util/CMakeFiles/bwmod.dir/build: bin/bwmod

.PHONY : src/util/CMakeFiles/bwmod.dir/build

src/util/CMakeFiles/bwmod.dir/requires: src/util/CMakeFiles/bwmod.dir/bwmod.c.o.requires

.PHONY : src/util/CMakeFiles/bwmod.dir/requires

src/util/CMakeFiles/bwmod.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -P CMakeFiles/bwmod.dir/cmake_clean.cmake
.PHONY : src/util/CMakeFiles/bwmod.dir/clean

src/util/CMakeFiles/bwmod.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util/CMakeFiles/bwmod.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/util/CMakeFiles/bwmod.dir/depend

