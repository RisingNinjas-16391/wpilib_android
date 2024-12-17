#!/usr/bin/env bash

ARCHITECTURES=("arm64-v8a" "x86_64")
ROOT=$(pwd)

cd allwpilib

for ABI in "${ARCHITECTURES[@]}"; do
    echo "Now building for $ABI"

    # configure build
    cmake --preset default \
        -S . \
        -B build-$ABI \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DWITH_WPILIB=OFF \
        -DWITH_PROTOBUF=OFF \
        -DWITH_GUI=OFF \
        -DWITH_CSCORE=OFF \
        -DWITH_TESTS=OFF \
        -DWITH_SIMULATION_MODULES=OFF \
        -DWITH_JAVA=ON \
        -DCMAKE_TOOLCHAIN_FILE=../android-ndk-r27c/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI=$ABI \
        -DANDROID_PLATFORM=android-24

    # build
    cd build-$ABI
    cmake --build . --parallel $(nproc)

    # copy libraries
    mkdir -p $ROOT/$ABI
    cp $(find . -name '*.so') $ROOT/$ABI

    cd ..
done

cd $ROOT

# create library archives
tar czvf libraries.tar.gz ${ARCHITECTURES[@]}
zip -r libraries.zip ${ARCHITECTURES[@]}
