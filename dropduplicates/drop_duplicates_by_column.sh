#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
get_passed_awk_cols="$SCRIPTPATH"/get_passed_awk_cols.awk
uuniqaw="$SCRIPTPATH"/uuniq.awk
wholestring="awk -f $get_passed_awk_cols -v cols=$1 $2"
eval "sortbycol=$($wholestring)"
awk -f "$uuniqaw" -v columns="$sortbycol" "$2"
