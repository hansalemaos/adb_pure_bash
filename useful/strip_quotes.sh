#!/bin/bash

trim_quotes() {
   v="${1//\'/}"
   v2="${v//\"/}"
   printf '%s\n' "$v2"
}

trim_quotes "$@"
