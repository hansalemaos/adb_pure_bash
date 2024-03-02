BEGIN {
    FS="\t";
    OFS=FS;
    ARGCPARSED=0;
    ARGCPARSED=split(columns, ARGVPARSED, ",");
}
(NR <= 1) {
    print $0
    co=1;
    for (i=1; i<=NF;i++){
        for (j=1;j<=ARGCPARSED;j++){
            if ($i==ARGVPARSED[j]){
                ARGVPARSED2[co]+=i;
                co=co+1;
            }
        }
    }

}
(NR > 1 ){
    allval=""
    for (i=1; i<=NF;i++){
        for (j=1;j<=length(ARGVPARSED2);j++) {
            if (i==int(ARGVPARSED2[j])) {
                allval=ARGVPARSED2[j]","$i","allval","
            }
        }

    }
    valuesAsValues[allval] = $0;
    allval=""

}
END {
    for (i in valuesAsValues) {
        print valuesAsValues[i]
    }
}

# awk -f "/sdcard/dropdu/dropdu.awk" -v columns="class" /sdcard/u.txt | awk -f /sdcard/printer/awk_pretty_print.awk
# awk -f "/sdcard/dropdu/dropdu.awk" -v columns="centerx,centery" /sdcard/u.txt | awk -f /sdcard/printer/awk_pretty_print.awk
# awk -f "/sdcard/dropdu/dropdu.awk" -v columns="area,width" /sdcard/u.txt | awk -f /sdcard/printer/awk_pretty_print.awk