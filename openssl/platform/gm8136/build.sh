export TOOLCHAIN=/media/data/workspace/gm/8136/sdk/toolchain_gnueabi-4.4.0_ARMv5TE/usr
export PATH=$TOOLCHAIN/bin:$PATH

export CC=arm-linux-cc
export AR=arm-linux-ar
export LD=arm-linux-ld
export RANLIB=arm-linux-ranlib
export STRIP=arm-linux-strip


/usr/bin/perl ./Configure linux-armv4 --prefix=$PREFIX -fPIC shared #os/compiler:arm-linux-cc
#./Configure --prefix=$PREFIX -fPIC shared os/compiler:arm-linux-cc

make clean
make -j4 build_libs
make -j4
make install
