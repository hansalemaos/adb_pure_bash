#!/bin/bash

split() {
   # Usage: split "string" "delimiter"
   IFS=$'\n' read -d "" -r arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}

split "$@"