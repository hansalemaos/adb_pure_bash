# Pure bash library to automate ADB

## Fragment dump as CSV (Tab-separated values)

```bash
sh /sdcard/activityparser/awkparser.sh
```
## Uiautomator dump as CSV (Tab-separated values)
```bash
sh /sdcard/uidumpparser/u.sh
```

## localize elements

```bash
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

```bash
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

```bash
# This command executes the AWK script, specifying the coordinates x0=1, y0=1 as the start coordinates, and x1=100, y1=100 as the end coordinates.
awk -f /sdcard/rgbtools/awkrgbregion.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100

# This example is similar to the first one but additionally specifies the screen width (-w 1600) - which saves some time. It captures a smaller region of the screen dump data defined by the coordinates (x0=1, y0=1, x1=10, y1=10) and extracts RGB values from it, considering a screen width of 1600 pixels.
awk -f /sdcard/rgbtools/awkrgbregion.awk -v x0=1 -v y0=1 -v x1=10 -v y1=10 -w 1600

```

## get RGB mean of a region
```bash

awk -f /sdcard/rgbtools/awkrgbmean.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100
# This command executes the awkrgbmean.awk script.
# It sets the coordinates (x0, y0, x1, y1) for the region of interest as 1, 1, 100, 100 respectively.
# The RGB values for this region are calculated using the awkrgbregion.awk script (assumed to be in the same directory as awkrgbmean.awk), and their mean is computed.
# The mean RGB values are printed to the standard output.

awk -f /sdcard/rgbtools/awkrgbmean.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100 -v w=1600
# This command is similar to Example 1, but it additionally sets the screen width w as 1600 (faster).
```