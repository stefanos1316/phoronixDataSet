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

# Utility rule file for regress-rtwizard-rtwiz_m35_B.

# Include the progress variables for this target.
include regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/progress.make

regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B: bin/pixcmp
regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B: bin/rtwizard
regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B: regress/rtwizard/rtwiz_m35_B.done


regress/rtwizard/rtwiz_m35_B.done: bin/pixcmp
regress/rtwizard/rtwiz_m35_B.done: bin/rtwizard
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating rtwiz_m35_B.done, m35_B.pix, m35_B.log"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard && /usr/bin/cmake -P /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_B.cmake

regress/rtwizard/m35_B.pix: regress/rtwizard/rtwiz_m35_B.done
	@$(CMAKE_COMMAND) -E touch_nocreate regress/rtwizard/m35_B.pix

regress/rtwizard/m35_B.log: regress/rtwizard/rtwiz_m35_B.done
	@$(CMAKE_COMMAND) -E touch_nocreate regress/rtwizard/m35_B.log

regress-rtwizard-rtwiz_m35_B: regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B
regress-rtwizard-rtwiz_m35_B: regress/rtwizard/rtwiz_m35_B.done
regress-rtwizard-rtwiz_m35_B: regress/rtwizard/m35_B.pix
regress-rtwizard-rtwiz_m35_B: regress/rtwizard/m35_B.log
regress-rtwizard-rtwiz_m35_B: regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/build.make

.PHONY : regress-rtwizard-rtwiz_m35_B

# Rule to build all files generated by this target.
regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/build: regress-rtwizard-rtwiz_m35_B

.PHONY : regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/build

regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard && $(CMAKE_COMMAND) -P CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/cmake_clean.cmake
.PHONY : regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/clean

regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/rtwizard /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : regress/rtwizard/CMakeFiles/regress-rtwizard-rtwiz_m35_B.dir/depend

