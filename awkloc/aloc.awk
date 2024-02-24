BEGIN {
    if (! sep) {
        sep="#";
    }
    if (! and) {
        and=0;
    }
    and=int(and);
    ARGCPARSED=0;
    split(query, ARGVPARSED, sep);
    for (j in ARGVPARSED) {
            ARGCPARSED=ARGCPARSED+1
        }
    FS="\t";
    OFS=FS;
    opis[1]=">=";
    opis[2]="<=";
    opis[3]="!=";
    opis[4]=">>";
    opis[5]="<<";
    opis[6]="==";
    opis[7]="~~";

    for (i = 1; i <= ARGCPARSED; i++) {
        #print "ARGV["i"] =", ARGVPARSED[i];
        for (o in opis) {
            indi=index(ARGVPARSED[i], opis[o]);
            if (indi > 0){
                k=substr(ARGVPARSED[i],0,indi-1);
                v=substr(ARGVPARSED[i],indi+2,length(ARGVPARSED[i]))
                allcols[k]=k;
                if (o==1){
                    cols_ge[k]=v;
                }
                else if (o==2){
                    cols_le[k]=v;
                }
                else if (o==3){
                    cols_ne[k]=v;
                }
                else if (o==4){
                    cols_gt[k]=v;
                }
                else if (o==5){
                    cols_lt[k]=v;
                }
                else if (o==6){
                    cols_eq[k]=v;
                }
                else if (o==7){
                    cols_regex[k]=v;
                }


            }
        }
    }

}
(NR <=1){
    header=$0;
    resultcounter=1;
    for (j in allcols) {
            stop=1;

            for (i=1; i<=NF;i++){
                if ($i==j){
                    stop=0;
                }
            }
            if (stop>0){
                print j " not in columns!" > "/dev/stderr";
                exit 1;
            }
    }
    for (i=1; i<=NF;i++){
        for (j in cols_ge) {
                    if ($i==j){
                        cols_ge_nr[i]=cols_ge[j];
                    }
                }
        for (j in cols_le) {
                    if ($i==j){
                        cols_le_nr[i]=cols_le[j];
                    }
                }
        for (j in cols_ne) {
                    if ($i==j){
                        cols_ne_nr[i]=cols_ne[j];
                    }
                }
        for (j in cols_gt) {
                    if ($i==j){
                        cols_gt_nr[i]=cols_gt[j];
                    }
                }
        for (j in cols_lt) {
                    if ($i==j){
                        cols_lt_nr[i]=cols_lt[j];
                    }
                }
        for (j in cols_eq) {
                    if ($i==j){
                        cols_eq_nr[i]=cols_eq[j];
                    }
                }
        for (j in cols_regex) {
                    if ($i==j){
                        cols_regex_nr[i]=cols_regex[j];
                    }
                }
    }
}
(NR >1){
    isgood=1;
    ortrue=0;
    if ((isgood>0)||(and==0)){
        for (i in cols_ge_nr) {
            if (int($i) >= int(cols_ge_nr[i])){
                isgood=1;
                if (and==0){
                    ortrue=1;
                }
            }
            else {
                isgood=0;
                break
            }
       }
    }
    if ((isgood>0)||(and==0)){
        for (i in cols_le_nr) {
            if (int($i) <= int(cols_le_nr[i])){
                isgood=1;
                if (and==0){
                    ortrue=1;
                }
            }
            else {
                isgood=0;
                break
            }
       }
    }
    if ((isgood>0)||(and==0)){
        for (i in cols_ne_nr) {
            if (int($i) != int(cols_ne_nr[i])){
                isgood=1;
                if (and==0){
                    ortrue=1;
                }
            }
            else {
                isgood=0;
                break
            }
       }
    }
    if ((isgood>0)||(and==0)){
        for (i in cols_gt_nr) {
            if (int($i) > int(cols_gt_nr[i])){
                isgood=1;
                if (and==0){
                    ortrue=1;
                }
            }


            else {
                isgood=0;
                break
            }
       }
    }
    if ((isgood>0)||(and==0)){
        for (i in cols_lt_nr) {
            if (int($i) < int(cols_lt_nr[i])){
                isgood=1;
                if (and==0){
                    ortrue=1;
                }
            }
            else {
                isgood=0;
                break
            }
       }
    }
    if ((isgood>0)||(and==0)){
        for (i in cols_eq_nr) {
            if ($i == cols_eq_nr[i]){
                isgood=1;
                if (and==0){
                    ortrue=1;
                }
            }
            else {
                isgood=0;
                break
            }
       }
    }
    if ((isgood>0)||(and==0)){
        for (i in cols_regex_nr) {
            if ($i ~ cols_regex_nr[i]){
                isgood=1;
                if (and==0){
                    ortrue=1;
                }
            }
            else {
                isgood=0;
                break
            }
       }
    }
    if ((isgood > 0)||(ortrue>0)){
        results[resultcounter]=$0;
        resultcounter=resultcounter+1;
    }
    isgood=1;
    ortrue=0;
}
END{
    if (resultcounter>1){
        print header;
        for (i = 0; i < resultcounter; i++) {
            print results[i]
        }
    }
}