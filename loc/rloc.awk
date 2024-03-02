function str_rstrip(str, char) {
    sub(char "+$", "", str);
    return str;
}


function executeAWKScript(col1,col2,col3,col4, c1,c2,c3,c4) {
    cmd = "awk -v col1="col1" -v col2="col2" -v col3="col3" -v col4="col4" 'BEGIN{FS=\"\\t\";}(NR==1){for (i=1;i<=NF;i++){ if ($i==col1){ncol1=i;} else if ($i==col2){ncol2=i;} else if ($i==col3){ncol3=i;} else if ($i==col4){ncol4=i;}  }} (NR>1){printf $ncol1\",\"$ncol2\",\"$ncol3\",\"$ncol4\"X\" }' "fi""
    if ((cmd | getline stringx) > 0) {
        close(cmd)
    }
    stringstr=str_rstrip(stringx,"X")
    counter=split(stringstr, ARGVPARSED0, "X");
    for (i=1;i<=counter;i++){
        n=split(ARGVPARSED0[i], ARGVPARSED, ",");

        if (scan_full_size==0){
            if (((int(ARGVPARSED[3])-int(ARGVPARSED[1]))==width) && ((int(ARGVPARSED[4])-int(ARGVPARSED[2]))==height)){
                c1[i]=0;
                c2[i]=0;
                c3[i]=0;
                c4[i]=0;
                resus[i]=0;
                continue
            }
        }
        c1[i]=int(ARGVPARSED[1])
        c2[i]=int(ARGVPARSED[2])
        c3[i]=int(ARGVPARSED[3])
        c4[i]=int(ARGVPARSED[4])
        if (c1[i]<0){
            c1[i]=0;
        }
        if (c1[i]>width){
            c1[i]=width;
        }
        if (c3[i]<0){
            c3[i]=0;
        }
        if (c3[i]>width){
            c3[i]=width;
        }
        if (c2[i]<0){
            c2[i]=0;
        }
        if (c2[i]>height){
            c2[i]=height;
        }
        if (c4[i]<0){
            c4[i]=0;
        }
        if (c4[i]>height){
            c4[i]=height;
        }
        resus[i]=0;
    }
    delete ARGVPARSED
    delete ARGVPARSED0
}

function gettmpfile(){
    cmdmktemp="mktemp"
    if ((cmdmktemp | getline tmpf) > 0) {
        close(cmdmktemp)
    }
    return tmpf;
}

function getwidthheight(){
    wcmd="(wm size | awk 'BEGIN{FS=\"[[:space:]x]\";}{printf $(NF-1)\",\"$NF}')"
    if ((wcmd | getline wh) > 0) {
        close(wcmd)
    }
    split(wh, wharray, ",");
    width=int(wharray[1])
    height=int(wharray[2])
}

BEGIN{
    if (! count_one_color){
        count_one_color=0;
    }
    else {
        count_one_color=int(count_one_color);

    }
    if (! scan_full_size){
        scan_full_size=0;
    }
    else {
        scan_full_size=int(scan_full_size);
    }
    if (! is_one_color_there){
        is_one_color_there=0;
    }
    else {
        is_one_color_there=int(is_one_color_there);
    }
    if (! get_avarage_coord){
        get_avarage_coord=0;
    }
    else {
        get_avarage_coord=int(get_avarage_coord);
    }


    if (! rgb){
        r=-1
        g=-1
        b=-1
    }
    else{
        counter=split(rgb, rgbarray, ",");
        r=int(rgbarray[1]);
        g=int(rgbarray[2]);
        b=int(rgbarray[3]);
    }
    if (! rgbrange){
        rmin=-1;
        rmax=-1;
        gmin=-1;
        gmax=-1;
        bmin=-1;
        bmax=-1;
    }
    else{
        counter=split(rgbrange, rgbrangearray, ",");
        rmin=int(rgbrangearray[1]);
        rmax=int(rgbrangearray[2]);
        gmin=int(rgbrangearray[3]);
        gmax=int(rgbrangearray[4]);
        bmin=int(rgbrangearray[5]);
        bmax=int(rgbrangearray[6]);
    }

    if (! sep) {
        sep="#";
    }
    if (rgbvalues){
        nl=split(rgbvalues, ARGVPARSED, sep);
        for (j=1; j<=nl;j++) {
                split(ARGVPARSED[j], xandy, ",");
                rv[j]=int(xandy[1]);
                gv[j]=int(xandy[2]);
                bv[j]=int(xandy[3]);
            }
        rgbvalues=1;
    }
    else{
        rgbvalues=0;
    }
    if (! average_color){
        average_color=0;
    }
    else{
        average_color=int(average_color);
    }
    if (! dominant_color){
        dominant_color=0;
    }
    else{
        dominant_color=int(dominant_color);
    }
    #print dominant_color;


    coltmp=gettmpfile();
    getwidthheight();
    FS=",";
    OFS="\t"
    executeAWKScript(col1,col2,col3,col4,c1,c2,c3,c4)

}

