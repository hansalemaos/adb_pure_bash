function getRGBValueAtCoords(x_coord, y_coord, screen_width) {
    color_depth_bytes = 4
    offset_bytes = ((y_coord * screen_width + x_coord) * color_depth_bytes)
    offset_bytes -= color_depth_bytes
    offset_bytes += 16
    system("hexdump -n 4 -s " offset_bytes " -e '\"%07.8_Ad\\n\"' -e'4/1 \"%d "" \"' /sdcard/dumpdata.tmp > /sdcard/rgbdata.tmp")
    getline rgbdata < "/sdcard/rgbdata.tmp"
    close("/sdcard/rgbdata.tmp")
    split(rgbdata, rgbarray, " ")
    r = rgbarray[1]
    g = rgbarray[2]
    b = rgbarray[3]
    print x_coord "," y_coord "," r "," g "," b;
}

BEGIN {
    if (! w){
        w = 0
        screen_h = 0
        system("wm size | grep -oE '[0-9]+x[0-9]+$' > /sdcard/screen_size.tmp")
        getline screen_size < "/sdcard/screen_size.tmp"
        close("/sdcard/screen_size.tmp")
        split(screen_size, screen_array, "x")
        screen_h = screen_array[1];
        w = screen_array[2];
        system("rm -f /sdcard/screen_size.tmp")

    }
    system("screencap /sdcard/dumpdata.tmp")
    if (! sep) {
        sep="#";
    }
    split(c, ARGVPARSED, sep);
    for (j in ARGVPARSED) {
            split(ARGVPARSED[j], xandy, ",");
            x_coordinate=int(xandy[1]);
            y_coordinate=int(xandy[2]);
            getRGBValueAtCoords(x_coordinate, y_coordinate, w);
        }
    system("rm -f /sdcard/dumpdata.tmp")
    system("rm -f /sdcard/rgbdata.tmp")
}
# Examples 
# awk -f /sdcard/awkrgb.awk -v c="1300,1#111,111#1000,140" -v w=1600
# awk -f /sdcard/awkrgb.awk -v c="1300,1#111,111#1000,140"
# awk -f /sdcard/awkrgb.awk -v c="1300,1!111,111!1000,140" -v sep="!"