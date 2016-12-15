export TOOLCHAIN=/media/data/workspace/gm/8126/crosstool/arm-none-linux-gnueabi-4.4.0_ARMv5TE
export PATH=$TOOLCHAIN/bin:$PATH

export CC=arm-none-linux-gnueabi-cc
export AR=arm-none-linux-gnueabi-ar
export LD=arm-none-linux-gnueabi-ld
export RANLIB=arm-none-linux-gnueabi-ranlib
export STRIP=arm-none-linux-gnueabi-strip

./configure --prefix=$PREFIX --host=arm-linux \
--enable-shared=no \
--enable-static=yes

make clean
make -j4
make install
