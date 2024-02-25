#!/bin/bash

get_domain() {
    dom=$(cat /sdcard/activedomains.json | grep -o -E '"domain":"[^"]+"' | awk 'FS="\":\"" {print $2}' | awk 'FS="\"" {print $1}')
    echo "$dom"
}

download() {
    rm -f /sdcard/tmphtml.html
    curl -s --insecure "$1" -o /sdcard/tmphtml.html
    cat /sdcard/tmphtml.html | awk '{print $0}'
}

get_line() {
    filelen=$(wc -l "$1" | awk '{print $1}')
    filelen=$(($filelen - 1))
    randno=$((1 + RANDOM))
    randomnumber=$((randno % filelen))
    sed "${randomnumber}q;d" "$1" | awk '{print $0}'
}
generate_random_name() {

    lastnames="$1"
    firstnames_male="$2"
    firstnames_female="$3"
    tmpfile="/sdcard/tmplastnames.txt"
    tmpfile2="/sdcard/tmpfirstnames.txt"
    rm -f "$tmpfile"
    rm -f "$tmpfile2"

    gender=""
    randno=$((1 + RANDOM))
    randomnumber=$((randno % 2))
    if [ "$randomnumber" -ge 1 ]; then
        get_line "$firstnames_male" >>"$tmpfile2"
        gender="male"
    else
        get_line "$firstnames_female" >>"$tmpfile2"
        gender="female"
    fi

    randnon=$((1 + RANDOM))
    randomnumbern=$((randnon % 3))
    randomnumbern=$(($randomnumbern + 1))
    i=0
    while [ $i -le $randomnumbern ]; do
        get_line "$lastnames" >>"$tmpfile"
        i=$(($i + 1))
    done
    alllastnames=$(cat "$tmpfile" | xargs)
    finame=$(cat "$tmpfile2" | xargs)
    namestogether="$finame $alllastnames"
    namestogethernospace=$(echo ${namestogether//[[:blank:]]/})
    printf "%s\t%s\t%s\t%s\t%s\n" "$finame" "$alllastnames" "$gender" "$namestogether" "$namestogethernospace"
}
generate_password() {
    chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*()_=+"
    upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ11"
    lower="abcdefghijklmnopqrstuvwxyz0123456789"
    special="!@#$%&*()_=+"
    password=''
    loopvar=$(($1 - 3))
    for i in $(seq 1 "$loopvar"); do
        random_char=${chars:$((RANDOM % ${#chars})):1}
        password+=$random_char
    done
    random_char=${upper:$((RANDOM % ${#upper})):1}
    password+=$random_char
    random_char=${lower:$((RANDOM % ${#lower})):1}
    password+=$random_char
    random_char=${special:$((RANDOM % ${#special})):1}
    password+=$random_char
    echo "$password" | awk '{print}'
}
checkemail() {
    curl --insecure -X GET -H "Accept: application/ld+json" -H "Content-Type: application/json" -H "Authorization: Bearer $1" "https://api.mail.tm/messages?page=1"
}
generate_random_name_and_email() {
    lastnames="$2"
    firstnames_male="$3"
    firstnames_female="$4"
    download https://api.mail.tm/domains >/sdcard/activedomains.json
    activedomain=$(get_domain)
    randomname=$(generate_random_name "$lastnames" "$firstnames_male" "$firstnames_female")
    nameforemail=$(echo "$randomname" | awk 'FS="\t" {print $NF}')
    nameforemail="$nameforemail@$activedomain"
    password=$(generate_password 16)
    responseaccount=$(curl --insecure -X POST -H "Accept: application/ld+json" -H "Content-Type: application/json" -d '{"address":"'$nameforemail'", "password": "'$password'"}' https://api.mail.tm/accounts)
    realemail=$(echo "$responseaccount" | awk 'FS="address\":\"" {print $2}' | awk 'FS="\"" {print $1}')
    tok=$(curl --insecure -X POST -H "Accept: application/ld+json" -H "Content-Type: application/json" -d '{"address":"'$realemail'", "password": "'$password'"}' https://api.mail.tm/token)
    token=$(echo "$tok" | awk 'FS="token\":\"" {print $2}' | awk 'FS="\"" {print $1}')
    checkemail "$token"
    printf "%s\t%s\t%s\t%s\n" "$randomname" "$realemail" "$password" "$token" >"$1"
}
get_token() {
    cat "$1" | awk 'FS="\t" {print $NF}'
}

generate_random_name_and_email "$1" "$2" "$3" "$4"
get_token "$1"

# Example
# saveinfile="/sdcard/emailaccount.txt"
# lastnames="/sdcard/lastnames.csv"
# firstnames_male="/sdcard/firstnames_male.csv"
# firstnames_female="/sdcard/firstnames_female.txt"
# sh generateemail "$saveinfile" "$lastnames" "$firstnames_male" "$firstnames_female"
