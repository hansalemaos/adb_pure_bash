#!/bin/bash
get_width_height() {
    local -n stringarraywidthheight=$1
    stringarraywidthheight=()
    screen_width=$(wm size | grep -oE '[0-9]+x[0-9]+$')
    stringarraywidthheight=()
    dlim="x"
    splitstringdelim stringarraywidthheight "$screen_width" "$dlim"
    #echo "${stringarraywidthheight[0]}"
    #echo "${stringarraywidthheight[1]}"
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

widthheight=()
get_width_height widthheight
screen_w="${widthheight[0]}"
screen_h="${widthheight[1]}"
echo "$screen_w" "$screen_h"