export TOOLCHAIN=/media/data/workspace/gm/8136/sdk/toolchain_gnueabi-4.4.0_ARMv5TE/usr
export PATH=$TOOLCHAIN/bin:$PATH

export CC=arm-linux-cc
export AR=arm-linux-ar
export LD=arm-linux-ld
export RANLIB=arm-linux-ranlib
export STRIP=arm-linux-strip

export CROSS_TARGET=arm-linux
export CROSS_COMPILE=${CROSS_TARGET}-
export CROSS_OPENSSL=linux-generic32


#/usr/bin/perl ./Configure linux-armv4 --prefix=$PREFIX -fPIC shared #os/compiler:arm-linux-cc
#./Configure --prefix=$PREFIX -fPIC os/compiler:${CC}

[ -f Makefile ] || \
    ./Configure \
        ${CROSS_OPENSSL} \
        threads \
        shared \
        --prefix=$PREFIX \
        --with-zlib-lib=$PREFIX

make clean
make
make install_sw
