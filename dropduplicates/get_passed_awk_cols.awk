BEGIN {
        if (! sep){
            sep=","
        }
        FS="\t"
        OFS=FS
        numbers_of_cols=","
        ARGCPARSED=0;
        split(cols, ARGVPARSED, sep);
        for (j in ARGVPARSED) {
                ARGCPARSED=ARGCPARSED+1
            }

}
NR <= 1 {
    header = $0
	for (i=1; i<=NF;i++)
		{
            for (j in ARGVPARSED) {
			    if($i==ARGVPARSED[j]){
                numbers_of_cols=numbers_of_cols "," i;
            }
         }
      }
}

END {
    gsub(/^,+|,+$/, "", numbers_of_cols)
    print numbers_of_cols
}