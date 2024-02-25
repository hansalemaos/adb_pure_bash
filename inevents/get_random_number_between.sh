#!/bin/bash
get_random_number_between() {

    randomnuber=$(((RANDOM % $(($2- $1))) + $1))
    echo "$randomnuber"
}
get_random_number_between "$1" "$2"