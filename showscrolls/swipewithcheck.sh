#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
scrollshowscript=$SCRIPTPATH/scrollshow.sh
get_random_number_between() {

    randomnuber=$(((RANDOM % $(($2- $1))) + $1))
    echo "$randomnuber"
}

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
    swipechange="${11}"
    swipestartx=$(get_random_number_between "$startwidth1" "$startwidth2")
    swipeendx=$(get_random_number_between "$endwidth1" "$endwidth2")
    swipestarty=$(get_random_number_between "$startheight1" "$startheight2")
    swipeendy=$(get_random_number_between "$endheight1" "$endheight2")
    swipetime=$(get_random_number_between "$swipestarttime" "$swipeendtime")
    echo "$swipestartx" "$swipestarty" "$swipeendx" "$swipeendy" "$swipetime"
    rsc=$(sh "$scrollshowscript" -x0 "$swipestartx" -y0 "$swipestarty"  -x1 "$swipeendx"  -y1 "$swipeendy" -m "$swipetime")
    howmanychanges=$(echo -e -n "$rsc" | sed -e 's/[-[:space:]0-9]/\n/g' | xargs -n 1 | wc -l)
    echo "$howmanychanges"
    if [ "$howmanychanges" -lt "$swipechange" ]; then 
        return 1
    else 
        return 0
    fi

}
start_swiping(){
    read width height <<<$(wm size | awk 'BEGIN{FS="[[:space:]x]";}{printf $(NF-1)" "$NF}')
    numberofscrolls=$(get_random_number_between "${11}" "${12}")
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
        start_swiping2 "$startwidth1" "$startwidth2" "$endwidth1" "$endwidth2" "$startheight1" "$startheight2" "$endheight1" "$endheight2" "$9" "${10}" "${13}"
        if [ $? -eq 0 ]; then
            echo "scrolled"
        else
            echo "not scrolled"
            return 1
        fi        
        sleep 0.1
        ix=$((ix + 1))
    done
    return 0
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
swipechange="${13}"
start_swiping "$start_height1" "$start_height2" "$start_width1" "$start_width2" "$end_height1" "$end_height2" "$end_width1" "$end_width2" "$swipemintime" "$swipemaxtime" "$min_repeat" "$max_repeat" "$swipechange"

# sh /sdcard/showscrolls/swipewithcheck.sh 70 80 45 47 30 40 45 47 1000 3000 5 10 8

# i=0
# while [ "$i" -lt 10 ]; do
#     sh /sdcard/showscrolls/swipewithcheck.sh 70 80 45 47 30 40 45 47 1000 3000 5 10 8
#     sh /sdcard/showscrolls/swipewithcheck.sh 30 40 45 47 70 80 45 47 1000 3000 5 10 8
#     i=$((i + 1))
#     sleep 1
# done