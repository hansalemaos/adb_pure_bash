function strip_minus(var) {
    gsub(/^[-]+/, "", var)
    return var
}
BEGIN {
    FS="\t";
    OFS=FS;
}
(NR>=1){
    for (i=1;i<=NF;i++){
        if ((i==1)||(i==2)||(i==6)||(i==7)){
            printf $i OFS;
        }
        else if (i==8) {
            print $i;
        }
        else if ((i==3)||(i==4)){
            for (i2 = 1; i2 <= length($i); i2++) {
            char = substr($i, i2, 1);
            printf char OFS;
            }
        }
        else if (i==5){
            if ($i ~ /^([^,]+),([^,]+)-([^,]+),([^,]+)$/) {
                split($i, groups, /,+/);
                for (j=1; j<=3; j++) {
                    if (j!=2){
                        printf "%s", groups[j];
                    }
                    else {
                        if (! (groups[j] ~ /^[-]/)){
                            split(groups[j], groups2, /-/);
                            printf "%s", groups2[1];
                            printf OFS;
                            printf "%s", groups2[2];
                        }
                        else {
                            minusstripped=strip_minus(groups[j]);
                            split(minusstripped, groups2, /-/);
                            printf "-";
                            printf "%s", groups2[1];
                            printf OFS;
                            printf "%s", groups2[2];
                        }
                    }
                    printf OFS;
                }
            }
            else {
                printf 0 OFS 0 OFS 0 OFS 0 OFS;
            }
        }
    }
}
