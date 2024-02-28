function stripStringBothSides(var) {
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", var)
    return var
}
function getownpath(){
    cmd = "mktemp"
    if ((cmd | getline temp_file) > 0) {
        close(cmd)
    }
    if ((cmd | getline temp_file2) > 0) {
        close(cmd)
    }
    if ((cmd | getline temp_file3) > 0) {
        close(cmd)
    }
    co=0;
    allli=""
    while ( ( "ps -f" | getline pslines ) > 0 ) {
        if (co==0){
            co+=1
        }
        else{
            where = match(pslines, / awk /)
            if (where != 0){
                allli=allli "\n" pslines;
            }
        }
    }
    alli2=stripStringBothSides(allli)
    print alli2 > temp_file
    sortcommand="sort -n -k5,5 < "temp_file" > "temp_file2
    system(sortcommand);
    system("tac "temp_file2" | awk 'BEGIN { FS = \" +awk +-f +\" }; { print $2 }' | awk 'BEGIN { FS = \"[.][aA][wW][kK] *\" }; { print $1 \".awk\" }' | sed \"1q;d\" > " temp_file3);
    getline fpath < temp_file3
    close(temp_file3);
    system("rm -f "temp_file);
    system("rm -f "temp_file2);
    system("rm -f "temp_file3);
    return fpath;
}

function pdata(){
    if (print_coords>0){
        printf alldatacoords[databs];
    }
    if (print_colors>0){
        if (print_coords>0){
            printf ",";
        }
        printf alldatargb[databs];
    }
    if (counter!=lastval){
        printf ors;
    }
    else{
        printf "\n"
    }
}

function get_colors_in_area(sx0, sy0, sx1,sy1 , screenwidth,print_colors,print_coords,ors,action){
    counter=0
    lastval=(sx1-sx0)*(sy1-sy0)
    found_color=0;
    for (ys=sy0*screenwidth;ys<sy1*screenwidth;ys+=screenwidth){
        for (xs=sx0;xs<sx1;xs++){
            counter++;
            databs=ys+xs
            if (action=="print_data"){
                pdata()
            }
            else if (action=="search_color"){
                if (alldatargb[databs]!=rgbcolor){
                    continue
                }
                pdata()
            }
            else if (action=="count_color"){
                if (alldatargb[databs]!=rgbcolor){
                    continue
                }
                found_color++;
            }
            else if ((action=="dominant_color") || (action=="count_all_colors")){
                dominant_colors[alldatargb[databs]]+=1;

            }
        }
    }
    if (action=="count_color"){
        printf found_color;
    }
    if ((action=="dominant_color") || (action=="count_all_colors")){
        for (cor in dominant_colors){
            if (action=="dominant_color"){
                if (dominant_colors[cor]>maxval){
                    maxval=int(dominant_colors[cor]+0);
                    maxcor=cor;
                    dominant_colors[cor]=0;
                }
            }
            else if (action=="count_all_colors"){
                if (dominant_colors[cor]>0){
                    percentage=((dominant_colors[cor]*100)/(counter*100))*100;
                    printf cor","percentage","dominant_colors[cor] ors;
                    dominant_colors[cor]=0;
                }
            }
        }
        if (action=="dominant_color"){
            percentage=((maxval*100)/(counter*100))*100;
            printf maxcor","percentage","maxval;

        }
    }
    found_color=0;
    maxval=0
    percentage=0
    counter=0
    lastval=0
}

# awk -f /sdcard/rgbinfos.awk -v o="/sdcard/baba.txt"
# awk -f /sdcard/rgbapply.awk -v areas="1,1,5,5#10,12,14,18#3,3,6,6" -v print_colors=1 -v print_coords=1 -v action=print_data -v ors="\t" -v sep="#" "/sdcard/baba.txt"
# awk -f /sdcard/rgbapply.awk -v areas="1,1,5,5#10,12,14,18#3,3,6,6" -v print_colors=1 -v print_coords=1 -v rgbcolor="4,8,37" -v action=search_color -v ors="\t" -v sep="#" "/sdcard/baba.txt"
# awk -f /sdcard/rgbapply.awk -v areas="1,1,5,5#10,12,14,18#3,3,6,6" -v print_colors=0 -v print_coords=1 -v rgbcolor="4,8,37" -v action=search_color -v ors="\t" -v sep="#" "/sdcard/baba.txt"
# awk -f /sdcard/rgbapply.awk -v areas="1,1,5,5#10,12,14,18#3,3,6,6" -v rgbcolor="129,131,145" -v action=count_color -v sep="#" "/sdcard/baba.txt"
# awk -f /sdcard/rgbapply.awk -v areas="1,1,5,5#10,12,14,18#3,3,6,6#406,136,409,153#136,406,153,409" -v action=dominant_color -v sep="#" "/sdcard/baba.txt"
# awk -f /sdcard/rgbapply.awk -v areas="1,1,5,5#10,12,14,18#3,3,6,6" -v action=count_all_colors -v sep="#" "/sdcard/baba.txt"
BEGIN {
    mkcmd = "mktemp"
    if (! print_colors){
        print_colors=0;
    }
    else {
        print_colors=int(print_colors)
    }
    if (! print_coords){
        print_coords=0;
    }
    else {
        print_coords=int(print_coords)
    }
    FS=",";
    if (! ors){
        ors="\t"
    }
    if (! sep){
        sep="#";
    }
    split(areas, allareastmp, sep)
    for (ele in allareastmp){
        we=(index(areas, sep""allareastmp[ele]""sep))
        if (we==0){
            we=(index(areas, sep""allareastmp[ele]))
        }
        if (we==0){
            we=(index(areas, allareastmp[ele]""sep))
        }
        if (we==0){
            we=(index(areas, allareastmp[ele]))
        }
        indexarray[we]=(allareastmp[ele]);
    }
    strlenareas=length(areas);
    elecounter=1;
    lastone=0;
    for (elei=1;elei<=strlenareas;elei++){
            for (ii in indexarray){
                if (int(ii)==(elei)){
                    if (elei==lastone){
                        continue
                    }
                    allareas[elecounter]=indexarray[ii];
                    elecounter++;
                    lastone=elei;


                }
            }

    }

    rgbdata=ARGV[1];
    if ((mkcmd | getline screensizetmp) > 0) {
        close(mkcmd);
    }
    system("tail -1 "rgbdata" | awk 'BEGIN{FS=\",\"} END{ print $1\",\"$2}' >" screensizetmp)
    getline screenwidthheight < screensizetmp
    close(screensizetmp)
    system("rm -f " screensizetmp)
    split(screenwidthheight,widthheight,",")
    screenwidth=int(widthheight[1])+1
    screenheight=int(widthheight[2])+1
    totallines=screenwidth*screenheight
}

{
    alldatargb[NR-1]=$3","$4","$5;
    alldatacoords[NR-1]=$1","$2;
}

END{
    for (ax=1;ax<elecounter; ax++){
        split(allareas[ax],suba,",");
        printf allareas[ax]":";
        get_colors_in_area(int(suba[1]), int(suba[2]), int(suba[3]), int(suba[4]), screenwidth,print_colors,print_coords,ors,action)
        printf "\n"

    }
}

