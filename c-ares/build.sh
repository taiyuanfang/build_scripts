#!/bin/bash

ROOT=$(pwd)
PLATFORM=$1

PLATFORM_DIR="$ROOT/platform/$PLATFORM"
SRC_DIR="$ROOT/src"

if ! [ -f "$PLATFORM_DIR/build.sh" ]; then
    echo "$PLATFORM_DIR/build.sh not found"
    exit
fi

if ! [ -d "$SRC_DIR/c-ares" ]; then
    mkdir -p "$SRC_DIR"
    cd "$SRC_DIR"
    git clone https://github.com/c-ares/c-ares.git
    cd c-ares
    ./buildconf
    ./configure --help > configure.help
else
    cd "$SRC_DIR/c-ares"
fi

PREFIX="$PLATFORM_DIR"
mkdir -p "$PREFIX"

. "$PLATFORM_DIR/build.sh"

cd "$ROOT"
