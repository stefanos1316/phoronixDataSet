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
include src/proc-db/CMakeFiles/brep_cobb.dir/depend.make

# Include the progress variables for this target.
include src/proc-db/CMakeFiles/brep_cobb.dir/progress.make

# Include the compile flags for this target's objects.
include src/proc-db/CMakeFiles/brep_cobb.dir/flags.make

src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o: src/proc-db/CMakeFiles/brep_cobb.dir/flags.make
src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o: ../src/proc-db/brep_cobb.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/brep_cobb.cpp

src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/brep_cobb.dir/brep_cobb.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/brep_cobb.cpp > CMakeFiles/brep_cobb.dir/brep_cobb.cpp.i

src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/brep_cobb.dir/brep_cobb.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db/brep_cobb.cpp -o CMakeFiles/brep_cobb.dir/brep_cobb.cpp.s

src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o.requires:

.PHONY : src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o.requires

src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o.provides: src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o.requires
	$(MAKE) -f src/proc-db/CMakeFiles/brep_cobb.dir/build.make src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o.provides.build
.PHONY : src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o.provides

src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o.provides.build: src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o


# Object files for target brep_cobb
brep_cobb_OBJECTS = \
"CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o"

# External object files for target brep_cobb
brep_cobb_EXTERNAL_OBJECTS =

src/proc-db/brep_cobb: src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o
src/proc-db/brep_cobb: src/proc-db/CMakeFiles/brep_cobb.dir/build.make
src/proc-db/brep_cobb: lib/libwdb.so.20.0.1
src/proc-db/brep_cobb: lib/librt.so.20.0.1
src/proc-db/brep_cobb: lib/libgdiam.so
src/proc-db/brep_cobb: lib/libvds.so.1.0.1
src/proc-db/brep_cobb: lib/libbrep.so.20.0.1
src/proc-db/brep_cobb: lib/libopenNURBS.so.2012.10.245
src/proc-db/brep_cobb: lib/libp2t.so.1.0.1
src/proc-db/brep_cobb: lib/libz.so.1.2.11
src/proc-db/brep_cobb: lib/liblz4.so
src/proc-db/brep_cobb: lib/libnmg.so
src/proc-db/brep_cobb: lib/libbg.so.20.0.1
src/proc-db/brep_cobb: lib/libSPSR.so
src/proc-db/brep_cobb: lib/libbn.so.20.0.1
src/proc-db/brep_cobb: lib/libbu.so.20.0.1
src/proc-db/brep_cobb: /usr/lib/x86_64-linux-gnu/libuuid.so
src/proc-db/brep_cobb: lib/libregex.so.1.0.4
src/proc-db/brep_cobb: src/proc-db/CMakeFiles/brep_cobb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable brep_cobb"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/brep_cobb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/proc-db/CMakeFiles/brep_cobb.dir/build: src/proc-db/brep_cobb

.PHONY : src/proc-db/CMakeFiles/brep_cobb.dir/build

src/proc-db/CMakeFiles/brep_cobb.dir/requires: src/proc-db/CMakeFiles/brep_cobb.dir/brep_cobb.cpp.o.requires

.PHONY : src/proc-db/CMakeFiles/brep_cobb.dir/requires

src/proc-db/CMakeFiles/brep_cobb.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db && $(CMAKE_COMMAND) -P CMakeFiles/brep_cobb.dir/cmake_clean.cmake
.PHONY : src/proc-db/CMakeFiles/brep_cobb.dir/clean

src/proc-db/CMakeFiles/brep_cobb.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/proc-db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/proc-db/CMakeFiles/brep_cobb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/proc-db/CMakeFiles/brep_cobb.dir/depend

