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
CMAKE_SOURCE_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build

# Include any dependencies generated for this target.
include tests/gtests/CMakeFiles/test_rnn_forward.dir/depend.make

# Include the progress variables for this target.
include tests/gtests/CMakeFiles/test_rnn_forward.dir/progress.make

# Include the compile flags for this target's objects.
include tests/gtests/CMakeFiles/test_rnn_forward.dir/flags.make

tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o: tests/gtests/CMakeFiles/test_rnn_forward.dir/flags.make
tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o: ../tests/gtests/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_rnn_forward.dir/main.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests/gtests/main.cpp

tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_rnn_forward.dir/main.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests/gtests/main.cpp > CMakeFiles/test_rnn_forward.dir/main.cpp.i

tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_rnn_forward.dir/main.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests/gtests/main.cpp -o CMakeFiles/test_rnn_forward.dir/main.cpp.s

tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o.requires:

.PHONY : tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o.requires

tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o.provides: tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o.requires
	$(MAKE) -f tests/gtests/CMakeFiles/test_rnn_forward.dir/build.make tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o.provides.build
.PHONY : tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o.provides

tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o.provides.build: tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o


tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o: tests/gtests/CMakeFiles/test_rnn_forward.dir/flags.make
tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o: ../tests/gtests/test_rnn_forward.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests/gtests/test_rnn_forward.cpp

tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests/gtests/test_rnn_forward.cpp > CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.i

tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests/gtests/test_rnn_forward.cpp -o CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.s

tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o.requires:

.PHONY : tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o.requires

tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o.provides: tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o.requires
	$(MAKE) -f tests/gtests/CMakeFiles/test_rnn_forward.dir/build.make tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o.provides.build
.PHONY : tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o.provides

tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o.provides.build: tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o


# Object files for target test_rnn_forward
test_rnn_forward_OBJECTS = \
"CMakeFiles/test_rnn_forward.dir/main.cpp.o" \
"CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o"

# External object files for target test_rnn_forward
test_rnn_forward_EXTERNAL_OBJECTS =

tests/gtests/test_rnn_forward: tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o
tests/gtests/test_rnn_forward: tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o
tests/gtests/test_rnn_forward: tests/gtests/CMakeFiles/test_rnn_forward.dir/build.make
tests/gtests/test_rnn_forward: src/libdnnl.so.1.1
tests/gtests/test_rnn_forward: tests/gtests/gtest/libdnnl_gtest.a
tests/gtests/test_rnn_forward: tests/gtests/CMakeFiles/test_rnn_forward.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test_rnn_forward"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_rnn_forward.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/gtests/CMakeFiles/test_rnn_forward.dir/build: tests/gtests/test_rnn_forward

.PHONY : tests/gtests/CMakeFiles/test_rnn_forward.dir/build

tests/gtests/CMakeFiles/test_rnn_forward.dir/requires: tests/gtests/CMakeFiles/test_rnn_forward.dir/main.cpp.o.requires
tests/gtests/CMakeFiles/test_rnn_forward.dir/requires: tests/gtests/CMakeFiles/test_rnn_forward.dir/test_rnn_forward.cpp.o.requires

.PHONY : tests/gtests/CMakeFiles/test_rnn_forward.dir/requires

tests/gtests/CMakeFiles/test_rnn_forward.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests && $(CMAKE_COMMAND) -P CMakeFiles/test_rnn_forward.dir/cmake_clean.cmake
.PHONY : tests/gtests/CMakeFiles/test_rnn_forward.dir/clean

tests/gtests/CMakeFiles/test_rnn_forward.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/tests/gtests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/tests/gtests/CMakeFiles/test_rnn_forward.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/gtests/CMakeFiles/test_rnn_forward.dir/depend

