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

# Utility rule file for sc_gen_hdrs_cp.

# Include the progress variables for this target.
include src/other/CMakeFiles/sc_gen_hdrs_cp.dir/progress.make

src/other/CMakeFiles/sc_gen_hdrs_cp: src/other/sc_gen_hdrs.sentinel


src/other/sc_gen_hdrs.sentinel: src/other/stepcode/include/sc_cf.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating sc_gen_hdrs.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other && /usr/bin/cmake -E copy_if_different /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/include/sc_cf.h /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/stepcode/sc_cf.h
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other && /usr/bin/cmake -E copy_if_different /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/include/sc_version_string.h /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/include/stepcode/sc_version_string.h
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/sc_gen_hdrs.sentinel

sc_gen_hdrs_cp: src/other/CMakeFiles/sc_gen_hdrs_cp
sc_gen_hdrs_cp: src/other/sc_gen_hdrs.sentinel
sc_gen_hdrs_cp: src/other/CMakeFiles/sc_gen_hdrs_cp.dir/build.make

.PHONY : sc_gen_hdrs_cp

# Rule to build all files generated by this target.
src/other/CMakeFiles/sc_gen_hdrs_cp.dir/build: sc_gen_hdrs_cp

.PHONY : src/other/CMakeFiles/sc_gen_hdrs_cp.dir/build

src/other/CMakeFiles/sc_gen_hdrs_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other && $(CMAKE_COMMAND) -P CMakeFiles/sc_gen_hdrs_cp.dir/cmake_clean.cmake
.PHONY : src/other/CMakeFiles/sc_gen_hdrs_cp.dir/clean

src/other/CMakeFiles/sc_gen_hdrs_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/CMakeFiles/sc_gen_hdrs_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/CMakeFiles/sc_gen_hdrs_cp.dir/depend
