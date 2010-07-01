#!/bin/bash

dir=${1:?"source directory missing"}

if grep -q "test/ee" <<< "${dir}"; then
    arch="ee"
else
    arch="iop"
fi

cd build || exit 1
rm -rf *
cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain-${arch}.cmake \
    "../${dir}" || exit 1
make
