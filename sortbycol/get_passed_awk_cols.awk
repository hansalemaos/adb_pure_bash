BEGIN {
        FS="\t"
        OFS=FS
        numbers_of_cols=","
}
NR <= 1 {
    header = $0
	for (i=1; i<=NF;i++)
		{
			if($i==col){
            numbers_of_cols=numbers_of_cols "," i;
         }
      }
}

END {
    gsub(/^,+|,+$/, "", numbers_of_cols) 
    print numbers_of_cols
}