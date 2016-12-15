#!/bin/bash

ROOT=$(pwd)
PLATFORM=$1

PLATFORM_DIR="$ROOT/platform/$PLATFORM"
SRC_DIR="$ROOT/src"

if ! [ -f "$PLATFORM_DIR/build.sh" ]; then
    echo "$PLATFORM_DIR/build.sh not found"
    exit
fi

if ! [ -d "$SRC_DIR/openssl" ]; then
    mkdir -p "$SRC_DIR"
    cd "$SRC_DIR"
    git clone https://github.com/openssl/openssl.git
    cd openssl
    git checkout OpenSSL_1_0_0-stable
else
    cd "$SRC_DIR/openssl"
fi

PREFIX="$PLATFORM_DIR"
mkdir -p "$PREFIX"

. "$PLATFORM_DIR/build.sh"

cd "$ROOT"
