BEGIN {
    if (! fs){
    FS = "\t";
    }
    else {
        FS = fs;
    }
    if (! m){
        m=0;
    }
}
{
    line[NR] = $0
    for (f=1; f<=NF; f++) {
        len = length($f)
        if (len>maxlen[f])
            maxlen[f] = len
            if (m>0){
                if (maxlen[f]>m){
                    maxlen[f]=m
                }
            }
    }
    mle=0
    for (fx=1; fx<=NF; fx++) {
        mle+=maxlen[fx]+0
        mle+=3
    }
}
END {
    for(nr=1; nr<=NR; nr++) {
        if (nr==1){
            for (fx=1; fx<=mle; fx++){
                printf "-"
            }
            print ""
        }
        nf = split(line[nr], fields)
        for (f=1; f<=nf; f++)
        if (m>0){
            printf "%-" (maxlen[f]+1) "s""| ", substr(fields[f],0,m)
        }
        else{
            printf "%-" (maxlen[f]+1) "s""| ", fields[f]
        }
        print ""
        if (nr==1){
            for (fx=1; fx<=mle; fx++){
                printf "-"
            }
            print ""
        }
    }
}

# sh /sdcard/activityparser/awkparser.sh > /sdcard/a.txt
# awk -f /sdcard/awkprint/awk_pretty_print.awk -v fs="\t" -v m=15 /sdcard/a.txt

# sh /sdcard/uidumpparser/u.sh > /sdcard/u.txt
# awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/u.txt