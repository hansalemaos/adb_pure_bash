#!/bin/sh

power() {
    base="$1"
    exponent="$2"
    result=1
    while [ "$exponent" -gt 0 ]; do
        result=$((result * base))
        exponent=$((exponent - 1))
    done
    echo "$result"
}

split_to_patterns() {
    min_="$1"
    max_="$2"
    stops="$max_"

    nines_count=1
    mintem="${min_%?}"
    stop="$mintem"9
    while [ "$min_" -le "$stop" ] && [ "$stop" -lt "$max_" ]; do
        if ! echo "$stops" | grep -q "\<$stop\>"; then
            stops="$stops $stop"
        fi

        nines_count=$((nines_count + 1))
        nines_counter=0
        mintem="${min_}"
        while [ "$nines_counter" -lt "$nines_count" ]; do
            mintem="${mintem%?}"
            nines_counter=$((nines_counter + 1))
        done
        nines_counter1=1
        while [ "$nines_counter1" -lt "$nines_count" ]; do
            mintem="${mintem}9"
            nines_counter1=$((nines_counter1 + 1))
        done
        stop="$mintem"9
    done

    zeros_count=1
    po1=$(power 10 "$zeros_count")
    ma1=$(($max_ + 1))
    ma2=$(($max_ + 1))
    subs1=$((ma1 - ma2 % $po1))
    stop=$((subs1 - 1))
    while [ "$min_" -lt "$stop" ] && [ "$stop" -le "$max_" ]; do
        if ! echo "$stops" | grep -q -E "\b$stop\b"; then
            stops="$stops\n$stop"
        fi

        zeros_count=$((zeros_count + 1))
        ma1=$(($max_ + 1))
        ma2=$(($max_ + 1))
        po1=$(power 10 "$zeros_count")
        subs1=$((ma1 - ma2 % $po1))
        stop=$((subs1 - 1))
    done

    stops=$(echo "$stops" | tr " " "\n" | uniq | sort -n)
    subpatterns=""

    start="$min_"
    for stop in $stops; do
        pattern=""
        start_digits=$(echo "$start" | fold -w1)
        stop_digits=$(echo "$stop" | fold -w1)

        IFS=$'\n'
        for start_digit in $start_digits; do
            stop_digit=$(echo "$stop_digits" | head -n 1)
            stop_digits=$(echo "$stop_digits" | tail -n +2)
            if [ "$start_digit" -gt "$stop_digit" ]; then
                pattern=""
                break
            fi
            if [ "$start_digit" = "$stop_digit" ]; then
                pattern="$pattern$start_digit"
            elif [ "$start_digit" != "0" ] || [ "$stop_digit" != "9" ]; then
                if [ "$start_digit" -lt "$stop_digit" ]; then
                    pattern="$pattern""[$start_digit-$stop_digit]"
                fi
            else
                pattern="$pattern""[0-9]"
            fi
        done

        if [ -z "$pattern" ]; then
            pattern=""
        else
            subpatterns="$subpatterns($pattern)|"
        fi

        start=$((stop + 1))
    done
    stripped="${subpatterns%??}"
    finalcode="^($stripped))$"
    printf "%s" "$finalcode"
}

split_to_patterns "$1" "$2"
