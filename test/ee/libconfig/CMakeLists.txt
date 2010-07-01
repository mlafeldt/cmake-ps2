PROJECT("libconfig" C)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE_DIRECTORIES(include)

ADD_LIBRARY(config STATIC src/grammar.c src/libconfig.c src/scanctx.c src/scanner.c src/strbuf.c)
