#!/bin/bash

get_token() {
    cat "$1" | awk 'FS="\t" {print $NF}'
}
checkemail() {

    curl --insecure -X GET -H "Accept: application/ld+json" -H "Content-Type: application/json" -H "Authorization: Bearer $1" "https://api.mail.tm/messages?page=1"
}
# sh /sdcard/Pictures/checkemail.sh /sdcard/newemail.txt
tok=$(get_token "$1")
checkemail "$tok"
