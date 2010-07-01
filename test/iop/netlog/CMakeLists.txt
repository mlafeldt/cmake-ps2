PROJECT("netlog" C)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

SET(IOP_BIN netlog.irx)
SET(IOP_SRCS netlog.c udpcl.c xprintf.c build-exports.c build-imports.c)
SET(IOP_LIBS)

SET(out_f "${CMAKE_CURRENT_BINARY_DIR}/build-imports.c")
ADD_CUSTOM_COMMAND(OUTPUT ${out_f}
    COMMAND echo "#include \"irx_imports.h\"" > ${out_f}
    COMMAND cat ${CMAKE_CURRENT_SOURCE_DIR}/imports.lst >> ${out_f}
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/imports.lst
    COMMENT "Creating ${out_f}" VERBATIM
)

SET(out_f "${CMAKE_CURRENT_BINARY_DIR}/build-exports.c")
ADD_CUSTOM_COMMAND(OUTPUT ${out_f}
    COMMAND echo "#include \"irx.h\"" > ${out_f}
    COMMAND cat ${CMAKE_CURRENT_SOURCE_DIR}/exports.tab >> ${out_f}
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/exports.tab
    COMMENT "Creating ${out_f}" VERBATIM
)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -fno-builtin -DNETLOG_RPC")
SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -s")

ADD_EXECUTABLE(${IOP_BIN} ${IOP_SRCS})

ADD_CUSTOM_COMMAND(TARGET ${IOP_BIN} POST_BUILD COMMAND md5sum ARGS ${IOP_BIN})
