#!/usr/bin/env bash

array_to_string() {
    separator="$1"
    local -n arr=$2

    regex="$(printf "${separator}%s" "${arr[@]}")"
    regex="${regex:${#separator}}" # remove leading separator

    if [[ -n $3 ]]; then
        if [[ $regex = *"$separator"* ]]; then
            prefix=${regex%"$separator"*}              # Extract content before the last instance
            suffix=${regex#"$prefix"}                  # Extract content *after* our prefix
            regex=${prefix}${suffix/"$separator"/"$3"} # Append unmodified prefix w/ suffix w/ replacement
        fi
    fi

    echo "${regex}"
}

build_array_from_arguments() {
    array=()
    va=""
    i=0
    arr=("$@")
    for ix in "${arr[@]}"; do
        if [ "$i" -eq 0 ]; then
            va="$ix"
        else
            array+=("$ix")
        fi
        i=$((i + 1))
    done
    array_to_string "$va" array

}

build_array_from_arguments "$@"
