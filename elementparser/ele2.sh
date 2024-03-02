#!/usr/bin/env sh
_sdcard_goodelements_txt=$(mktemp)
dumppath=/sdcard/window_dump.xml
rm -f "$dumppath" >/dev/null 2>&1
uiautomator dump >/dev/null 2>&1
sed -i 's/><node/\n/g' "$dumppath"
fil=$(grep -E 'index="[0-9]+"' "$dumppath")
_sdcard_NAF_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "NAF=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_index_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "index=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_text_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "text=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_resource_id_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "resource-id=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_class_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "class=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_package_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "package=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_content_desc_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "content-desc=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_checkable_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "checkable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_checked_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "checked=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_clickable_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "clickable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_enabled_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "enabled=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_focusable_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "focusable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_focused_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "focused=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_scrollable_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "scrollable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_long_clickable_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "long-clickable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_password_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "password=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_selected_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "selected=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }')
_sdcard_bounds_txt=$(echo -e -n "$fil" | awk 'BEGIN { FS = "bounds=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' | sed -n -E 's/[^0-9]*\[([0-9]+),([0-9]+)\]\[([0-9]+),([0-9]+)\][^0-9]*/\1 \2 \3 \4/p' || echo "0 0 0 0")
#echo "$lxa2y" > "$_sdcard_bounds_txt"
_sdcard_width_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{sum = $3 - $1; print sum}')
_sdcard_height_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{sum = $4 - $2; print sum}')
_sdcard_area_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{sum = ($3 - $1) * ($4 - $2); print sum}')
_sdcard_centerx_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{sum = int(($3 - $1) / 2 + $1); print sum}')
_sdcard_centery_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{sum = int(($4 - $2) / 2 + $2); print sum}')
_sdcard_startx_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{print $1}')
_sdcard_endx_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{print $3}')
_sdcard_starty_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{print $2}')
_sdcard_endy_txt=$(echo -e -n "$_sdcard_bounds_txt" | awk '{print $4}')
loopvar=$(echo -e -n "$_sdcard_index_txt" | wc -l)
i=0
printf "%s\t" "index" "text" "resource-id" "class" "package" "content-desc" "checkable" "checked" "clickable" "enabled" "focusable" "focused" "scrollable" "long-clickable" "password" "selected" "startx" "endx" "starty" "endy" "centerx" "centery" "area" "width"
echo "height"
while [ "$i" -lt "$loopvar" ]; do
    i=$((i + 1))
    #v_sdcard_NAF_txt=$(echo -e -n "$_sdcard_NAF_txt" | sed -n "$i"p)
    printf "%s\t" "$(printf "%s" "$_sdcard_index_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_text_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_resource_id_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_class_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_package_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_content_desc_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_checkable_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_checked_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_clickable_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_enabled_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_focusable_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_focused_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_scrollable_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_long_clickable_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_password_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_selected_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_startx_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_endx_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_starty_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_endy_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_centerx_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_centery_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_area_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_width_txt" | sed -n "$i"p)"
    printf "%s\t" "$(printf "%s" "$_sdcard_height_txt" | sed -n "$i"p)"
    echo 
    #echo -e \t"$v_sdcard_index_txt" \t"$v_sdcard_text_txt" \t"$v_sdcard_resource_id_txt" \t"$v_sdcard_class_txt" \t"$v_sdcard_package_txt" \t"$v_sdcard_content_desc_txt" \t"$v_sdcard_checkable_txt" \t"$v_sdcard_checked_txt" \t"$v_sdcard_clickable_txt" \t"$v_sdcard_enabled_txt" \t"$v_sdcard_focusable_txt" \t"$v_sdcard_focused_txt" \t"$v_sdcard_scrollable_txt" \t"$v_sdcard_long_clickable_txt" \t"$v_sdcard_password_txt" \t"$v_sdcard_selected_txt" \t"$v_sdcard_startx_txt" \t"$v_sdcard_endx_txt" \t"$v_sdcard_starty_txt" \t"$v_sdcard_endy_txt" \t"$v_sdcard_centerx_txt" \t"$v_sdcard_centery_txt" \t"$v_sdcard_area_txt" \t"$v_sdcard_width_txt" \t"$v_sdcard_height_txt"
    #printf "%s\t" "$v_sdcard_index_txt" "$v_sdcard_text_txt" "$v_sdcard_resource_id_txt" "$v_sdcard_class_txt" "$v_sdcard_package_txt" "$v_sdcard_content_desc_txt" "$v_sdcard_checkable_txt" "$v_sdcard_checked_txt" "$v_sdcard_clickable_txt" "$v_sdcard_enabled_txt" "$v_sdcard_focusable_txt" "$v_sdcard_focused_txt" "$v_sdcard_scrollable_txt" "$v_sdcard_long_clickable_txt" "$v_sdcard_password_txt" "$v_sdcard_selected_txt" "$v_sdcard_startx_txt" "$v_sdcard_endx_txt" "$v_sdcard_starty_txt" "$v_sdcard_endy_txt" "$v_sdcard_centerx_txt" "$v_sdcard_centery_txt" "$v_sdcard_area_txt" "$v_sdcard_width_txt" "$v_sdcard_height_txt"
done
# | awk -v va=i 'BEGIN{FS="\t"}(NR==va){print $0}'
