#!/bin/bash
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
        found=false
        ii=$((ii + 1))
        jj=0
        for path2 in "${file2_array[@]}"; do
            jj=$((jj + 1))
            if [ "$path1" = "$path2" ]; then
                found=true
                in_file1_and_file2+=("$path1")
                in_file1_and_file2_LINE+=("$ii---$jj")
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

file1="$1"
file2="$2"
unique_file1=()
unique_file2=()
commonfiles=()
unique_file1_LINE=()
unique_file2_LINE=()
commonfiles_LINE=()
array_elements=()

get_unique_and_common_strings "$file1" "$file2" unique_file1 unique_file2 commonfiles unique_file1_LINE unique_file2_LINE commonfiles_LINE

ix=0
iy=0
iz=0
for path in "${unique_file1[@]}"; do
    printf 'file1\t%s\t%s\n' "${unique_file1_LINE[$ix]}" "$path"
    ix=$((ix + 1))
done
for path in "${unique_file2[@]}"; do
    printf 'file2\t%s\t%s\n' "${unique_file2_LINE[$iy]}" "$path"
    iy=$((iy + 1))
done
for path in "${commonfiles[@]}"; do
    printf 'file1_file2\t%s\t%s\n' "${commonfiles_LINE[$iz]}" "$path"
    iz=$((iz + 1))
done
unset array_elements
unset unique_file1
unset unique_file2
unset commonfiles
unset unique_file1_LINE
unset unique_file2_LINE
unset commonfiles_LINE
unset in_file1_and_file2
