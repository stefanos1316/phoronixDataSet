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
include src/remrt/CMakeFiles/rtsrv.dir/depend.make

# Include the progress variables for this target.
include src/remrt/CMakeFiles/rtsrv.dir/progress.make

# Include the compile flags for this target's objects.
include src/remrt/CMakeFiles/rtsrv.dir/flags.make

src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o: src/remrt/CMakeFiles/rtsrv.dir/flags.make
src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o: ../src/rt/usage.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/usage.cpp

src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rtsrv.dir/__/rt/usage.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/usage.cpp > CMakeFiles/rtsrv.dir/__/rt/usage.cpp.i

src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rtsrv.dir/__/rt/usage.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/usage.cpp -o CMakeFiles/rtsrv.dir/__/rt/usage.cpp.s

src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o.requires:

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o.requires

src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o.provides: src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o.requires
	$(MAKE) -f src/remrt/CMakeFiles/rtsrv.dir/build.make src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o.provides.build
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o.provides

src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o.provides.build: src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o


src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o: src/remrt/CMakeFiles/rtsrv.dir/flags.make
src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o: ../src/rt/view.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtsrv.dir/__/rt/view.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/view.c

src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtsrv.dir/__/rt/view.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/view.c > CMakeFiles/rtsrv.dir/__/rt/view.c.i

src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtsrv.dir/__/rt/view.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/view.c -o CMakeFiles/rtsrv.dir/__/rt/view.c.s

src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o.requires:

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o.requires

src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o.provides: src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o.requires
	$(MAKE) -f src/remrt/CMakeFiles/rtsrv.dir/build.make src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o.provides.build
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o.provides

src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o.provides.build: src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o


src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o: src/remrt/CMakeFiles/rtsrv.dir/flags.make
src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o: ../src/rt/do.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtsrv.dir/__/rt/do.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/do.c

src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtsrv.dir/__/rt/do.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/do.c > CMakeFiles/rtsrv.dir/__/rt/do.c.i

src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtsrv.dir/__/rt/do.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/do.c -o CMakeFiles/rtsrv.dir/__/rt/do.c.s

src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o.requires:

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o.requires

src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o.provides: src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o.requires
	$(MAKE) -f src/remrt/CMakeFiles/rtsrv.dir/build.make src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o.provides.build
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o.provides

src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o.provides.build: src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o


src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o: src/remrt/CMakeFiles/rtsrv.dir/flags.make
src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o: ../src/rt/heatgraph.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/heatgraph.c

src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/heatgraph.c > CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.i

src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/heatgraph.c -o CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.s

src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o.requires:

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o.requires

src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o.provides: src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o.requires
	$(MAKE) -f src/remrt/CMakeFiles/rtsrv.dir/build.make src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o.provides.build
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o.provides

src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o.provides.build: src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o


src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o: src/remrt/CMakeFiles/rtsrv.dir/flags.make
src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o: ../src/rt/opt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtsrv.dir/__/rt/opt.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/opt.c

src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtsrv.dir/__/rt/opt.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/opt.c > CMakeFiles/rtsrv.dir/__/rt/opt.c.i

src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtsrv.dir/__/rt/opt.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/opt.c -o CMakeFiles/rtsrv.dir/__/rt/opt.c.s

src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o.requires:

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o.requires

src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o.provides: src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o.requires
	$(MAKE) -f src/remrt/CMakeFiles/rtsrv.dir/build.make src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o.provides.build
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o.provides

src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o.provides.build: src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o


src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o: src/remrt/CMakeFiles/rtsrv.dir/flags.make
src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o: ../src/rt/scanline.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtsrv.dir/__/rt/scanline.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/scanline.c

src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtsrv.dir/__/rt/scanline.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/scanline.c > CMakeFiles/rtsrv.dir/__/rt/scanline.c.i

src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtsrv.dir/__/rt/scanline.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/scanline.c -o CMakeFiles/rtsrv.dir/__/rt/scanline.c.s

src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o.requires:

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o.requires

src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o.provides: src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o.requires
	$(MAKE) -f src/remrt/CMakeFiles/rtsrv.dir/build.make src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o.provides.build
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o.provides

src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o.provides.build: src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o


src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o: src/remrt/CMakeFiles/rtsrv.dir/flags.make
src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o: ../src/rt/worker.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtsrv.dir/__/rt/worker.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/worker.c

src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtsrv.dir/__/rt/worker.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/worker.c > CMakeFiles/rtsrv.dir/__/rt/worker.c.i

src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtsrv.dir/__/rt/worker.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/rt/worker.c -o CMakeFiles/rtsrv.dir/__/rt/worker.c.s

src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o.requires:

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o.requires

src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o.provides: src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o.requires
	$(MAKE) -f src/remrt/CMakeFiles/rtsrv.dir/build.make src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o.provides.build
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o.provides

src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o.provides.build: src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o


