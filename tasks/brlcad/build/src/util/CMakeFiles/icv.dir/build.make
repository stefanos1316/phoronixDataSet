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
include src/util/CMakeFiles/icv.dir/depend.make

# Include the progress variables for this target.
include src/util/CMakeFiles/icv.dir/progress.make

# Include the compile flags for this target's objects.
include src/util/CMakeFiles/icv.dir/flags.make

src/util/CMakeFiles/icv.dir/icv.cpp.o: src/util/CMakeFiles/icv.dir/flags.make
src/util/CMakeFiles/icv.dir/icv.cpp.o: ../src/util/icv.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/util/CMakeFiles/icv.dir/icv.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/icv.dir/icv.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/icv.cpp

src/util/CMakeFiles/icv.dir/icv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/icv.dir/icv.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/icv.cpp > CMakeFiles/icv.dir/icv.cpp.i

src/util/CMakeFiles/icv.dir/icv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/icv.dir/icv.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util/icv.cpp -o CMakeFiles/icv.dir/icv.cpp.s

src/util/CMakeFiles/icv.dir/icv.cpp.o.requires:

.PHONY : src/util/CMakeFiles/icv.dir/icv.cpp.o.requires

src/util/CMakeFiles/icv.dir/icv.cpp.o.provides: src/util/CMakeFiles/icv.dir/icv.cpp.o.requires
	$(MAKE) -f src/util/CMakeFiles/icv.dir/build.make src/util/CMakeFiles/icv.dir/icv.cpp.o.provides.build
.PHONY : src/util/CMakeFiles/icv.dir/icv.cpp.o.provides

src/util/CMakeFiles/icv.dir/icv.cpp.o.provides.build: src/util/CMakeFiles/icv.dir/icv.cpp.o


# Object files for target icv
icv_OBJECTS = \
"CMakeFiles/icv.dir/icv.cpp.o"

# External object files for target icv
icv_EXTERNAL_OBJECTS =

bin/icv: src/util/CMakeFiles/icv.dir/icv.cpp.o
bin/icv: src/util/CMakeFiles/icv.dir/build.make
bin/icv: lib/libicv.so.20.0.1
bin/icv: lib/libbn.so.20.0.1
bin/icv: lib/libbu.so.20.0.1
bin/icv: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/icv: lib/libregex.so.1.0.4
bin/icv: lib/libpng16.so.16.29.0
bin/icv: lib/libz.so.1.2.11
bin/icv: lib/libnetpbm.so
bin/icv: src/util/CMakeFiles/icv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/icv"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/icv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/util/CMakeFiles/icv.dir/build: bin/icv

.PHONY : src/util/CMakeFiles/icv.dir/build

src/util/CMakeFiles/icv.dir/requires: src/util/CMakeFiles/icv.dir/icv.cpp.o.requires

.PHONY : src/util/CMakeFiles/icv.dir/requires

src/util/CMakeFiles/icv.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util && $(CMAKE_COMMAND) -P CMakeFiles/icv.dir/cmake_clean.cmake
.PHONY : src/util/CMakeFiles/icv.dir/clean

src/util/CMakeFiles/icv.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/util/CMakeFiles/icv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/util/CMakeFiles/icv.dir/depend

