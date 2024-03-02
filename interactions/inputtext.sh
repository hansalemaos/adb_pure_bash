#!/usr/bin/env sh

get_random_number_between() {

    randomnuber=$(((RANDOM % $(($2- $1))) + $1))
    echo "$randomnuber"
}


min=100
max=200
lettermax=1
lettermin=1
while [ $# -gt 0 ]; do
    case "$1" in
    -t | --text)
        shift
        text=$(echo -e -n "$1" | awk  'BEGIN{FS="\t"; }(NR>=1){h=$0;  gsub(/[àáâäæãåāǎ]/,"a", h);  gsub(/[çćč]/,"c", h);  gsub(/[èéêëēėęě]/,"e", h);  gsub(/[îïííīįìǐ]/,"i", h);  gsub(/[ł]/,"l", h);  gsub(/[ñń]/,"n", h);  gsub(/[ôöòóœøōǒõ]/,"o", h);  gsub(/[ßśš]/,"s", h);  gsub(/[ûüǔùǖǘǚǜúū]/,"u", h);  gsub(/[ÿ]/,"y", h);  gsub(/[žźż]/,"z", h);  gsub(/[ÀÁÂÄÆÃÅĀǍ]/,"A", h);  gsub(/[ÇĆČ]/,"C", h);  gsub(/[ÈÉÊËĒĖĘĚ]/,"E", h);  gsub(/[ÎÏÍÍĪĮÌǏ]/,"I", h);  gsub(/[Ł]/,"L", h);  gsub(/[ÑŃ]/,"N", h);  gsub(/[ÔÖÒÓŒØŌǑÕ]/,"O", h);  gsub(/[SSŚŠ]/,"S", h);  gsub(/[ÛÜǓÙǕǗǙǛÚŪ]/,"U", h);  gsub(/[Ÿ]/,"Y", h);  gsub(/[ŽŹŻ]/,"Z", h);  print h;  }')
        echo text: "$text"
        ;;
    -i | --min)
        shift
        min=$1
        ;;
    -a | --max)
        shift
        max=$1
        ;;
    -l | --lettermax)
        shift
        lettermax=$1
        ;;
    -m | --lettermin)
        shift
        lettermin=$1
        ;;
    esac
    shift
done
i=0
lines=$(echo -e -n "$text" | wc -l)
ii=0
while [ "$ii" -le "$lines" ]; do
    #| head -n $i | tail -n 1)
    text2=$(echo -e -n "$text" | head -n $(($ii + 1)) | tail -n 1)
    strilen=${#text2}
    while [ "$i" -lt "$strilen" ]; do
        if [ "$lettermax" -eq "$lettermin" ]; then
            j=$lettermax
        else
            ra=$(get_random_number_between "$lettermin" "$lettermax")
            j=$ra
        fi
        letter="${text2:$i:$j}"
        echo "$letter"
        input text "$letter"
        i=$((i + j))
        ra=$(get_random_number_between "$min" "$max")
        sleep 0."$ra"
    done
    i=0
    ii=$((ii + 1))
    if [ "$lines" -gt 1 ]; then
        input keyevent KEYCODE_ENTER
    fi
done

# sh /sdcard/interactions/inputtext.sh --text "Hello my friend\nbibi\nddx" --min 100 --max 200 --lettermin 1 --lettermax 3
# sh /sdcard/interactions/inputtext.sh --text "Hello my friend\nbibi\nddx" --min 100 --max 200
# sh /sdcard/interactions/inputtext.sh --text "Hello my friend\nbibi\nddx"