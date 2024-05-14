#!/usr/bin/env sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
uielementparser="$SCRIPTPATH/elementparser.sh"
#jdata="/sdcard/jdata.txt"

get_joinedframe() {
    parsedfiles2="$(cat "$uielementparser" | sh | tail -n+2)"
    parsedfiles="$(echo -e -n "$parsedfiles2" | sed -E 's/\t/\tUXUAXSBDB/g' | sed -E 's/UXUAXSBDB//')"
    lastlinenumber="$(echo -e -n "$parsedfiles" | tac | grep -niE -m1 '^[[:space:]]*1[[:space:]]+0[[:space:]]+' | awk 'BEGIN{FS=":";}{print $1}')"
    lastlinenumber=$((lastlinenumber + 1))
    lastlines=$(echo -e -n "$parsedfiles" | tail -n "$lastlinenumber")
    filedata=$(echo -e -n "$lastlines" | tr '\n' '\31' | awk 'BEGIN{FS="\31[[:space:]]*[0-9]+[[:space:]]+0[[:space:]]+";}{for (i=1;i<=NF;i++){printf "%s\n", $i}} ')

    loopvar=$(echo -e -n "$filedata" | wc -l | awk '{print $1}')
    i=0
    printf "%s\t" "text" "resource-id" "class" "package" "content-desc" "checkable" "checked" "clickable" "enabled" "focusable" "focused" "scrollable" "long-clickable" "password" "selected" "startx" "endx" "starty" "endy" "centerx" "centery" "area" "width"
    echo

    while [ "$i" -lt "$loopvar" ]; do
        i=$((i + 1))
        filedatax=$(echo -e -n "$filedata" | sed -n "$i"p | tr '\31' '\n' | sed -E 's/^[0-9]+\t[0-9]+\t/00000\t00000\t/g')
        if [ -n "$filedatax" ]; then
            echo -e "00000\t00000\t$filedatax" | sed -E 's/00000\t00000\t00000\t00000\t/00000\t00000\t/g' | awk 'function strip_spaces_both_sides(var) {
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", var)
}
BEGIN{FS="\t";
element_index_string="";
index_string="";
text_string="";
resource_id_string="";
class_string="";
package_string="";
content_desc_string="";
checkable_string="";
checked_string="";
clickable_string="";
enabled_string="";
focusable_string="";
focused_string="";
scrollable_string="";
long_clickable_string="";
password_string="";
selected_string="";
startx_string="";
endx_string="";
starty_string="";
endy_string="";
centerx_string="";
centery_string="";
area_string="";
width_string="";
height_string="";}
{ 
strip_spaces_both_sides($1)
if (length($1) != 0){
element_index_string=element_index_string"|"$1;}
else{
element_index_string=element_index_string"|NaN";}

strip_spaces_both_sides($2)
if (length($2) != 0){
index_string=index_string"|"$2;}
else{
index_string=index_string"|NaN";}

strip_spaces_both_sides($3)
if (length($3) != 0){
text_string=text_string"|"$3;}
else{
text_string=text_string"|NaN";}

strip_spaces_both_sides($4)
if (length($4) != 0){
resource_id_string=resource_id_string"|"$4;}
else{
resource_id_string=resource_id_string"|NaN";}

strip_spaces_both_sides($5)
if (length($5) != 0){
class_string=class_string"|"$5;}
else{
class_string=class_string"|NaN";}

strip_spaces_both_sides($6)
if (length($6) != 0){
package_string=package_string"|"$6;}
else{
package_string=package_string"|NaN";}

strip_spaces_both_sides($7)
if (length($7) != 0){
content_desc_string=content_desc_string"|"$7;}
else{
content_desc_string=content_desc_string"|NaN";}

strip_spaces_both_sides($8)
if (length($8) != 0){
checkable_string=checkable_string"|"$8;}
else{
checkable_string=checkable_string"|NaN";}

strip_spaces_both_sides($9)
if (length($9) != 0){
checked_string=checked_string"|"$9;}
else{
checked_string=checked_string"|NaN";}

strip_spaces_both_sides($10)
if (length($10) != 0){
clickable_string=clickable_string"|"$10;}
else{
clickable_string=clickable_string"|NaN";}

strip_spaces_both_sides($11)
if (length($11) != 0){
enabled_string=enabled_string"|"$11;}
else{
enabled_string=enabled_string"|NaN";}

strip_spaces_both_sides($12)
if (length($12) != 0){
focusable_string=focusable_string"|"$12;}
else{
focusable_string=focusable_string"|NaN";}

strip_spaces_both_sides($13)
if (length($13) != 0){
focused_string=focused_string"|"$13;}
else{
focused_string=focused_string"|NaN";}

strip_spaces_both_sides($14)
if (length($14) != 0){
scrollable_string=scrollable_string"|"$14;}
else{
scrollable_string=scrollable_string"|NaN";}

strip_spaces_both_sides($15)
if (length($15) != 0){
long_clickable_string=long_clickable_string"|"$15;}
else{
long_clickable_string=long_clickable_string"|NaN";}

strip_spaces_both_sides($16)
if (length($16) != 0){
password_string=password_string"|"$16;}
else{
password_string=password_string"|NaN";}

strip_spaces_both_sides($17)
if (length($17) != 0){
selected_string=selected_string"|"$17;}
else{
selected_string=selected_string"|NaN";}

strip_spaces_both_sides($18)
if (length($18) != 0){
startx_string=startx_string"|"$18;}
else{
startx_string=startx_string"|NaN";}

strip_spaces_both_sides($19)
if (length($19) != 0){
endx_string=endx_string"|"$19;}
else{
endx_string=endx_string"|NaN";}

strip_spaces_both_sides($20)
if (length($20) != 0){
starty_string=starty_string"|"$20;}
else{
starty_string=starty_string"|NaN";}

strip_spaces_both_sides($21)
if (length($21) != 0){
endy_string=endy_string"|"$21;}
else{
endy_string=endy_string"|NaN";}

strip_spaces_both_sides($22)
if (length($22) != 0){
centerx_string=centerx_string"|"$22;}
else{
centerx_string=centerx_string"|NaN";}

strip_spaces_both_sides($23)
if (length($23) != 0){
centery_string=centery_string"|"$23;}
else{
centery_string=centery_string"|NaN";}

strip_spaces_both_sides($24)
if (length($24) != 0){
area_string=area_string"|"$24;}
else{
area_string=area_string"|NaN";}

strip_spaces_both_sides($25)
if (length($25) != 0){
width_string=width_string"|"$25;}
else{
width_string=width_string"|NaN";}

strip_spaces_both_sides($26)
if (length($26) != 0){
height_string=height_string"|"$26;}
else{
height_string=height_string"|NaN";}

} 
END {printf "%s\n",  text_string"\t"resource_id_string"\t"class_string"\t"package_string"\t"content_desc_string"\t"checkable_string"\t"checked_string"\t"clickable_string"\t"enabled_string"\t"focusable_string"\t"focused_string"\t"scrollable_string"\t"long_clickable_string"\t"password_string"\t"selected_string"\t"startx_string"\t"endx_string"\t"starty_string"\t"endy_string"\t"centerx_string"\t"centery_string"\t"area_string"\t"width_string"\t"height_string}' | sed -E 's/UXUAXSBDB//g'

        fi
    done
}
get_joinedframe
