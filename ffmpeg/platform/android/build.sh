
function do_make()
{
    mkdir -p "$PREFIX/$ARCH"

    ./configure --prefix="$PREFIX/$ARCH" \
    --disable-programs \
    --disable-doc \
    --disable-debug \
    --disable-everything \
    --enable-decoder=h264 \
    --target-os=linux \
    --arch=$ARCH \
    --enable-cross-compile \
    --cross-prefix=$CROSS_PREFIX \
    --disable-neon \
    --disable-asm \
    --disable-yasm \
    --sysroot=$SYSROOT \
    --extra-cflags="-fPIC -D__GLIBC__ $EXFLAGS" \


    make clean
    make -j4
    make install

}


function set_x64()
{
    SDK_VER=24
    ARCH=x86_64
    SYSROOT=$ANDROID_NDK/platforms/android-$SDK_VER/arch-$ARCH
    TOOLCHAIN=$ANDROID_NDK/toolchains/x86_64-4.9/prebuilt/darwin-x86_64
    EXFLAGS=""
    CROSS_PREFIX=$TOOLCHAIN/bin/x86_64-linux-android-
}

function set_x86()
{
    SDK_VER=19
    ARCH=x86
    SYSROOT=$ANDROID_NDK/platforms/android-$SDK_VER/arch-$ARCH
    TOOLCHAIN=$ANDROID_NDK/toolchains/x86-4.9/prebuilt/darwin-x86_64
    EXFLAGS=""
    CROSS_PREFIX=$TOOLCHAIN/bin/i686-linux-android-

}

function set_arm64()
{
    SDK_VER=24
    ARCH=arm64
    SYSROOT=$ANDROID_NDK/platforms/android-$SDK_VER/arch-$ARCH
    TOOLCHAIN=$ANDROID_NDK/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64
    #EXFLAGS="-marm"
    EXFLAGS=""
    CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android-

}


function set_armv7()
{
    SDK_VER=19
    ARCH=arm
    SYSROOT=$ANDROID_NDK/platforms/android-$SDK_VER/arch-$ARCH
    TOOLCHAIN=$ANDROID_NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
    EXFLAGS="-marm"
    CROSS_PREFIX=$TOOLCHAIN/bin/arm-linux-androideabi-

}


set_armv7
do_make


set_arm64
do_make


set_x86
do_make


set_x64
do_make
