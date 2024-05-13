#!/usr/bin/env sh

device_serial=""
src=""
dst=""
adbpath=$(which adb)

while [ $# -gt 0 ]; do
    case "$1" in
    --serial)
        shift
        device_serial=$1
        ;;
    --src)
        shift
        src=$1
        ;;
    --dst)
        shift
        dst=$1
        ;;
    esac
    shift
done

if [ -z "$device_serial" ]; then
    echo "no device specified"
    exit 1
fi

if [ -z "$src" ]; then
    echo "no src specified"
    exit 1
fi

if [ -z "$dst" ]; then
    echo "no dst specified, using /sdcard/"
    dst="/sdcard/"
fi

find "$src" -type d | tr '\n' '\0' | xargs -0 -n1 echo -e | awk -v src="$src" -v dst="$dst" 'BEGIN{FS="\t"}{system("echo '\''"$1"'\'' | sed '\''s|^"src"|"dst"|g'\''")}' | tr '\n' '\0' | xargs -0 -n1 echo -e | awk -v adbpath="$adbpath" -v device_serial="$device_serial" 'BEGIN{FS="\t"}{system(adbpath" \-s "device_serial" shell '\''mkdir -p "$1"'\''")}'

find "$src" -type f | tr '\n' '\0' | xargs -0 -n1 echo -e | awk -v src="$src" -v dst="$dst" 'BEGIN{FS="\t"}{system("printf \"%s \" '\''"$1"'\'' && echo '\''"$1"'\'' | sed '\''s|^"src"|"dst"|g'\''")}' | tr '\n' '\0' | xargs -0 -n1 echo -e | awk -v adbpath="$adbpath" -v device_serial="$device_serial" 'BEGIN{FS="\t"}{system(adbpath" \-s "device_serial" push "$1)}'
