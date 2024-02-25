#!/bin/bash

remove_chars_from_string() {
    printf '%s\n' "${1//$2/}"

}
remove_chars_from_string "$@"