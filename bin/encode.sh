#!/usr/bin/env bash

# One of my video encoding tests for amazon's compute cluster
IN="$1"; OUT="output.webm";

ffmpeg -i "$IN" -c:v libvpx -b:v 1M -c:a libvorbis "$OUT"
