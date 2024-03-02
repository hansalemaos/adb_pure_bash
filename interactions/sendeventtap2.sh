#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
savedscripts=$SCRIPTPATH/savedsendeventscripts
if ! [ -d "$savedscripts" ]; then
    mkdir -p "$savedscripts"
fi
getdev() {
    input_dir="/dev/input/"
    for event_file in "$input_dir"event*; do
        if [ -e "$event_file" ]; then
            numeric_value=$(getevent -lp "$event_file" | awk -F'[[:space:]]max[[:space:]]|:' '/max/ { split($3, parts, ","); if (parts[1] != " value 0") print parts[1] }')
            if [[ -n "$numeric_value" ]]; then
                echo "$event_file $numeric_value"
            fi
        fi
    done
}
formatbinary() {
    int1=$1
    int2=$2
    int3=$3
    int4=$4
    int5=$5
    da=$(printf "\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x\\\\x%02x" $((int1 & 0xFF)) $((int1 >> 8 & 0xFF)) $((int1 >> 16 & 0xFF)) $((int1 >> 24 & 0xFF)) $((int2 & 0xFF)) $((int2 >> 8 & 0xFF)) $((int2 >> 16 & 0xFF)) $((int2 >> 24 & 0xFF)) $((int3 & 0xFF)) $((int3 >> 8 & 0xFF)) $((int4 & 0xFF)) $((int4 >> 8 & 0xFF)) $((int5 & 0xFF)) $((int5 >> 8 & 0xFF)) $((int5 >> 16 & 0xFF)) $((int5 >> 24 & 0xFF)))
    echo -n -e "$da" >>"$tmpfile"
}
trim() {
    var="$1"
    var="${var#"${var%%[![:space:]]*}"}" # Remove leading whitespace
    var="${var%"${var##*[![:space:]]}"}" # Remove trailing whitespace
    echo -n "$var"
}
x="$1"
y="$2"
inputdev="$3"    # Input device (without '/dev/input/')
inputdevmax="$4" # Maximum value from sh_get_sendevent_input_devices()
if [ "$inputdevmax" -eq 0 ]; then
    splitter="$inputdev "
    devin=$(getdev)
    mano=$(echo "$devin" | awk -F"$splitter" '{print $2}' | xargs)
    inputdevmax=$(trim "$mano")
fi
width="$5"  # Screen width
height="$6" # Screen height
fofilex=$((width - x))
tmpfile="$savedscripts"/"$y"_"$fofilex"_"$width"_"$height"_"$inputdev"_"$inputdevmax".txt
if [ -f "$tmpfile" ]; then
    exec 3>"/dev/input/$inputdev"
    cat "$tmpfile" >&3
    exec 3>&-
    sendevent /dev/input/$inputdev 0 0 0
    sendevent /dev/input/$inputdev 0 2 0
    sendevent /dev/input/$inputdev 0 0 0
else
    formatbinary 1 2 0 2 0
    formatbinary 1 2 0 0 0
    formatbinary 1 2 3 53 $((x * inputdevmax / width))
    formatbinary 1 2 0 2 0
    formatbinary 1 2 0 0 0
    formatbinary 1 2 3 54 $((y * inputdevmax / height))
    formatbinary 1 2 0 2 0
    formatbinary 1 2 0 0 0
    formatbinary 1 2 0 2 0
    formatbinary 1 2 0 0 0
    formatbinary 1 2 3 53 $((x * inputdevmax / width))
    formatbinary 1 2 0 2 0
    formatbinary 1 2 0 0 0
    formatbinary 1 2 3 54 $((y * inputdevmax / height))
    formatbinary 1 2 0 2 0
    formatbinary 1 2 0 0 0
    formatbinary 1 2 0 2 0
    formatbinary 1 2 0 0 0
    exec 3>"/dev/input/$inputdev"
    cat "$tmpfile" >&3
    exec 3>&-
    sendevent /dev/input/$inputdev 0 0 0
    sendevent /dev/input/$inputdev 0 2 0
    sendevent /dev/input/$inputdev 0 0 0
fi
