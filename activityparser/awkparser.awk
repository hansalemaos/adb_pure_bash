BEGIN {
    FS="\t";
    OFS=FS;
}

{
    for (i=1; i<=NF; i++) {
        if ($i ~ /^([^,]+),([^,]+)-([^,]+),([^,]+)$/) {
            split($i, groups, /,+/);
            for (j=1; j<=3; j++) {
                if (j!=2){
                    printf "%s", groups[j];
                }
                else {
                    split(groups[j], groups2, /-/);
                    printf "%s", groups2[1];
                    printf "\t";
                    printf "%s", groups2[2];

                }
                if (j < 3) {
                    printf "\t";
                }
            }
            printf "%s", (i < NF) ? OFS : ORS;
        }
        else if ($i ~ /^([A-Z.]{8,9})$/) {
            len = length($i);
                for (ii = 1; ii <= len; ii++) {
                    printf "%s\t", substr($i, ii, 1);
                }

        }
        else {
            printf "%s%s", $i, (i < NF) ? OFS : ORS;
        }
    }
}

