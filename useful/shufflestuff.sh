#!/usr/bin/env sh

skipfirst=0
file=""
percentage=50
while [ $# -gt 0 ]; do
    case "$1" in
    -f | --file)
        shift
        file=$1
        ;;
    -s | --skipfirst)
        shift
        skipfirst=$1
        ;;
    -p | --percentage)
        shift
        percentage=$1
        ;;
    esac
    shift
done

shufflefile(){
    len=$(wc -l "$file" | awk '{print $1}')
    len=$(($len - 1))
    randomtmp=$(mktemp)
    if [ "$skipfirst" -eq 1 ]; then
        i=1;
        printf "%06d\n" 0 > "$randomtmp"

    else
        i=0;
    fi
    while [ "$i" -le "$len" ]; do
        if [ $((i + 1)) -eq "$len" ]; then
            printf "%06d\n" $(($RANDOM + 1)) >> "$randomtmp"
        else
            printf "%06d\n" $(($RANDOM + 1)) >> "$randomtmp"
        fi
        i=$((i + 1))
    done
    paste "$randomtmp" "$file" | sort -n -k1,1 | cut -c8-
}

get_percentage() {
    skipfirst=0
    i=0
    wholestring=""
    while [ "$i" -lt 100 ]; do
        if [ "$i" -lt "$percentage" ]; then
            if [ "$i" -eq 0 ]; then
                wholestring=$(printf '0\n')
            else
                wholestring="$wholestring\n"$(printf '0\n')
            fi
        else
            wholestring="$wholestring\n"$(printf '1\n')
        fi
        i=$((i + 1))

    done
    file=$(mktemp)
    echo -e -n "$wholestring" > "$file"
    vx=$(shufflefile)
    vx=$(echo -e -n "$vx" | head -n 2 | tail -n 1)
    vx=$((vx + 0)) 
    return $vx
}
if [ "$file" = "" ]; then
    get_percentage 
else 
    shufflefile
fi

# sh /sdcard/usefulscripts/shufflestuff.sh --file /sdcard/u.txt --skipfirst 1 | awk -f /sdcard/printer/awk_pretty_print.awk
# sh /sdcard/usefulscripts/shufflestuff.sh --percentage 30 
# sh /sdcard/usefulscripts/shufflestuff.sh --file /sdcard/u.txt --skipfirst 0 | awk -f /sdcard/printer/awk_pretty_print.awk