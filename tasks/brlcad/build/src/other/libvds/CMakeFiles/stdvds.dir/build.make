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
include src/other/libvds/CMakeFiles/stdvds.dir/depend.make

# Include the progress variables for this target.
include src/other/libvds/CMakeFiles/stdvds.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/libvds/CMakeFiles/stdvds.dir/flags.make

src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o: src/other/libvds/CMakeFiles/stdvds.dir/flags.make
src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o: ../src/other/libvds/stdvds.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/stdvds.dir/stdvds.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdvds.c

src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/stdvds.dir/stdvds.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdvds.c > CMakeFiles/stdvds.dir/stdvds.c.i

src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/stdvds.dir/stdvds.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdvds.c -o CMakeFiles/stdvds.dir/stdvds.c.s

src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o.requires

src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o.provides: src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/stdvds.dir/build.make src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o.provides

src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o.provides.build: src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o


src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o: src/other/libvds/CMakeFiles/stdvds.dir/flags.make
src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o: ../src/other/libvds/stdfold.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/stdvds.dir/stdfold.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdfold.c

src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/stdvds.dir/stdfold.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdfold.c > CMakeFiles/stdvds.dir/stdfold.c.i

src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/stdvds.dir/stdfold.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdfold.c -o CMakeFiles/stdvds.dir/stdfold.c.s

src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o.requires

src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o.provides: src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/stdvds.dir/build.make src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o.provides

src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o.provides.build: src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o


src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o: src/other/libvds/CMakeFiles/stdvds.dir/flags.make
src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o: ../src/other/libvds/stdvis.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/stdvds.dir/stdvis.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdvis.c

src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/stdvds.dir/stdvis.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdvis.c > CMakeFiles/stdvds.dir/stdvis.c.i

src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/stdvds.dir/stdvis.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/stdvis.c -o CMakeFiles/stdvds.dir/stdvis.c.s

src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o.requires

src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o.provides: src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/stdvds.dir/build.make src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o.provides

src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o.provides.build: src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o


# Object files for target stdvds
stdvds_OBJECTS = \
"CMakeFiles/stdvds.dir/stdvds.c.o" \
"CMakeFiles/stdvds.dir/stdfold.c.o" \
"CMakeFiles/stdvds.dir/stdvis.c.o"

# External object files for target stdvds
stdvds_EXTERNAL_OBJECTS =

lib/libstdvds.so.1.0.1: src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o
lib/libstdvds.so.1.0.1: src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o
lib/libstdvds.so.1.0.1: src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o
lib/libstdvds.so.1.0.1: src/other/libvds/CMakeFiles/stdvds.dir/build.make
lib/libstdvds.so.1.0.1: src/other/libvds/CMakeFiles/stdvds.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C shared library ../../../lib/libstdvds.so"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stdvds.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && $(CMAKE_COMMAND) -E cmake_symlink_library ../../../lib/libstdvds.so.1.0.1 ../../../lib/libstdvds.so.1 ../../../lib/libstdvds.so

lib/libstdvds.so.1: lib/libstdvds.so.1.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libstdvds.so.1

lib/libstdvds.so: lib/libstdvds.so.1.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libstdvds.so

# Rule to build all files generated by this target.
src/other/libvds/CMakeFiles/stdvds.dir/build: lib/libstdvds.so

.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/build

src/other/libvds/CMakeFiles/stdvds.dir/requires: src/other/libvds/CMakeFiles/stdvds.dir/stdvds.c.o.requires
src/other/libvds/CMakeFiles/stdvds.dir/requires: src/other/libvds/CMakeFiles/stdvds.dir/stdfold.c.o.requires
src/other/libvds/CMakeFiles/stdvds.dir/requires: src/other/libvds/CMakeFiles/stdvds.dir/stdvis.c.o.requires

.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/requires

src/other/libvds/CMakeFiles/stdvds.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && $(CMAKE_COMMAND) -P CMakeFiles/stdvds.dir/cmake_clean.cmake
.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/clean

src/other/libvds/CMakeFiles/stdvds.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds/CMakeFiles/stdvds.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/libvds/CMakeFiles/stdvds.dir/depend
