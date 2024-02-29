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
            #smallestvaluepossible = int($8)
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
                    #if (j < 3) {
                    printf OFS;
                    #}
                }
            }
            else {
                printf 0 OFS 0 OFS 0 OFS 0 OFS;
            }
        }
    }
}

    # for (i = 1; i <= FNR; i++) {
    #     tempvalstartx = field20[i]+0;
    #     tempvalstarty = field21[i]+0;
    #     tempvalendx = field22[i]+0;
    #     tempvalendy = field23[i]+0;
    #     smallestvaluepossible = field26[i]+0;
    #     allparents="|"
    #     fieldfim=field0[i]
    #     for (j = FNR; j >= 1; j--) {
    #         if (j >= i) {
    #             continue;
    #         }
    #         if ((smallestvaluepossible>field26[j])) {
    #             tempvalstartx += field20[j];
    #             tempvalstarty += field21[j];
    #             smallestvaluepossible = field26[j]+0;
    #             allparents= j "|" allparents
    #         }
    #     }
    #     tempvalendx=tempvalendx+tempvalstartx;
    #     tempvalendy=tempvalendy+tempvalstarty;
    #     allparents = lstrip(allparents, char_to_strip);
    #     allparents = rstrip(allparents, char_to_strip);
    #     width=tempvalendx - tempvalstartx;
    #     height=tempvalendy - tempvalstarty;
    #     area=width * height;
    #     centerx=int(width / 2) + tempvalstartx;
    #     centery=int(height / 2) + tempvalstarty;
    #     print i, fieldfim, allparents, tempvalstartx, tempvalstarty, tempvalendx, tempvalendy, width, height, area, centerx, centery