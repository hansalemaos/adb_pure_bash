#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
MOUNTSCRIPT=$SCRIPTPATH/forcemountrw.sh

su -c "sh $MOUNTSCRIPT"

busypath=$(su -c "which busybox")
if [ ! -f "/system/bin/busybox" ]; then
    su -c "cp $busypath /system/bin/busybox"
fi;
su -c "chown 777 /system/bin/busybox"
cd /system/bin
/system/bin/busybox | tr '\n' ' ' | awk 'BEGIN{FS="Currently defined functions:" ;}{print $NF}' | sed 's/^[ \t]*//;s/[ \t]*$//' | awk 'BEGIN{FS="Currently defined functions:" ;}{print $NF}' | awk 'BEGIN{FS=",[[:blank:]]+" ;}{for (i=1;i<=NF;i++){if ($i!=""){system("which "$i" > /dev/null || echo \"cd /system/bin && ln -s busybox "$i"\"")}}}' | tr '\n' '\0' | xargs -0 -n1 su sh
