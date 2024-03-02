#!/usr/bin/env sh

randomsleep(){
    rounds="$1"
    roundscounter=0;
    while [ "$roundscounter" -lt "$rounds" ]; do
        randno=$((1 + RANDOM))
        randomnumber=$((randno % 3))
        sleep 0."$randomnumber"
        roundscounter=$((roundscounter + 1))
    done
}

randomsleep "$1"