# !/bin/bash
# Finds the image in $image_dir with the most $color and copy it to $output_path
# Requires convert which is part of the imagemagick package
# On OSX, `brew install imagemagick`
# On Debian, `apt install imagemagick`
# On Windows, install imagemagick through Cygwin

res="#00c2ff" # resistance blue

image_dir="./screenshots"
output_path="./screenshots/bluest.png"
color=$res

printHelp () {
	echo "Usage: $0 -c color -i image_dir -o output_path"
	echo "       -i image_dir: path to image directory (default ./screenshots)"
	echo "       -o output_path: path to write image (default ./screenshots/bluest.png)"
  echo "       -c color: color (default #00c2ff)"
	exit 1
}

while [[ $# -gt 0 ]]; do
	key="$1"
	case $key in
		-h|--help)
  		printHelp
  		;;
		-i|--input)
  		image_dir=$2
  		shift
  		;;
    -o|--output)
  		output_path=$2
  		shift
  		;;
    -c|--color)
      color=$2
      shift
      ;;
		*)
      echo "Ignoring invalid parameter $1"
      ;;
	esac
	shift
done

bluest=$(find -L $image_dir -type f -print0 | xargs -0 -I screenshot convert screenshot -fuzz 5% -transparent "$color" +fuzz -fill black +opaque none -channel rgba -fill white -opaque none -format "%[fx:100*mean] %f\n" info: | sort -n | tail -1 | awk '{ print $2 }')
cp "$image_dir/$bluest" "$output_path"
#convert -resize 50% -modulate 30 "$image_dir/$bluest" "$image_dir/intel.png"
#return $bluest