src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o: src/remrt/CMakeFiles/rtsrv.dir/flags.make
src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o: ../src/remrt/rtsrv.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rtsrv.dir/rtsrv.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/remrt/rtsrv.c

src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtsrv.dir/rtsrv.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/remrt/rtsrv.c > CMakeFiles/rtsrv.dir/rtsrv.c.i

src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtsrv.dir/rtsrv.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/remrt/rtsrv.c -o CMakeFiles/rtsrv.dir/rtsrv.c.s

src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o.requires:

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o.requires

src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o.provides: src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o.requires
	$(MAKE) -f src/remrt/CMakeFiles/rtsrv.dir/build.make src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o.provides.build
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o.provides

src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o.provides.build: src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o


# Object files for target rtsrv
rtsrv_OBJECTS = \
"CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o" \
"CMakeFiles/rtsrv.dir/__/rt/view.c.o" \
"CMakeFiles/rtsrv.dir/__/rt/do.c.o" \
"CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o" \
"CMakeFiles/rtsrv.dir/__/rt/opt.c.o" \
"CMakeFiles/rtsrv.dir/__/rt/scanline.c.o" \
"CMakeFiles/rtsrv.dir/__/rt/worker.c.o" \
"CMakeFiles/rtsrv.dir/rtsrv.c.o"

# External object files for target rtsrv
rtsrv_EXTERNAL_OBJECTS =

bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/build.make
bin/rtsrv: lib/libfb.so.20.0.1
bin/rtsrv: lib/liboptical.so.20.0.1
bin/rtsrv: lib/libpkg.so.20.0.1
bin/rtsrv: lib/libicv.so.20.0.1
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libSM.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libICE.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libXi.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libGL.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libSM.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libICE.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libXi.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libGL.so
bin/rtsrv: lib/libtk.so.8.5
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libX11.so
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libXext.so
bin/rtsrv: lib/libtkstub.a
bin/rtsrv: lib/libtclstub.a
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libXrender.so
bin/rtsrv: lib/libtcl.so.8.5.19
bin/rtsrv: lib/librt.so.20.0.1
bin/rtsrv: lib/libgdiam.so
bin/rtsrv: lib/libvds.so.1.0.1
bin/rtsrv: lib/libbrep.so.20.0.1
bin/rtsrv: lib/libnmg.so
bin/rtsrv: lib/libbg.so.20.0.1
bin/rtsrv: lib/libSPSR.so
bin/rtsrv: lib/libopenNURBS.so.2012.10.245
bin/rtsrv: lib/libp2t.so.1.0.1
bin/rtsrv: lib/liblz4.so
bin/rtsrv: lib/libpng16.so.16.29.0
bin/rtsrv: lib/libz.so.1.2.11
bin/rtsrv: lib/libbn.so.20.0.1
bin/rtsrv: lib/libbu.so.20.0.1
bin/rtsrv: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/rtsrv: lib/libregex.so.1.0.4
bin/rtsrv: lib/libnetpbm.so
bin/rtsrv: src/remrt/CMakeFiles/rtsrv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable ../../bin/rtsrv"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rtsrv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/remrt/CMakeFiles/rtsrv.dir/build: bin/rtsrv

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/build

src/remrt/CMakeFiles/rtsrv.dir/requires: src/remrt/CMakeFiles/rtsrv.dir/__/rt/usage.cpp.o.requires
src/remrt/CMakeFiles/rtsrv.dir/requires: src/remrt/CMakeFiles/rtsrv.dir/__/rt/view.c.o.requires
src/remrt/CMakeFiles/rtsrv.dir/requires: src/remrt/CMakeFiles/rtsrv.dir/__/rt/do.c.o.requires
src/remrt/CMakeFiles/rtsrv.dir/requires: src/remrt/CMakeFiles/rtsrv.dir/__/rt/heatgraph.c.o.requires
src/remrt/CMakeFiles/rtsrv.dir/requires: src/remrt/CMakeFiles/rtsrv.dir/__/rt/opt.c.o.requires
src/remrt/CMakeFiles/rtsrv.dir/requires: src/remrt/CMakeFiles/rtsrv.dir/__/rt/scanline.c.o.requires
src/remrt/CMakeFiles/rtsrv.dir/requires: src/remrt/CMakeFiles/rtsrv.dir/__/rt/worker.c.o.requires
src/remrt/CMakeFiles/rtsrv.dir/requires: src/remrt/CMakeFiles/rtsrv.dir/rtsrv.c.o.requires

.PHONY : src/remrt/CMakeFiles/rtsrv.dir/requires

src/remrt/CMakeFiles/rtsrv.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt && $(CMAKE_COMMAND) -P CMakeFiles/rtsrv.dir/cmake_clean.cmake
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/clean

src/remrt/CMakeFiles/rtsrv.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/remrt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/remrt/CMakeFiles/rtsrv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/remrt/CMakeFiles/rtsrv.dir/depend
