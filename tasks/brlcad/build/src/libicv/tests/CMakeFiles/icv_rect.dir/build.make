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
include src/libicv/tests/CMakeFiles/icv_rect.dir/depend.make

# Include the progress variables for this target.
include src/libicv/tests/CMakeFiles/icv_rect.dir/progress.make

# Include the compile flags for this target's objects.
include src/libicv/tests/CMakeFiles/icv_rect.dir/flags.make

src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o: src/libicv/tests/CMakeFiles/icv_rect.dir/flags.make
src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o: ../src/libicv/tests/rect.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/icv_rect.dir/rect.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/tests/rect.c

src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/icv_rect.dir/rect.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/tests/rect.c > CMakeFiles/icv_rect.dir/rect.c.i

src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/icv_rect.dir/rect.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/tests/rect.c -o CMakeFiles/icv_rect.dir/rect.c.s

src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o.requires:

.PHONY : src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o.requires

src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o.provides: src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o.requires
	$(MAKE) -f src/libicv/tests/CMakeFiles/icv_rect.dir/build.make src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o.provides.build
.PHONY : src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o.provides

src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o.provides.build: src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o


# Object files for target icv_rect
icv_rect_OBJECTS = \
"CMakeFiles/icv_rect.dir/rect.c.o"

# External object files for target icv_rect
icv_rect_EXTERNAL_OBJECTS =

src/libicv/tests/icv_rect: src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o
src/libicv/tests/icv_rect: src/libicv/tests/CMakeFiles/icv_rect.dir/build.make
src/libicv/tests/icv_rect: lib/libicv.so.20.0.1
src/libicv/tests/icv_rect: lib/libbn.so.20.0.1
src/libicv/tests/icv_rect: lib/libbu.so.20.0.1
src/libicv/tests/icv_rect: /usr/lib/x86_64-linux-gnu/libuuid.so
src/libicv/tests/icv_rect: lib/libregex.so.1.0.4
src/libicv/tests/icv_rect: lib/libpng16.so.16.29.0
src/libicv/tests/icv_rect: lib/libz.so.1.2.11
src/libicv/tests/icv_rect: lib/libnetpbm.so
src/libicv/tests/icv_rect: src/libicv/tests/CMakeFiles/icv_rect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable icv_rect"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/icv_rect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libicv/tests/CMakeFiles/icv_rect.dir/build: src/libicv/tests/icv_rect

.PHONY : src/libicv/tests/CMakeFiles/icv_rect.dir/build

src/libicv/tests/CMakeFiles/icv_rect.dir/requires: src/libicv/tests/CMakeFiles/icv_rect.dir/rect.c.o.requires

.PHONY : src/libicv/tests/CMakeFiles/icv_rect.dir/requires

src/libicv/tests/CMakeFiles/icv_rect.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/tests && $(CMAKE_COMMAND) -P CMakeFiles/icv_rect.dir/cmake_clean.cmake
.PHONY : src/libicv/tests/CMakeFiles/icv_rect.dir/clean

src/libicv/tests/CMakeFiles/icv_rect.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/tests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/tests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/tests/CMakeFiles/icv_rect.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libicv/tests/CMakeFiles/icv_rect.dir/depend
