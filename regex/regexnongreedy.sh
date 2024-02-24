#!/usr/bin/env bash
grepnongreedy() {
    string="$3"
    lenstring=${#string}
    i=0
    regularexpression="$1"
    findshortest="$2"
    result=""
    while [[ "$i" -le "$lenstring" ]]; do
        i=$((i + 1))
        result=$(echo ${string:0:$i} | grep -oE "$regularexpression")
        if [ -z "$result" ]; then
            continue
        else
            if [ "$findshortest" -ge 1 ]; then
                resulttemp="$result"
                resulttemp2="$result"
                j=0
                while [[ "$j" -lt "$i" ]]; do
                    resulttemp=$(echo ${result:$j:$i} | grep -oE "$regularexpression")
                    if [ -z "$resulttemp" ]; then
                        result="$resulttemp2"
                        break
                    else
                        resulttemp2="$resulttemp"
                    fi
                    j=$((j + 1))
                done
                break
            else
                break
            fi
        fi
    done
    echo "$result"
}

grepnongreedy "$1" "$2" "$3"

# string="oioioibabapooiba"
# regularexpression="oi.*ba"
# findshortest=0
# sh /sdcard/regex/regexnongreedy.sh "$regularexpression" "$findshortest" "$string"
# # oioioiba

# string="oioioibabapooiba"
# regularexpression="oi.*ba"
# findshortest=1
# sh /sdcard/regex/regexnongreedy.sh "$regularexpression" "$findshortest" "$string"
# # oiba
