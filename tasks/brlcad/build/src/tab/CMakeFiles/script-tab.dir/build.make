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
include src/tab/CMakeFiles/script-tab.dir/depend.make

# Include the progress variables for this target.
include src/tab/CMakeFiles/script-tab.dir/progress.make

# Include the compile flags for this target's objects.
include src/tab/CMakeFiles/script-tab.dir/flags.make

src/tab/CMakeFiles/script-tab.dir/script-tab.c.o: src/tab/CMakeFiles/script-tab.dir/flags.make
src/tab/CMakeFiles/script-tab.dir/script-tab.c.o: ../src/tab/script-tab.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/tab/CMakeFiles/script-tab.dir/script-tab.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/script-tab.dir/script-tab.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab/script-tab.c

src/tab/CMakeFiles/script-tab.dir/script-tab.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/script-tab.dir/script-tab.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab/script-tab.c > CMakeFiles/script-tab.dir/script-tab.c.i

src/tab/CMakeFiles/script-tab.dir/script-tab.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/script-tab.dir/script-tab.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab/script-tab.c -o CMakeFiles/script-tab.dir/script-tab.c.s

src/tab/CMakeFiles/script-tab.dir/script-tab.c.o.requires:

.PHONY : src/tab/CMakeFiles/script-tab.dir/script-tab.c.o.requires

src/tab/CMakeFiles/script-tab.dir/script-tab.c.o.provides: src/tab/CMakeFiles/script-tab.dir/script-tab.c.o.requires
	$(MAKE) -f src/tab/CMakeFiles/script-tab.dir/build.make src/tab/CMakeFiles/script-tab.dir/script-tab.c.o.provides.build
.PHONY : src/tab/CMakeFiles/script-tab.dir/script-tab.c.o.provides

src/tab/CMakeFiles/script-tab.dir/script-tab.c.o.provides.build: src/tab/CMakeFiles/script-tab.dir/script-tab.c.o


# Object files for target script-tab
script__tab_OBJECTS = \
"CMakeFiles/script-tab.dir/script-tab.c.o"

# External object files for target script-tab
script__tab_EXTERNAL_OBJECTS =

bin/script-tab: src/tab/CMakeFiles/script-tab.dir/script-tab.c.o
bin/script-tab: src/tab/CMakeFiles/script-tab.dir/build.make
bin/script-tab: lib/librt.so.20.0.1
bin/script-tab: lib/libgdiam.so
bin/script-tab: lib/libvds.so.1.0.1
bin/script-tab: lib/libbrep.so.20.0.1
bin/script-tab: lib/libnmg.so
bin/script-tab: lib/libbg.so.20.0.1
bin/script-tab: lib/libbn.so.20.0.1
bin/script-tab: lib/libbu.so.20.0.1
bin/script-tab: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/script-tab: lib/libSPSR.so
bin/script-tab: lib/libopenNURBS.so.2012.10.245
bin/script-tab: lib/libp2t.so.1.0.1
bin/script-tab: lib/libz.so.1.2.11
bin/script-tab: lib/libregex.so.1.0.4
bin/script-tab: lib/liblz4.so
bin/script-tab: src/tab/CMakeFiles/script-tab.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/script-tab"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/script-tab.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tab/CMakeFiles/script-tab.dir/build: bin/script-tab

.PHONY : src/tab/CMakeFiles/script-tab.dir/build

src/tab/CMakeFiles/script-tab.dir/requires: src/tab/CMakeFiles/script-tab.dir/script-tab.c.o.requires

.PHONY : src/tab/CMakeFiles/script-tab.dir/requires

src/tab/CMakeFiles/script-tab.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab && $(CMAKE_COMMAND) -P CMakeFiles/script-tab.dir/cmake_clean.cmake
.PHONY : src/tab/CMakeFiles/script-tab.dir/clean

src/tab/CMakeFiles/script-tab.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tab /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tab/CMakeFiles/script-tab.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tab/CMakeFiles/script-tab.dir/depend

