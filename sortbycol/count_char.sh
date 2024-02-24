#!/usr/bin/env bash
count_char() {
    string=$(echo "$1" | xargs)
    local character="$2"
    local count=0
    count=$(awk -F"$character" '{print NF-1}' <<< "$string")
    echo "$count"
}
count_char "$1" "$2"