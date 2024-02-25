#!/usr/bin/env sh
build_array_from_arguments() {
    array=()
    va=""
    i=0
    arr=( "$@" )
    for ix in "${arr[@]}"; do
        if [ "$i" -eq 0 ]; then
            va="$ix"
        else
            array+=("$ix")
        fi
        i=$((i + 1))
    done
    for elem in "${array[@]}"; do
        if [[ "$elem" == "$va" ]]; then
            return 0
        fi
    done
    return 1
}

build_array_from_arguments "$@"
