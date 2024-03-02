#!/usr/bin/env sh
grant=1
while [ $# -gt 0 ]; do
    case "$1" in
    -g | --grant)
        shift
        grant=$1
        ;;
    -p | --package)
        shift
        package=$1
        ;;
    esac
    shift
done
givepermission(){
    cmdxx=$(dumpsys package "$package" | grep permission | tr -d " " | awk 'BEGIN{FS=":"} {print $1}' | grep -oE '^.*[A-Z_0-9]+$' | uniq)
    while IFS= read -r permission; do
        pm "$1" "$package" "$permission" 2>/dev/null
    done <<<"$cmdxx"
}
if [ "$grant" -eq 0 ]; then
    givepermission revoke
else
    givepermission grant
fi
# sh /sdcard/useful/grantrevoke.sh --package com.termux --grant 0
# sh /sdcard/useful/grantrevoke.sh --package com.termux --grant 1