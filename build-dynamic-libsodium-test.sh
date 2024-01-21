#!/bin/bash

CC=/home/noname/Desktop/wasm/wasi-sdk-new/wasi-sdk/build/install/opt/wasi-sdk/bin/clang
CFLAGS="--target=wasm32-wasi -fPIC -I$PWD/test/quirks -I$PWD/libsodium-wasm32-wasi/include -L$PWD/libsodium-wasm32-wasi/lib -lsodium -Wl,--shared -Wl,--no-export-dynamic " 

target_folder=./libsodium-test-dynamic
mkdir -p "$target_folder"

for file in "$PWD/test/default"/*.c ; do
  filename=$(basename "$file")
  $CC "$file" $CFLAGS -o "$target_folder/${filename%.c}.wasm"
done