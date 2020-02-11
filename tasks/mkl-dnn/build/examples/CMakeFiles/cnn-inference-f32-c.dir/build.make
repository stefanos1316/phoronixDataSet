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
include examples/CMakeFiles/cnn-inference-f32-c.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/cnn-inference-f32-c.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/cnn-inference-f32-c.dir/flags.make

examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o: examples/CMakeFiles/cnn-inference-f32-c.dir/flags.make
examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o: ../examples/cnn_inference_f32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/examples/cnn_inference_f32.c

examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/examples/cnn_inference_f32.c > CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.i

examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/examples/cnn_inference_f32.c -o CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.s

examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o.requires:

.PHONY : examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o.requires

examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o.provides: examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o.requires
	$(MAKE) -f examples/CMakeFiles/cnn-inference-f32-c.dir/build.make examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o.provides.build
.PHONY : examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o.provides

examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o.provides.build: examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o


# Object files for target cnn-inference-f32-c
cnn__inference__f32__c_OBJECTS = \
"CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o"

# External object files for target cnn-inference-f32-c
cnn__inference__f32__c_EXTERNAL_OBJECTS =

examples/cnn-inference-f32-c: examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o
examples/cnn-inference-f32-c: examples/CMakeFiles/cnn-inference-f32-c.dir/build.make
examples/cnn-inference-f32-c: src/libdnnl.so.1.1
examples/cnn-inference-f32-c: examples/CMakeFiles/cnn-inference-f32-c.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable cnn-inference-f32-c"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cnn-inference-f32-c.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/cnn-inference-f32-c.dir/build: examples/cnn-inference-f32-c

.PHONY : examples/CMakeFiles/cnn-inference-f32-c.dir/build

examples/CMakeFiles/cnn-inference-f32-c.dir/requires: examples/CMakeFiles/cnn-inference-f32-c.dir/cnn_inference_f32.c.o.requires

.PHONY : examples/CMakeFiles/cnn-inference-f32-c.dir/requires

examples/CMakeFiles/cnn-inference-f32-c.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/cnn-inference-f32-c.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/cnn-inference-f32-c.dir/clean

examples/CMakeFiles/cnn-inference-f32-c.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/examples /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples /home/sgeorgiou/GitHub/phoronixDataSet/tasks/mkl-dnn/build/examples/CMakeFiles/cnn-inference-f32-c.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/cnn-inference-f32-c.dir/depend

