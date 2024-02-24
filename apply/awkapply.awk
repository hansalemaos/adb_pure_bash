function executeAWKScript(cmd) {
    system(cmd)
    data=""
    getline data < temp_file
    close(temp_file)
    printf OFS data
    system("rm -f "temp_file)
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
                printf column OFS newcolumn;
			}
            else{
                printf $i
            }
		if (i==NF){
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
                printf $i;
                cmd="printf \"%s\" \"" $i "\" | awk '" apply "' > "temp_file
                executeAWKScript(cmd);
            }
			else {
                printf $i
            }
		if (i==NF){
            print ""
        }
        else{
            printf OFS
        }
    }
}

# awk -f /sdcard/apply/awkapply.awk -v column="text" -v newcolumn="text2" -v apply="{printf length(\$0)}" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt

# awk -f /sdcard/apply/awkapply.awk -v column="endy" -v newcolumn="endy2" -v apply="{printf (\$0 \> 700)}" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt

# awk -f /sdcard/apply/awkapply.awk -v column="clickable" -v newcolumn="is_clickable" -v apply="{printf (\$0 \~ \"true\")}" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt