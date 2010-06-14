PROJECT("CMake PS2 Sample" C)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE(cmake/FindPS2SDK.cmake)
INCLUDE(cmake/build-ee.cmake)

SET(EE_SRCS hello.c)

SET(EE_BIN hello.elf)
SET(EE_LIBS draw graph math3d mf packet dma)
EE_BUILD_BIN()

SET(EE_LIB hello)
EE_BUILD_LIB()

SET(EE_ERL hello.erl)
EE_BUILD_ERL()
