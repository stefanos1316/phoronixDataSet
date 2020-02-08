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
include src/irprep/CMakeFiles/showtherm.dir/depend.make

# Include the progress variables for this target.
include src/irprep/CMakeFiles/showtherm.dir/progress.make

# Include the compile flags for this target's objects.
include src/irprep/CMakeFiles/showtherm.dir/flags.make

src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o: src/irprep/CMakeFiles/showtherm.dir/flags.make
src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o: ../src/irprep/showtherm.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/showtherm.dir/showtherm.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/showtherm.c

src/irprep/CMakeFiles/showtherm.dir/showtherm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/showtherm.dir/showtherm.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/showtherm.c > CMakeFiles/showtherm.dir/showtherm.c.i

src/irprep/CMakeFiles/showtherm.dir/showtherm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/showtherm.dir/showtherm.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/showtherm.c -o CMakeFiles/showtherm.dir/showtherm.c.s

src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o.requires:

.PHONY : src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o.requires

src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o.provides: src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o.requires
	$(MAKE) -f src/irprep/CMakeFiles/showtherm.dir/build.make src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o.provides.build
.PHONY : src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o.provides

src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o.provides.build: src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o


# Object files for target showtherm
showtherm_OBJECTS = \
"CMakeFiles/showtherm.dir/showtherm.c.o"

# External object files for target showtherm
showtherm_EXTERNAL_OBJECTS =

bin/showtherm: src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o
bin/showtherm: src/irprep/CMakeFiles/showtherm.dir/build.make
bin/showtherm: lib/librt.so.20.0.1
bin/showtherm: lib/libgdiam.so
bin/showtherm: lib/libvds.so.1.0.1
bin/showtherm: lib/libbrep.so.20.0.1
bin/showtherm: lib/libnmg.so
bin/showtherm: lib/libbg.so.20.0.1
bin/showtherm: lib/libSPSR.so
bin/showtherm: lib/libbn.so.20.0.1
bin/showtherm: lib/libbu.so.20.0.1
bin/showtherm: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/showtherm: lib/libopenNURBS.so.2012.10.245
bin/showtherm: lib/libp2t.so.1.0.1
bin/showtherm: lib/libz.so.1.2.11
bin/showtherm: lib/libregex.so.1.0.4
bin/showtherm: lib/liblz4.so
bin/showtherm: src/irprep/CMakeFiles/showtherm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/showtherm"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/showtherm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/irprep/CMakeFiles/showtherm.dir/build: bin/showtherm

.PHONY : src/irprep/CMakeFiles/showtherm.dir/build

src/irprep/CMakeFiles/showtherm.dir/requires: src/irprep/CMakeFiles/showtherm.dir/showtherm.c.o.requires

.PHONY : src/irprep/CMakeFiles/showtherm.dir/requires

src/irprep/CMakeFiles/showtherm.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && $(CMAKE_COMMAND) -P CMakeFiles/showtherm.dir/cmake_clean.cmake
.PHONY : src/irprep/CMakeFiles/showtherm.dir/clean

src/irprep/CMakeFiles/showtherm.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep/CMakeFiles/showtherm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/irprep/CMakeFiles/showtherm.dir/depend

