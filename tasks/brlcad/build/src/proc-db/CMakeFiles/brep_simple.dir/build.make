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
include src/proc-db/CMakeFiles/brep_simple.dir/depend.make

# Include the progress variables for this target.
include src/proc-db/CMakeFiles/brep_simple.dir/progress.make

# Include the compile flags for this target's objects.
include src/proc-db/CMakeFiles/brep_simple.dir/flags.make

src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o: src/proc-db/CMakeFiles/brep_simple.dir/flags.make
src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o: ../src/proc-db/brep_simple.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/brep_simple.dir/brep_simple.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/brep_simple.cpp

src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/brep_simple.dir/brep_simple.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/brep_simple.cpp > CMakeFiles/brep_simple.dir/brep_simple.cpp.i

src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/brep_simple.dir/brep_simple.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/brep_simple.cpp -o CMakeFiles/brep_simple.dir/brep_simple.cpp.s

src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o.requires:

.PHONY : src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o.requires

src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o.provides: src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o.requires
	$(MAKE) -f src/proc-db/CMakeFiles/brep_simple.dir/build.make src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o.provides.build
.PHONY : src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o.provides

src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o.provides.build: src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o


src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o: src/proc-db/CMakeFiles/brep_simple.dir/flags.make
src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o: ../src/proc-db/twistedcube.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/brep_simple.dir/twistedcube.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/twistedcube.cpp

src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/brep_simple.dir/twistedcube.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/twistedcube.cpp > CMakeFiles/brep_simple.dir/twistedcube.cpp.i

src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/brep_simple.dir/twistedcube.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/twistedcube.cpp -o CMakeFiles/brep_simple.dir/twistedcube.cpp.s

src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o.requires:

.PHONY : src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o.requires

src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o.provides: src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o.requires
	$(MAKE) -f src/proc-db/CMakeFiles/brep_simple.dir/build.make src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o.provides.build
.PHONY : src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o.provides

src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o.provides.build: src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o


# Object files for target brep_simple
brep_simple_OBJECTS = \
"CMakeFiles/brep_simple.dir/brep_simple.cpp.o" \
"CMakeFiles/brep_simple.dir/twistedcube.cpp.o"

# External object files for target brep_simple
brep_simple_EXTERNAL_OBJECTS =

src/proc-db/brep_simple: src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o
src/proc-db/brep_simple: src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o
src/proc-db/brep_simple: src/proc-db/CMakeFiles/brep_simple.dir/build.make
src/proc-db/brep_simple: lib/libwdb.so.20.0.1
src/proc-db/brep_simple: lib/librt.so.20.0.1
src/proc-db/brep_simple: lib/libgdiam.so
src/proc-db/brep_simple: lib/libvds.so.1.0.1
src/proc-db/brep_simple: lib/libbrep.so.20.0.1
src/proc-db/brep_simple: lib/libopenNURBS.so.2012.10.245
src/proc-db/brep_simple: lib/libp2t.so.1.0.1
src/proc-db/brep_simple: lib/libz.so.1.2.11
src/proc-db/brep_simple: lib/liblz4.so
src/proc-db/brep_simple: lib/libnmg.so
src/proc-db/brep_simple: lib/libbg.so.20.0.1
src/proc-db/brep_simple: lib/libSPSR.so
src/proc-db/brep_simple: lib/libbn.so.20.0.1
src/proc-db/brep_simple: lib/libbu.so.20.0.1
src/proc-db/brep_simple: /usr/lib/x86_64-linux-gnu/libuuid.so
src/proc-db/brep_simple: lib/libregex.so.1.0.4
src/proc-db/brep_simple: src/proc-db/CMakeFiles/brep_simple.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable brep_simple"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/brep_simple.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/proc-db/CMakeFiles/brep_simple.dir/build: src/proc-db/brep_simple

.PHONY : src/proc-db/CMakeFiles/brep_simple.dir/build

src/proc-db/CMakeFiles/brep_simple.dir/requires: src/proc-db/CMakeFiles/brep_simple.dir/brep_simple.cpp.o.requires
src/proc-db/CMakeFiles/brep_simple.dir/requires: src/proc-db/CMakeFiles/brep_simple.dir/twistedcube.cpp.o.requires

.PHONY : src/proc-db/CMakeFiles/brep_simple.dir/requires

src/proc-db/CMakeFiles/brep_simple.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && $(CMAKE_COMMAND) -P CMakeFiles/brep_simple.dir/cmake_clean.cmake
.PHONY : src/proc-db/CMakeFiles/brep_simple.dir/clean

src/proc-db/CMakeFiles/brep_simple.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db/CMakeFiles/brep_simple.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/proc-db/CMakeFiles/brep_simple.dir/depend

