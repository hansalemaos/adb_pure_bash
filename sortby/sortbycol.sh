#!/usr/bin/env bash

count_char() {
    string=$(echo "$1" | xargs)
    local character="$2"
    local count=0
    count=$(awk -F"$character" '{print NF-1}' <<< "$string")
    echo "$count"
}
strip_commas() {
    trimmed="${1#,}"
    trimmed="${trimmed%,}"

    echo "$trimmed"
}
_sdcard_sortedarray3_txt=$(mktemp)
sortbycol=""
sentence="$1"
sentence=${sentence//;/$'\n'}
kstring=""
ini=1
for line0 in $sentence; do
    sortbycoltmp=$(awk -v col="$line0" 'BEGIN { FS="\t"; OFS="\t"; numbers_of_cols=","; } NR <= 1 { header = $0; for (i=1; i<=NF;i++) { if($i==col){ numbers_of_cols=numbers_of_cols "," i; } } } END { gsub(/^,+|,+$/, "", numbers_of_cols); print numbers_of_cols }' "$2") 
    sortbycol="$sortbycol","$sortbycoltmp"
    kstring="-k$ini,$ini $kstring"
    ini=$((ini + 1))
done
sortbycol="$(strip_commas "$sortbycol")"
cutting=$(count_char "$sortbycol" ",")
cutting=$(($cutting + 3))
awk -F "\t" 'BEGIN{OFS="\t";} (NR==1){print $0}' "$2" 
tail -n +2 "$2" | awk -v sortbycol="$sortbycol" -F '\t' 'BEGIN {FS="\t"; OFS=FS; split(sortbycol, cols, ","); } { line = ""; for (i in cols) line = line (i>1 ? OFS : "\t") $cols[i]; print line, $0 }' >"$_sdcard_sortedarray3_txt"
if [ "$3" -gt 0 ]; then
    sortcommand="sort -n $kstring < $_sdcard_sortedarray3_txt"
else
    sortcommand="sort $kstring < $_sdcard_sortedarray3_txt"
fi
sortcommandr="$(eval "$sortcommand")"
echo -e -n "$sortcommandr" | awk -F '\t' -v cutting="$cutting" 'BEGIN{OFS=FS;} {for (i=cutting; i <= NF; i++) printf "%s%s", $i, (i < NF ? OFS : ORS)}' 

# file="/sdcard/u.txt"
# sortby="centery;area"
# numeric=1
# sh /sdcard/sortby/sortbycol.sh "$sortby" "$file" "$numeric" | awk -f /sdcard/printer/awk_pretty_print.awk
