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

# Utility rule file for icv_headers_cp.

# Include the progress variables for this target.
include include/icv/CMakeFiles/icv_headers_cp.dir/progress.make

include/icv/CMakeFiles/icv_headers_cp: include/icv/icv_headers.sentinel


include/icv/icv_headers.sentinel: ../include/icv/defines.h
include/icv/icv_headers.sentinel: ../include/icv/colorspace.h
include/icv/icv_headers.sentinel: ../include/icv/crop.h
include/icv/icv_headers.sentinel: ../include/icv/filters.h
include/icv/icv_headers.sentinel: ../include/icv/io.h
include/icv/icv_headers.sentinel: ../include/icv/ops.h
include/icv/icv_headers.sentinel: ../include/icv/stat.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating icv_headers.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/icv && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/icv/icv_headers.sentinel

icv_headers_cp: include/icv/CMakeFiles/icv_headers_cp
icv_headers_cp: include/icv/icv_headers.sentinel
icv_headers_cp: include/icv/CMakeFiles/icv_headers_cp.dir/build.make

.PHONY : icv_headers_cp

# Rule to build all files generated by this target.
include/icv/CMakeFiles/icv_headers_cp.dir/build: icv_headers_cp

.PHONY : include/icv/CMakeFiles/icv_headers_cp.dir/build

include/icv/CMakeFiles/icv_headers_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/icv && $(CMAKE_COMMAND) -P CMakeFiles/icv_headers_cp.dir/cmake_clean.cmake
.PHONY : include/icv/CMakeFiles/icv_headers_cp.dir/clean

include/icv/CMakeFiles/icv_headers_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/include/icv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/icv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/icv/CMakeFiles/icv_headers_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : include/icv/CMakeFiles/icv_headers_cp.dir/depend

