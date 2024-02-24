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

BEGIN {
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
    executeAWKScript(script, args)
}

# awk -f /sdcard/rgbtools/awkrgbmean.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100
# awk -f /sdcard/rgbtools/awkrgbmean.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v w=1600