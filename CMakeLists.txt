cmake_minimum_required(VERSION 3.10)

# Set the project name
project(p12_spice_simulator C)

# Specify the C standard
set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED True)

# Specify the output directory for binaries
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/target)

# Generate compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Add the include directory
include_directories(${PROJECT_SOURCE_DIR}/include)

# Collect all source files in the src directory
file(GLOB_RECURSE SOURCES ${PROJECT_SOURCE_DIR}/src/*.c)

# Add the executable
add_executable(${PROJECT_NAME} ${SOURCES})

