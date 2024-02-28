#!/usr/bin/env sh

shufflelinesecho() {
    echo "$1" | head -n 100 | while IFS="$(printf '\n')" read -r line; do
        printf "%06d %s\n" $RANDOM "$line"
    done | sort -n -k1,1 | cut -c8-
}

get_percentage() {
    percentage="$1"
    i=0
    wholestring=""
    while [ "$i" -lt 100 ]; do
        if [ "$i" -lt "$percentage" ]; then
            if [ "$i" -eq 0 ]; then
                wholestring=$(printf '%s\t0\n' "$i")
            else
                wholestring="$wholestring\n"$(printf '%s\t0\n' "$i")
            fi
        else
            wholestring="$wholestring\n"$(printf '%s\t1\n' "$i")
        fi
        i=$((i + 1))

    done
    allstr=$(shufflelinesecho "$wholestring")
    vx=$(echo "$allstr" | head -n 1 | awk '(NR==1){print $2}')
    vx=$((vx + 0))
    return $vx
}
get_percentage "$1"
