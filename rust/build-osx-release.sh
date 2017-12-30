#!/bin/bash

cd ./channel_path
cargo rustc --features "cpython/python3-sys" --release -- -C link-arg="-undefined" -C link-arg="dynamic_lookup"
cd ../channel_world
cargo rustc --features "cpython/python3-sys" --release -- -C link-arg="-undefined" -C link-arg="dynamic_lookup"
cd ..

cp ./target/release/libchannel_path.dylib ../cm_channels/channel_path.so
cp ./target/release/libchannel_world.dylib ../cm_channels/channel_world.so
