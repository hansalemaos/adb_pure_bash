#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
prettyprint=$SCRIPTPATH/awk_pretty_print.awk

splitlines_file() {
    local -n oarra="$1"
    filex=$2
    file_contentscx=$(<"$filex")
    oldIFS=$IFS
    while IFS= read -r line; do
        oarra+=("$line")
    done <<<"$file_contentscx"
}
IFS=$oldIFS
swap_arrays() {
    local -n arr1="$1"
    local -n arr2="$2"
    tmp1=()
    tmp2=()
    for liney in "${arr1[@]}"; do
        tmp1+=("$liney")
    done
    for liney in "${arr2[@]}"; do
        tmp2+=("$liney")
    done
    unset arr1
    unset arr2
    for liney in "${tmp2[@]}"; do
        arr1+=("$liney")
    done
    for liney in "${tmp1[@]}"; do
        arr2+=("$liney")
    done
}

get_unique_and_common_strings() {
    file1="$1"
    file2="$2"

    local -n unique_to_file1="$3"
    local -n unique_to_file2="$4"
    local -n in_file1_and_file2="$5"
    local -n unique_to_file1_LINE="$6"
    local -n unique_to_file2_LINE="$7"
    local -n in_file1_and_file2_LINE="$8"
    file1_array=()
    splitlines_file file1_array "$file1"
    file2_array=()
    splitlines_file file2_array "$file2"
    ii=0
    for path1 in "${file1_array[@]}"; do
        maxsize=$((maxsize + 1))
        found=false
        ii=$((ii + 1))
        jj=0
        for path2 in "${file2_array[@]}"; do
            jj=$((jj + 1))
            if [ "$path1" = "$path2" ]; then
                found=true
                #in_file1_and_file2+=("$path1")
                #in_file1_and_file2_LINE+=("$ii---$jj")
                break
            fi
        done
        if [ "$found" = false ]; then
            unique_to_file1+=("$path1")
            unique_to_file1_LINE+=("$ii")

        fi
    done
    jj=0
    for path1 in "${file2_array[@]}"; do
        jj=$((jj + 1))
        if [ "$jj" -gt "$maxsize" ];then
            maxsize=$((maxsize + 1))
        fi
        found=false
        ii=0
        for path2 in "${file1_array[@]}"; do
            ii=$((ii + 1))
            if [ "$path1" = "$path2" ]; then
                found=true
                break
            fi
        done
        if [ "$found" = false ]; then
            unique_to_file2+=("$path1")
            unique_to_file2_LINE+=("$jj")

        fi
    done

}

_sdcard_a_txt=$(mktemp)
_sdcard_a2_txt=$(mktemp)
_sdcard_aa_txt=$(mktemp)
_sdcard_aa2_txt=$(mktemp)
_sdcard_aaa_txt=$(mktemp)
_sdcard_aaa2_txt=$(mktemp)


maxsize=0;
parser="$4"
sh "$parser" > "$_sdcard_a_txt"
echo 'Press enter to continue'
read
sh  "$parser" > "$_sdcard_a2_txt"
awk 'BEGIN{FS="\t";}{for (i=2;i<=NF;i++){printf $i; if (i<NF){printf FS};if (i==NF){print ""} }}' "$_sdcard_a_txt" > "$_sdcard_aa_txt"
awk 'BEGIN{FS="\t";}{for (i=2;i<=NF;i++){printf $i; if (i<NF){printf FS};if (i==NF){print ""} }}' "$_sdcard_a2_txt" > "$_sdcard_aa2_txt"
awk -f "$prettyprint" "$_sdcard_aa_txt" >  "$_sdcard_aaa_txt"
awk -f "$prettyprint" "$_sdcard_aa2_txt" >  "$_sdcard_aaa2_txt"
awk -f "$prettyprint" "$_sdcard_a_txt" >  "$1"
awk -f "$prettyprint" "$_sdcard_a2_txt" >  "$2"
file1="$_sdcard_aaa_txt"
file2="$_sdcard_aaa2_txt"
unique_file1=()
unique_file2=()
commonfiles=()
unique_file1_LINE=()
unique_file2_LINE=()
commonfiles_LINE=()
array_elements=()

get_unique_and_common_strings "$file1" "$file2" unique_file1 unique_file2 commonfiles unique_file1_LINE unique_file2_LINE commonfiles_LINE


iz=0
icounter=0
v=$(head -n 3 "$_sdcard_aaa_txt" | tail -n 1)
printf '    \t    \t%s\n' "$v" > "$3"
v=$(head -n 2 "$_sdcard_aaa_txt" | tail -n 1)
printf 'file\tline\t%s\n' "$v" >> "$3"
v=$(head -n 1 "$_sdcard_aaa_txt" | tail -n 1)
diffi=$(printf '    \t    \t%s\n' "$v")
printf '    \t    \t%s\n' "$v" >> "$3"
while [ "$icounter" -lt "$maxsize" ]; do
    ix=0
    iy=0
    tempvar=""
    for path in "${unique_file1[@]}"; do
        if [ "$icounter" -eq "${unique_file1_LINE[$ix]}" ];then
            tempvar=$(printf 'file1\t%s\t%s\n' "${unique_file1_LINE[$ix]}" "$path")
            printf "%s" "$tempvar" >> "$3"
            echo "" >> "$3"
            break
        fi
        ix=$((ix + 1))

    done
    for path in "${unique_file2[@]}"; do
        if [ "$icounter" -eq "${unique_file2_LINE[$iy]}" ];then

            printf 'file2\t%s\t%s\n' "${unique_file2_LINE[$iy]}" "$path"  >> "$3"
            if [ "$tempvar" != "" ];then
                echo "" >> "$3"
                echo "$diffi" >> "$3"
                echo "" >> "$3"
            fi
            break
        fi
        iy=$((iy + 1))
    done
    icounter=$((icounter + 1))
done
unset array_elements
unset unique_file1
unset unique_file2
unset commonfiles
unset unique_file1_LINE
unset unique_file2_LINE
unset commonfiles_LINE
unset in_file1_and_file2

# sh /sdcard/awkprint/getelementdifference.sh /sdcard/ele1.txt /sdcard/ele2.txt /sdcard/elediff2.txt /sdcard/activityparser/awkparser.sh
# cat /sdcard/elediff2.txt

# sh /sdcard/awkprint/getelementdifference.sh /sdcard/ele1.txt /sdcard/ele2.txt /sdcard/elediff3.txt /sdcard/uidumpparser/u.sh
# cat /sdcard/elediff3.txt
