#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
shufflefile=$SCRIPTPATH/shufflestuff.sh

sh "$shufflefile" -f "$1" | head -n "$2"

# sh /sdcard/useful/get_n_random_lines_from_file.sh /sdcard/test3.txt 10