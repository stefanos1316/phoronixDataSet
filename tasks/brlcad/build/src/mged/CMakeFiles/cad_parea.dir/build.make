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
include src/mged/CMakeFiles/cad_parea.dir/depend.make

# Include the progress variables for this target.
include src/mged/CMakeFiles/cad_parea.dir/progress.make

# Include the compile flags for this target's objects.
include src/mged/CMakeFiles/cad_parea.dir/flags.make

src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o: src/mged/CMakeFiles/cad_parea.dir/flags.make
src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o: ../src/mged/cad_parea.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cad_parea.dir/cad_parea.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/mged/cad_parea.c

src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cad_parea.dir/cad_parea.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/mged/cad_parea.c > CMakeFiles/cad_parea.dir/cad_parea.c.i

src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cad_parea.dir/cad_parea.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/mged/cad_parea.c -o CMakeFiles/cad_parea.dir/cad_parea.c.s

src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o.requires:

.PHONY : src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o.requires

src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o.provides: src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o.requires
	$(MAKE) -f src/mged/CMakeFiles/cad_parea.dir/build.make src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o.provides.build
.PHONY : src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o.provides

src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o.provides.build: src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o


# Object files for target cad_parea
cad_parea_OBJECTS = \
"CMakeFiles/cad_parea.dir/cad_parea.c.o"

# External object files for target cad_parea
cad_parea_EXTERNAL_OBJECTS =

bin/cad_parea: src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o
bin/cad_parea: src/mged/CMakeFiles/cad_parea.dir/build.make
bin/cad_parea: lib/libbu.so.20.0.1
bin/cad_parea: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/cad_parea: lib/libregex.so.1.0.4
bin/cad_parea: src/mged/CMakeFiles/cad_parea.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/cad_parea"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cad_parea.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/mged/CMakeFiles/cad_parea.dir/build: bin/cad_parea

.PHONY : src/mged/CMakeFiles/cad_parea.dir/build

src/mged/CMakeFiles/cad_parea.dir/requires: src/mged/CMakeFiles/cad_parea.dir/cad_parea.c.o.requires

.PHONY : src/mged/CMakeFiles/cad_parea.dir/requires

src/mged/CMakeFiles/cad_parea.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged && $(CMAKE_COMMAND) -P CMakeFiles/cad_parea.dir/cmake_clean.cmake
.PHONY : src/mged/CMakeFiles/cad_parea.dir/clean

src/mged/CMakeFiles/cad_parea.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/mged /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/mged/CMakeFiles/cad_parea.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/mged/CMakeFiles/cad_parea.dir/depend
