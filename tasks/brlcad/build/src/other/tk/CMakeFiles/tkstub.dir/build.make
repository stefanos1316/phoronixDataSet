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
include src/other/tk/CMakeFiles/tkstub.dir/depend.make

# Include the progress variables for this target.
include src/other/tk/CMakeFiles/tkstub.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/tk/CMakeFiles/tkstub.dir/flags.make

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o: src/other/tk/CMakeFiles/tkstub.dir/flags.make
src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o: ../src/other/tk/generic/tkStubInit.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tkstub.dir/generic/tkStubInit.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tkStubInit.c

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tkstub.dir/generic/tkStubInit.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tkStubInit.c > CMakeFiles/tkstub.dir/generic/tkStubInit.c.i

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tkstub.dir/generic/tkStubInit.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tkStubInit.c -o CMakeFiles/tkstub.dir/generic/tkStubInit.c.s

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o.requires:

.PHONY : src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o.requires

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o.provides: src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o.requires
	$(MAKE) -f src/other/tk/CMakeFiles/tkstub.dir/build.make src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o.provides.build
.PHONY : src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o.provides

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o.provides.build: src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o


src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o: src/other/tk/CMakeFiles/tkstub.dir/flags.make
src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o: ../src/other/tk/generic/tkStubLib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tkstub.dir/generic/tkStubLib.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tkStubLib.c

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tkstub.dir/generic/tkStubLib.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tkStubLib.c > CMakeFiles/tkstub.dir/generic/tkStubLib.c.i

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tkstub.dir/generic/tkStubLib.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/tkStubLib.c -o CMakeFiles/tkstub.dir/generic/tkStubLib.c.s

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o.requires:

.PHONY : src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o.requires

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o.provides: src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o.requires
	$(MAKE) -f src/other/tk/CMakeFiles/tkstub.dir/build.make src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o.provides.build
.PHONY : src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o.provides

src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o.provides.build: src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o


src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o: src/other/tk/CMakeFiles/tkstub.dir/flags.make
src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o: ../src/other/tk/generic/ttk/ttkStubInit.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/ttk/ttkStubInit.c

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/ttk/ttkStubInit.c > CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.i

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/ttk/ttkStubInit.c -o CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.s

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o.requires:

.PHONY : src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o.requires

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o.provides: src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o.requires
	$(MAKE) -f src/other/tk/CMakeFiles/tkstub.dir/build.make src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o.provides.build
.PHONY : src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o.provides

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o.provides.build: src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o


src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o: src/other/tk/CMakeFiles/tkstub.dir/flags.make
src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o: ../src/other/tk/generic/ttk/ttkStubLib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/ttk/ttkStubLib.c

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/ttk/ttkStubLib.c > CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.i

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk/generic/ttk/ttkStubLib.c -o CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.s

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o.requires:

.PHONY : src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o.requires

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o.provides: src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o.requires
	$(MAKE) -f src/other/tk/CMakeFiles/tkstub.dir/build.make src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o.provides.build
.PHONY : src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o.provides

src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o.provides.build: src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o


# Object files for target tkstub
tkstub_OBJECTS = \
"CMakeFiles/tkstub.dir/generic/tkStubInit.c.o" \
"CMakeFiles/tkstub.dir/generic/tkStubLib.c.o" \
"CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o" \
"CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o"

# External object files for target tkstub
tkstub_EXTERNAL_OBJECTS =

lib/libtkstub.a: src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o
lib/libtkstub.a: src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o
lib/libtkstub.a: src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o
lib/libtkstub.a: src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o
lib/libtkstub.a: src/other/tk/CMakeFiles/tkstub.dir/build.make
lib/libtkstub.a: src/other/tk/CMakeFiles/tkstub.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C static library ../../../lib/libtkstub.a"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && $(CMAKE_COMMAND) -P CMakeFiles/tkstub.dir/cmake_clean_target.cmake
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tkstub.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/other/tk/CMakeFiles/tkstub.dir/build: lib/libtkstub.a

.PHONY : src/other/tk/CMakeFiles/tkstub.dir/build

src/other/tk/CMakeFiles/tkstub.dir/requires: src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubInit.c.o.requires
src/other/tk/CMakeFiles/tkstub.dir/requires: src/other/tk/CMakeFiles/tkstub.dir/generic/tkStubLib.c.o.requires
src/other/tk/CMakeFiles/tkstub.dir/requires: src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubInit.c.o.requires
src/other/tk/CMakeFiles/tkstub.dir/requires: src/other/tk/CMakeFiles/tkstub.dir/generic/ttk/ttkStubLib.c.o.requires

.PHONY : src/other/tk/CMakeFiles/tkstub.dir/requires

src/other/tk/CMakeFiles/tkstub.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk && $(CMAKE_COMMAND) -P CMakeFiles/tkstub.dir/cmake_clean.cmake
.PHONY : src/other/tk/CMakeFiles/tkstub.dir/clean

src/other/tk/CMakeFiles/tkstub.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tk /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tk/CMakeFiles/tkstub.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/tk/CMakeFiles/tkstub.dir/depend
