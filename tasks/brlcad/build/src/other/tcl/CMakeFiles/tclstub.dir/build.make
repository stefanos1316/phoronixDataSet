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
include src/other/tcl/CMakeFiles/tclstub.dir/depend.make

# Include the progress variables for this target.
include src/other/tcl/CMakeFiles/tclstub.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/tcl/CMakeFiles/tclstub.dir/flags.make

src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o: src/other/tcl/CMakeFiles/tclstub.dir/flags.make
src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o: ../src/other/tcl/generic/tclStubLib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tclstub.dir/generic/tclStubLib.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclStubLib.c

src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tclstub.dir/generic/tclStubLib.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclStubLib.c > CMakeFiles/tclstub.dir/generic/tclStubLib.c.i

src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tclstub.dir/generic/tclStubLib.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl/generic/tclStubLib.c -o CMakeFiles/tclstub.dir/generic/tclStubLib.c.s

src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o.requires:

.PHONY : src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o.requires

src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o.provides: src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o.requires
	$(MAKE) -f src/other/tcl/CMakeFiles/tclstub.dir/build.make src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o.provides.build
.PHONY : src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o.provides

src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o.provides.build: src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o


# Object files for target tclstub
tclstub_OBJECTS = \
"CMakeFiles/tclstub.dir/generic/tclStubLib.c.o"

# External object files for target tclstub
tclstub_EXTERNAL_OBJECTS =

lib/libtclstub.a: src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o
lib/libtclstub.a: src/other/tcl/CMakeFiles/tclstub.dir/build.make
lib/libtclstub.a: src/other/tcl/CMakeFiles/tclstub.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../lib/libtclstub.a"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl && $(CMAKE_COMMAND) -P CMakeFiles/tclstub.dir/cmake_clean_target.cmake
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tclstub.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/other/tcl/CMakeFiles/tclstub.dir/build: lib/libtclstub.a

.PHONY : src/other/tcl/CMakeFiles/tclstub.dir/build

src/other/tcl/CMakeFiles/tclstub.dir/requires: src/other/tcl/CMakeFiles/tclstub.dir/generic/tclStubLib.c.o.requires

.PHONY : src/other/tcl/CMakeFiles/tclstub.dir/requires

src/other/tcl/CMakeFiles/tclstub.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl && $(CMAKE_COMMAND) -P CMakeFiles/tclstub.dir/cmake_clean.cmake
.PHONY : src/other/tcl/CMakeFiles/tclstub.dir/clean

src/other/tcl/CMakeFiles/tclstub.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tcl /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tcl/CMakeFiles/tclstub.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/tcl/CMakeFiles/tclstub.dir/depend

