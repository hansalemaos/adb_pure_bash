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
    # must start like awk -f FILE
    ownpath=getownpath()
    print ownpath
}