(NR>4){
    y=(FNR-5)/width;
    x=(FNR-5)%width;
    for (h=1;h<=length(c1);h++){
        if (! (x >= c1[h] && x < c3[h] && y >= c2[h] && y < c4[h])){
            continue;
        }
        if (r>-1){
            if (! (r==$1 && g==$2 && b==$3)){
                continue;
            }
        }
        else if (rmin>-1){
            if (! (rmin<=$1 && rmax>=$1 && gmin<=$2 && gmax>=$2 && bmin<=$3 && bmax>=$3)){
                continue;
            }
        }
        else if (rgbvalues>0){
            go_on=0;
            for (j=1; j<=nl;j++){
                if (rv[j]==$1 && gv[j]==$2 && bv[j]==$3){
                    go_on=1;
                    break;
                }
            }
            if (go_on==0){
                continue;
            }
        }
        else if (average_color>0){
                resus[h]+=1;
                resusr[h]+=$1;
                resusg[h]+=$2;
                resusb[h]+=$3;
                continue;
        }
        else if (dominant_color>0){
            # if (! maxval[h]){
            #     maxval[h]=0;
            # }
            resusrgb[h,$1,$2,$3]+=1
            if (resusrgb[h,$1,$2,$3] > maxval[h]){
                resus[h]=$1 OFS $2 OFS $3
                maxval[h]=resusrgb[h,$1,$2,$3]
            }
            continue;

        }
        if (count_one_color>0){
            resus[h]+=1
        }
        else if (is_one_color_there>0){
            if (resus[h]>0){
                continue;
            }
            resus[h]+=1;
        }
        else if (get_avarage_coord>0){
                resus[h]+=1;
                resusx[h]+=x;
                resusy[h]+=y;
        }
    }
}
END {
    if ((count_one_color>0)||(is_one_color_there>0)){
        print newcolumn > coltmp
    }
    else if ((get_avarage_coord>0)){
        print newcolumn"_x" OFS newcolumn"_y"> coltmp
    }
    else if ((average_color > 0)||(dominant_color>0)){
        print newcolumn"_r" OFS newcolumn"_g" OFS newcolumn"_b"> coltmp
    }
    for (h=1;h<=length(c1);h++){
        if ((count_one_color>0)||(is_one_color_there>0)){
            print resus[h] >> coltmp
        }
        else if ((get_avarage_coord>0)){
            if (resus[h]>0){
                print int(resusx[h]/resus[h]) OFS int(resusy[h]/resus[h]) >> coltmp
            }
            else{
                print "-1" OFS "-1" >> coltmp
            }
        }
        else if ((average_color > 0)){
            if (resus[h]>0){
                print int(resusr[h]/resus[h]) OFS int(resusg[h]/resus[h]) OFS int(resusb[h]/resus[h]) >> coltmp
            }
            else{
                print "-1" OFS "-1" OFS "-1" >> coltmp
            }
        }
        else if ((dominant_color > 0)){
            if (maxval[h]>0){
                print resus[h] >> coltmp
            }
            else{
                print "-1" OFS "-1" OFS "-1" >> coltmp
            }
        }        
    }
    system("paste "fi" "coltmp"")
}
# sed -n '1p; 21,27p' /sdcard/u.txt > /sdcard/fifi.txt
# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=color_count -v rgb=24,24,24 -v count_one_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=is_there -v rgb=24,24,24 -v is_one_color_there=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=avg -v rgb=24,24,24 -v get_avarage_coord=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk


# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=color_count -v rgbrange=5,25,5,25,5,25 -v count_one_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=is_there -v rgbrange=5,25,5,25,5,25 -v is_one_color_there=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=avg -v rgbrange=5,25,5,25,5,25 -v get_avarage_coord=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk


# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=color_count -v rgbvalues=24,24,24#25,25,25 -v count_one_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=is_there -v rgbvalues=24,24,24#25,25,25 -v is_one_color_there=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk
# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=avg -v rgbvalues=24,24,24#25,25,25 -v get_avarage_coord=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk

# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=avg_color -v average_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk

# screencap | hexdump -v -e '4/1 "%d," "\n"' | awk -f /sdcard/loc/rloc.awk -v col1=startx -v col2=starty -v col3=endx -v col4=endy -v newcolumn=dom_color -v dominant_color=1 -v fi=/sdcard/fifi.txt  | awk -f /sdcard/printer/awk_pretty_print.awk