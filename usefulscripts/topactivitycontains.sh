#!/usr/bin/env sh

contains() {
    string=$(dumpsys activity | grep 'mCurrentFocus')
    exit_code=$?
    if [ "$exit_code" -eq 1 ]; then
        contains "$1"
    fi
    substring="$1"

    if test "${string#*"$substring"}" != "$string"; then
        return 0
    else
        return 1
    fi
}

contains "$1"
