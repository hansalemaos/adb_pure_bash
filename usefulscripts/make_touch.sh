#!/bin/bash

mktouch() {
    mkdir -p ${1%/*} 2>/dev/null
    [ -z "$2" ] && touch "$1" || echo "$2" >"$1"
}

mktouch "$@"
