#!/usr/bin/env sh
while [ $# -gt 0 ]; do
    case "$1" in
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
    -m | --ms)
        shift
        ms=$1
        ;;
    esac
    shift
done

sleeptimeout=$((ms / 1000))
sleeptimeout=$((sleeptimeout + 1))

input swipe "$x0" "$y0" "$x1" "$y1" "$ms" &
timeout "$sleeptimeout" uiautomator events | awk 'BEGIN{FS="((EventType:|ScrollDelta)|(romIndex:)|(oIndex:))";OFS="\t"}{for (i=1;i<=NF;i++){gsub(/;.*$/, "", $i);gsub(/^[0-9][0-9]-[0-9][0-9][[:space:]\t]+[0-9.:]+/, "", $i);gsub(/^[[:space:]\t]+/, "", $i);gsub(/[XY]+:[[:space:]\t]*/, "", $i); if ((i<NF)&&(i>1)){printf $i OFS}; if (i==NF){print $i}}}'
#sh /sdcard/showscrolls/scrollshow.sh -x0 400 -y0 1400 -x1 452 -y1 200 -m 3000