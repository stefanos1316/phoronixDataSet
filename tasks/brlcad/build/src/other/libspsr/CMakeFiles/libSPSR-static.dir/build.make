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
include src/other/libspsr/CMakeFiles/libSPSR-static.dir/depend.make

# Include the progress variables for this target.
include src/other/libspsr/CMakeFiles/libSPSR-static.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/libspsr/CMakeFiles/libSPSR-static.dir/flags.make

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o: src/other/libspsr/CMakeFiles/libSPSR-static.dir/flags.make
src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o: ../src/other/libspsr/Src/Factor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/Factor.cpp

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/Factor.cpp > CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.i

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/Factor.cpp -o CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.s

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o.requires:

.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o.requires

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o.provides: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o.requires
	$(MAKE) -f src/other/libspsr/CMakeFiles/libSPSR-static.dir/build.make src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o.provides.build
.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o.provides

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o.provides.build: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o


src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o: src/other/libspsr/CMakeFiles/libSPSR-static.dir/flags.make
src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o: ../src/other/libspsr/Src/Geometry.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/Geometry.cpp

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/Geometry.cpp > CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.i

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/Geometry.cpp -o CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.s

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o.requires:

.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o.requires

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o.provides: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o.requires
	$(MAKE) -f src/other/libspsr/CMakeFiles/libSPSR-static.dir/build.make src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o.provides.build
.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o.provides

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o.provides.build: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o


src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o: src/other/libspsr/CMakeFiles/libSPSR-static.dir/flags.make
src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o: ../src/other/libspsr/Src/MarchingCubes.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/MarchingCubes.cpp

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/MarchingCubes.cpp > CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.i

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/MarchingCubes.cpp -o CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.s

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o.requires:

.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o.requires

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o.provides: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o.requires
	$(MAKE) -f src/other/libspsr/CMakeFiles/libSPSR-static.dir/build.make src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o.provides.build
.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o.provides

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o.provides.build: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o


src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o: src/other/libspsr/CMakeFiles/libSPSR-static.dir/flags.make
src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o: ../src/other/libspsr/Src/SPSR.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/SPSR.cpp

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/SPSR.cpp > CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.i

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr/Src/SPSR.cpp -o CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.s

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o.requires:

.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o.requires

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o.provides: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o.requires
	$(MAKE) -f src/other/libspsr/CMakeFiles/libSPSR-static.dir/build.make src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o.provides.build
.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o.provides

src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o.provides.build: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o


# Object files for target libSPSR-static
libSPSR__static_OBJECTS = \
"CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o" \
"CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o" \
"CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o" \
"CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o"

# External object files for target libSPSR-static
libSPSR__static_EXTERNAL_OBJECTS =

lib/libSPSR.a: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o
lib/libSPSR.a: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o
lib/libSPSR.a: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o
lib/libSPSR.a: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o
lib/libSPSR.a: src/other/libspsr/CMakeFiles/libSPSR-static.dir/build.make
lib/libSPSR.a: src/other/libspsr/CMakeFiles/libSPSR-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library ../../../lib/libSPSR.a"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && $(CMAKE_COMMAND) -P CMakeFiles/libSPSR-static.dir/cmake_clean_target.cmake
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libSPSR-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/other/libspsr/CMakeFiles/libSPSR-static.dir/build: lib/libSPSR.a

.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/build

src/other/libspsr/CMakeFiles/libSPSR-static.dir/requires: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Factor.cpp.o.requires
src/other/libspsr/CMakeFiles/libSPSR-static.dir/requires: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/Geometry.cpp.o.requires
src/other/libspsr/CMakeFiles/libSPSR-static.dir/requires: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/MarchingCubes.cpp.o.requires
src/other/libspsr/CMakeFiles/libSPSR-static.dir/requires: src/other/libspsr/CMakeFiles/libSPSR-static.dir/Src/SPSR.cpp.o.requires

.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/requires

src/other/libspsr/CMakeFiles/libSPSR-static.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr && $(CMAKE_COMMAND) -P CMakeFiles/libSPSR-static.dir/cmake_clean.cmake
.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/clean

src/other/libspsr/CMakeFiles/libSPSR-static.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/libspsr /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/libspsr/CMakeFiles/libSPSR-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/libspsr/CMakeFiles/libSPSR-static.dir/depend
