#!/bin/bash
wasi_sdk_folder=/home/noname/Desktop/wasm/wasi-sdk-new/wasi-sdk/build/install/opt/wasi-sdk

CC=$wasi_sdk_folder/bin/clang
CFLAGS="--target=wasm32-wasi -I$PWD/test/quirks -I$PWD/libsodium-wasm32-wasi/include -L$PWD/libsodium-wasm32-wasi/lib -lsodium" 

target_folder=./libsodium-test
mkdir -p "$target_folder"

for file in "$PWD/test/default"/*.c ; do
  filename=$(basename "$file")
  $CC "$file" $CFLAGS -o "$target_folder/${filename%.c}.wasm"
done