#!/usr/bin/env bash
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
get_random_number_between=$SCRIPTPATH/get_random_number_between.sh
getwidthheight=$SCRIPTPATH/getwidthheight.sh
start_swiping2() {
    startwidth1="$1"
    startwidth2="$2"
    endwidth1="$3"
    endwidth2="$4"
    startheight1="$5"
    startheight2="$6"
    endheight1="$7"
    endheight2="$8"
    swipestarttime="$9"
    swipeendtime="${10}"
    swipestartx=$(sh "$get_random_number_between" "$startwidth1" "$startwidth2")
    swipeendx=$(sh "$get_random_number_between" "$endwidth1" "$endwidth2")
    swipestarty=$(sh "$get_random_number_between" "$startheight1" "$startheight2")
    swipeendy=$(sh "$get_random_number_between" "$endheight1" "$endheight2")
    swipetime=$(sh "$get_random_number_between" "$swipestarttime" "$swipeendtime")
    echo "$swipestartx" "$swipestarty" "$swipeendx" "$swipeendy" "$swipetime"
    ecute=$(input swipe "$swipestartx" "$swipestarty" "$swipeendx" "$swipeendy" "$swipetime")

}
start_swiping(){
    read width height <<<$(sh "$getwidthheight")
    numberofscrolls=$(sh "$get_random_number_between" "${11}" "${12}")
    ix=0;
    while [ "$ix" -lt "$numberofscrolls" ]; do
        startheight1=$((height / 100 * $1))
        startheight2=$((height / 100 * $2))

        startwidth1=$((width / 100 * $3))
        startwidth2=$((width / 100 * $4))

        endheight1=$((height / 100 * $5))
        endheight2=$((height / 100 * $6))

        endwidth1=$((width / 100 * $7))
        endwidth2=$((width / 100 * $8))
        start_swiping2 "$startwidth1" "$startwidth2" "$endwidth1" "$endwidth2" "$startheight1" "$startheight2" "$endheight1" "$endheight2" "$9" "${10}"
        sleep 0.1
        ix=$((ix + 1))
    done
}
start_height1="$1"
start_height2="$2"
start_width1="$3"
start_width2="$4"
end_height1="$5"
end_height2="$6"
end_width1="$7"
end_width2="$8"
swipemintime="$9"
swipemaxtime="${10}"
min_repeat="${11}"
max_repeat="${12}"
start_swiping "$start_height1" "$start_height2" "$start_width1" "$start_width2" "$end_height1" "$end_height2" "$end_width1" "$end_width2" "$swipemintime" "$swipemaxtime" "$min_repeat" "$max_repeat"