function stripStringBothSides(var) {
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", var)
    return var
}

function splitStringIntoChunks(string, chunksize, array) {
    len = length(string)
    chunks = int((len + chunksize - 1) / chunksize)
    for (i = 1; i <= chunks; i++) {
        start = (i - 1) * chunksize + 1
        end = start + chunksize - 1
        if (end > len) end = len
        array[i] = substr(string, start, end - start + 1)
    }
}
function lstrip(str) {
    sub(/^0+/, "", str)
    return str
}
function getPartOfRegion(start_x, start_y, end_x, end_y, screen_width) {
    color_depth_bytes = 4
    screenwidthtimescolordepth = screen_width * color_depth_bytes
    startabs = (start_x * color_depth_bytes) + 16
    endabs = (end_x * color_depth_bytes) + 16
    readqty = endabs - startabs
    system("screencap " dumpdata)

    while (start_y < end_y) {
        offset_start = start_y * screenwidthtimescolordepth
        offset_end = offset_start + readqty
        formatx ="'" readqty "/1 \"%03d,\"'"
        comi="hexdump -n " readqty " -s " offset_start " -e " formatx " " dumpdata " > "area_hexdumptmp
        system(comi)
        getline area_hexdump < area_hexdumptmp
        close(area_hexdumptmp)
        splitStringIntoChunks(area_hexdump, 16, chunkarray)
        counter = start_x
        for (i in chunkarray) {
            colorcomplete = stripStringBothSides(chunkarray[i])
            v1 = lstrip(substr(colorcomplete, 1, 3))
            v2 = lstrip(substr(colorcomplete, 5, 3))
            v3 = lstrip(substr(colorcomplete, 9, 3))
            v4 = counter
            v5 = start_y
            print v4"," v5"," v1"," v2"," v3;
            counter++
        }
        delete chunkarray
        start_y++
    }
    system("rm -f " dumpdata)
}

BEGIN {
    mkcmd = "mktemp"
    if ((mkcmd | getline area_hexdumptmp) > 0) {
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
    start_x = int(x0)
    start_y = int(y0)
    end_x = int(x1)
    end_y = int(y1)

    getPartOfRegion(start_x, start_y, end_x, end_y, w)
}
# awk -f /sdcard/awkrgbregion.awk -v x0=1 -v y0=1 -v x1=100 -v y1=100
# awk -f /sdcard/awkrgbregion.awk -v x0=1 -v y0=1 -v x1=10 -v y1=10 -w 1600