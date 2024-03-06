function str_rstrip(str, char) {
    sub(char "+$", "", str);
    return str;
}
function str_rstrip_space(str) {
    sub("[[:space:]]+$", "", str);
    return str;
}
function getrandomnumber(startnumber,endnumber){
    randcmd="echo -e -n $(((RANDOM % $(("endnumber" - "startnumber"))) + "startnumber"))"
    if ((randcmd | getline stringd) > 0) {  # only one line to read
        close(randcmd)
    }
    return int(stringd)
    #return int(int(startnumber)+(srand() % int(endnumber-startnumber)))
}
function remove_accents_from_str(h){
    gsub(/[àáâäæãåāǎ]{1,2}/,"a", h)
    gsub(/[çćč]{1,2}/,"c", h)
    gsub(/[èéêëēėęě]{1,2}/,"e", h)
    gsub(/[îïííīįìǐ]{1,2}/,"i", h)
    gsub(/[ł]{1,2}/,"l", h)
    gsub(/[ñń]{1,2}/,"n", h)
    gsub(/[ôöòóœøōǒõ]{1,2}/,"o", h)
    gsub(/[ßśš]{1,2}/,"s", h)
    gsub(/[ûüǔùǖǘǚǜúū]{1,2}/,"u", h)
    gsub(/[ÿ]{1,2}/,"y", h)
    gsub(/[žźż]{1,2}/,"z", h)
    gsub(/[ÀÁÂÄÆÃÅĀǍ]{1,2}/,"A", h)
    gsub(/[ÇĆČ]{1,2}/,"C", h)
    gsub(/[ÈÉÊËĒĖĘĚ]{1,2}/,"E", h)
    gsub(/[ÎÏÍÍĪĮÌǏ]{1,2}/,"I", h)
    gsub(/[Ł]{1,2}/,"L", h)
    gsub(/[ÑŃ]{1,2}/,"N", h)
    gsub(/[ÔÖÒÓŒØŌǑÕ]{1,2}/,"O", h)
    gsub(/[SSŚŠ]{1,2}/,"S", h)
    gsub(/[ÛÜǓÙǕǗǙǛÚŪ]{1,2}/,"U", h)
    gsub(/[Ÿ]{1,2}/,"Y", h)
    gsub(/[ŽŹŻ]{1,2}/,"Z", h)
    return h
}

function read_data(cmd, sep) {
    read_file_command=cmd" | sed 'x;G;1!h;s/\n/"sep"/g;$!d'" # execute cat and replace all newlines
    if ((read_file_command | getline string) > 0) {  # only one line to read
        close(read_file_command)
    }
    stringstr=str_rstrip(string,sep) # strip last sep
    stringstr=str_rstrip_space(stringstr)
    counter=split(stringstr, datawithoutnewlines, sep); # split at sep (fake newline)
    columncounter=1;
    for (i=1;i<=counter;i++){
        output[i]=str_rstrip_space(datawithoutnewlines[i]);
        columncounter=i;
    }
    delete datawithoutnewlines
    return columncounter
}

function parse_files(){
    allfilesnumber=split(files,allfiles,sep);
    indexcounter=1;


    for (file_number=1;file_number<=allfilesnumber;file_number++){
        number_of_all_rows=read_data("cat "allfiles[file_number], sepforline);
        number_of_lines_in_file[file_number]=number_of_all_rows;
        for (row_number=1;row_number<=number_of_all_rows;row_number++){
            parsed_data[file_number, row_number]=output[row_number];
            flatindex[indexcounter]=file_number""s34""row_number
            indexcounter+=1; # absolut index counter
            delete output[row_number]; # important delete data
        }
    }
}

function to_camel_case(str) {
    wordall=tolower(str)
    sus1=toupper(substr(wordall, 1, 1));
    sus2=substr(wordall, 2);
    totalstr=sus1""sus2
    return totalstr
}

function get_true_false(percentage) {
    if (percentage<=0){
        return 0;
    }
    if (percentage>=100){
        return 1;
    }
    percentagegot=int(getrandomnumber(1,100))
    if (percentagegot > percentage){
        return 0;
    }
    return 1;
}

