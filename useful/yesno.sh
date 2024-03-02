#!/usr/bin/env sh

askuser() {
    printf "$1"
    read answer
    if [ -z "${answer}" ]; then
        answer="y"
    fi
    if [ "$answer" != "${answer#[Yy]}" ]; then
        return 0
    else
        return 1
    fi
}

askuser "$1"
