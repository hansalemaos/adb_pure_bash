#!/usr/bin/env sh
filename=""
width=0
onlyhexdump=0
hexdata=""
x1=0
y1=0
colorcount=0
rgbcolors=""
inregion=0
while [ $# -gt 0 ]; do
    case "$1" in
    -f | --filename)
        shift
        filename=$1
        ;;
    -x | --hexdata)
        shift
        hexdata=$1
        ;;
    -w | --width)
        shift
        width=$1
        ;;
    -x0 | --x0)
        shift
        x0=$1
        ;;
    -y0 | --y0)
        shift
        y0=$1
        ;;
    -x1 | --x1)
        shift
        x1=$1
        ;;
    -y1 | --y1)
        shift
        y1=$1
        ;;
    -o | --onlyhexdump)
        shift
        onlyhexdump=1
        ;;
    -c | --colorcount)
        shift
        colorcount=1
        ;;
    -r | --rgbcolors)
        shift
        rgbcolors=$1
        ;;
    -i | --inregion)
        shift
        inregion=1
        ;;
    esac
    shift
done

if [ "$x1" -eq 0 ]; then
    x1=$(($x0 + 1))
fi
if [ "$y1" -eq 0 ]; then
    y1=$(($y0 + 1))
fi

dohexdump() {
    screencap | hexdump -v -e '4/1 "%d," "\n"'
}
rgbcheck() {
    if [ "$width" -eq 0 ]; then
        width=$(wm size | awk 'BEGIN{FS="[[:space:]x]";}{print $(NF-1)}')
    fi
    if [ -z "$filename" ]; then
        if [ -z "$hexdata" ]; then
            screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -v x0="$x0" -v y0="$y0" -v x1="$x1" -v y1="$y1" -v w="$width" 'BEGIN{FS=",";}(NR>4){y=(FNR-5)/w; x=(FNR-5)%w;if (x >= x0 && x < x1 && y >= y0 && y < y1){printf "%d,%d,%d,%d,%d\n", x, y, $1, $2, $3 }}'
        else
            awk -v x0="$x0" -v y0="$y0" -v x1="$x1" -v y1="$y1" -v w="$width" 'BEGIN{FS=",";}(NR>4){y=(FNR-5)/w; x=(FNR-5)%w;if (x >= x0 && x < x1 && y >= y0 && y < y1){printf "%d,%d,%d,%d,%d\n", x, y, $1, $2, $3 }}' "$hexdata"
        fi
    else
        #cat "$filename" | hexdump -v -e '4/1 "%d," "\n"' | awk -v w="$width" 'BEGIN{FS=",";}(NR>4){printf "%d,%d,%d,%d,%d\n", (FNR-5)/w, (FNR-5)%w, $1, $2, $3 }'
        hexdump -v -e '4/1 "%d," "\n"' <"$filename" | awk -v x0="$x0" -v y0="$y0" -v x1="$x1" -v y1="$y1" -v w="$width" 'BEGIN{FS=",";}(NR>4){y=(FNR-5)/w; x=(FNR-5)%w;if (x >= x0 && x < x1 && y >= y0 && y < y1){printf "%d,%d,%d,%d,%d\n", x, y, $1, $2, $3 }}'

    fi
}

docolorcount() {
    temp_file=$(mktemp)

    rgbcheck | awk -v temp_file="$temp_file" 'BEGIN{FS=",";}{vatmp=$3","$4","$5; if (! colorstocount[vatmp]){ counter+=1;} colorstocount[vatmp]+=1;}END{for (j in colorstocount) {print colorstocount[j]":"j >> temp_file}}'
    sort -n -k1,1 <"$temp_file" | tac

}

arecolorsinregion() {
    rgbcheck | awk -v rgbcolors="$rgbcolors" -v temp_file="$temp_file" 'BEGIN{FS=",";split(rgbcolors,rgbcolorsarray,"#");for (i=1;i<=length(rgbcolorsarray);i++) \
     {rgbcolorsarray2[rgbcolorsarray[i]]=1; }}{vatmp=$3","$4","$5; if (rgbcolorsarray2[vatmp]){isgood=1; exit 0;}} END {if (isgood!=1){exit 1;}}'

}

searchrgbcolors() {
    temp_file=$(mktemp)
    rgbcheck | awk -v rgbcolors="$rgbcolors" -v temp_file="$temp_file" 'BEGIN{FS=",";split(rgbcolors,rgbcolorsarray,"#");for (i=1;i<=length(rgbcolorsarray);i++) \
     {rgbcolorsarray2[rgbcolorsarray[i]]=1; }}{vatmp=$3","$4","$5; if (! colorstocount[vatmp]){ counter+=1;} colorstocount[vatmp]+=1;} \
     END{ for (j in colorstocount){ if (rgbcolorsarray2[j]==1){print colorstocount[j]":"j >> temp_file}}}'
    sort -n -k1,1 <"$temp_file" | tac

}

if [ "$onlyhexdump" -eq 1 ]; then
    dohexdump
elif [ "$colorcount" -eq 1 ]; then
    docolorcount

elif [ "$rgbcolors" != "" ]; then
    if [ "$inregion" -eq 1 ]; then
        arecolorsinregion
    else
        searchrgbcolors
    fi
else
    rgbcheck
fi

# # dump rgb data:
# sh /sdcard/fastrgbdump.sh -x0 183 -y0 1339 -x1 187 -y1 1343

# # dump rgb data from region with already captured screen
# screencap >/sdcard/capscreen.tmp
# sh /sdcard/fastrgbdump.sh -f /sdcard/capscreen.tmp -x0 183 -y0 1339 -x1 187 -y1 1343

# # hexdump to a file
# sh /sdcard/fastrgbdump.sh --onlyhexdump 1 >/sdcard/hexdump.tmp
# sh /sdcard/fastrgbdump.sh -x /sdcard/hexdump.tmp -x0 183 -y0 1339 -x1 187 -y1 1343

# # count colors in region
# sh /sdcard/fastrgbdump.sh --colorcount 1 -x0 183 -y0 1339 -x1 187 -y1 1343

# # color at coordinate
# sh /sdcard/fastrgbdump.sh -x0 183 -y0 1339

# # search for colors in region
# sh /sdcard/fastrgbdump.sh --rgbcolors 24,24,24#29,180,82 -x0 183 -y0 1339 -x1 187 -y1 1343

# # check if colors are in region (returns 0 for true, 1 for false)
# sh /sdcard/fastrgbdump.sh --inregion 1 --rgbcolors 24,24,24#29,180,82 -x0 183 -y0 1339 -x1 187 -y1 1343
