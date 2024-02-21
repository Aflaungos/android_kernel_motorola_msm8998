rm -rf out
mkdir -p out

export ARCH=arm64
export CLANG_PATH=${HOME}/linux-x86/clang-r416183b/bin
export PATH=${CLANG_PATH}:${PATH}
export CROSS_COMPILE=${HOME}/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=${HOME}/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
export KERNEL_LLVM_BIN=${HOME}/linux-x86/clang-r416183b/bin/clang
export LD_LIBRARY_PATH=${HOME}/linux-x86/clang-r416183b/lib64:$LD_LIBRARY_PATH
export CLANG_TRIPLE=aarch64-linux-gnu-
export KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc"

make -j8 -C $(pwd) O=$(pwd)/out AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip $KERNEL_MAKE_ENV ARCH=arm64 CC=clang lineageos_evert_defconfig
make -j8 -C $(pwd) O=$(pwd)/out AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip $KERNEL_MAKE_ENV ARCH=arm64 CC=clang