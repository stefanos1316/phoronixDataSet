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
include src/proc-db/CMakeFiles/pipe.dir/depend.make

# Include the progress variables for this target.
include src/proc-db/CMakeFiles/pipe.dir/progress.make

# Include the compile flags for this target's objects.
include src/proc-db/CMakeFiles/pipe.dir/flags.make

src/proc-db/CMakeFiles/pipe.dir/pipe.c.o: src/proc-db/CMakeFiles/pipe.dir/flags.make
src/proc-db/CMakeFiles/pipe.dir/pipe.c.o: ../src/proc-db/pipe.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/proc-db/CMakeFiles/pipe.dir/pipe.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/pipe.dir/pipe.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/pipe.c

src/proc-db/CMakeFiles/pipe.dir/pipe.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pipe.dir/pipe.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/pipe.c > CMakeFiles/pipe.dir/pipe.c.i

src/proc-db/CMakeFiles/pipe.dir/pipe.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pipe.dir/pipe.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/pipe.c -o CMakeFiles/pipe.dir/pipe.c.s

src/proc-db/CMakeFiles/pipe.dir/pipe.c.o.requires:

.PHONY : src/proc-db/CMakeFiles/pipe.dir/pipe.c.o.requires

src/proc-db/CMakeFiles/pipe.dir/pipe.c.o.provides: src/proc-db/CMakeFiles/pipe.dir/pipe.c.o.requires
	$(MAKE) -f src/proc-db/CMakeFiles/pipe.dir/build.make src/proc-db/CMakeFiles/pipe.dir/pipe.c.o.provides.build
.PHONY : src/proc-db/CMakeFiles/pipe.dir/pipe.c.o.provides

src/proc-db/CMakeFiles/pipe.dir/pipe.c.o.provides.build: src/proc-db/CMakeFiles/pipe.dir/pipe.c.o


# Object files for target pipe
pipe_OBJECTS = \
"CMakeFiles/pipe.dir/pipe.c.o"

# External object files for target pipe
pipe_EXTERNAL_OBJECTS =

src/proc-db/pipe: src/proc-db/CMakeFiles/pipe.dir/pipe.c.o
src/proc-db/pipe: src/proc-db/CMakeFiles/pipe.dir/build.make
src/proc-db/pipe: lib/libwdb.so.20.0.1
src/proc-db/pipe: lib/librt.so.20.0.1
src/proc-db/pipe: lib/libgdiam.so
src/proc-db/pipe: lib/libvds.so.1.0.1
src/proc-db/pipe: lib/libbrep.so.20.0.1
src/proc-db/pipe: lib/libp2t.so.1.0.1
src/proc-db/pipe: lib/liblz4.so
src/proc-db/pipe: lib/libnmg.so
src/proc-db/pipe: lib/libbg.so.20.0.1
src/proc-db/pipe: lib/libSPSR.so
src/proc-db/pipe: lib/libbn.so.20.0.1
src/proc-db/pipe: lib/libbu.so.20.0.1
src/proc-db/pipe: /usr/lib/x86_64-linux-gnu/libuuid.so
src/proc-db/pipe: lib/libopenNURBS.so.2012.10.245
src/proc-db/pipe: lib/libz.so.1.2.11
src/proc-db/pipe: lib/libregex.so.1.0.4
src/proc-db/pipe: src/proc-db/CMakeFiles/pipe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable pipe"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pipe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/proc-db/CMakeFiles/pipe.dir/build: src/proc-db/pipe

.PHONY : src/proc-db/CMakeFiles/pipe.dir/build

src/proc-db/CMakeFiles/pipe.dir/requires: src/proc-db/CMakeFiles/pipe.dir/pipe.c.o.requires

.PHONY : src/proc-db/CMakeFiles/pipe.dir/requires

src/proc-db/CMakeFiles/pipe.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && $(CMAKE_COMMAND) -P CMakeFiles/pipe.dir/cmake_clean.cmake
.PHONY : src/proc-db/CMakeFiles/pipe.dir/clean

src/proc-db/CMakeFiles/pipe.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db/CMakeFiles/pipe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/proc-db/CMakeFiles/pipe.dir/depend

