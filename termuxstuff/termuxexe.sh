#!/usr/bin/env sh
termux=0
pause=1
zplit="#"
while [ $# -gt 0 ]; do
    case "$1" in
    -t | --termux)
        shift
        termux=$1
        ;;
    -s | --sleep)
        shift
        pause=$1
        ;;
    -p | --pythonscript)
        shift
        pythonscript=$1
        ;;
    -z | --split)
        shift
        zplit=$1
        ;;

    esac
    shift
done

fromshell() {
    # shell
    # execute: fromshell testpycommand.py
    tstamp=$(date +%s)
    setprop pythoncommand /sdcard/"$1$zplit$tstamp"
    outfile=/sdcard/"$tstamp".txt
    while [ ! -f "$outfile" ]; do
        sleep "$pause"
    done
    charsold=-1
    charsnew=$(cat "$outfile" | wc -c)
    while [ "$charsold" -ne "$charsnew" ] && [ "$charsnew" -ne 0 ]; do
        sleep "$pause"
        charsold="$charsnew"
        charsnew=$(cat "$outfile" | wc -c)
    done
    catfi=$(cat "$outfile")
    while [ "$catfi" = "" ]; do
        sleep "$pause"
        catfi=$(cat "$outfile")
    done
    echo "$outfile"
    echo -e -n "$catfi"
}

fromtermux() {
    # termux code
    tstamp=$(date +%s)
    pyc="pythoncommand"
    oldcmd=$(getprop "$pyc")
    newcmd="$oldcmd"
    while true; do
        newcmd=$(getprop "$pyc")
        if [ "$oldcmd" != "$newcmd" ]; then
            cmdtoexecute=$(echo "$newcmd" | awk -F "$zplit" '{print $1}')
            tsta=$(echo "$newcmd" | awk -F "$zplit" '{print $NF}')
            echo "$cmdtoexecute"
            oldcmd="$newcmd"
            python "$cmdtoexecute" >/sdcard/"$tsta".txt
        fi
        sleep "$pause"
    done
}

if [ "$termux" -eq 1 ]; then
    fromtermux
else
    fromshell "$pythonscript"
fi

# execute that in termux
# sh /sdcard/termuxstuff/termuxexe.sh --termux 1 --sleep 1 --split "#"

# execute that in the shell
# sh /sdcard/termuxstuff/termuxexe.sh --termux 0 --sleep 1 --split "#" --pythonscript testpycommand.py
