#!/usr/bin/env sh
write() {
    my_string=("$@")
    strilen=${#my_string}
    i=0
    j=1
    while [ $i -lt "$strilen" ]; do
        letter="${my_string:$i:$j}"
        input text "$letter"
        i=$((i + 1))
        randno=$((1 + RANDOM))
        randomnumber=$((randno % 3))
        sleep 0."$randomnumber"
    done

}
write "$@"
# sh /sdcard/inevents/inputtextnatural.sh "Hoje vou sair!"