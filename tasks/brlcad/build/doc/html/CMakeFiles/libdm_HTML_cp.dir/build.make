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

# Utility rule file for libdm_HTML_cp.

# Include the progress variables for this target.
include doc/html/CMakeFiles/libdm_HTML_cp.dir/progress.make

doc/html/CMakeFiles/libdm_HTML_cp: doc/html/libdm_HTML.sentinel


doc/html/libdm_HTML.sentinel: ../doc/html/manuals/libdm/api.html
doc/html/libdm_HTML.sentinel: ../doc/html/manuals/libdm/contents.html
doc/html/libdm_HTML.sentinel: ../doc/html/manuals/libdm/dm_obj.html
doc/html/libdm_HTML.sentinel: ../doc/html/manuals/libdm/index.html
doc/html/libdm_HTML.sentinel: ../doc/html/manuals/libdm/preface.html
doc/html/libdm_HTML.sentinel: ../doc/html/manuals/libdm/tcl.html
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating libdm_HTML.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/html && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/html/libdm_HTML.sentinel

libdm_HTML_cp: doc/html/CMakeFiles/libdm_HTML_cp
libdm_HTML_cp: doc/html/libdm_HTML.sentinel
libdm_HTML_cp: doc/html/CMakeFiles/libdm_HTML_cp.dir/build.make

.PHONY : libdm_HTML_cp

# Rule to build all files generated by this target.
doc/html/CMakeFiles/libdm_HTML_cp.dir/build: libdm_HTML_cp

.PHONY : doc/html/CMakeFiles/libdm_HTML_cp.dir/build

doc/html/CMakeFiles/libdm_HTML_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/html && $(CMAKE_COMMAND) -P CMakeFiles/libdm_HTML_cp.dir/cmake_clean.cmake
.PHONY : doc/html/CMakeFiles/libdm_HTML_cp.dir/clean

doc/html/CMakeFiles/libdm_HTML_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/html /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/html /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/html/CMakeFiles/libdm_HTML_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/html/CMakeFiles/libdm_HTML_cp.dir/depend

