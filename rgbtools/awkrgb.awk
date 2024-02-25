function getRGBValueAtCoords(x_coord, y_coord, screen_width) {
    color_depth_bytes = 4
    offset_bytes = ((y_coord * screen_width + x_coord) * color_depth_bytes)
    offset_bytes -= color_depth_bytes
    offset_bytes += 16
    system("hexdump -n 4 -s " offset_bytes " -e '\"%07.8_Ad\\n\"' -e'4/1 \"%d "" \"' "dumpdata" > "rgbdatatmp)
    getline rgbdata < rgbdatatmp
    close(rgbdatatmp)
    split(rgbdata, rgbarray, " ")
    r = rgbarray[1]
    g = rgbarray[2]
    b = rgbarray[3]
    print x_coord "," y_coord "," r "," g "," b;
}

BEGIN {
    mkcmd = "mktemp"
    if ((mkcmd | getline rgbdatatmp) > 0) {
        close(mkcmd)
    }
    if ((mkcmd | getline dumpdata) > 0) {
        close(mkcmd)
    }
    if (! w){
            if ((mkcmd | getline screen_sizetmp) > 0) {
                close(mkcmd)
            }
            w = 0
            screen_h = 0
            system("wm size | grep -oE '[0-9]+x[0-9]+$' > "screen_sizetmp)
            getline screen_size < screen_sizetmp
            close(screen_sizetmp)
            split(screen_size, screen_array, "x")
            screen_h = screen_array[1];
            w = int(screen_array[2]);
            system("rm -f "screen_sizetmp)

        }
    system("screencap "dumpdata)
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
    system("rm -f "dumpdata)
    system("rm -f "rgbdatatmp)
}
# Examples 
# awk -f /sdcard/awkrgb.awk -v c="1300,1#111,111#1000,140" -v w=1600
# awk -f /sdcard/awkrgb.awk -v c="1300,1#111,111#1000,140"
# awk -f /sdcard/awkrgb.awk -v c="1300,1!111,111!1000,140" -v sep="!"