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
include src/libicv/CMakeFiles/libicv.dir/depend.make

# Include the progress variables for this target.
include src/libicv/CMakeFiles/libicv.dir/progress.make

# Include the compile flags for this target's objects.
include src/libicv/CMakeFiles/libicv.dir/flags.make

# Object files for target libicv
libicv_OBJECTS =

# External object files for target libicv
libicv_EXTERNAL_OBJECTS = \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/size.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/png.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o"

lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/size.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/png.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv.dir/build.make
lib/libicv.so.20.0.1: lib/libbn.so.20.0.1
lib/libicv.so.20.0.1: lib/libpng16.so.16.29.0
lib/libicv.so.20.0.1: lib/libnetpbm.so
lib/libicv.so.20.0.1: lib/libbu.so.20.0.1
lib/libicv.so.20.0.1: /usr/lib/x86_64-linux-gnu/libuuid.so
lib/libicv.so.20.0.1: lib/libregex.so.1.0.4
lib/libicv.so.20.0.1: lib/libz.so.1.2.11
lib/libicv.so.20.0.1: src/libicv/CMakeFiles/libicv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C shared library ../../lib/libicv.so"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libicv.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libicv.so.20.0.1 ../../lib/libicv.so.20 ../../lib/libicv.so

lib/libicv.so.20: lib/libicv.so.20.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libicv.so.20

lib/libicv.so: lib/libicv.so.20.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libicv.so

# Rule to build all files generated by this target.
src/libicv/CMakeFiles/libicv.dir/build: lib/libicv.so

.PHONY : src/libicv/CMakeFiles/libicv.dir/build

src/libicv/CMakeFiles/libicv.dir/requires:

.PHONY : src/libicv/CMakeFiles/libicv.dir/requires

src/libicv/CMakeFiles/libicv.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && $(CMAKE_COMMAND) -P CMakeFiles/libicv.dir/cmake_clean.cmake
.PHONY : src/libicv/CMakeFiles/libicv.dir/clean

src/libicv/CMakeFiles/libicv.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libicv/CMakeFiles/libicv.dir/depend
