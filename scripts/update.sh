SS_DIR="/screenshots"
DATE=$(date +%Y-%m-%d)
# Create a video of the last day
./movie.sh $DATE
# Save only the bluest screenshot of the day
unset -v bluest
bluest=$(./bluest.sh $DATE)
# Sync bluest screenshot of the day
convert -resize 50% -modulate 30 "$SS_DIR/$bluest" "$SS_DIR/intel.png"
