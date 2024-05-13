function lstrip(str, char) {
    sub("^" char "+", "", str);
    return str;
}

function rstrip(str, char) {
    sub(char "+$", "", str);
    return str;
}


BEGIN{
    read_file_command="pwd";
    if ((read_file_command | getline pwdfolder) > 0) {
        close(read_file_command);
    }
    if (! adbpath){
        adbpath="adb";
    }
    if (! win){
        win=0;
    }
    else{
        win=int(win);
    }
    if (! dst){
        dst="/sdcard/";
    }
    if (! serial){
        serial="127.0.0.1:5555";
    }
    if (! cmdfile){
        cmdfile=""
    }
    currfolder="/";
    gsub(/[\/]+$/, "",dst);
}

{
    if ((match($0, /^[[:space:]]*$/))||(match($0, /^d.*[[:space:]]+[0-9]{2}:[0-9]{2}[[:space:]]+.*$/))||(match($0, /^total[[:space:]]+[0-9]+[[:space:]]*$/))){
        next;
    }
    if (! (match($(NF-1), /^[0-9]+:[0-9]+$/))){
        if (match($1, /^\..*:$/)){
            currfolder=$0"";
            currfolder=rstrip(currfolder,":");
            currfolder=lstrip(currfolder,"\\.");
            dstfolder=dst""currfolder;
            dstfolderall[dstfolder]="\""adbpath"\" -s "serial" shell mkdir -p \""dstfolder"\"";
        }
    }
    if (match($(NF-1), /^[0-9]+:[0-9]+$/)){
        finalpath=sprintf(pwdfolder currfolder"/"$NF);
        if (win>0){
            gsub(/[\/]+/, "\\",finalpath);
            gsub(/^[\\\/]+/, "",finalpath);
            no=split(finalpath, finalpatharray, /[\\]+/);
            finalpath="";
            for (i=1;i<=no;i++){
                if (i==1){
                    finalpath=sprintf(finalpatharray[i]":");
                    }
                else{
                    finalpath=sprintf(finalpath"\\"finalpatharray[i]);
                }
            }

        }
        pushfiles[finalpath]="\""adbpath"\" -s "serial" push \""finalpath"\" \""dstfolder"/\"";

    }

}

END {
    if (cmdfile!=""){
        print "" > cmdfile;
    }
    for (outfolder in dstfolderall){
            print dstfolderall[outfolder];
            if (cmdfile!=""){
                print dstfolderall[outfolder] >> cmdfile;
            }
    }
    for (pushf in pushfiles){
        print pushfiles[pushf];
            if (cmdfile!=""){
                print pushfiles[pushf] >> cmdfile;
            }
    }
}

