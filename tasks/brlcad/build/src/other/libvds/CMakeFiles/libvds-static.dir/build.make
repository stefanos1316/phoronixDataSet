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
include src/other/libvds/CMakeFiles/libvds-static.dir/depend.make

# Include the progress variables for this target.
include src/other/libvds/CMakeFiles/libvds-static.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/libvds/CMakeFiles/libvds-static.dir/flags.make

src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o: src/other/libvds/CMakeFiles/libvds-static.dir/flags.make
src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o: ../src/other/libvds/build.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libvds-static.dir/build.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/build.c

src/other/libvds/CMakeFiles/libvds-static.dir/build.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libvds-static.dir/build.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/build.c > CMakeFiles/libvds-static.dir/build.c.i

src/other/libvds/CMakeFiles/libvds-static.dir/build.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libvds-static.dir/build.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/build.c -o CMakeFiles/libvds-static.dir/build.c.s

src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o.requires

src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o.provides: src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/libvds-static.dir/build.make src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o.provides

src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o.provides.build: src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o


src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o: src/other/libvds/CMakeFiles/libvds-static.dir/flags.make
src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o: ../src/other/libvds/cluster.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libvds-static.dir/cluster.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/cluster.c

src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libvds-static.dir/cluster.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/cluster.c > CMakeFiles/libvds-static.dir/cluster.c.i

src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libvds-static.dir/cluster.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/cluster.c -o CMakeFiles/libvds-static.dir/cluster.c.s

src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o.requires

src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o.provides: src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/libvds-static.dir/build.make src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o.provides

src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o.provides.build: src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o


src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o: src/other/libvds/CMakeFiles/libvds-static.dir/flags.make
src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o: ../src/other/libvds/dynamic.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libvds-static.dir/dynamic.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/dynamic.c

src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libvds-static.dir/dynamic.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/dynamic.c > CMakeFiles/libvds-static.dir/dynamic.c.i

src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libvds-static.dir/dynamic.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/dynamic.c -o CMakeFiles/libvds-static.dir/dynamic.c.s

src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o.requires

src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o.provides: src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/libvds-static.dir/build.make src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o.provides

src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o.provides.build: src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o


src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o: src/other/libvds/CMakeFiles/libvds-static.dir/flags.make
src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o: ../src/other/libvds/render.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libvds-static.dir/render.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/render.c

src/other/libvds/CMakeFiles/libvds-static.dir/render.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libvds-static.dir/render.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/render.c > CMakeFiles/libvds-static.dir/render.c.i

src/other/libvds/CMakeFiles/libvds-static.dir/render.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libvds-static.dir/render.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/render.c -o CMakeFiles/libvds-static.dir/render.c.s

src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o.requires

src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o.provides: src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/libvds-static.dir/build.make src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o.provides

src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o.provides.build: src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o


src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o: src/other/libvds/CMakeFiles/libvds-static.dir/flags.make
src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o: ../src/other/libvds/util.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libvds-static.dir/util.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/util.c

src/other/libvds/CMakeFiles/libvds-static.dir/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libvds-static.dir/util.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/util.c > CMakeFiles/libvds-static.dir/util.c.i

src/other/libvds/CMakeFiles/libvds-static.dir/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libvds-static.dir/util.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/util.c -o CMakeFiles/libvds-static.dir/util.c.s

src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o.requires

src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o.provides: src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/libvds-static.dir/build.make src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o.provides

src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o.provides.build: src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o


src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o: src/other/libvds/CMakeFiles/libvds-static.dir/flags.make
src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o: ../src/other/libvds/file.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libvds-static.dir/file.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/file.c

src/other/libvds/CMakeFiles/libvds-static.dir/file.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libvds-static.dir/file.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/file.c > CMakeFiles/libvds-static.dir/file.c.i

src/other/libvds/CMakeFiles/libvds-static.dir/file.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libvds-static.dir/file.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds/file.c -o CMakeFiles/libvds-static.dir/file.c.s

src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o.requires:

.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o.requires

src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o.provides: src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o.requires
	$(MAKE) -f src/other/libvds/CMakeFiles/libvds-static.dir/build.make src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o.provides.build
.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o.provides

src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o.provides.build: src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o


# Object files for target libvds-static
libvds__static_OBJECTS = \
"CMakeFiles/libvds-static.dir/build.c.o" \
"CMakeFiles/libvds-static.dir/cluster.c.o" \
"CMakeFiles/libvds-static.dir/dynamic.c.o" \
"CMakeFiles/libvds-static.dir/render.c.o" \
"CMakeFiles/libvds-static.dir/util.c.o" \
"CMakeFiles/libvds-static.dir/file.c.o"

# External object files for target libvds-static
libvds__static_EXTERNAL_OBJECTS =

lib/libvds.a: src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o
lib/libvds.a: src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o
lib/libvds.a: src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o
lib/libvds.a: src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o
lib/libvds.a: src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o
lib/libvds.a: src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o
lib/libvds.a: src/other/libvds/CMakeFiles/libvds-static.dir/build.make
lib/libvds.a: src/other/libvds/CMakeFiles/libvds-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C static library ../../../lib/libvds.a"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && $(CMAKE_COMMAND) -P CMakeFiles/libvds-static.dir/cmake_clean_target.cmake
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libvds-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/other/libvds/CMakeFiles/libvds-static.dir/build: lib/libvds.a

.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/build

src/other/libvds/CMakeFiles/libvds-static.dir/requires: src/other/libvds/CMakeFiles/libvds-static.dir/build.c.o.requires
src/other/libvds/CMakeFiles/libvds-static.dir/requires: src/other/libvds/CMakeFiles/libvds-static.dir/cluster.c.o.requires
src/other/libvds/CMakeFiles/libvds-static.dir/requires: src/other/libvds/CMakeFiles/libvds-static.dir/dynamic.c.o.requires
src/other/libvds/CMakeFiles/libvds-static.dir/requires: src/other/libvds/CMakeFiles/libvds-static.dir/render.c.o.requires
src/other/libvds/CMakeFiles/libvds-static.dir/requires: src/other/libvds/CMakeFiles/libvds-static.dir/util.c.o.requires
src/other/libvds/CMakeFiles/libvds-static.dir/requires: src/other/libvds/CMakeFiles/libvds-static.dir/file.c.o.requires

.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/requires

src/other/libvds/CMakeFiles/libvds-static.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds && $(CMAKE_COMMAND) -P CMakeFiles/libvds-static.dir/cmake_clean.cmake
.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/clean

src/other/libvds/CMakeFiles/libvds-static.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libvds /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libvds/CMakeFiles/libvds-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/libvds/CMakeFiles/libvds-static.dir/depend

