## 编译libsodium-test
0. 编译`wasi-sdk`
1. 执行`build-libsodium.sh`
2. 执行`build-dynamic-libsodium-test.sh`和`build-libsodium-test.sh`分别生成动态和静态libsodium test的wasm文件

## 生成对比的excel文件
执行show.py文件，生成`file_sizes_comparison.xlsx`