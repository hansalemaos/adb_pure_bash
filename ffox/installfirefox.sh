#!/usr/bin/env sh
rm -f /sdcard/Download/fenixdownload.apk
if [ -z "$1" ]; then
    wget -O /sdcard/Download/fenixdownload.apk ftp.mozilla.org/pub/fenix/releases/123.0/android/fenix-123.0-android-x86_64/fenix-123.0.multi.android-x86_64.apk
else
    wget -O /sdcard/Download/fenixdownload.apk "$1"
fi
pm install -t -r /sdcard/Download/fenixdownload.apk 
cmdxx=$(dumpsys package org.mozilla.firefox | grep permission | tr -d " " | awk 'BEGIN{FS=":"} {print $1}' | grep -oE '^.*[A-Z_0-9]+$' | uniq)
while IFS= read -r permission; do
    pm grant org.mozilla.firefox "$permission" 2>/dev/null
done <<<"$cmdxx"


