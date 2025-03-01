# For more information about using CMake with Android Studio, read:
# https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum required CMake version.
cmake_minimum_required(VERSION 3.22.1)

# Declares and names the project.
project("mobileblox" CXX)

# Enforce C++17 standard.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the shared library.
add_library(mobileblox SHARED
    native-lib.cpp

    # Luau Core
    luau/lapi.cpp
    luau/laux.cpp
    luau/lbaselib.cpp
    luau/lbitlib.cpp
    luau/lbuiltins.cpp
    luau/lcorolib.cpp
    luau/ldblib.cpp
    luau/ldebug.cpp
    luau/ldo.cpp
    luau/lfunc.cpp
    luau/lgc.cpp
    luau/lgcdebug.cpp
    luau/linit.cpp
    luau/lmathlib.cpp
    luau/lmem.cpp
    luau/lnumprint.cpp
    luau/lobject.cpp
    luau/loslib.cpp
    luau/lperf.cpp
    luau/lstate.cpp
    luau/lstring.cpp
    luau/lstrlib.cpp
    luau/ltable.cpp
    luau/ltablib.cpp
    luau/ltm.cpp
    luau/ludata.cpp
    luau/lutf8lib.cpp
    luau/lvmexecute.cpp
    luau/lvmload.cpp
    luau/lvmutils.cpp

    # Luau Compiler
    luau/Ast.cpp
    luau/BuiltinFolding.cpp
    luau/Builtins.cpp
    luau/BytecodeBuilder.cpp
    luau/Compiler.cpp
    luau/Confusables.cpp
    luau/ConstantFolding.cpp
    luau/CostModel.cpp
    luau/lcode.cpp
    luau/Lexer.cpp
    luau/Location.cpp
    luau/Parser.cpp
    luau/StringUtils.cpp
    luau/TableShape.cpp
    luau/TimeTrace.cpp
    luau/ValueTracking.cpp
)

# Locate NDK log library.
find_library(log-lib log)

# Find and link Dobby.
find_package(Dobby REQUIRED CONFIG)
include_directories(prefab/modules/dobby/include)

# Link libraries.
target_link_libraries(mobileblox
    dobby::dobby
    ${log-lib}
)
