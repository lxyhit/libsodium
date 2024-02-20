## 需要改动的地方
`build-libsodium.sh`、`build-dynamic-libsodium-test.sh`、`build-libsodium-test.sh`三个shell脚本需要更改开头`wasi-sdk_folder`变量为对应的地址
`AOTcompile.sh`需要更改`AOT_COMPILER`为AOT编译器的地址，更改`target_folder`为存储wasm文件的文件夹名
`show.py`需要更改`file_extension`为对比文件的后缀名

## 如何编译libsodium-test
0. 编译`wasi-sdk`
1. 执行`build-libsodium.sh`
2. 执行`build-dynamic-libsodium-test.sh`和`build-libsodium-test.sh`分别生成动态和静态libsodium test对应的的wasm文件

## 生成对比的excel文件
执行show.py文件，生成`file_sizes_comparison.xlsx`

## 注意
如果不开启bulk-memory和extended-const会使data段变大从而扩大原文件的大小，在编译时加上`-mbulk-memory -mextended-const`参数可以解决这个问题。但是由于目前wasmtime没有支持extended-const草案，因此无法AOT编译或者是运行得到的文件。