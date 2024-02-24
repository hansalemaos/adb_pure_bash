#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
awkparser=$SCRIPTPATH/awkparser.awk
awkparser2=$SCRIPTPATH/awkparser2.awk
_sdcard_tempfileelements1_txt=$(mktemp)
_sdcard_tempfileelements2_txt=$(mktemp)
_sdcard_wholeelements_txt=$(mktemp)
_sdcard_wholeelements2_txt=$(mktemp)
_sdcard_wholeelements4_txt=$(mktemp)
_sdcard_elementsawkformat_txt=$(mktemp)
_sdcard_nebo_txt=$(mktemp)
_sdcard_grepformaneo_txt=$(mktemp)
_sdcard_awkparse_txt=$(mktemp)
ele=$(dumpsys activity top -a -c --checkin)
lastelments=$(echo "$ele" | grep -E -o -n '[:space:]*((View Hierarchy:)|(Looper))' | awk 'BEGIN { FS =":";} {print $1}' | tail -n 2 | xargs)
IFS="$(printf ' ')" read -r startline endline <<<"$lastelments"
startline=$((startline + 2))
endline=$((endline - 1))
lasteletext=$(echo "$ele" |sed -n "$startline","$endline"p )
withreplacechar=$(printf "%s" "$lasteletext" | awk -v subs1=" " -v subs2="|" '{ gsub(subs1, subs2) } 1')
stringindt=$(echo "$withreplacechar" | grep -o -E '^\|+'  | awk '{print length}')
withoutleading=$(echo "$lasteletext" |  awk '{ sub(/^[ \t]+|[ \t]/, ""); print }')
echo "$withoutleading" >  "$_sdcard_tempfileelements1_txt"
echo "$stringindt" > "$_sdcard_tempfileelements2_txt"
paste -d ' ' "$_sdcard_tempfileelements1_txt"  "$_sdcard_tempfileelements2_txt" > "$_sdcard_wholeelements_txt"
cat "$_sdcard_wholeelements_txt" | sed -E 's/([^#0-9]+[0-9]+)}/\1\ #XXXXXXXX\ NOID}/g' > "$_sdcard_wholeelements4_txt"
cat "$_sdcard_wholeelements4_txt" | sed -E 's/(#[0-9a-f]+)}/\1\ NOID}/g' > "$_sdcard_wholeelements2_txt"
cat "$_sdcard_wholeelements2_txt" | awk 'BEGIN {FS="[[:space:]\{\}]+"; OFS="\t"; } {for (i=1; i <= NF; i++) printf "%s%s", $i, (i < NF ? OFS : ORS)}' > "$_sdcard_elementsawkformat_txt"
awk -f "$awkparser" "$_sdcard_elementsawkformat_txt" > "$_sdcard_nebo_txt"
cat "$_sdcard_nebo_txt" | grep -e '[.]'  > "$_sdcard_grepformaneo_txt"
awk -f "$awkparser2" "$_sdcard_grepformaneo_txt" > "$_sdcard_awkparse_txt"
rm -f "$_sdcard_tempfileelements1_txt"
rm -f "$_sdcard_tempfileelements2_txt"
rm -f "$_sdcard_wholeelements_txt"
rm -f "$_sdcard_wholeelements2_txt"
rm -f "$_sdcard_wholeelements4_txt"
rm -f "$_sdcard_elementsawkformat_txt"
rm -f "$_sdcard_nebo_txt"
rm -f "$_sdcard_grepformaneo_txt"
cat "$_sdcard_awkparse_txt"
