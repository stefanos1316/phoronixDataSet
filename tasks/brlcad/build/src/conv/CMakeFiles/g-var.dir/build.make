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
include src/conv/CMakeFiles/g-var.dir/depend.make

# Include the progress variables for this target.
include src/conv/CMakeFiles/g-var.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/CMakeFiles/g-var.dir/flags.make

src/conv/CMakeFiles/g-var.dir/g-var.c.o: src/conv/CMakeFiles/g-var.dir/flags.make
src/conv/CMakeFiles/g-var.dir/g-var.c.o: ../src/conv/g-var.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/CMakeFiles/g-var.dir/g-var.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/g-var.dir/g-var.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/g-var.c

src/conv/CMakeFiles/g-var.dir/g-var.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/g-var.dir/g-var.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/g-var.c > CMakeFiles/g-var.dir/g-var.c.i

src/conv/CMakeFiles/g-var.dir/g-var.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/g-var.dir/g-var.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/g-var.c -o CMakeFiles/g-var.dir/g-var.c.s

src/conv/CMakeFiles/g-var.dir/g-var.c.o.requires:

.PHONY : src/conv/CMakeFiles/g-var.dir/g-var.c.o.requires

src/conv/CMakeFiles/g-var.dir/g-var.c.o.provides: src/conv/CMakeFiles/g-var.dir/g-var.c.o.requires
	$(MAKE) -f src/conv/CMakeFiles/g-var.dir/build.make src/conv/CMakeFiles/g-var.dir/g-var.c.o.provides.build
.PHONY : src/conv/CMakeFiles/g-var.dir/g-var.c.o.provides

src/conv/CMakeFiles/g-var.dir/g-var.c.o.provides.build: src/conv/CMakeFiles/g-var.dir/g-var.c.o


# Object files for target g-var
g__var_OBJECTS = \
"CMakeFiles/g-var.dir/g-var.c.o"

# External object files for target g-var
g__var_EXTERNAL_OBJECTS =

bin/g-var: src/conv/CMakeFiles/g-var.dir/g-var.c.o
bin/g-var: src/conv/CMakeFiles/g-var.dir/build.make
bin/g-var: lib/librt.so.20.0.1
bin/g-var: lib/libgdiam.so
bin/g-var: lib/libvds.so.1.0.1
bin/g-var: lib/libbrep.so.20.0.1
bin/g-var: lib/libnmg.so
bin/g-var: lib/libbg.so.20.0.1
bin/g-var: lib/libSPSR.so
bin/g-var: lib/libbn.so.20.0.1
bin/g-var: lib/libbu.so.20.0.1
bin/g-var: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/g-var: lib/libopenNURBS.so.2012.10.245
bin/g-var: lib/libp2t.so.1.0.1
bin/g-var: lib/libz.so.1.2.11
bin/g-var: lib/libregex.so.1.0.4
bin/g-var: lib/liblz4.so
bin/g-var: src/conv/CMakeFiles/g-var.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/g-var"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/g-var.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/CMakeFiles/g-var.dir/build: bin/g-var

.PHONY : src/conv/CMakeFiles/g-var.dir/build

src/conv/CMakeFiles/g-var.dir/requires: src/conv/CMakeFiles/g-var.dir/g-var.c.o.requires

.PHONY : src/conv/CMakeFiles/g-var.dir/requires

src/conv/CMakeFiles/g-var.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -P CMakeFiles/g-var.dir/cmake_clean.cmake
.PHONY : src/conv/CMakeFiles/g-var.dir/clean

src/conv/CMakeFiles/g-var.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/CMakeFiles/g-var.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/CMakeFiles/g-var.dir/depend
