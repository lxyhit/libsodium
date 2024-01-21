#!/bin/bash
wasi_sdk_folder=/home/noname/Desktop/wasm/wasi-sdk-new/wasi-sdk/build/install/opt/wasi-sdk

export CC=$wasi_sdk_folder/bin/clang
export AR=$wasi_sdk_folder/bin/llvm-ar
export NM=$wasi_sdk_folder/bin/llvm-nm
export RANLIB=$wasi_sdk_folder/bin/llvm-ranlib
export CFLAGS="-Os -g"

./configure --prefix=$PWD/libsodium-wasm32-wasi --host=wasm32-wasi --disable-ssp --without-pthreads --disable-shared

make -j16 install