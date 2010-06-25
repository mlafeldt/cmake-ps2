PROJECT("netlog" C)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

SET(IOP_BIN netlog)
#SET(IOP_SRCS netlog.c udpcl.c xprintf.c exports.tab imports.lst)
SET(IOP_SRCS netlog.c udpcl.c xprintf.c build-exports.c build-imports.c)
SET(IOP_LIBS)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -fno-builtin -DNETLOG_RPC")
SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -s")

ADD_EXECUTABLE(${IOP_BIN} ${IOP_SRCS})
