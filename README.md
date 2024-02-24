# Pure bash library to automate ADB

## Fragment dump as CSV (Tab-separated values)

```sh
sh /sdcard/activityparser/awkparser.sh
```
## Uiautomator dump as CSV (Tab-separated values)
```sh
sh /sdcard/uidumpparser/u.sh
```

## localize elements

```sh
sh /sdcard/uidumpparser/u.sh > /sdcard/u.txt
awk -f /sdcard/awkloc/aloc.awk -v query="width>>300|height>>90|class~~view" -v sep="|" -v and=1 ./sdcard/u.txt
# width >> 300: Selects rows where the value in the "width" column is greater than 300.
# height >> 90: Selects rows where the value in the "height" column is greater than 90.
# class ~~ view: Selects rows where the "class" column matches the regular expression "view".

awk -f /sdcard/awkloc/aloc.awk -v query="width>>300|height>>90|class~~view" -v sep="|" -v and=0 ./sdcard/u.txt
# Similar to the previous query, but any condition can match independently for a row to be included in the output.

awk -f /sdcard/awkloc/aloc.awk -v query="width>>300|height>>90|class~~view|enabled==false" -v sep="|" -v and=0 ./sdcard/u.txt
# Similar to the first query, but adds an extra condition:
# enabled == false: Selects rows where the value in the "enabled" column is equal to "false".

awk -f /sdcard/awkloc/aloc.awk -v query="width>>300#height>>90#class~~view#enabled==false#area>=0#starty<=10000" ./sdcard/u.txt
# width > 300, height > 90, class ~ view, enabled == false, area >= 0, starty <= 10000: Selects rows meeting one of these # conditions.
# default separator (#) is used between conditions.

sh /sdcard/activityparser/awkparser.sh > /sdcard/a.txt
awk -f /sdcard/awkloc/aloc.awk -v query="CLASSNAME~~widget|HEIGHT>>90|VISIBILITY==V" -v sep="|" -v and=1 ./sdcard/a.txt
awk -f /sdcard/awkloc/aloc.awk -v query="CLASSNAME~~widget|HEIGHT>>90|VISIBILITY==V" -v sep="|" -v and=0 ./sdcard/a.txt
# CLASSNAME ~~ widget: Selects rows where the "CLASSNAME" column matches the regular expression "widget".
# HEIGHT >> 90: Selects rows where the value in the "HEIGHT" column is greater than 90.
# VISIBILITY == V: Selects rows where the value in the "VISIBILITY" column is equal to "V".
# and=1: all conditions must be met
# and=0: any condition must be met
```

## get RGB values

```sh
awk -f /sdcard/rgbtools/awkrgb.awk -v c="1300,1#111,111#1000,140" -v w=1600

# Provide the -v c parameter to specify the coordinates to extract RGB values from. Coordinates should be in the format x,y, separated by #. Multiple coordinates can be provided, separated by #.

# Optionally, provide the -v w parameter to specify the screen width (saves some time). If not provided, the script will attempt to determine the screen width automatically.

# For example, the following command extracts RGB values for the coordinates 1300,1; 111,111; and 1000,140 from a screen with a width of 1600 pixels:

awk -f /sdcard/rgbtools/awkrgb.awk -v c="1300,1#111,111#1000,140" -v w=1600

# Other examples

# takes a little longer
awk -f /sdcard/rgbtools/awkrgb.awk -v c="1300,1#111,111#1000,140"

# another sep
awk -f /sdcard/rgbtools/awkrgb.awk -v c="1300,1!111,111!1000,140" -v sep="!"

```

## get all RGB values of a region

```sh
# This command executes the AWK script, specifying the coordinates x0=1, y0=1 as the start coordinates, and x1=100, y1=100 as the end coordinates.
awk -f /sdcard/rgbtools/awkrgbregion.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100

# This example is similar to the first one but additionally specifies the screen width (-w 1600) - which saves some time. It captures a smaller region of the screen dump data defined by the coordinates (x0=1, y0=1, x1=10, y1=10) and extracts RGB values from it, considering a screen width of 1600 pixels.
awk -f /sdcard/rgbtools/awkrgbregion.awk -v x0=1 -v y0=1 -v x1=10 -v y1=10 -w 1600

```

## get RGB mean of a region
```sh

awk -f /sdcard/rgbtools/awkrgbmean.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100
# This command executes the awkrgbmean.awk script.
# It sets the coordinates (x0, y0, x1, y1) for the region of interest as 1, 1, 100, 100 respectively.
# The RGB values for this region are calculated using the awkrgbregion.awk script (assumed to be in the same directory as awkrgbmean.awk), and their mean is computed.
# The mean RGB values are printed to the standard output.

awk -f /sdcard/rgbtools/awkrgbmean.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v w=1600
# This command is similar to Example 1, but it additionally sets the screen width w as 1600 (faster).
```

## click on the center coordinates of the first element

```sh
sh /sdcard/uidumpparser/u.sh > /sdcard/u.txt
sh /sdcard/tap1stcoords/tap_first_center_coords.sh /sdcard/u.txt
sh /sdcard/activityparser/awkparser.sh > /sdcard/a.txt
sh /sdcard/tap1stcoords/tap_first_center_coords.sh /sdcard/a.txt
```

