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
CMAKE_SOURCE_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve

# Include any dependencies generated for this target.
include CMakeFiles/primesieve.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/primesieve.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/primesieve.dir/flags.make

CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o: CMakeFiles/primesieve.dir/flags.make
CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o: src/console/cmdoptions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/cmdoptions.cpp

CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/cmdoptions.cpp > CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.i

CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/cmdoptions.cpp -o CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.s

CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o.requires:

.PHONY : CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o.requires

CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o.provides: CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o.requires
	$(MAKE) -f CMakeFiles/primesieve.dir/build.make CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o.provides.build
.PHONY : CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o.provides

CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o.provides.build: CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o


CMakeFiles/primesieve.dir/src/console/help.cpp.o: CMakeFiles/primesieve.dir/flags.make
CMakeFiles/primesieve.dir/src/console/help.cpp.o: src/console/help.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/primesieve.dir/src/console/help.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/primesieve.dir/src/console/help.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/help.cpp

CMakeFiles/primesieve.dir/src/console/help.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/primesieve.dir/src/console/help.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/help.cpp > CMakeFiles/primesieve.dir/src/console/help.cpp.i

CMakeFiles/primesieve.dir/src/console/help.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/primesieve.dir/src/console/help.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/help.cpp -o CMakeFiles/primesieve.dir/src/console/help.cpp.s

CMakeFiles/primesieve.dir/src/console/help.cpp.o.requires:

.PHONY : CMakeFiles/primesieve.dir/src/console/help.cpp.o.requires

CMakeFiles/primesieve.dir/src/console/help.cpp.o.provides: CMakeFiles/primesieve.dir/src/console/help.cpp.o.requires
	$(MAKE) -f CMakeFiles/primesieve.dir/build.make CMakeFiles/primesieve.dir/src/console/help.cpp.o.provides.build
.PHONY : CMakeFiles/primesieve.dir/src/console/help.cpp.o.provides

CMakeFiles/primesieve.dir/src/console/help.cpp.o.provides.build: CMakeFiles/primesieve.dir/src/console/help.cpp.o


CMakeFiles/primesieve.dir/src/console/main.cpp.o: CMakeFiles/primesieve.dir/flags.make
CMakeFiles/primesieve.dir/src/console/main.cpp.o: src/console/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/primesieve.dir/src/console/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/primesieve.dir/src/console/main.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/main.cpp

CMakeFiles/primesieve.dir/src/console/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/primesieve.dir/src/console/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/main.cpp > CMakeFiles/primesieve.dir/src/console/main.cpp.i

CMakeFiles/primesieve.dir/src/console/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/primesieve.dir/src/console/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/main.cpp -o CMakeFiles/primesieve.dir/src/console/main.cpp.s

CMakeFiles/primesieve.dir/src/console/main.cpp.o.requires:

.PHONY : CMakeFiles/primesieve.dir/src/console/main.cpp.o.requires

CMakeFiles/primesieve.dir/src/console/main.cpp.o.provides: CMakeFiles/primesieve.dir/src/console/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/primesieve.dir/build.make CMakeFiles/primesieve.dir/src/console/main.cpp.o.provides.build
.PHONY : CMakeFiles/primesieve.dir/src/console/main.cpp.o.provides

CMakeFiles/primesieve.dir/src/console/main.cpp.o.provides.build: CMakeFiles/primesieve.dir/src/console/main.cpp.o


CMakeFiles/primesieve.dir/src/console/test.cpp.o: CMakeFiles/primesieve.dir/flags.make
CMakeFiles/primesieve.dir/src/console/test.cpp.o: src/console/test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/primesieve.dir/src/console/test.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/primesieve.dir/src/console/test.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/test.cpp

CMakeFiles/primesieve.dir/src/console/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/primesieve.dir/src/console/test.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/test.cpp > CMakeFiles/primesieve.dir/src/console/test.cpp.i

CMakeFiles/primesieve.dir/src/console/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/primesieve.dir/src/console/test.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/src/console/test.cpp -o CMakeFiles/primesieve.dir/src/console/test.cpp.s

CMakeFiles/primesieve.dir/src/console/test.cpp.o.requires:

.PHONY : CMakeFiles/primesieve.dir/src/console/test.cpp.o.requires

CMakeFiles/primesieve.dir/src/console/test.cpp.o.provides: CMakeFiles/primesieve.dir/src/console/test.cpp.o.requires
	$(MAKE) -f CMakeFiles/primesieve.dir/build.make CMakeFiles/primesieve.dir/src/console/test.cpp.o.provides.build
.PHONY : CMakeFiles/primesieve.dir/src/console/test.cpp.o.provides

CMakeFiles/primesieve.dir/src/console/test.cpp.o.provides.build: CMakeFiles/primesieve.dir/src/console/test.cpp.o


# Object files for target primesieve
primesieve_OBJECTS = \
"CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o" \
"CMakeFiles/primesieve.dir/src/console/help.cpp.o" \
"CMakeFiles/primesieve.dir/src/console/main.cpp.o" \
"CMakeFiles/primesieve.dir/src/console/test.cpp.o"

# External object files for target primesieve
primesieve_EXTERNAL_OBJECTS =

primesieve: CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o
primesieve: CMakeFiles/primesieve.dir/src/console/help.cpp.o
primesieve: CMakeFiles/primesieve.dir/src/console/main.cpp.o
primesieve: CMakeFiles/primesieve.dir/src/console/test.cpp.o
primesieve: CMakeFiles/primesieve.dir/build.make
primesieve: libprimesieve.a
primesieve: CMakeFiles/primesieve.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable primesieve"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/primesieve.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/primesieve.dir/build: primesieve

.PHONY : CMakeFiles/primesieve.dir/build

CMakeFiles/primesieve.dir/requires: CMakeFiles/primesieve.dir/src/console/cmdoptions.cpp.o.requires
CMakeFiles/primesieve.dir/requires: CMakeFiles/primesieve.dir/src/console/help.cpp.o.requires
CMakeFiles/primesieve.dir/requires: CMakeFiles/primesieve.dir/src/console/main.cpp.o.requires
CMakeFiles/primesieve.dir/requires: CMakeFiles/primesieve.dir/src/console/test.cpp.o.requires

.PHONY : CMakeFiles/primesieve.dir/requires

CMakeFiles/primesieve.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/primesieve.dir/cmake_clean.cmake
.PHONY : CMakeFiles/primesieve.dir/clean

CMakeFiles/primesieve.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve /home/sgeorgiou/GitHub/phoronixDataSet/tasks/primesieve/CMakeFiles/primesieve.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/primesieve.dir/depend
