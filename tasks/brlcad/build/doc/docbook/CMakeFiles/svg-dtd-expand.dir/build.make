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

# Utility rule file for svg-dtd-expand.

# Include the progress variables for this target.
include doc/docbook/CMakeFiles/svg-dtd-expand.dir/progress.make

doc/docbook/CMakeFiles/svg-dtd-expand: doc/docbook/resources/other/standard/svg/svg.sentinel


doc/docbook/resources/other/standard/svg/svg.sentinel: ../doc/docbook/resources/other/standard/met-fonts.xsl
doc/docbook/resources/other/standard/svg/svg.sentinel: ../doc/docbook/resources/other/standard/w3_svg_dtd.tar.bz2
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating resources/other/standard/svg/svg.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/resources/other/standard && /usr/bin/cmake -E tar xjf /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/resources/other/standard/w3_svg_dtd.tar.bz2
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/resources/other/standard && /usr/bin/cmake -E copy /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/resources/other/standard/met-fonts.xsl /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/resources/other/standard/svg/met-fonts.xsl
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/resources/other/standard && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/resources/other/standard/svg/svg.sentinel

svg-dtd-expand: doc/docbook/CMakeFiles/svg-dtd-expand
svg-dtd-expand: doc/docbook/resources/other/standard/svg/svg.sentinel
svg-dtd-expand: doc/docbook/CMakeFiles/svg-dtd-expand.dir/build.make

.PHONY : svg-dtd-expand

# Rule to build all files generated by this target.
doc/docbook/CMakeFiles/svg-dtd-expand.dir/build: svg-dtd-expand

.PHONY : doc/docbook/CMakeFiles/svg-dtd-expand.dir/build

doc/docbook/CMakeFiles/svg-dtd-expand.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook && $(CMAKE_COMMAND) -P CMakeFiles/svg-dtd-expand.dir/cmake_clean.cmake
.PHONY : doc/docbook/CMakeFiles/svg-dtd-expand.dir/clean

doc/docbook/CMakeFiles/svg-dtd-expand.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/CMakeFiles/svg-dtd-expand.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/docbook/CMakeFiles/svg-dtd-expand.dir/depend
