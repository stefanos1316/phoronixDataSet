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
include src/conv/CMakeFiles/bot_shell-vtk.dir/depend.make

# Include the progress variables for this target.
include src/conv/CMakeFiles/bot_shell-vtk.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/CMakeFiles/bot_shell-vtk.dir/flags.make

src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o: src/conv/CMakeFiles/bot_shell-vtk.dir/flags.make
src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o: ../src/conv/bot_shell-vtk.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/bot_shell-vtk.c

src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/bot_shell-vtk.c > CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.i

src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/bot_shell-vtk.c -o CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.s

src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o.requires:

.PHONY : src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o.requires

src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o.provides: src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o.requires
	$(MAKE) -f src/conv/CMakeFiles/bot_shell-vtk.dir/build.make src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o.provides.build
.PHONY : src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o.provides

src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o.provides.build: src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o


# Object files for target bot_shell-vtk
bot_shell__vtk_OBJECTS = \
"CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o"

# External object files for target bot_shell-vtk
bot_shell__vtk_EXTERNAL_OBJECTS =

bin/bot_shell-vtk: src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o
bin/bot_shell-vtk: src/conv/CMakeFiles/bot_shell-vtk.dir/build.make
bin/bot_shell-vtk: lib/librt.so.20.0.1
bin/bot_shell-vtk: lib/libgdiam.so
bin/bot_shell-vtk: lib/libvds.so.1.0.1
bin/bot_shell-vtk: lib/libbrep.so.20.0.1
bin/bot_shell-vtk: lib/libnmg.so
bin/bot_shell-vtk: lib/libbg.so.20.0.1
bin/bot_shell-vtk: lib/libSPSR.so
bin/bot_shell-vtk: lib/libbn.so.20.0.1
bin/bot_shell-vtk: lib/libbu.so.20.0.1
bin/bot_shell-vtk: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/bot_shell-vtk: lib/libopenNURBS.so.2012.10.245
bin/bot_shell-vtk: lib/libp2t.so.1.0.1
bin/bot_shell-vtk: lib/libz.so.1.2.11
bin/bot_shell-vtk: lib/libregex.so.1.0.4
bin/bot_shell-vtk: lib/liblz4.so
bin/bot_shell-vtk: src/conv/CMakeFiles/bot_shell-vtk.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/bot_shell-vtk"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bot_shell-vtk.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/CMakeFiles/bot_shell-vtk.dir/build: bin/bot_shell-vtk

.PHONY : src/conv/CMakeFiles/bot_shell-vtk.dir/build

src/conv/CMakeFiles/bot_shell-vtk.dir/requires: src/conv/CMakeFiles/bot_shell-vtk.dir/bot_shell-vtk.c.o.requires

.PHONY : src/conv/CMakeFiles/bot_shell-vtk.dir/requires

src/conv/CMakeFiles/bot_shell-vtk.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -P CMakeFiles/bot_shell-vtk.dir/cmake_clean.cmake
.PHONY : src/conv/CMakeFiles/bot_shell-vtk.dir/clean

src/conv/CMakeFiles/bot_shell-vtk.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/CMakeFiles/bot_shell-vtk.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/CMakeFiles/bot_shell-vtk.dir/depend
