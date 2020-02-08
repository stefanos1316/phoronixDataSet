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
include src/util/CMakeFiles/pixsubst.dir/depend.make

# Include the progress variables for this target.
include src/util/CMakeFiles/pixsubst.dir/progress.make

# Include the compile flags for this target's objects.
include src/util/CMakeFiles/pixsubst.dir/flags.make

src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o: src/util/CMakeFiles/pixsubst.dir/flags.make
src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o: ../src/util/pixsubst.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/pixsubst.dir/pixsubst.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixsubst.c

src/util/CMakeFiles/pixsubst.dir/pixsubst.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pixsubst.dir/pixsubst.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixsubst.c > CMakeFiles/pixsubst.dir/pixsubst.c.i

src/util/CMakeFiles/pixsubst.dir/pixsubst.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pixsubst.dir/pixsubst.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/pixsubst.c -o CMakeFiles/pixsubst.dir/pixsubst.c.s

src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o.requires:

.PHONY : src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o.requires

src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o.provides: src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o.requires
	$(MAKE) -f src/util/CMakeFiles/pixsubst.dir/build.make src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o.provides.build
.PHONY : src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o.provides

src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o.provides.build: src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o


# Object files for target pixsubst
pixsubst_OBJECTS = \
"CMakeFiles/pixsubst.dir/pixsubst.c.o"

# External object files for target pixsubst
pixsubst_EXTERNAL_OBJECTS =

bin/pixsubst: src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o
bin/pixsubst: src/util/CMakeFiles/pixsubst.dir/build.make
bin/pixsubst: lib/libbu.so.20.0.1
bin/pixsubst: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/pixsubst: lib/libregex.so.1.0.4
bin/pixsubst: src/util/CMakeFiles/pixsubst.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/pixsubst"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pixsubst.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/util/CMakeFiles/pixsubst.dir/build: bin/pixsubst

.PHONY : src/util/CMakeFiles/pixsubst.dir/build

src/util/CMakeFiles/pixsubst.dir/requires: src/util/CMakeFiles/pixsubst.dir/pixsubst.c.o.requires

.PHONY : src/util/CMakeFiles/pixsubst.dir/requires

src/util/CMakeFiles/pixsubst.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -P CMakeFiles/pixsubst.dir/cmake_clean.cmake
.PHONY : src/util/CMakeFiles/pixsubst.dir/clean

src/util/CMakeFiles/pixsubst.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util/CMakeFiles/pixsubst.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/util/CMakeFiles/pixsubst.dir/depend

