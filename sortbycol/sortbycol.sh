#!/usr/bin/env bash
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
count_char=$SCRIPTPATH/count_char.sh
get_passed_awk_cols=$SCRIPTPATH/get_passed_awk_cols.awk
_sdcard_sortedarray3_txt=$(mktemp)
_sdcard_sortedarray_txt=$(mktemp)
_sdcard_sortedarray2_txt=$(mktemp)
_sdcard_sortedarray4_txt=$(mktemp)
strip_commas() {
    trimmed="${1#,}"
    trimmed="${trimmed%,}"

    echo "$trimmed"
}

sortbycol=""
sentence="$1"
sentence=${sentence//;/$'\n'}
kstring=""
ini=1
for line0 in $sentence; do
    wholestring="awk -f $get_passed_awk_cols -v col=$line0 $2"
    eval "sortbycoltmp=$($wholestring)"
    sortbycol="$sortbycol","$sortbycoltmp"
    kstring="-k$ini,$ini $kstring"
    ini=$((ini + 1))
done
sortbycol="$(strip_commas "$sortbycol")"
cutting=$(sh "$count_char" "$sortbycol" ",")
cutting=$(($cutting + 3))
rm -f "$_sdcard_sortedarray_txt"
awk -F "\t" 'BEGIN{OFS="\t";} (NR==1){print $0}' "$2" >"$_sdcard_sortedarray_txt"
cat "$2" | tail -n +2 | awk -v sortbycol="$sortbycol" -F '\t' 'BEGIN { OFS=FS; split(sortbycol, cols, ","); } { line = ""; for (i in cols) line = line (i>1 ? OFS : "\t") $cols[i]; print line, $0 }' >"$_sdcard_sortedarray3_txt"
if [ "$3" -gt 0 ]; then
    sortcommand="sort -n $kstring < $_sdcard_sortedarray3_txt > $_sdcard_sortedarray4_txt"
else
    sortcommand="sort $kstring < $_sdcard_sortedarray3_txt > $_sdcard_sortedarray4_txt"
fi
eval "$sortcommand"
cat "$_sdcard_sortedarray4_txt" | awk -F '\t' -v cutting="$cutting" 'BEGIN{OFS=FS;} {for (i=cutting; i <= NF; i++) printf "%s%s", $i, (i < NF ? OFS : ORS)}' >"$_sdcard_sortedarray2_txt"
cat "$_sdcard_sortedarray2_txt" >>"$_sdcard_sortedarray_txt"
rm -f "$_sdcard_sortedarray2_txt"
rm -f "$_sdcard_sortedarray3_txt"
rm -f "$_sdcard_sortedarray4_txt"
cat "$_sdcard_sortedarray_txt"

# Examples 
# file="/sdcard/u.txt"
# sortby="centery;area"
# numeric=1
# sh /sdcard/sortbycol/sortbycol.sh "$sortby" "$file" "$numeric" >/sdcard/p.txt
# awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt

# file="/sdcard/u.txt"
# sortby="area;centery"
# numeric=1
# sh /sdcard/sortbycol/sortbycol.sh "$sortby" "$file" "$numeric" >/sdcard/p.txt
# awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt

# file="/sdcard/u.txt"
# sortby="text"
# numeric=0
# sh /sdcard/sortbycol/sortbycol.sh "$sortby" "$file" "$numeric" >/sdcard/p.txt
# awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt
