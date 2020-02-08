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
include src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/depend.make

# Include the progress variables for this target.
include src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/progress.make

# Include the compile flags for this target's objects.
include src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/flags.make

# Object files for target libgcv_gdal
libgcv_gdal_OBJECTS =

# External object files for target libgcv_gdal
libgcv_gdal_EXTERNAL_OBJECTS = \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal-obj.dir/gdal.cpp.o"

lib/libgcv_plugins/libgcv_gdal.so: src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal-obj.dir/gdal.cpp.o
lib/libgcv_plugins/libgcv_gdal.so: src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/build.make
lib/libgcv_plugins/libgcv_gdal.so: lib/libgcv.so.20.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/libgdal.so
lib/libgcv_plugins/libgcv_gdal.so: lib/libwdb.so.20.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/librt.so.20.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/libgdiam.so
lib/libgcv_plugins/libgcv_gdal.so: lib/libvds.so.1.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/libbrep.so.20.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/libp2t.so.1.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/liblz4.so
lib/libgcv_plugins/libgcv_gdal.so: lib/libopenNURBS.so.2012.10.245
lib/libgcv_plugins/libgcv_gdal.so: lib/libnmg.so
lib/libgcv_plugins/libgcv_gdal.so: lib/libbg.so.20.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/libSPSR.so
lib/libgcv_plugins/libgcv_gdal.so: lib/libbn.so.20.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/libbu.so.20.0.1
lib/libgcv_plugins/libgcv_gdal.so: lib/libregex.so.1.0.4
lib/libgcv_plugins/libgcv_gdal.so: /usr/lib/x86_64-linux-gnu/libuuid.so
lib/libgcv_plugins/libgcv_gdal.so: lib/libproj.so.12.0.0
lib/libgcv_plugins/libgcv_gdal.so: lib/libpng16.so.16.29.0
lib/libgcv_plugins/libgcv_gdal.so: lib/libz.so.1.2.11
lib/libgcv_plugins/libgcv_gdal.so: src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking CXX shared library ../../../../lib/libgcv_plugins/libgcv_gdal.so"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/gdal && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libgcv_gdal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/build: lib/libgcv_plugins/libgcv_gdal.so

.PHONY : src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/build

src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/requires:

.PHONY : src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/requires

src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/gdal && $(CMAKE_COMMAND) -P CMakeFiles/libgcv_gdal.dir/cmake_clean.cmake
.PHONY : src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/clean

src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins/gdal /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/gdal /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libgcv/plugins/gdal/CMakeFiles/libgcv_gdal.dir/depend

