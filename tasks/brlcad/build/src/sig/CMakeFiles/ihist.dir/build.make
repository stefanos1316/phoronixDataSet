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
include src/sig/CMakeFiles/ihist.dir/depend.make

# Include the progress variables for this target.
include src/sig/CMakeFiles/ihist.dir/progress.make

# Include the compile flags for this target's objects.
include src/sig/CMakeFiles/ihist.dir/flags.make

src/sig/CMakeFiles/ihist.dir/ihist.c.o: src/sig/CMakeFiles/ihist.dir/flags.make
src/sig/CMakeFiles/ihist.dir/ihist.c.o: ../src/sig/ihist.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/sig/CMakeFiles/ihist.dir/ihist.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/sig && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ihist.dir/ihist.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/sig/ihist.c

src/sig/CMakeFiles/ihist.dir/ihist.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ihist.dir/ihist.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/sig && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/sig/ihist.c > CMakeFiles/ihist.dir/ihist.c.i

src/sig/CMakeFiles/ihist.dir/ihist.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ihist.dir/ihist.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/sig && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/sig/ihist.c -o CMakeFiles/ihist.dir/ihist.c.s

src/sig/CMakeFiles/ihist.dir/ihist.c.o.requires:

.PHONY : src/sig/CMakeFiles/ihist.dir/ihist.c.o.requires

src/sig/CMakeFiles/ihist.dir/ihist.c.o.provides: src/sig/CMakeFiles/ihist.dir/ihist.c.o.requires
	$(MAKE) -f src/sig/CMakeFiles/ihist.dir/build.make src/sig/CMakeFiles/ihist.dir/ihist.c.o.provides.build
.PHONY : src/sig/CMakeFiles/ihist.dir/ihist.c.o.provides

src/sig/CMakeFiles/ihist.dir/ihist.c.o.provides.build: src/sig/CMakeFiles/ihist.dir/ihist.c.o


# Object files for target ihist
ihist_OBJECTS = \
"CMakeFiles/ihist.dir/ihist.c.o"

# External object files for target ihist
ihist_EXTERNAL_OBJECTS =

bin/ihist: src/sig/CMakeFiles/ihist.dir/ihist.c.o
bin/ihist: src/sig/CMakeFiles/ihist.dir/build.make
bin/ihist: lib/libbu.so.20.0.1
bin/ihist: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/ihist: lib/libregex.so.1.0.4
bin/ihist: src/sig/CMakeFiles/ihist.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/ihist"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/sig && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ihist.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/sig/CMakeFiles/ihist.dir/build: bin/ihist

.PHONY : src/sig/CMakeFiles/ihist.dir/build

src/sig/CMakeFiles/ihist.dir/requires: src/sig/CMakeFiles/ihist.dir/ihist.c.o.requires

.PHONY : src/sig/CMakeFiles/ihist.dir/requires

src/sig/CMakeFiles/ihist.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/sig && $(CMAKE_COMMAND) -P CMakeFiles/ihist.dir/cmake_clean.cmake
.PHONY : src/sig/CMakeFiles/ihist.dir/clean

src/sig/CMakeFiles/ihist.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/sig /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/sig /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/sig/CMakeFiles/ihist.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/sig/CMakeFiles/ihist.dir/depend

