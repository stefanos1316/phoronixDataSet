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
include src/libbu/tests/CMakeFiles/bu_sscanf.dir/depend.make

# Include the progress variables for this target.
include src/libbu/tests/CMakeFiles/bu_sscanf.dir/progress.make

# Include the compile flags for this target's objects.
include src/libbu/tests/CMakeFiles/bu_sscanf.dir/flags.make

src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o: src/libbu/tests/CMakeFiles/bu_sscanf.dir/flags.make
src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o: ../src/libbu/tests/sscanf.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bu_sscanf.dir/sscanf.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libbu/tests/sscanf.c

src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bu_sscanf.dir/sscanf.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libbu/tests/sscanf.c > CMakeFiles/bu_sscanf.dir/sscanf.c.i

src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bu_sscanf.dir/sscanf.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libbu/tests/sscanf.c -o CMakeFiles/bu_sscanf.dir/sscanf.c.s

src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o.requires:

.PHONY : src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o.requires

src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o.provides: src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o.requires
	$(MAKE) -f src/libbu/tests/CMakeFiles/bu_sscanf.dir/build.make src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o.provides.build
.PHONY : src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o.provides

src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o.provides.build: src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o


# Object files for target bu_sscanf
bu_sscanf_OBJECTS = \
"CMakeFiles/bu_sscanf.dir/sscanf.c.o"

# External object files for target bu_sscanf
bu_sscanf_EXTERNAL_OBJECTS =

src/libbu/tests/bu_sscanf: src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o
src/libbu/tests/bu_sscanf: src/libbu/tests/CMakeFiles/bu_sscanf.dir/build.make
src/libbu/tests/bu_sscanf: lib/libbu.so.20.0.1
src/libbu/tests/bu_sscanf: /usr/lib/x86_64-linux-gnu/libuuid.so
src/libbu/tests/bu_sscanf: lib/libregex.so.1.0.4
src/libbu/tests/bu_sscanf: src/libbu/tests/CMakeFiles/bu_sscanf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bu_sscanf"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bu_sscanf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libbu/tests/CMakeFiles/bu_sscanf.dir/build: src/libbu/tests/bu_sscanf

.PHONY : src/libbu/tests/CMakeFiles/bu_sscanf.dir/build

src/libbu/tests/CMakeFiles/bu_sscanf.dir/requires: src/libbu/tests/CMakeFiles/bu_sscanf.dir/sscanf.c.o.requires

.PHONY : src/libbu/tests/CMakeFiles/bu_sscanf.dir/requires

src/libbu/tests/CMakeFiles/bu_sscanf.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/tests && $(CMAKE_COMMAND) -P CMakeFiles/bu_sscanf.dir/cmake_clean.cmake
.PHONY : src/libbu/tests/CMakeFiles/bu_sscanf.dir/clean

src/libbu/tests/CMakeFiles/bu_sscanf.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libbu/tests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/tests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbu/tests/CMakeFiles/bu_sscanf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libbu/tests/CMakeFiles/bu_sscanf.dir/depend