function random_item(arr) {
    lenarra=length(arr)
    rand_index=1;
    if (lenarra>1){
        rand_index =int(getrandomnumber(1,lenarra))
    }
    return arr[rand_index]
}
BEGIN {
    if (! ofs ){
        OFS="\t";
    }
    else {
        OFS=ofs;
    }
    if (! fs ){
        FS="\t";
    }
    else {
        FS=fs;
    }
    if (! sep ){
        sep="#";
    }
    if (! sepforline){
        sepforline="Ç";
    }
    if (! file_field_sep){
        file_field_sep="[[:space:]]+";
    }
    if (! percent_camel){
        percent_camel=0;
    }
    else{
        percent_camel=int(percent_camel);
    }
    if (! percent_up){
        percent_up=0;
    }
    else{
        percent_up=int(percent_up);
    }

    if (! percent_low){
        percent_low=0;
    }
    else{
        percent_low=int(percent_low);
    }
    if (! percent_number){
        percent_number=0;
    }
    else{
        percent_number=int(percent_number);
    }

    if (! percent_accents){
        percent_accents=0;
    }
    else{
        percent_accents=int(percent_accents);
    }
    if (! total_output){
        total_output=1;
    }
    else{
        total_output=int(total_output);
    }

    if (! random_number_start){
        random_number_start=0;
    }
    else{
        random_number_start=int(random_number_start);
    }


    if (! random_number_end){
        random_number_end=0;
    }
    else{
        random_number_end=int(random_number_end);
    }

    if (! outputseps){
        outputseps=" "
    }
    if (! percent_space_replace){
        percent_space_replace=0;
        space_replace=" ";
    }
    else{
        percent_space_replace=int(percent_space_replace);
    }
    split(outputseps,outputsepsarray,sep)
    s34="\034" # sep for multidimensional arrays
    parse_files();
    while (length(outputstringtotalarray)<total_output){
        for (i=1;i<=total_output;i++){
            outputstringtotal=""
            outputsep=random_item(outputsepsarray)
            camel=get_true_false(percent_camel);
            up=get_true_false(percent_up);
            low=get_true_false(percent_low);
            addno=get_true_false(percent_number);
            pspace=get_true_false(percent_space_replace);

            remove_accents=get_true_false(percent_accents);
            for (file_no=1;file_no<=length(number_of_lines_in_file);file_no++){
                random_rows[file_no]=getrandomnumber(1,number_of_lines_in_file[file_no])
            }

            for (flat=1;flat<=length(parsed_data);flat++){
                index_file_line=flatindex[flat];
                split(index_file_line,index_file_linearray,s34);
                filenumber=index_file_linearray[1];
                linenumber=index_file_linearray[2];
                if (linenumber!=random_rows[filenumber]){
                    continue;
                }
                number_of_fields=split(parsed_data[index_file_line],fieldarray,file_field_sep);
                number_of_rows_in_file=number_of_lines_in_file[filenumber]
                outputstring=parsed_data[index_file_line]"";
                if (remove_accents>0){
                    outputstring=remove_accents_from_str(outputstring);
                }
                if ((filenumber)<length(number_of_lines_in_file)){
                    outputstring=outputstring""outputsep;
                }
                if (camel>0){
                    outputstring=to_camel_case(outputstring)
                }
                else if (low>0){
                    outputstring=tolower(outputstring)
                }
                else if (up>0){
                    outputstring=toupper(outputstring)
                }

                if (pspace>0){
                    gsub(/[[:space:]]+/,space_replace, outputstring)
                }
                outputstringtotal=outputstringtotal""outputstring;
                # template for printing fields 
                #for (field_index=1;field_index<=number_of_fields;field_index++){

                    #printf "NUMBER OF ROWS: " number_of_rows_in_file " FILE NAME: " allfiles[filenumber] " FILE INDEX: "filenumber" | LINDE INDEX: "linenumber" | WHOLE LINE: "parsed_data[index_file_line] " | FIELD NUMBER: "field_index" | FIELD VALUE: "fieldarray[field_index]"\n";
                #}
                #print "--------------------------------"
            }
            if (addno>0){
                if (random_number_start!=random_number_end){
                    outputstringtotal=outputstringtotal""outputsep""getrandomnumber(random_number_start,random_number_end)

                }
            }
        outputstringtotalarray[outputstringtotal]=outputstringtotal

        }
        delete random_rows;
    }
    outcounter=0;
    for (j in outputstringtotalarray){
        print j;
        outcounter+=1;
        if (outcounter==total_output){
            break
        }
    }
}
