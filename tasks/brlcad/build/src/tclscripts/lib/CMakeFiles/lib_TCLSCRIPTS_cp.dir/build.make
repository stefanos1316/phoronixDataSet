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

# Utility rule file for lib_TCLSCRIPTS_cp.

# Include the progress variables for this target.
include src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/progress.make

src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp: src/tclscripts/lib/lib_TCLSCRIPTS.sentinel


src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Accordian.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/CellPlot.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/ColorEntry.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/ComboBox.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Command.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Database.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Db.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Display.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Dm.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Drawable.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Ged.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/GeometryIO.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Help.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Legend.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Mged.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/ModelAxesControl.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/QuadDisplay.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/RtControl.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/RtImage.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Splash.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/Table.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/TableView.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/TkTable.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/View.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/ViewAxesControl.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/cursor.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/apply_mat.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/gui_conversion.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/pattern.tcl
src/tclscripts/lib/lib_TCLSCRIPTS.sentinel: ../src/tclscripts/lib/pattern_gui.tcl
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating lib_TCLSCRIPTS.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lib && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lib/lib_TCLSCRIPTS.sentinel

lib_TCLSCRIPTS_cp: src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp
lib_TCLSCRIPTS_cp: src/tclscripts/lib/lib_TCLSCRIPTS.sentinel
lib_TCLSCRIPTS_cp: src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/build.make

.PHONY : lib_TCLSCRIPTS_cp

# Rule to build all files generated by this target.
src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/build: lib_TCLSCRIPTS_cp

.PHONY : src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/build

src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lib && $(CMAKE_COMMAND) -P CMakeFiles/lib_TCLSCRIPTS_cp.dir/cmake_clean.cmake
.PHONY : src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/clean

src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/tclscripts/lib /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lib /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tclscripts/lib/CMakeFiles/lib_TCLSCRIPTS_cp.dir/depend
