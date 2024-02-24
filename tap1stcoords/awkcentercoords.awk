BEGIN {
    FS="\t"
    fieldnumberx="[not found]"
    fieldnumbery="[not found]"
    fieldname1x="centerx"
    fieldname2x="CENTER_X"
    fieldname1y="centery"
    fieldname2y="CENTER_Y"
    CENTERX="-1"
    CENTERY="-1"
    printf "export CENTERCLICKX=%s; export CENTERCLICKY=%s\n", "-1", "-1"
}

# eval $(awk -f /sdcard/Pictures/awk_get_center_coordinates.awk /sdcard/u.txt)
# echo $CENTERX
# echo $CENTERY


# First line is the header row. Retrieve the number of the selected fields.
NR <= 1 {
		for (i=1; i<=NF;i++)
		{
			if(fieldname1x==$i)
			{
				fieldnumberx=i;
			}
			else if(fieldname2x==$i) {
				fieldnumberx=i;

			}
			else if(fieldname1y==$i) {
				fieldnumbery=i;

			}
			else if(fieldname2y==$i) {
				fieldnumbery=i;

			}
		}
}

# Process subsequent lines
NR > 1 {
    if (($fieldnumberx ~ /^[0-9]+$/) && ($fieldnumbery ~ /^[0-9]+$/) ){

    printf "export CENTERCLICKX=%s; export CENTERCLICKY=%s\n", $fieldnumberx, $fieldnumbery;
    exit;
}}