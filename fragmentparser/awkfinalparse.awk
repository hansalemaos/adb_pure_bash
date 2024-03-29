function lstrip(str, char) {
    sub("^" char "+", "", str);
    return str;
}

function rstrip(str, char) {
    sub(char "+$", "", str);
    return str;
}
BEGIN {
    FS="\t";
    OFS=FS;
    char_to_strip = "\\|";
    printf "ELEMENT_INDEX"
    printf FS
    printf "CLASSNAME"
    printf FS
    printf "MID"
    printf FS
    printf "VISIBILITY"
    printf FS
    printf "FOCUSABLE"
    printf FS
    printf "ENABLED"
    printf FS
    printf "DRAWN"
    printf FS
    printf "SCROLLBARS_HORIZONTAL"
    printf FS
    printf "SCROLLBARS_VERTICAL"
    printf FS
    printf "CLICKABLE"
    printf FS
    printf "LONG_CLICKABLE"
    printf FS
    printf "CONTEXT_CLICKABLE"
    printf FS
    printf "PFLAG_IS_ROOT_NAMESPACE"
    printf FS
    printf "PFLAG_FOCUSED"
    printf FS
    printf "PFLAG_SELECTED"
    printf FS
    printf "PFLAG_PREPRESSED"
    printf FS
    printf "PFLAG_HOVERED"
    printf FS
    printf "PFLAG_ACTIVATED"
    printf FS
    printf "PFLAG_INVALIDATED"
    printf FS
    printf "PFLAG_DIRTY_MASK"
    printf FS
    printf "START_X_RELATIVE"
    printf FS
    printf "START_Y_RELATIVE"
    printf FS
    printf "END_X_RELATIVE"
    printf FS
    printf "END_Y_RELATIVE"
    printf FS
    printf "HASHCODE"
    printf FS
    printf "ELEMENT_ID"
    printf FS
    printf "IS_ACTIVE"
    printf FS
    printf "PARENTSINDEX"
    printf FS
    printf "START_X"
    printf FS
    printf "START_Y"
    printf FS
    printf "END_X"
    printf FS
    printf "END_Y"
    printf FS
    printf "WIDTH"
    printf FS
    printf "HEIGHT"
    printf FS
    printf "AREA"
    printf FS
    printf "CENTER_X"
    printf FS
    printf "CENTER_Y"
    #printf FS
    print

}
{
    field20[FNR] = $20
    field21[FNR] = $21
    field22[FNR] = $22
    field23[FNR] = $23
    field26[FNR] = $26
    field0[FNR]=$0
}
END {
    for (i = 1; i <= NR; i++) {
        tempvalstartx = int(field20[i]);
        tempvalstarty = int(field21[i]);
        tempvalendx =   int(field22[i]);
        tempvalendy =   int(field23[i]);
        smallestvaluepossible = int(field26[i]);
        allparents="|"
        fieldfim=field0[i]
        for (j = NR; j >= 1; j--) {
            if ((j<i)&&(smallestvaluepossible>int(field26[j]))) {
                tempvalstartx=tempvalstartx+int(field20[j]);
                tempvalstarty=tempvalstarty+int(field21[j]);
                smallestvaluepossible = int(field26[j])+0;
                allparents= j "|" allparents
            }
        }
        tempvalendx=tempvalendx+tempvalstartx-int(field20[i]);
        tempvalendy=tempvalendy+tempvalstarty-int(field21[i]);
        allparents = lstrip(allparents, char_to_strip);
        allparents = rstrip(allparents, char_to_strip);
        width=tempvalendx - tempvalstartx;
        height=tempvalendy - tempvalstarty;
        area=width * height;
        centerx=int(width / 2) + tempvalstartx;
        centery=int(height / 2) + tempvalstarty;
        print i, fieldfim, allparents, tempvalstartx, tempvalstarty, tempvalendx, tempvalendy, width, height, area, centerx, centery
    }
}
