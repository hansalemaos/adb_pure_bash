#!/bin/bash

get_line() {
    filelen=$(wc -l "$1" | awk '{print $1}')
    filelen=$(($filelen - 1))
    randno=$((1 + RANDOM))
    randomnumber=$((randno % filelen))
    sed "${randomnumber}q;d" "$1"
}

get_line "$1"