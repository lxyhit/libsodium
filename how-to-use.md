## 需要改动的地方
`build-libsodium.sh`、`build-dynamic-libsodium-test.sh`、`build-libsodium-test.sh`三个shell脚本需要更改开头`wasi-sdk_folder`变量为对应的地址
`AOTcompile.sh`需要更改`AOT_COMPILER`为AOT编译器的地址
`show.py`需要更改`file_extension`为对比文件的后缀名

## 如何编译libsodium-test
0. 编译`wasi-sdk`
1. 执行`build-libsodium.sh`
2. 执行`build-dynamic-libsodium-test.sh`和`build-libsodium-test.sh`分别生成动态和静态libsodium test对应的的wasm文件

## 生成对比的excel文件
执行show.py文件，生成`file_sizes_comparison.xlsx`