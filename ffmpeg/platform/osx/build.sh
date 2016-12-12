

./configure --prefix=$PREFIX \
--disable-doc \
--disable-debug \
--disable-encoders \
--disable-decoders \
--enable-decoder=h264 \
--disable-bzlib \
--disable-iconv \
--extra-cflags="-Os -fPIC" \


make clean
make -j4
make install

