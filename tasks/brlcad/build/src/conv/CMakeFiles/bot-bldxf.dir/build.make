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
include src/conv/CMakeFiles/bot-bldxf.dir/depend.make

# Include the progress variables for this target.
include src/conv/CMakeFiles/bot-bldxf.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/CMakeFiles/bot-bldxf.dir/flags.make

src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o: src/conv/CMakeFiles/bot-bldxf.dir/flags.make
src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o: ../src/conv/dxf/bot-bldxf.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/dxf/bot-bldxf.c

src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/dxf/bot-bldxf.c > CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.i

src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/dxf/bot-bldxf.c -o CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.s

src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o.requires:

.PHONY : src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o.requires

src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o.provides: src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o.requires
	$(MAKE) -f src/conv/CMakeFiles/bot-bldxf.dir/build.make src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o.provides.build
.PHONY : src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o.provides

src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o.provides.build: src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o


# Object files for target bot-bldxf
bot__bldxf_OBJECTS = \
"CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o"

# External object files for target bot-bldxf
bot__bldxf_EXTERNAL_OBJECTS =

bin/bot-bldxf: src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o
bin/bot-bldxf: src/conv/CMakeFiles/bot-bldxf.dir/build.make
bin/bot-bldxf: lib/librt.so.20.0.1
bin/bot-bldxf: lib/libgdiam.so
bin/bot-bldxf: lib/libvds.so.1.0.1
bin/bot-bldxf: lib/libbrep.so.20.0.1
bin/bot-bldxf: lib/libnmg.so
bin/bot-bldxf: lib/libbg.so.20.0.1
bin/bot-bldxf: lib/libSPSR.so
bin/bot-bldxf: lib/libbn.so.20.0.1
bin/bot-bldxf: lib/libbu.so.20.0.1
bin/bot-bldxf: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/bot-bldxf: lib/libopenNURBS.so.2012.10.245
bin/bot-bldxf: lib/libp2t.so.1.0.1
bin/bot-bldxf: lib/libz.so.1.2.11
bin/bot-bldxf: lib/libregex.so.1.0.4
bin/bot-bldxf: lib/liblz4.so
bin/bot-bldxf: src/conv/CMakeFiles/bot-bldxf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/bot-bldxf"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bot-bldxf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/CMakeFiles/bot-bldxf.dir/build: bin/bot-bldxf

.PHONY : src/conv/CMakeFiles/bot-bldxf.dir/build

src/conv/CMakeFiles/bot-bldxf.dir/requires: src/conv/CMakeFiles/bot-bldxf.dir/dxf/bot-bldxf.c.o.requires

.PHONY : src/conv/CMakeFiles/bot-bldxf.dir/requires

src/conv/CMakeFiles/bot-bldxf.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -P CMakeFiles/bot-bldxf.dir/cmake_clean.cmake
.PHONY : src/conv/CMakeFiles/bot-bldxf.dir/clean

src/conv/CMakeFiles/bot-bldxf.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/CMakeFiles/bot-bldxf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/CMakeFiles/bot-bldxf.dir/depend
