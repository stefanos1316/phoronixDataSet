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
include src/libpkg/CMakeFiles/libpkg-obj.dir/depend.make

# Include the progress variables for this target.
include src/libpkg/CMakeFiles/libpkg-obj.dir/progress.make

# Include the compile flags for this target's objects.
include src/libpkg/CMakeFiles/libpkg-obj.dir/flags.make

src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o: src/libpkg/CMakeFiles/libpkg-obj.dir/flags.make
src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o: ../src/libpkg/pkg.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libpkg-obj.dir/pkg.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libpkg/pkg.c

src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libpkg-obj.dir/pkg.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libpkg/pkg.c > CMakeFiles/libpkg-obj.dir/pkg.c.i

src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libpkg-obj.dir/pkg.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libpkg/pkg.c -o CMakeFiles/libpkg-obj.dir/pkg.c.s

src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o.requires:

.PHONY : src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o.requires

src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o.provides: src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o.requires
	$(MAKE) -f src/libpkg/CMakeFiles/libpkg-obj.dir/build.make src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o.provides.build
.PHONY : src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o.provides

src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o.provides.build: src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o


src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o: src/libpkg/CMakeFiles/libpkg-obj.dir/flags.make
src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o: ../src/libpkg/vers.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libpkg-obj.dir/vers.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libpkg/vers.c

src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libpkg-obj.dir/vers.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libpkg/vers.c > CMakeFiles/libpkg-obj.dir/vers.c.i

src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libpkg-obj.dir/vers.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libpkg/vers.c -o CMakeFiles/libpkg-obj.dir/vers.c.s

src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o.requires:

.PHONY : src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o.requires

src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o.provides: src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o.requires
	$(MAKE) -f src/libpkg/CMakeFiles/libpkg-obj.dir/build.make src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o.provides.build
.PHONY : src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o.provides

src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o.provides.build: src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o


libpkg-obj: src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o
libpkg-obj: src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o
libpkg-obj: src/libpkg/CMakeFiles/libpkg-obj.dir/build.make

.PHONY : libpkg-obj

# Rule to build all files generated by this target.
src/libpkg/CMakeFiles/libpkg-obj.dir/build: libpkg-obj

.PHONY : src/libpkg/CMakeFiles/libpkg-obj.dir/build

src/libpkg/CMakeFiles/libpkg-obj.dir/requires: src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o.requires
src/libpkg/CMakeFiles/libpkg-obj.dir/requires: src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o.requires

.PHONY : src/libpkg/CMakeFiles/libpkg-obj.dir/requires

src/libpkg/CMakeFiles/libpkg-obj.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && $(CMAKE_COMMAND) -P CMakeFiles/libpkg-obj.dir/cmake_clean.cmake
.PHONY : src/libpkg/CMakeFiles/libpkg-obj.dir/clean

src/libpkg/CMakeFiles/libpkg-obj.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libpkg /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg/CMakeFiles/libpkg-obj.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libpkg/CMakeFiles/libpkg-obj.dir/depend

