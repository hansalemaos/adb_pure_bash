#!/usr/bin/env sh

shufflelinesecho() {
    echo "$1" | while IFS="$(printf '\n')" read -r line; do
        printf "%06d %s\n" $RANDOM "$line"
    done | sort -n | cut -c8-
}
_sdcard_shuffeldarray_txt=$(mktemp)
_sdcard_shuffeldarray2_txt=$(mktemp)
uniquelinesfromfile=$(cat "$1" | tail -n+2)
awk -F "\t" 'BEGIN{OFS="\t";} (NR==1){print $0}' "$1" >"$_sdcard_shuffeldarray_txt"
shufflelinesecho "$uniquelinesfromfile" >"$_sdcard_shuffeldarray2_txt"
cat "$_sdcard_shuffeldarray2_txt" >>"$_sdcard_shuffeldarray_txt"
rm -f "$_sdcard_shuffeldarray2_txt"
cat "$_sdcard_shuffeldarray_txt"
