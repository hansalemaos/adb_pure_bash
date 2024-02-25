#!/usr/bin/env sh
check_if_finished_writing() {
    timeout2=$(($SECONDS + timeoutfinal))

    while true; do
        if [ $SECONDS -gt "$timeout2" ]; then
            return 1
        fi
        initial_size=$(stat -c %s "$1")
        sleep "$2"
        current_size=$(stat -c %s "$1")
        if [ "$current_size" -eq "$initial_size" ]; then
            return 0
        fi
    done
}
get_width_height() {
    local -n stringarraywidthheight=$1
    stringarraywidthheight=()
    screen_width=$(wm size | grep -oE '[0-9]+x[0-9]+$')
    stringarraywidthheight=()
    dlim="x"
    splitstringdelim stringarraywidthheight "$screen_width" "$dlim"
}

splitstringdelim() {
    local -n stringarray="$1"
    inputstring=$2
    sep=$3
    allfilessplit=$(tr "$sep" '\r' <<<"$inputstring")
    array=($(echo $allfilessplit | sed 's/\r/\n/g'))
    for l in "${array[@]}"; do
        stringarray+=("$l")
    done
}
FILES_IN_FOLDER_NEWEST_FIRST=$(ls -lt /sdcard/Download/ | tail -n +2)
FILES_IN_FOLDER_NEWEST_FIRST_len=$(echo "$FILES_IN_FOLDER_NEWEST_FIRST" | wc -l)
timeoutfinal="$2"
am start -n org.mozilla.firefox/org.mozilla.fenix.IntentReceiverActivity -a android.intent.action.VIEW -d "$1"
widthheight=()
get_width_height widthheight
screen_w="${widthheight[0]}"
screen_h="${widthheight[1]}"
screen_wclick=$((screen_w / 100 * 95))
screen_hclick=$((screen_h / 100 * 95))
timeout2=$(($SECONDS + timeoutfinal))
gotit=0
while true; do
    isthere=$(dumpsys activity top | grep 'download_button}$')
    if [ -z "$isthere" ]; then
        echo 'Button not found'
        if [ "$gotit" -ge 1 ]; then
            break
        fi
        sleep 1

    else
        input tap $screen_wclick $screen_hclick
        echo "$screen_w" "$screen_h"
        gotit=1
        #continue

    fi
    if [ $SECONDS -gt "$timeout2" ]; then
        exit 1
    fi

done
cd /sdcard/Download/
timeout2=$(($SECONDS + timeoutfinal))

FILES_IN_FOLDER_NEWEST_FIRST1=$(ls -lt /sdcard/Download/ | tail -n +2)
FILES_IN_FOLDER_NEWEST_FIRST_len1=$(echo "$FILES_IN_FOLDER_NEWEST_FIRST1"  | wc -l)
while [ "$FILES_IN_FOLDER_NEWEST_FIRST_len" -eq "$FILES_IN_FOLDER_NEWEST_FIRST_len1" ]; do
    sleep 1
    FILES_IN_FOLDER_NEWEST_FIRST1=$(ls -lt /sdcard/Download/ | tail -n +2)
    FILES_IN_FOLDER_NEWEST_FIRST_len1=$(echo "$FILES_IN_FOLDER_NEWEST_FIRST1" | wc -l)
    if [ $SECONDS -gt "$timeout2" ]; then
        exit 1
    fi
done
ourfile=$(echo "$FILES_IN_FOLDER_NEWEST_FIRST1" | head -n 1 | awk 'BEGIN{FS=" +[0-9]+:[0-9]+ +"} {print $2}')
ourfile="/sdcard/Download/"$ourfile
timeout2=$(($SECONDS + timeoutfinal))

while true; do
    if check_if_finished_writing "$ourfile" 0.5; then
        break
    fi
    if [ $SECONDS -gt "$timeout2" ]; then
        exit 1
    fi
done
am force-stop org.mozilla.firefox

