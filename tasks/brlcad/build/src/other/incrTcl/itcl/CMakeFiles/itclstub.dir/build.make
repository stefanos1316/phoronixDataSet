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
include src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/depend.make

# Include the progress variables for this target.
include src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/flags.make

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o: src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/flags.make
src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o: ../src/other/incrTcl/itcl/generic/itclStubLib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/itclstub.dir/generic/itclStubLib.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itcl/generic/itclStubLib.c

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/itclstub.dir/generic/itclStubLib.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itcl/generic/itclStubLib.c > CMakeFiles/itclstub.dir/generic/itclStubLib.c.i

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/itclstub.dir/generic/itclStubLib.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itcl/generic/itclStubLib.c -o CMakeFiles/itclstub.dir/generic/itclStubLib.c.s

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o.requires:

.PHONY : src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o.requires

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o.provides: src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o.requires
	$(MAKE) -f src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/build.make src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o.provides.build
.PHONY : src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o.provides

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o.provides.build: src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o


# Object files for target itclstub
itclstub_OBJECTS = \
"CMakeFiles/itclstub.dir/generic/itclStubLib.c.o"

# External object files for target itclstub
itclstub_EXTERNAL_OBJECTS =

lib/libitclstub.a: src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o
lib/libitclstub.a: src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/build.make
lib/libitclstub.a: src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../../lib/libitclstub.a"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl && $(CMAKE_COMMAND) -P CMakeFiles/itclstub.dir/cmake_clean_target.cmake
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/itclstub.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/build: lib/libitclstub.a

.PHONY : src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/build

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/requires: src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/generic/itclStubLib.c.o.requires

.PHONY : src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/requires

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl && $(CMAKE_COMMAND) -P CMakeFiles/itclstub.dir/cmake_clean.cmake
.PHONY : src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/clean

src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/incrTcl/itcl /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/incrTcl/itcl/CMakeFiles/itclstub.dir/depend

