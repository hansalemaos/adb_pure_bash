function is_val_empty(v) {
    if (v ~ /^[:space:]*$/){
        print 1;
    }
    else{
        print 0;
    }
}
function get_len(v) {
    print length(v);
}
function check_lt(v, value) {
    if (v < value){
        print 1;
    }
    else{
        print 0;
    }
}
function check_gt(v, value) {
    if (v > value){
        print 1;
    }
    else{
        print 0;
    }
}
function check_ge(v, value) {
    if (v >= value){
        print 1;
    }
    else{
        print 0;
    }
}
function check_le(v, value) {
    if (v <= value){
        print 1;
    }
    else{
        print 0;
    }
}
function check_eq(v, value) {
    if (v == value){
        print 1;
    }
    else{
        print 0;
    }
}
function count_char(v,character) {
    countcommand="echo -e -n "v" | xargs | awk -F"character" '{print NF-1}'"
    if ((countcommand | getline count) > 0) {
        close(countcommand)
    }    
    print count;
}

function str_contains(v,value){
    print index(v, value)
}
function sort_letters(v){
    sortletterscmd = "echo "v" | tr -d '[:space:]' | grep -o . | sort | tr -d \"\\n\""
    if ((sortletterscmd | getline stringx) > 0) {
        close(sortletterscmd)
    }
    print stringx;
}

function str_replace(var,subs1,subs2){
    gsub(subs1, subs2, var)
    print var

}
function absval(v){
    abs_val = v;
        if (abs_val < 0) {
            abs_val = -v;
        }
        print abs_val;
}
function str_startswith(v,value){
    startswithcmd="if [[ "v" == "value"* ]] ; then echo 1; fi"
    if ((startswithcmd | getline stringx) > 0) {
        close(startswithcmd)
    }
    if (stringx ~ /^[:space:]*$/){
        stringx=0;
    }
    print stringx;
    stringx=0;

}
function str_endswith(v,vala){
    endswithcmd="if [[ "v" == *"vala" ]] ; then echo 1; fi"
    if ((endswithcmd | getline stringxx) > 0) {
        close(endswithcmd)
    }    
    if (stringxx ~ /^[:space:]*$/){
        stringxx=0;
    }
    print stringxx;
    stringxx=0;
}
function levenshtein_distance(str1, str2,    len1, len2, chars1, chars2, i, j, matrix, cost, x, y, z) {
    len1 = length(str1)
    len2 = length(str2)
    if (len1 == 0) return len2
    if (len2 == 0) return len1
    if (str1 == str2) return 0
    for(i = 1; i <= len1; i++) {
        chars1[i] = substr(str1, i, 1)
    }
	for(j = 1; j <= len2; j++) {
        chars2[j] = substr(str2, j, 1)
    }
    for (i = 0; i <= len1; i++) {
        matrix[i, 0] = i
    }
    for (j = 0; j <= len2; j++) {
        matrix[0, j] = j
    }
    for (i = 1; i <= len1; i++) {
        for (j = 1; j <= len2; j++) {
            cost = (chars1[i] == chars2[j]) ? 0 : 1
            x = matrix[i-1, j] + 1
            y = matrix[i, j-1] + 1
            z = matrix[i-1, j-1] + cost
            if (x <= y && x <= z) matrix[i, j] = x
            if (y <= x && y <= z) matrix[i, j] = y
            if (z <= x && z <= y) matrix[i, j] = z
        }
    }
    return matrix[len1, len2]
}

function str_lstrip(str, char) {
    sub("^" char "+", "", str);
    print str;
}

function str_rstrip(str, char) {
    sub(char "+$", "", str);
    print str;
}

function strip_spaces_both_sides(var) {
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", var)
    print var;
}

function str_lower(v){
    print tolower(v);
}
function str_upper(v){
    print toupper(v);
}
BEGIN {
    if (! fs){
	    FS="\t";
    }
    else{
        FS=fs;
    }
    OFS=FS;
	coli="";
}
NR <= 1 {
    header=$0;
    for (i=1; i<=NF;i++){
        keyvalues[i]=$i;
        valueskey[$i]=i;
        if(column==$i){
            coli=i;
        }
    }
    if (coli==""){
        print "column not found";
        exit 1
    }
    else{
        printf header;
        printf OFS;
        printf newcolumn;
        print ""
    }

}
(NR > 1 ){

    for (i=1; i<=NF;i++){
            if (i==coli) {
                colicol[NR]=$i;
            }
        }
}
(NR > 1 ){
    for (i=1; i<=NF;i++){
        printf $i OFS;
        if (i==NF){
            va=colicol[NR]
            if (is_empty){
                is_val_empty(va);
            }
            else if (len){
                get_len(va);
            }
            else if (lt){
                check_lt(va,value);
            }

            else if (gt){
                check_gt(va,value);
            }

            else if (ge){
                check_ge(va,value);
            }

            else if (le){
                check_le(va,value);
            }

            else if (eq){
                check_eq(va,value);
            }
            else if (charcount){
                count_char(va, value);
            }
            else if (strcontains){
                str_contains(va, value);
            }
            else if (sortletters){
                sort_letters(va);
            }
            else if (strreplace){
                str_replace(va,old,new)
            }
            else if (absolute){
                absval(va)
            }
            else if (leven){
                vax=levenshtein_distance(va, str)
                print vax

            }
            else if (strstartswith){
                str_startswith(va, value)

            }
            else if (strendswith){
                str_endswith(va, value)

            }
            else if (strlstrip){
                str_lstrip(va, value)

            }
            else if (strrstrip){
                str_rstrip(va, value)

            }
            else if (spacestrip){
                strip_spaces_both_sides(va)

            }
            else if (strlower){
                str_lower(va)

            }
            else if (strupper){
                str_upper(va)

            }
            else{
                print colicol[NR];
            }
        }
    }
}

# awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="text2" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="is_empty" -v is_empty=1 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="text" -v newcolumn="length" -v len=1 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_lt" -v lt=1 -v value=700 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_gt" -v gt=1 -v value=700 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_ge" -v ge=1 -v value=700 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_le" -v le=1 -v value=700 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="centerx" -v newcolumn="centerx_eq" -v eq=1 -v value=700 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_count" -v charcount=1 -v value="1" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_count" -v charcount=1 -v value="0" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# #returns index, 0 if not
# awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_strcontains" -v strcontains=1 -v value="000" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_sorted" -v sortletters=1 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_replaced" -v strreplace=1 -v old=andro -v new=BUDU /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="area" -v newcolumn="area_abs" -v absolute=1 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_leven" -v leven=1 -v str="android.view.View" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_starts" -v strstartswith=1 -v value="android.view" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_ends" -v strendswith=1 -v value="android.view" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_rstrip" -v strrstrip=1 -v value="w" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_lstrip" -v strlstrip=1 -v value="a" /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_spacestrip" -v spacestrip=1 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_upper" -v strupper=1 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt
# awk -f /sdcard/series/seriesapply.awk -v column="class" -v newcolumn="class_lower" -v strlower=1 /sdcard/u.txt > /sdcard/p.txt
# awk -f /sdcard/printer/awk_pretty_print.awk  /sdcard/p.txt