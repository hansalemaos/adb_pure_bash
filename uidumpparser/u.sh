#!/usr/bin/env sh
trim() {
    var="$1"
    var="${var#"${var%%[![:space:]]*}"}"
    var="${var%"${var##*[![:space:]]}"}"
    echo "$var"
}

_sdcard_goodelements_txt=$(mktemp)
_sdcard_NAF_txt=$(mktemp)
_sdcard_index_txt=$(mktemp)
_sdcard_text_txt=$(mktemp)
_sdcard_resource_id_txt=$(mktemp)
_sdcard_class_txt=$(mktemp)
_sdcard_package_txt=$(mktemp)
_sdcard_content_desc_txt=$(mktemp)
_sdcard_checkable_txt=$(mktemp)
_sdcard_checked_txt=$(mktemp)
_sdcard_clickable_txt=$(mktemp)
_sdcard_enabled_txt=$(mktemp)
_sdcard_focusable_txt=$(mktemp)
_sdcard_focused_txt=$(mktemp)
_sdcard_scrollable_txt=$(mktemp)
_sdcard_long_clickable_txt=$(mktemp)
_sdcard_password_txt=$(mktemp)
_sdcard_selected_txt=$(mktemp)
_sdcard_bounds_txt=$(mktemp)
_sdcard_width_txt=$(mktemp)
_sdcard_height_txt=$(mktemp)
_sdcard_area_txt=$(mktemp)
_sdcard_centerx_txt=$(mktemp)
_sdcard_centery_txt=$(mktemp)
_sdcard_startx_txt=$(mktemp)
_sdcard_endx_txt=$(mktemp)
_sdcard_starty_txt=$(mktemp)
_sdcard_endy_txt=$(mktemp)
_sdcard_u_txt=$(mktemp)
uiautomator dump >/dev/null 2>&1
sed -i 's/><node/\n/g' /sdcard/window_dump.xml
cat /sdcard/window_dump.xml | grep -E 'index="[0-9]+"' >"$_sdcard_goodelements_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "NAF=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_NAF_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "index=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_index_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "text=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_text_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "resource-id=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_resource_id_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "class=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_class_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "package=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_package_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "content-desc=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_content_desc_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "checkable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_checkable_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "checked=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_checked_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "clickable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_clickable_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "enabled=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_enabled_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "focusable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_focusable_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "focused=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_focused_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "scrollable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_scrollable_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "long-clickable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_long_clickable_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "password=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_password_txt"
cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "selected=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > "$_sdcard_selected_txt"
lxa2y=$(cat "$_sdcard_goodelements_txt" | awk 'BEGIN { FS = "bounds=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' | sed -n -E 's/[^0-9]*\[([0-9]+),([0-9]+)\]\[([0-9]+),([0-9]+)\][^0-9]*/\1 \2 \3 \4/p' || echo "0 0 0 0")
echo "$lxa2y" > "$_sdcard_bounds_txt"
awk '{sum = $3 - $1; print sum}' "$_sdcard_bounds_txt" >"$_sdcard_width_txt"
awk '{sum = $4 - $2; print sum}' "$_sdcard_bounds_txt" >"$_sdcard_height_txt"
awk '{sum = ($3 - $1) * ($4 - $2); print sum}' "$_sdcard_bounds_txt" >"$_sdcard_area_txt"
awk '{sum = int(($3 - $1) / 2 + $1); print sum}' "$_sdcard_bounds_txt" > "$_sdcard_centerx_txt"
awk '{sum = int(($4 - $2) / 2 + $2); print sum}' "$_sdcard_bounds_txt" > "$_sdcard_centery_txt"
awk '{print $1}' "$_sdcard_bounds_txt" >"$_sdcard_startx_txt"
awk '{print $3}' "$_sdcard_bounds_txt" >"$_sdcard_endx_txt"
awk '{print $2}' "$_sdcard_bounds_txt" >"$_sdcard_starty_txt"
awk '{print $4}' "$_sdcard_bounds_txt" >"$_sdcard_endy_txt"
v1=$(printf "%s\t" "index" "text" "resource-id" "class" "package" "content-desc" "checkable" "checked" "clickable" "enabled" "focusable" "focused" "scrollable" "long-clickable" "password" "selected" "startx" "endx" "starty" "endy" "centerx" "centery" "area" "width" "height" | echo "$(cat)") #| trim  > "$_sdcard_u_txt"
trim "$v1" > "$_sdcard_u_txt"
paste "$_sdcard_index_txt" "$_sdcard_text_txt" "$_sdcard_resource_id_txt" "$_sdcard_class_txt" "$_sdcard_package_txt" "$_sdcard_content_desc_txt" "$_sdcard_checkable_txt" "$_sdcard_checked_txt" "$_sdcard_clickable_txt" "$_sdcard_enabled_txt" "$_sdcard_focusable_txt" "$_sdcard_focused_txt" "$_sdcard_scrollable_txt" "$_sdcard_long_clickable_txt" "$_sdcard_password_txt" "$_sdcard_selected_txt" "$_sdcard_startx_txt" "$_sdcard_endx_txt" "$_sdcard_starty_txt" "$_sdcard_endy_txt" "$_sdcard_centerx_txt" "$_sdcard_centery_txt" "$_sdcard_area_txt" "$_sdcard_width_txt" "$_sdcard_height_txt" >> "$_sdcard_u_txt"
rm -f "$_sdcard_index_txt"
rm -f "$_sdcard_text_txt"
rm -f "$_sdcard_resource_id_txt"
rm -f "$_sdcard_class_txt"
rm -f "$_sdcard_package_txt"
rm -f "$_sdcard_content_desc_txt"
rm -f "$_sdcard_checkable_txt"
rm -f "$_sdcard_checked_txt"
rm -f "$_sdcard_clickable_txt"
rm -f "$_sdcard_enabled_txt"
rm -f "$_sdcard_focusable_txt"
rm -f "$_sdcard_focused_txt"
rm -f "$_sdcard_scrollable_txt"
rm -f "$_sdcard_long_clickable_txt"
rm -f "$_sdcard_password_txt"
rm -f "$_sdcard_selected_txt"
rm -f "$_sdcard_startx_txt"
rm -f "$_sdcard_endx_txt"
rm -f "$_sdcard_starty_txt"
rm -f "$_sdcard_endy_txt"
rm -f "$_sdcard_centerx_txt"
rm -f "$_sdcard_centery_txt"
rm -f "$_sdcard_area_txt"
rm -f "$_sdcard_width_txt"
rm -f "$_sdcard_height_txt"
rm -f "$_sdcard_NAF_txt"
rm -f "$_sdcard_goodelements_txt"
rm -f "$_sdcard_bounds_txt"
rm -f /sdcard/window_dump.xml
cat "$_sdcard_u_txt"