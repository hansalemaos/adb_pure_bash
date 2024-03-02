#!/bin/bash

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

generate_password "$1"