export TOOLCHAIN=/media/data/workspace/gm/8136/sdk/toolchain_gnueabi-4.4.0_ARMv5TE/usr
export PATH=$TOOLCHAIN/bin:$PATH

export CC=arm-linux-gcc
export AR=arm-linux-ar
export LD=arm-linux-ld
export RANLIB=arm-linux-ranlib
export STRIP=arm-linux-strip


./configure --prefix=$PREFIX --host=arm-linux \
--enable-shared=no \
--enable-static=yes

make clean
make -j4
make install
