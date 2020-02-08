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
include src/proc-db/CMakeFiles/tea_nmg.dir/depend.make

# Include the progress variables for this target.
include src/proc-db/CMakeFiles/tea_nmg.dir/progress.make

# Include the compile flags for this target's objects.
include src/proc-db/CMakeFiles/tea_nmg.dir/flags.make

src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o: src/proc-db/CMakeFiles/tea_nmg.dir/flags.make
src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o: ../src/proc-db/tea_nmg.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tea_nmg.dir/tea_nmg.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/tea_nmg.c

src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tea_nmg.dir/tea_nmg.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/tea_nmg.c > CMakeFiles/tea_nmg.dir/tea_nmg.c.i

src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tea_nmg.dir/tea_nmg.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/tea_nmg.c -o CMakeFiles/tea_nmg.dir/tea_nmg.c.s

src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o.requires:

.PHONY : src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o.requires

src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o.provides: src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o.requires
	$(MAKE) -f src/proc-db/CMakeFiles/tea_nmg.dir/build.make src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o.provides.build
.PHONY : src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o.provides

src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o.provides.build: src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o


# Object files for target tea_nmg
tea_nmg_OBJECTS = \
"CMakeFiles/tea_nmg.dir/tea_nmg.c.o"

# External object files for target tea_nmg
tea_nmg_EXTERNAL_OBJECTS =

src/proc-db/tea_nmg: src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o
src/proc-db/tea_nmg: src/proc-db/CMakeFiles/tea_nmg.dir/build.make
src/proc-db/tea_nmg: lib/libwdb.so.20.0.1
src/proc-db/tea_nmg: lib/librt.so.20.0.1
src/proc-db/tea_nmg: lib/libnmg.so
src/proc-db/tea_nmg: lib/libgdiam.so
src/proc-db/tea_nmg: lib/libvds.so.1.0.1
src/proc-db/tea_nmg: lib/libbrep.so.20.0.1
src/proc-db/tea_nmg: lib/libbg.so.20.0.1
src/proc-db/tea_nmg: lib/libSPSR.so
src/proc-db/tea_nmg: lib/libp2t.so.1.0.1
src/proc-db/tea_nmg: lib/liblz4.so
src/proc-db/tea_nmg: lib/libbn.so.20.0.1
src/proc-db/tea_nmg: lib/libbu.so.20.0.1
src/proc-db/tea_nmg: /usr/lib/x86_64-linux-gnu/libuuid.so
src/proc-db/tea_nmg: lib/libopenNURBS.so.2012.10.245
src/proc-db/tea_nmg: lib/libz.so.1.2.11
src/proc-db/tea_nmg: lib/libregex.so.1.0.4
src/proc-db/tea_nmg: src/proc-db/CMakeFiles/tea_nmg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable tea_nmg"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tea_nmg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/proc-db/CMakeFiles/tea_nmg.dir/build: src/proc-db/tea_nmg

.PHONY : src/proc-db/CMakeFiles/tea_nmg.dir/build

src/proc-db/CMakeFiles/tea_nmg.dir/requires: src/proc-db/CMakeFiles/tea_nmg.dir/tea_nmg.c.o.requires

.PHONY : src/proc-db/CMakeFiles/tea_nmg.dir/requires

src/proc-db/CMakeFiles/tea_nmg.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && $(CMAKE_COMMAND) -P CMakeFiles/tea_nmg.dir/cmake_clean.cmake
.PHONY : src/proc-db/CMakeFiles/tea_nmg.dir/clean

src/proc-db/CMakeFiles/tea_nmg.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db/CMakeFiles/tea_nmg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/proc-db/CMakeFiles/tea_nmg.dir/depend
