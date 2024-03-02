#!/usr/bin/env sh

wm size | awk 'BEGIN{FS="[[:space:]x]";}{printf $(NF-1)" "$NF}'