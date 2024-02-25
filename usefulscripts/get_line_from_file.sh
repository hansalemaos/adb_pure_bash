#!/bin/bash

get_line() {
    number="$1"
    sed "${number}q;d" "$2"

}

get_line "$1" "$2"