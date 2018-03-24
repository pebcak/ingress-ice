# Find the bluest pic of the $DATE

SS_DIR="/screenshots"
BLUEST_DIR="/screenshots/bluest"
DATE=$1 # $(date +%Y-%m-%d -d yesterday)

bluest=$(find $SS_DIR -name "ice-$DATE*" -print0 | xargs -0 -I screenshot convert screenshot -fuzz 5% -transparent "#00c2ff" +fuzz -fill black +opaque none -channel rgba -fill white -opaque none -format "%[fx:100*mean] %f\n" info: | sort -n | tail -1 | awk '{ print $2 }')

cp $SS_DIR/$bluest $BLUEST_DIR
convert -resize 50% -modulate 30 "$SS_DIR/$bluest" "$SS_DIR/intel.png"
return $bluest
