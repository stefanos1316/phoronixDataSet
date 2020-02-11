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
include examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/flags.make

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o: examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/flags.make
examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o: ../examples/cpu_rnn_inference_int8.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/examples/cpu_rnn_inference_int8.cpp

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/examples/cpu_rnn_inference_int8.cpp > CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.i

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/examples/cpu_rnn_inference_int8.cpp -o CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.s

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o.requires:

.PHONY : examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o.requires

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o.provides: examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o.requires
	$(MAKE) -f examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/build.make examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o.provides.build
.PHONY : examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o.provides

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o.provides.build: examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o


# Object files for target cpu-rnn-inference-int8-cpp
cpu__rnn__inference__int8__cpp_OBJECTS = \
"CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o"

# External object files for target cpu-rnn-inference-int8-cpp
cpu__rnn__inference__int8__cpp_EXTERNAL_OBJECTS =

examples/cpu-rnn-inference-int8-cpp: examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o
examples/cpu-rnn-inference-int8-cpp: examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/build.make
examples/cpu-rnn-inference-int8-cpp: src/libdnnl.so.1.1
examples/cpu-rnn-inference-int8-cpp: examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable cpu-rnn-inference-int8-cpp"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cpu-rnn-inference-int8-cpp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/build: examples/cpu-rnn-inference-int8-cpp

.PHONY : examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/build

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/requires: examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cpu_rnn_inference_int8.cpp.o.requires

.PHONY : examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/requires

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/cpu-rnn-inference-int8-cpp.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/clean

examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/examples /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/cpu-rnn-inference-int8-cpp.dir/depend

