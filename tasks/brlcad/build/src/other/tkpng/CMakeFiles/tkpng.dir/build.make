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
include src/other/tkpng/CMakeFiles/tkpng.dir/depend.make

# Include the progress variables for this target.
include src/other/tkpng/CMakeFiles/tkpng.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/tkpng/CMakeFiles/tkpng.dir/flags.make

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o: src/other/tkpng/CMakeFiles/tkpng.dir/flags.make
src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o: ../src/other/tkpng/generic/tkImgPNG.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tkpng/generic/tkImgPNG.c

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tkpng.dir/generic/tkImgPNG.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tkpng/generic/tkImgPNG.c > CMakeFiles/tkpng.dir/generic/tkImgPNG.c.i

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tkpng.dir/generic/tkImgPNG.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tkpng/generic/tkImgPNG.c -o CMakeFiles/tkpng.dir/generic/tkImgPNG.c.s

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o.requires:

.PHONY : src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o.requires

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o.provides: src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o.requires
	$(MAKE) -f src/other/tkpng/CMakeFiles/tkpng.dir/build.make src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o.provides.build
.PHONY : src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o.provides

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o.provides.build: src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o


src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o: src/other/tkpng/CMakeFiles/tkpng.dir/flags.make
src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o: ../src/other/tkpng/generic/tkImgPNGInit.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tkpng/generic/tkImgPNGInit.c

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tkpng/generic/tkImgPNGInit.c > CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.i

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tkpng/generic/tkImgPNGInit.c -o CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.s

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o.requires:

.PHONY : src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o.requires

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o.provides: src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o.requires
	$(MAKE) -f src/other/tkpng/CMakeFiles/tkpng.dir/build.make src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o.provides.build
.PHONY : src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o.provides

src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o.provides.build: src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o


# Object files for target tkpng
tkpng_OBJECTS = \
"CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o" \
"CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o"

# External object files for target tkpng
tkpng_EXTERNAL_OBJECTS =

lib/libtkpng.so.0.8: src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o
lib/libtkpng.so.0.8: src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o
lib/libtkpng.so.0.8: src/other/tkpng/CMakeFiles/tkpng.dir/build.make
lib/libtkpng.so.0.8: lib/libtcl.so.8.5.19
lib/libtkpng.so.0.8: lib/libtk.so.8.5
lib/libtkpng.so.0.8: /usr/lib/x86_64-linux-gnu/libSM.so
lib/libtkpng.so.0.8: /usr/lib/x86_64-linux-gnu/libICE.so
lib/libtkpng.so.0.8: /usr/lib/x86_64-linux-gnu/libX11.so
lib/libtkpng.so.0.8: /usr/lib/x86_64-linux-gnu/libXext.so
lib/libtkpng.so.0.8: lib/libtkstub.a
lib/libtkpng.so.0.8: lib/libtclstub.a
lib/libtkpng.so.0.8: /usr/lib/x86_64-linux-gnu/libXrender.so
lib/libtkpng.so.0.8: lib/libpng16.so.16.29.0
lib/libtkpng.so.0.8: lib/libz.so.1.2.11
lib/libtkpng.so.0.8: src/other/tkpng/CMakeFiles/tkpng.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library ../../../lib/libtkpng.so"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tkpng.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && $(CMAKE_COMMAND) -E cmake_symlink_library ../../../lib/libtkpng.so.0.8 ../../../lib/libtkpng.so.0.8 ../../../lib/libtkpng.so

lib/libtkpng.so: lib/libtkpng.so.0.8
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libtkpng.so

# Rule to build all files generated by this target.
src/other/tkpng/CMakeFiles/tkpng.dir/build: lib/libtkpng.so

.PHONY : src/other/tkpng/CMakeFiles/tkpng.dir/build

src/other/tkpng/CMakeFiles/tkpng.dir/requires: src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNG.c.o.requires
src/other/tkpng/CMakeFiles/tkpng.dir/requires: src/other/tkpng/CMakeFiles/tkpng.dir/generic/tkImgPNGInit.c.o.requires

.PHONY : src/other/tkpng/CMakeFiles/tkpng.dir/requires

src/other/tkpng/CMakeFiles/tkpng.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng && $(CMAKE_COMMAND) -P CMakeFiles/tkpng.dir/cmake_clean.cmake
.PHONY : src/other/tkpng/CMakeFiles/tkpng.dir/clean

src/other/tkpng/CMakeFiles/tkpng.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/tkpng /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/tkpng/CMakeFiles/tkpng.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/tkpng/CMakeFiles/tkpng.dir/depend
