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
include src/irprep/CMakeFiles/ir-X.dir/depend.make

# Include the progress variables for this target.
include src/irprep/CMakeFiles/ir-X.dir/progress.make

# Include the compile flags for this target's objects.
include src/irprep/CMakeFiles/ir-X.dir/flags.make

src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o: src/irprep/CMakeFiles/ir-X.dir/flags.make
src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o: ../src/irprep/ir-X.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ir-X.dir/ir-X.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/ir-X.c

src/irprep/CMakeFiles/ir-X.dir/ir-X.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ir-X.dir/ir-X.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/ir-X.c > CMakeFiles/ir-X.dir/ir-X.c.i

src/irprep/CMakeFiles/ir-X.dir/ir-X.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ir-X.dir/ir-X.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/ir-X.c -o CMakeFiles/ir-X.dir/ir-X.c.s

src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o.requires:

.PHONY : src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o.requires

src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o.provides: src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o.requires
	$(MAKE) -f src/irprep/CMakeFiles/ir-X.dir/build.make src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o.provides.build
.PHONY : src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o.provides

src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o.provides.build: src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o


# Object files for target ir-X
ir__X_OBJECTS = \
"CMakeFiles/ir-X.dir/ir-X.c.o"

# External object files for target ir-X
ir__X_EXTERNAL_OBJECTS =

bin/ir-X: src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o
bin/ir-X: src/irprep/CMakeFiles/ir-X.dir/build.make
bin/ir-X: lib/libbu.so.20.0.1
bin/ir-X: /usr/lib/x86_64-linux-gnu/libSM.so
bin/ir-X: /usr/lib/x86_64-linux-gnu/libICE.so
bin/ir-X: /usr/lib/x86_64-linux-gnu/libX11.so
bin/ir-X: /usr/lib/x86_64-linux-gnu/libXext.so
bin/ir-X: /usr/lib/x86_64-linux-gnu/libXi.so
bin/ir-X: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/ir-X: lib/libregex.so.1.0.4
bin/ir-X: src/irprep/CMakeFiles/ir-X.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/ir-X"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ir-X.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/irprep/CMakeFiles/ir-X.dir/build: bin/ir-X

.PHONY : src/irprep/CMakeFiles/ir-X.dir/build

src/irprep/CMakeFiles/ir-X.dir/requires: src/irprep/CMakeFiles/ir-X.dir/ir-X.c.o.requires

.PHONY : src/irprep/CMakeFiles/ir-X.dir/requires

src/irprep/CMakeFiles/ir-X.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && $(CMAKE_COMMAND) -P CMakeFiles/ir-X.dir/cmake_clean.cmake
.PHONY : src/irprep/CMakeFiles/ir-X.dir/clean

src/irprep/CMakeFiles/ir-X.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep/CMakeFiles/ir-X.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/irprep/CMakeFiles/ir-X.dir/depend

