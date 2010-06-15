#!/bin/bash

cd build/ || exit 1
cmake -DCMAKE_VERBOSE_MAKEFILE=TRUE -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain-ee.cmake .. || exit 1
make
