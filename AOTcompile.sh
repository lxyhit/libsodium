target_folder="./libsodium-test-dynamic"
AOT_COMPILER=/home/noname/Desktop/wasm/iwasm-rs/wasm-llvm

for wasm_file in "$target_folder"/*.wasm; do
    wat_file="${wasm_file%.wasm}.so"        
    $AOT_COMPILER "$wasm_file" --format=dylib -o "$wat_file"
    echo "Converted: $wasm_file to $wat_file"
done