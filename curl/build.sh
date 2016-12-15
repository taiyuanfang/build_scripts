#!/bin/bash

ROOT=$(pwd)
PLATFORM=$1

PLATFORM_DIR="$ROOT/platform/$PLATFORM"
SRC_DIR="$ROOT/src"

if ! [ -f "$PLATFORM_DIR/build.sh" ]; then
    echo "$PLATFORM_DIR/build.sh not found"
    exit
fi

if ! [ -d "$SRC_DIR/curl" ]; then
    mkdir -p "$SRC_DIR"
    cd "$SRC_DIR"
    git clone https://github.com/curl/curl.git
    cd curl
    git checkout 7_42
    git branch
    ./buildconf
    ./configure --help > configure.help
else
    cd "$SRC_DIR/curl"
fi

PREFIX="$PLATFORM_DIR"
mkdir -p "$PREFIX"

. "$PLATFORM_DIR/build.sh"

cd "$ROOT"
