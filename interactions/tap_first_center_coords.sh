#!/usr/bin/env sh

get_random_number_between() {

    randomnuber=$(((RANDOM % $(($2- $1))) + $1))
    echo "$randomnuber"
}
random=0
filename=""
offsetx=0
offsety=0
while [ $# -gt 0 ]; do
    case "$1" in
    -f | --filename)
        shift
        filename=$1
        ;;
    -r | --random)
        shift
        random=$1
        ;;
    -x | --offsetx)
        shift
        offsetx=$1
        ;;
    -y | --offsety)
        shift
        offsety=$1
        ;;                
    esac
    shift
done

if [ "$random" -eq 1 ]; then
    filelen=$(wc -l "$filename" | awk '{print $1}')
    filelen=$(($filelen - 1))
    
    if [ "$filelen" -eq 2 ]; then 
        rnx=2
    else 
        rnx=$(get_random_number_between 2 "$filelen")
    fi 

else
    rnx=2
fi
click_coords() {
    text=$(awk -v rn="$rnx" 'BEGIN { FS="\t"; OFS="\t"; fieldnumberx=""; fieldnumbery=""; fieldname1x="centerx"; fieldname2x="CENTER_X"; fieldname1y="centery"; fieldname2y="CENTER_Y"; CENTERX="-1"; CENTERY="-1"; CENTERCLICKX=-1; CENTERCLICKY=-1; } (NR <= 1) { for (i=1; i<=NF;i++) { if(fieldname1x==$i) { fieldnumberx=i; } else if(fieldname2x== $i) { fieldnumberx=i; } else if(fieldname1y== $i) { fieldnumbery=i; } else if(fieldname2y== $i) { fieldnumbery=i; } } } (NR==rn) { if (( $fieldnumberx ~ /^[0-9]+$/) && ( $fieldnumbery ~ /^[0-9]+$/) ){ printf  $fieldnumberx OFS  $fieldnumbery; }}' "$filename")
    CENTERCLICKX=$(echo "$text" | awk '{print $1}')
    CENTERCLICKY=$(echo "$text" | awk '{print $2}')

    if [ "$CENTERCLICKX" != "" ] && [ "$CENTERCLICKY" != "" ]; then
        CENTERCLICKX=$((CENTERCLICKX + $offsetx))
        CENTERCLICKY=$((CENTERCLICKY + $offsety))
        input tap "$CENTERCLICKX" "$CENTERCLICKY"
        return 0
    else
        return 1
    fi
}
click_coords

# sh /sdcard/interactions/tap_first_center_coords.sh --filename /sdcard/u.txt --random 1 --offsetx 0 --offsety 0
# sh /sdcard/interactions/tap_first_center_coords.sh --filename /sdcard/u.txt

