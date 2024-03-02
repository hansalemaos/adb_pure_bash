function executeAWKScript(cmd) {
    data=""
    if ((cmd | getline data) > 0) {
        close(cmd)
    }
    #data=sprintf(OFS data);
    return data
}
BEGIN {
	FS="\t";
    OFS=FS;
	coli="[not found]";
    cmd = "mktemp"
    if ((cmd | getline temp_file) > 0) {
        close(cmd)
    }
}
NR <= 1 {
		for (i=1; i<=NF;i++)
		{
			if(column==$i)
			{
				coli=i;
                #printf column OFS;
			}
        printf $i
		if (i==NF){
            printf OFS newcolumn;
            print ""
        }
        else{
            printf OFS
        }
		}

}

(NR > 1 ){
    for (i=1; i<=NF;i++)
		{
            if (i==coli) {
                cmd="printf \"%s\" \"" $i "\" | awk '" apply "'"
                da=executeAWKScript(cmd);
            }
        printf $i
		if (i==NF){
            print OFS da;
            #print "";
            da="";
        }
        else{
            printf OFS
        }
    }
}

# awk -f /sdcard/awkapply/apply.awk -v column="text" -v newcolumn="text2" -v apply="{printf length(\$0)}" /sdcard/u.txt | awk -f /sdcard/printer/awk_pretty_print.awk
# awk -f /sdcard/awkapply/apply.awk -v column="endy" -v newcolumn="endy2" -v apply="{printf (\$0 \> 700)}" /sdcard/u.txt | awk -f /sdcard/printer/awk_pretty_print.awk
# awk -f /sdcard/awkapply/apply.awk -v column="clickable" -v newcolumn="is_clickable" -v apply="{printf (\$0 \~ \"true\")}" /sdcard/u.txt | awk -f /sdcard/printer/awk_pretty_print.awk
