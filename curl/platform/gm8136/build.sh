export TOOLCHAIN=/media/data/workspace/gm/8136/sdk/toolchain_gnueabi-4.4.0_ARMv5TE/usr
export PATH=$TOOLCHAIN/bin:$PATH

export CROSS_COMPILE="arm-linux"
export CC=${CROSS_COMPILE}-cc
export AR=${CROSS_COMPILE}-ar
export LD=${CROSS_COMPILE}-ld
export RANLIB=${CROSS_COMPILE}-ranlib
export STRIP=${CROSS_COMPILE}-strip
export CFLAGS=" -Os "

SSL=$(realpath $ROOT/../openssl/platform/$PLATFORM)
ARES=$(realpath $ROOT/../c-ares/platform/$PLATFORM)

./configure \
--prefix=$PREFIX \
--host=${CROSS_COMPILE} \
--with-ssl=${SSL} \
--enable-ares=${ARES} \
--enable-shared=yes \
--enable-static=no \
--disable-dict \
--disable-imap \
--disable-tftp \
--disable-ftp \
--disable-pop3 \
--disable-telnet \
--disable-rtsp \
--disable-smb \
--disable-smbs \
--enable-smtp \


make clean
make -j4
make install-strip

