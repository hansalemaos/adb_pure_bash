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