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
include src/libbn/CMakeFiles/libbn.dir/depend.make

# Include the progress variables for this target.
include src/libbn/CMakeFiles/libbn.dir/progress.make

# Include the compile flags for this target's objects.
include src/libbn/CMakeFiles/libbn.dir/flags.make

# Object files for target libbn
libbn_OBJECTS =

# External object files for target libbn
libbn_EXTERNAL_OBJECTS = \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/anim.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/axis.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/complex.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/clip.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/font.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/globals.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/list.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/marker.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/mat.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/msr.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/multipoly.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/noise.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/plane.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/plot3.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/poly.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/qmath.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/rand.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/randmt.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/randsph.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/scale.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/sobolseq.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/sphmap.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/str.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/symbol.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/tabdata.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/tplot.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/ulp.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/vectfont.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/vector.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/vers.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/vert_tree.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/vlist.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn-obj.dir/wavelet.c.o"

lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/anim.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/axis.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/complex.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/clip.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/font.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/globals.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/list.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/marker.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/mat.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/msr.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/multipoly.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/noise.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/plane.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/plot3.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/poly.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/qmath.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/rand.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/randmt.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/randsph.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/scale.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/sobolseq.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/sphmap.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/str.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/symbol.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/tabdata.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/tplot.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/ulp.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/vectfont.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/vector.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/vers.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/vert_tree.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/vlist.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn-obj.dir/wavelet.c.o
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn.dir/build.make
lib/libbn.so.20.0.1: lib/libbu.so.20.0.1
lib/libbn.so.20.0.1: /usr/lib/x86_64-linux-gnu/libuuid.so
lib/libbn.so.20.0.1: lib/libregex.so.1.0.4
lib/libbn.so.20.0.1: src/libbn/CMakeFiles/libbn.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C shared library ../../lib/libbn.so"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libbn.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libbn.so.20.0.1 ../../lib/libbn.so.20 ../../lib/libbn.so

lib/libbn.so.20: lib/libbn.so.20.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libbn.so.20

lib/libbn.so: lib/libbn.so.20.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libbn.so

# Rule to build all files generated by this target.
src/libbn/CMakeFiles/libbn.dir/build: lib/libbn.so

.PHONY : src/libbn/CMakeFiles/libbn.dir/build

src/libbn/CMakeFiles/libbn.dir/requires:

.PHONY : src/libbn/CMakeFiles/libbn.dir/requires

src/libbn/CMakeFiles/libbn.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn && $(CMAKE_COMMAND) -P CMakeFiles/libbn.dir/cmake_clean.cmake
.PHONY : src/libbn/CMakeFiles/libbn.dir/clean

src/libbn/CMakeFiles/libbn.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libbn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbn/CMakeFiles/libbn.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libbn/CMakeFiles/libbn.dir/depend

