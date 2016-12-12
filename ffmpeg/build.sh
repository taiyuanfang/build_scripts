#!/bin/bash

ROOT=$(pwd)
PLATFORM=$1

if ! [ -f "platform/$PLATFORM/build.sh" ]; then
    echo "platform/$PLATFORM/build.sh not found"
    exit
fi

if ! [ -d "$ROOT/src/ffmpeg" ]; then
    mkdir -p "$ROOT/src"
    cd "$ROOT/src"
    git clone https://git.ffmpeg.org/ffmpeg.git
    cd ffmpeg
    git checkout n3.2.2
    git checkout -b 3.2.2
fi

cd "$ROOT/src/ffmpeg"
RELEASE=$(cat RELEASE)
PREFIX="$ROOT/platform/$PLATFORM/$RELEASE"
mkdir -p "$PREFIX"

./configure --help > configure.help

. "$ROOT/platform/$PLATFORM/build.sh"

cd "$ROOT"
