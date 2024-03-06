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
        text=$(echo -e -n "$1" | awk  'BEGIN{FS="\t"; }(NR>=1){h=$0;  gsub(/[àáâäæãåāǎ]{1,2}/,"a", h);  gsub(/[çćč]{1,2}/,"c", h);  gsub(/[èéêëēėęě]{1,2}/,"e", h);  gsub(/[îïííīįìǐ]{1,2}/,"i", h);  gsub(/[ł]{1,2}/,"l", h);  gsub(/[ñń]{1,2}/,"n", h);  gsub(/[ôöòóœøōǒõ]{1,2}/,"o", h);  gsub(/[ßśš]{1,2}/,"s", h);  gsub(/[ûüǔùǖǘǚǜúū]{1,2}/,"u", h);  gsub(/[ÿ]{1,2}/,"y", h);  gsub(/[žźż]{1,2}/,"z", h);  gsub(/[ÀÁÂÄÆÃÅĀǍ]{1,2}/,"A", h);  gsub(/[ÇĆČ]{1,2}/,"C", h);  gsub(/[ÈÉÊËĒĖĘĚ]{1,2}/,"E", h);  gsub(/[ÎÏÍÍĪĮÌǏ]{1,2}/,"I", h);  gsub(/[Ł]{1,2}/,"L", h);  gsub(/[ÑŃ]{1,2}/,"N", h);  gsub(/[ÔÖÒÓŒØŌǑÕ]{1,2}/,"O", h);  gsub(/[SSŚŠ]{1,2}/,"S", h);  gsub(/[ÛÜǓÙǕǗǙǛÚŪ]{1,2}/,"U", h);  gsub(/[Ÿ]{1,2}/,"Y", h);  gsub(/[ŽŹŻ]{1,2}/,"Z", h);  print h;  }')
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