export TOOLCHAIN=/media/data/workspace/gm/8126/crosstool/arm-none-linux-gnueabi-4.4.0_ARMv5TE
export PATH=$TOOLCHAIN/bin:$PATH

export CC=arm-none-linux-gnueabi-cc
export AR=arm-none-linux-gnueabi-ar
export LD=arm-none-linux-gnueabi-ld
export RANLIB=arm-none-linux-gnueabi-ranlib
export STRIP=arm-none-linux-gnueabi-strip

#/usr/bin/perl ./Configure linux-armv4 --prefix=$PREFIX -fPIC no-shared #os/compiler:arm-none-linux-gnueabi-cc
./Configure --prefix=$PREFIX -fPIC os/compiler:${CC}

make clean
make -j4 build_libs
make -j4
make install
