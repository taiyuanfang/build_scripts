#!/bin/bash

ROOT=$(pwd)
PLATFORM=$1
FFMPEG_TAG="n3.2.4"

PLATFORM_DIR="$ROOT/platform/$PLATFORM"
SRC_DIR="$ROOT/src"

if ! [ -f "$PLATFORM_DIR/build.sh" ]; then
    echo "$PLATFORM_DIR/build.sh not found"
    exit
fi

if ! [ -d "$SRC_DIR/ffmpeg" ]; then
    mkdir -p "$SRC_DIR"
    cd "$SRC_DIR"
    git clone https://git.ffmpeg.org/ffmpeg.git
    cd ffmpeg
    git checkout $FFMPEG_TAG -b $FFMPEG_TAG
fi

cd "$SRC_DIR/ffmpeg"
RELEASE=$(cat RELEASE)
PREFIX="$PLATFORM_DIR/$RELEASE"
mkdir -p "$PREFIX"

./configure --help > configure.help

. "$PLATFORM_DIR/build.sh"

cd "$ROOT"
