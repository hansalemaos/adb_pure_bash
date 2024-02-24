function executeAWKScript(script, args, cs,counter) {
    cmd = "awk -f " script " " args
    while ((cmd | getline) > 0) {
        
        split($0, ARGVPARSED, ",");
        if (length(ARGVPARSED[3])==0){
            continue
        }
        vatmp=ARGVPARSED[3]","ARGVPARSED[4]","ARGVPARSED[5]

        if (! cs[vatmp]){
            counter+=1;
        }
        cs[vatmp]+=1;
    }
    close(cmd)
}

BEGIN {
    cmd = "mktemp"
    if ((cmd | getline temp_file) > 0) {
        close(cmd)
    }
    if ((cmd | getline temp_file2) > 0) {
        close(cmd)
    }
    script = ARGV[0]
    n = split(script, parts, "/")
    script_path = ""
    for (i = 1; i < n; i++) {
        script_path = script_path parts[i] "/"
    }
    script = script_path "awkrgbregion.awk"
    args = "-v x0="x0 " -v y0="y0 " -v x1="x1 " -v y1="y1
    if (w){
        args=args" -v w="w
    }
    counter=0;
    executeAWKScript(script, args, colorstocount,counter)
     for (j in colorstocount) {
         print colorstocount[j]":"j >> temp_file
    }    
    sortcommand="sort -n -k1,1 < " temp_file " > "  temp_file2
    system(sortcommand)
    system("tac "temp_file2)

}

# awk -f /sdcard/rgbtools/awkcountcolors.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100
# awk -f /sdcard/rgbtools/awkcountcolors.awk -v x0=1 -v y0=1 -v x1=300 -v y1=300 -v w=1600