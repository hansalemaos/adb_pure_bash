#!/bin/bash

trim() {
    local var="$1"
    var="${var#"${var%%[![:space:]]*}"}"   # Remove leading whitespace
    var="${var%"${var##*[![:space:]]}"}"   # Remove trailing whitespace
    echo -n "$var"
}

trim "$@"
