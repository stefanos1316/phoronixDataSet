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

# Utility rule file for regress-mged-who.

# Include the progress variables for this target.
include regress/mged/CMakeFiles/regress-mged-who.dir/progress.make

regress/mged/CMakeFiles/regress-mged-who: bin/mged
regress/mged/CMakeFiles/regress-mged-who: regress/mged/regress_mged_cmd_functionality.g
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged && ../../bin/mged -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged/regress_mged_cmd_functionality.g < /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged/regress_who.mged

regress/mged/regress_mged_cmd_functionality.g: bin/mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/3ptarb.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/accept.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/adc.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/ae.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/arb.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/arced.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/arot.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/autoview.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/B.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/build_region.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/center.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/clone.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/comb.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/copymat.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/cpi.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/cp.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/draw_e_erase_d_who.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/draw.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/erase.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/extrude.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/eye_pt.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/facedef.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/g.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/hide.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/i.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/in.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/keypoint.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/killall.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/kill.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/killtree.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/knob.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/loadview.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/lookat.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/make.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/mirface.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/mirror.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/mrot.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/mvall.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/mv.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/oed.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/orientation.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/orot.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/oscale.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/overlay.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/permute.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/plot.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/prefix.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/ps.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/push.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/putmat.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/qorot.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/qvrot.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/refresh.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/reject.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/r.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/rm.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/rot_edit.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/rotobj.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/rot_view.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/saveview.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/sca_edit.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/sca_view.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/sed.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/set_perspective.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/setview.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/size.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/status.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/sv.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/tra_edit.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/translate.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/tra_view.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/unhide.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/view.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/vrot.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/who.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/xpush.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/Z.mged
regress/mged/regress_mged_cmd_functionality.g: ../regress/mged/zoom.mged
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating regress_mged_cmd_functionality.g"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged && /usr/bin/cmake -E remove -f /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged/regress_mged_cmd_functionality.g
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged && ../../bin/mged -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged/regress_mged_cmd_functionality.g ls

regress-mged-who: regress/mged/CMakeFiles/regress-mged-who
regress-mged-who: regress/mged/regress_mged_cmd_functionality.g
regress-mged-who: regress/mged/CMakeFiles/regress-mged-who.dir/build.make

.PHONY : regress-mged-who

# Rule to build all files generated by this target.
regress/mged/CMakeFiles/regress-mged-who.dir/build: regress-mged-who

.PHONY : regress/mged/CMakeFiles/regress-mged-who.dir/build

regress/mged/CMakeFiles/regress-mged-who.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged && $(CMAKE_COMMAND) -P CMakeFiles/regress-mged-who.dir/cmake_clean.cmake
.PHONY : regress/mged/CMakeFiles/regress-mged-who.dir/clean

regress/mged/CMakeFiles/regress-mged-who.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/mged /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/mged/CMakeFiles/regress-mged-who.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : regress/mged/CMakeFiles/regress-mged-who.dir/depend

