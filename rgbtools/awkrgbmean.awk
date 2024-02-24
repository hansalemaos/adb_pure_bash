function executeAWKScript(script, args) {
    cmd = "awk -f " script " " args
    counter=1;
    rtotal=0;
    gtotal=0;
    btotal=0;
    while ((cmd | getline) > 0) {
        split($0, ARGVPARSED, ",");
        rtotal+=ARGVPARSED[3];
        gtotal+=ARGVPARSED[4];
        btotal+=ARGVPARSED[5];        
        counter+=1;
    }
    close(cmd)
    counter=counter-1;
    rtotal=int(rtotal/counter);
    gtotal=int(gtotal/counter);    
    btotal=int(btotal/counter);
    print rtotal","gtotal","btotal;
}

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
BEGIN {
    scriptx=getownpath();
    split(scriptx, parts, "/");
    lenn=length(parts)
    script_path = "";
    for (i = 1; i < lenn; i++) {
        script_path = script_path parts[i] "/";
        if (i+1==lenn){
            script_path = script_path "awkrgbregion.awk";
        }
    }
    
    args = "-v x0="x0 " -v y0="y0 " -v x1="x1 " -v y1="y1
    if (w){
        args=args" -v w="w
    }
    executeAWKScript(script_path, args)
}

# awk -f /sdcard/rgbtools/awkrgbmean.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100
# awk -f /sdcard/rgbtools/awkrgbmean.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v w=1600