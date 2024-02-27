function getPartOfRegion(start_x, start_y, end_x, end_y, screen_width) {
    color_depth_bytes = 4
    screenwidthtimescolordepth = screen_width * color_depth_bytes
    startabs = (start_x * color_depth_bytes) + 16
    dividercoord=end_x-start_x;
    sequencef=int((end_y-start_y)*dividercoord)
    endabs = (sequencef * color_depth_bytes) + 16
    readqty = endabs - startabs
    abscoord=1;
    offset_start = 16
    formatx ="'4/1 \"%d,\" \"\\n\"'"
    comi="hexdump -n " readqty " -s " offset_start " -v -e " formatx " " dumpdata " | awk 'BEGIN{FS=\",\"}(NR<"sequencef"){print NR%"dividercoord"\",\"int(NR/"dividercoord")\",\"$1\",\"$2\",\"$3}' > "area_hexdumptmp
    system(comi);
}

BEGIN {
    mkcmd = "mktemp"
    if (! o){
        area_hexdumptmp="/sdcard/screencaprgbdata.txt";
    }
    else{
        area_hexdumptmp=o;
    }
    if (! screendump){
        if ((mkcmd | getline dumpdata) > 0) {
            close(mkcmd);
        }
        system("screencap " dumpdata);
        deltemp=1;
    }
    else{
        dumpdata=screendump;
        deltemp=0;
    }
    if (! w){
            if ((mkcmd | getline screen_sizetmp) > 0) {
                close(mkcmd)
            }
            w = 0
            h = 0
            system("wm size | grep -oE '[0-9]+x[0-9]+$' > "screen_sizetmp)
            getline screen_size < screen_sizetmp
            close(screen_sizetmp)
            split(screen_size, screen_array, "x")
            h = screen_array[1];
            w = int(screen_array[2]);
            system("rm -f "screen_sizetmp)

        }
    getPartOfRegion(0, 0, w, h, w)
    if (deltemp>0){
        system("rm -f "dumpdata);
    }
}
# output to /sdcard/screencaprgbdata.txt
# awk -f /sdcard/rgbinfos.awk

# another output path
# awk -f /sdcard/rgbinfos.awk -v o="/sdcard/screencaprgbdata2.txt"

# another output path (faster when adding screen width/height)
# awk -f /sdcard/rgbinfos.awk -v o="/sdcard/screencaprgbdata2.txt" -v w=1600 -v h=900

# passing captured screendata
# screencap /sdcard/dumpd.tmp
# awk -f /sdcard/rgbinfos.awk -v screendump="/sdcard/dumpd.tmp" -v o="/sdcard/screencaprgbdata2.txt"
# awk -f /sdcard/rgbinfos.awk -v screendump="/sdcard/dumpd.tmp" -v o="/sdcard/screencaprgbdata2.txt" w=1600 h=900