## pretty print

```sh
sh /sdcard/activityparser/awkparser.sh > /sdcard/a.txt
awk -f /sdcard/awkprint/awk_pretty_print.awk -v fs="\t" -v m=15 /sdcard/a.txt

sh /sdcard/uidumpparser/u.sh > /sdcard/u.txt
awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/u.txt
```

## search for RGB color in area

```sh
# This command executes the awksearchrgb.awk script.
# It sets the coordinates (x0, y0, x1, y1) for the region of interest as 1, 1, 100, 100, respectively.
# It specifies the separator as #.
# It provides the RGB color values to search for as 4,8,37 and 5,9,38.
# The script will search for these RGB values in the specified region using awkrgbregion.awk and print any matching lines.
awk -f /sdcard/rgbtools/awksearchrgb.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v sep="#" -v rgb="4,8,37#5,9,38"


# This command is similar to Example 1, but it additionally sets the screen width w as 1600 (faster).
# This extra parameter is passed to awkrgbregion.awk to assist in the calculation of RGB values.
awk -f /sdcard/rgbtools/awksearchrgb.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v w=1600 -v rgb="4,8,37#5,9,38"

# prints the first result and exits the script
awk -f /sdcard/rgbtools/awksearchrgb.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v sep="#" -v rgb="4,8,37#5,9,38" -v breakfirst=1

```

## add a new column (like pd.Series.apply)

```sh
sh /sdcard/uidumpparser/u.sh

# This example creates a new column "text2" with the length of each entry in the column "text".

awk -f /sdcard/apply/awkapply.awk -v column="text" -v newcolumn="text2" -v apply="{printf length(\$0)}" /sdcard/u.txt > /sdcard/p.txt

# In this example, the "endy2" column is created. If the value in "endy" is greater than 700, the value in "endy" will be "1" else "0".

awk -f /sdcard/apply/awkapply.awk -v column="endy" -v newcolumn="endy2" -v apply="{printf (\$0 \> 700)}" /sdcard/u.txt > /sdcard/p.txt

# Here, the is_clickable is set to true or false based on whether the original value contains the string "true" or not.

awk -f /sdcard/apply/awkapply.awk -v column="clickable" -v newcolumn="is_clickable" -v apply="{printf (\$0 \~ \"true\")}" /sdcard/u.txt > /sdcard/p.txt

awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt

```

## sortby columns

```sh
sh /sdcard/uidumpparser/u.sh

# This example sorts the data in u.txt first by the centery column and then by the area column.
# Numeric sorting is enabled.
file="/sdcard/u.txt"
sortby="centery;area"
numeric=1
sh /sdcard/sortbycol/sortbycol.sh "$sortby" "$file" "$numeric" >/sdcard/p.txt
awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt

# Here, the data is sorted by the area column first and then by the centery column.
# Numeric sorting is enabled
file="/sdcard/u.txt"
sortby="area;centery"
numeric=1
sh /sdcard/sortbycol/sortbycol.sh "$sortby" "$file" "$numeric" >/sdcard/p.txt
awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt

# This example sorts the data by the text column only.
# Non-numeric sorting is performed, and the output is written to p.txt.
file="/sdcard/u.txt"
sortby="text"
numeric=0
sh /sdcard/sortbycol/sortbycol.sh "$sortby" "$file" "$numeric" >/sdcard/p.txt
awk -f /sdcard/awkprint/awk_pretty_print.awk /sdcard/p.txt
```

## non greedy regex 
```sh
string="oioioibabapooiba"
regularexpression="oi.*ba"
findshortest=0
sh /sdcard/regex/regexnongreedy.sh "$regularexpression" "$findshortest" "$string"
# oioioiba
string="oioioibabapooiba"
regularexpression="oi.*ba"
findshortest=1
sh /sdcard/regex/regexnongreedy.sh "$regularexpression" "$findshortest" "$string"
# oiba
```

## Counting Colors in a Region:

```sh
# This command counts the occurrences of each color in the region defined by (1,1) to (100,100) on the screen
awk -f /sdcard/rgbtools/awkcountcolors.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100

# Here, the screen width (w) is specified as 1600 pixels. (a little faster)
awk -f /sdcard/rgbtools/awkcountcolors.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v w=1600

```

## sendevent tap 

```sh
# fromn the second time on, it is faster when you use the same config
awk -f /sdcard/inevents/sendeventtap.awk -v x=212 -v y=126 -v devi=event4 -v m=32767 -v w=1600 -v h=900

# if you don't know m (takes a little longer)
awk -f /sdcard/inevents/sendeventtap.awk -v x=212 -v y=126 -v devi=event4 -v w=1600 -v h=900

# if you don't know m, w, h (takes a little longer)
awk -f /sdcard/inevents/sendeventtap.awk -v x=214 -v y=126 -v devi=event4
```

## sendevent keyboard

```sh
awk -f /sdcard/sendeventkeys.awk -v event="EV_KEY" -v keycode="KEY_Q" -v devi="/dev/input/event3" -v duration=1
awk -f /sdcard/sendeventkeys.awk -v event="EV_KEY" -v keycode="KEY_A" -v devi="/dev/input/event3" -v duration=1
```

