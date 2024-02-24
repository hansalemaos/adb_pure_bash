function executeAWKScript(script, args, cs, bf) {
    cmd = "awk -f " script " " args
    while ((cmd | getline) > 0) {
        split($0, ARGVPARSED, ",");
        vatmp=ARGVPARSED[3]","ARGVPARSED[4]","ARGVPARSED[5]
        for (jx in cs) {
            if (cs[jx]==vatmp){
                print $0
                if (breakfirst>0){
                    exit;
                }
            }
        }
    }
    close(cmd)
}

BEGIN {
    if (! sep) {
        sep="#";
    }
    if (! breakfirst){
        breakfirst=0;
    }
    split(rgb, colorstosearch, sep);
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
    executeAWKScript(script, args, colorstosearch, breakfirst)
}

# awk -f /sdcard/rgbtools/awksearchrgb.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v sep="#" -v rgb="4,8,37#5,9,38"
# awk -f /sdcard/rgbtools/awksearchrgb.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v w=1600 -v rgb="4,8,37#5,9,38"