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
include src/other/libtermlib/CMakeFiles/termlib-static.dir/depend.make

# Include the progress variables for this target.
include src/other/libtermlib/CMakeFiles/termlib-static.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/libtermlib/CMakeFiles/termlib-static.dir/flags.make

src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o: src/other/libtermlib/CMakeFiles/termlib-static.dir/flags.make
src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o: ../src/other/libtermlib/termcap.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/termlib-static.dir/termcap.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/termcap.c

src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/termlib-static.dir/termcap.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/termcap.c > CMakeFiles/termlib-static.dir/termcap.c.i

src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/termlib-static.dir/termcap.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/termcap.c -o CMakeFiles/termlib-static.dir/termcap.c.s

src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o.requires:

.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o.requires

src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o.provides: src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o.requires
	$(MAKE) -f src/other/libtermlib/CMakeFiles/termlib-static.dir/build.make src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o.provides.build
.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o.provides

src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o.provides.build: src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o


src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o: src/other/libtermlib/CMakeFiles/termlib-static.dir/flags.make
src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o: ../src/other/libtermlib/tgoto.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/termlib-static.dir/tgoto.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/tgoto.c

src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/termlib-static.dir/tgoto.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/tgoto.c > CMakeFiles/termlib-static.dir/tgoto.c.i

src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/termlib-static.dir/tgoto.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/tgoto.c -o CMakeFiles/termlib-static.dir/tgoto.c.s

src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o.requires:

.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o.requires

src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o.provides: src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o.requires
	$(MAKE) -f src/other/libtermlib/CMakeFiles/termlib-static.dir/build.make src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o.provides.build
.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o.provides

src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o.provides.build: src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o


src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o: src/other/libtermlib/CMakeFiles/termlib-static.dir/flags.make
src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o: ../src/other/libtermlib/tputs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/termlib-static.dir/tputs.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/tputs.c

src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/termlib-static.dir/tputs.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/tputs.c > CMakeFiles/termlib-static.dir/tputs.c.i

src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/termlib-static.dir/tputs.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib/tputs.c -o CMakeFiles/termlib-static.dir/tputs.c.s

src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o.requires:

.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o.requires

src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o.provides: src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o.requires
	$(MAKE) -f src/other/libtermlib/CMakeFiles/termlib-static.dir/build.make src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o.provides.build
.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o.provides

src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o.provides.build: src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o


# Object files for target termlib-static
termlib__static_OBJECTS = \
"CMakeFiles/termlib-static.dir/termcap.c.o" \
"CMakeFiles/termlib-static.dir/tgoto.c.o" \
"CMakeFiles/termlib-static.dir/tputs.c.o"

# External object files for target termlib-static
termlib__static_EXTERNAL_OBJECTS =

lib/libtermlib.a: src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o
lib/libtermlib.a: src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o
lib/libtermlib.a: src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o
lib/libtermlib.a: src/other/libtermlib/CMakeFiles/termlib-static.dir/build.make
lib/libtermlib.a: src/other/libtermlib/CMakeFiles/termlib-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C static library ../../../lib/libtermlib.a"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && $(CMAKE_COMMAND) -P CMakeFiles/termlib-static.dir/cmake_clean_target.cmake
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/termlib-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/other/libtermlib/CMakeFiles/termlib-static.dir/build: lib/libtermlib.a

.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/build

src/other/libtermlib/CMakeFiles/termlib-static.dir/requires: src/other/libtermlib/CMakeFiles/termlib-static.dir/termcap.c.o.requires
src/other/libtermlib/CMakeFiles/termlib-static.dir/requires: src/other/libtermlib/CMakeFiles/termlib-static.dir/tgoto.c.o.requires
src/other/libtermlib/CMakeFiles/termlib-static.dir/requires: src/other/libtermlib/CMakeFiles/termlib-static.dir/tputs.c.o.requires

.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/requires

src/other/libtermlib/CMakeFiles/termlib-static.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib && $(CMAKE_COMMAND) -P CMakeFiles/termlib-static.dir/cmake_clean.cmake
.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/clean

src/other/libtermlib/CMakeFiles/termlib-static.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libtermlib /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libtermlib/CMakeFiles/termlib-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/libtermlib/CMakeFiles/termlib-static.dir/depend
