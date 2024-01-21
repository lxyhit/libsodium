#!/bin/bash

export CC=/home/noname/Desktop/wasm/wasi-sdk-new/wasi-sdk-21.0/bin/clang
export CFLAGS="-Os -g"
export AR=/home/noname/Desktop/wasm/wasi-sdk-new/wasi-sdk-21.0/bin/llvm-ar
export NM=/home/noname/Desktop/wasm/wasi-sdk-new/wasi-sdk-21.0/bin/llvm-nm
export RANLIB=/home/noname/Desktop/wasm/wasi-sdk-new/wasi-sdk-21.0/bin/llvm-ranlib

./configure --prefix=$PWD/libsodium-wasm32-wasi --host=wasm32-wasi --disable-ssp --without-pthreads --disable-shared

make -j16 install