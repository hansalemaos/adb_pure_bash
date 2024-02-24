#!/usr/bin/env sh

click_coords() {
    SCRIPT=$(realpath "$0")
    SCRIPTPATH=$(dirname "$SCRIPT")
    awkcoords=$SCRIPTPATH/awkcentercoords.awk
    eval $(awk -f "$awkcoords" "$1")
    echo "$CENTERCLICKX" "$CENTERCLICKY"

    if [[ "$CENTERCLICKX" -gt -1 && "$CENTERCLICKY" -gt -1 ]]; then
        input tap "$CENTERCLICKX" "$CENTERCLICKY"
        return 0
    else
        return 1
    fi
}
click_coords "$1"

# sh /sdcard/uidumpparser/u.sh > /sdcard/u.txt
# sh /sdcard/tap1stcoords/tap_first_center_coords.sh /sdcard/u.txt

# sh /sdcard/activityparser/awkparser.sh > /sdcard/a.txt
# sh /sdcard/tap1stcoords/tap_first_center_coords.sh /sdcard/a.txt
