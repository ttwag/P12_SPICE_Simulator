# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/taowang/Desktop/project/p12_spice_simulator

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/taowang/Desktop/project/p12_spice_simulator/build

# Include any dependencies generated for this target.
include CMakeFiles/p12_spice_simulator.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/p12_spice_simulator.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/p12_spice_simulator.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/p12_spice_simulator.dir/flags.make

CMakeFiles/p12_spice_simulator.dir/src/main.c.o: CMakeFiles/p12_spice_simulator.dir/flags.make
CMakeFiles/p12_spice_simulator.dir/src/main.c.o: /Users/taowang/Desktop/project/p12_spice_simulator/src/main.c
CMakeFiles/p12_spice_simulator.dir/src/main.c.o: CMakeFiles/p12_spice_simulator.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/taowang/Desktop/project/p12_spice_simulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/p12_spice_simulator.dir/src/main.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/p12_spice_simulator.dir/src/main.c.o -MF CMakeFiles/p12_spice_simulator.dir/src/main.c.o.d -o CMakeFiles/p12_spice_simulator.dir/src/main.c.o -c /Users/taowang/Desktop/project/p12_spice_simulator/src/main.c

CMakeFiles/p12_spice_simulator.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/p12_spice_simulator.dir/src/main.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/taowang/Desktop/project/p12_spice_simulator/src/main.c > CMakeFiles/p12_spice_simulator.dir/src/main.c.i

CMakeFiles/p12_spice_simulator.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/p12_spice_simulator.dir/src/main.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/taowang/Desktop/project/p12_spice_simulator/src/main.c -o CMakeFiles/p12_spice_simulator.dir/src/main.c.s

# Object files for target p12_spice_simulator
p12_spice_simulator_OBJECTS = \
"CMakeFiles/p12_spice_simulator.dir/src/main.c.o"

# External object files for target p12_spice_simulator
p12_spice_simulator_EXTERNAL_OBJECTS =

target/p12_spice_simulator: CMakeFiles/p12_spice_simulator.dir/src/main.c.o
target/p12_spice_simulator: CMakeFiles/p12_spice_simulator.dir/build.make
target/p12_spice_simulator: CMakeFiles/p12_spice_simulator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/taowang/Desktop/project/p12_spice_simulator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable target/p12_spice_simulator"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/p12_spice_simulator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/p12_spice_simulator.dir/build: target/p12_spice_simulator
.PHONY : CMakeFiles/p12_spice_simulator.dir/build

CMakeFiles/p12_spice_simulator.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/p12_spice_simulator.dir/cmake_clean.cmake
.PHONY : CMakeFiles/p12_spice_simulator.dir/clean

CMakeFiles/p12_spice_simulator.dir/depend:
	cd /Users/taowang/Desktop/project/p12_spice_simulator/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/taowang/Desktop/project/p12_spice_simulator /Users/taowang/Desktop/project/p12_spice_simulator /Users/taowang/Desktop/project/p12_spice_simulator/build /Users/taowang/Desktop/project/p12_spice_simulator/build /Users/taowang/Desktop/project/p12_spice_simulator/build/CMakeFiles/p12_spice_simulator.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/p12_spice_simulator.dir/depend

