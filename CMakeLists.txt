PROJECT("Cube Sample" C)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE(build-ee.cmake)

SET(EE_SRCS cube.c)

SET(EE_BIN cube.elf)
SET(EE_LIBS draw graph math3d mf packet dma)
EE_BUILD_BIN()

SET(EE_LIB cube)
EE_BUILD_LIB()

SET(EE_ERL cube.erl)
EE_BUILD_ERL()
