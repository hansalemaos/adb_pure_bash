BEGIN {
    FS="\t";
    OFS=FS;
}
(NR>=1){
    for (i=NF;i>=1;i--){
        if ((i==NF)&&(i==8)){
            if (! ($NF ~ /^[:space:]*$/)){
                for (i2=1;i2<=NF;i2++){
                    if (i2<NF){
                        printf $i2 OFS;
                    }
                    else{
                        print $i2;
                    }
                }
                next;
            }
        }
        else if ((i==NF)&&(i<8)){
            for (i2=1;i2<NF;i2++){
                printf $i2 OFS;
            }
            for (i3=1;i3<=(8-NF);i3++){
                printf "NADA" OFS;
            }
            print $NF;
            next;
        }
        else if ((i==NF)&&(i>8)){
            for (i2=1;i2<8;i2++){
                printf $i2 OFS;
            }
            print $NF;
            next;
        }        
    }
}