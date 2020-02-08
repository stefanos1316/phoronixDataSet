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
include src/tab/CMakeFiles/scriptsort.dir/depend.make

# Include the progress variables for this target.
include src/tab/CMakeFiles/scriptsort.dir/progress.make

# Include the compile flags for this target's objects.
include src/tab/CMakeFiles/scriptsort.dir/flags.make

src/tab/script.c: ../src/tab/script.l
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "[LEX][SS_Scanner] Building scanner with /usr/bin/flex"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab && /usr/bin/flex -l -o/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab/script.c script.l

src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o: src/tab/CMakeFiles/scriptsort.dir/flags.make
src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o: ../src/tab/scriptsort.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/scriptsort.dir/scriptsort.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab/scriptsort.c

src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/scriptsort.dir/scriptsort.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab/scriptsort.c > CMakeFiles/scriptsort.dir/scriptsort.c.i

src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/scriptsort.dir/scriptsort.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab/scriptsort.c -o CMakeFiles/scriptsort.dir/scriptsort.c.s

src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o.requires:

.PHONY : src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o.requires

src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o.provides: src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o.requires
	$(MAKE) -f src/tab/CMakeFiles/scriptsort.dir/build.make src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o.provides.build
.PHONY : src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o.provides

src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o.provides.build: src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o


src/tab/CMakeFiles/scriptsort.dir/script.c.o: src/tab/CMakeFiles/scriptsort.dir/flags.make
src/tab/CMakeFiles/scriptsort.dir/script.c.o: src/tab/script.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/tab/CMakeFiles/scriptsort.dir/script.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/scriptsort.dir/script.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab/script.c

src/tab/CMakeFiles/scriptsort.dir/script.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/scriptsort.dir/script.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab/script.c > CMakeFiles/scriptsort.dir/script.c.i

src/tab/CMakeFiles/scriptsort.dir/script.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/scriptsort.dir/script.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab/script.c -o CMakeFiles/scriptsort.dir/script.c.s

src/tab/CMakeFiles/scriptsort.dir/script.c.o.requires:

.PHONY : src/tab/CMakeFiles/scriptsort.dir/script.c.o.requires

src/tab/CMakeFiles/scriptsort.dir/script.c.o.provides: src/tab/CMakeFiles/scriptsort.dir/script.c.o.requires
	$(MAKE) -f src/tab/CMakeFiles/scriptsort.dir/build.make src/tab/CMakeFiles/scriptsort.dir/script.c.o.provides.build
.PHONY : src/tab/CMakeFiles/scriptsort.dir/script.c.o.provides

src/tab/CMakeFiles/scriptsort.dir/script.c.o.provides.build: src/tab/CMakeFiles/scriptsort.dir/script.c.o


# Object files for target scriptsort
scriptsort_OBJECTS = \
"CMakeFiles/scriptsort.dir/scriptsort.c.o" \
"CMakeFiles/scriptsort.dir/script.c.o"

# External object files for target scriptsort
scriptsort_EXTERNAL_OBJECTS =

bin/scriptsort: src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o
bin/scriptsort: src/tab/CMakeFiles/scriptsort.dir/script.c.o
bin/scriptsort: src/tab/CMakeFiles/scriptsort.dir/build.make
bin/scriptsort: lib/librt.so.20.0.1
bin/scriptsort: lib/libgdiam.so
bin/scriptsort: lib/libvds.so.1.0.1
bin/scriptsort: lib/libbrep.so.20.0.1
bin/scriptsort: lib/libnmg.so
bin/scriptsort: lib/libbg.so.20.0.1
bin/scriptsort: lib/libSPSR.so
bin/scriptsort: lib/libbn.so.20.0.1
bin/scriptsort: lib/libbu.so.20.0.1
bin/scriptsort: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/scriptsort: lib/libopenNURBS.so.2012.10.245
bin/scriptsort: lib/libp2t.so.1.0.1
bin/scriptsort: lib/libz.so.1.2.11
bin/scriptsort: lib/libregex.so.1.0.4
bin/scriptsort: lib/liblz4.so
bin/scriptsort: src/tab/CMakeFiles/scriptsort.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable ../../bin/scriptsort"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/scriptsort.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tab/CMakeFiles/scriptsort.dir/build: bin/scriptsort

.PHONY : src/tab/CMakeFiles/scriptsort.dir/build

src/tab/CMakeFiles/scriptsort.dir/requires: src/tab/CMakeFiles/scriptsort.dir/scriptsort.c.o.requires
src/tab/CMakeFiles/scriptsort.dir/requires: src/tab/CMakeFiles/scriptsort.dir/script.c.o.requires

.PHONY : src/tab/CMakeFiles/scriptsort.dir/requires

src/tab/CMakeFiles/scriptsort.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && $(CMAKE_COMMAND) -P CMakeFiles/scriptsort.dir/cmake_clean.cmake
.PHONY : src/tab/CMakeFiles/scriptsort.dir/clean

src/tab/CMakeFiles/scriptsort.dir/depend: src/tab/script.c
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab/CMakeFiles/scriptsort.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tab/CMakeFiles/scriptsort.dir/depend

