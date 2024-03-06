#!/usr/bin/env sh
oldIFS="$IFS"
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
firstawkpass=$SCRIPTPATH/firstawkpass.awk
parsealldata=$SCRIPTPATH/parsealldata.awk
awkfinalparse=$SCRIPTPATH/awkfinalparse.awk
_sdcard_tempfileelements1_txt=$(mktemp)
_sdcard_tempfileelements2_txt=$(mktemp)
_sdcard_wholeelements_txt=$(mktemp)
ele=$(dumpsys activity top -a -c --checkin)
lastelments=$(echo "$ele" | grep -E -o -n '[:space:]*((View Hierarchy:)|(Looper))' | awk 'BEGIN { FS =":";} {print $1}' | tail -n 2 | xargs)
IFS="$(printf ' ')" read -r startline endline <<<"$lastelments"
startline=$((startline + 2))
endline=$((endline - 1))
lasteletext=$(echo -e -n "$ele" |sed -n "$startline","$endline"p )
withreplacechar=$(echo -e -n "$lasteletext" | awk -v subs1=" " -v subs2="|" '{ gsub(subs1, subs2) } 1')
stringindt=$(echo -e -n "$withreplacechar" | grep -o -E '^\|+'  | awk '{print length}')
withoutleading=$(echo -e -n "$lasteletext" |  awk '{ sub(/^[ \t]+|[ \t]/, ""); print }')
echo "$withoutleading" >  "$_sdcard_tempfileelements1_txt"
echo "$stringindt" > "$_sdcard_tempfileelements2_txt"
paste -d ' ' "$_sdcard_tempfileelements1_txt"  "$_sdcard_tempfileelements2_txt" > "$_sdcard_wholeelements_txt"
sed -E 's/ aid=[0-9]+(})/\1}/g' "$_sdcard_wholeelements_txt" | awk 'BEGIN{FS="[[:space:]\{\}]+";OFS="\t";}{for(i=1;i<=NF;i++){printf $i; if (i<NF) {printf OFS}; if (i==NF){print ""}}}'  "$_sdcard_wholeelements_txt" | awk -f "$firstawkpass" | awk -f "$parsealldata" | awk -f "$awkfinalparse"
IFS="$oldIFS"