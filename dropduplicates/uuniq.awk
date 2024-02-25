BEGIN {
    FS="\t";
    OFS=FS;
    ARGCPARSED=0;
    split(columns, ARGVPARSED, ",");
    for (j in ARGVPARSED) {
            ARGCPARSED=ARGCPARSED+1
    }
}
(NR <= 1) {
    print $0

}
(NR > 1 ){
    allval=""
    for (i=1; i<=NF;i++){
        for (j in ARGVPARSED) {
            if (int(i)==int(ARGVPARSED[j])) {
                allval=allval","$i
            }
        }
    }
    valuesAsValues[allval] = $0;
}
END {
    for (i in valuesAsValues) {
        print valuesAsValues[i]
    }
}
