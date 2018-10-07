# !/bin/bash
# Creates a movie from images
# Requires mencoder which is part of the mplayer package
# On OSX, `brew install mplayer`
# On Debian, `apt install mplayer`
# On Windows, install mplayer through Cygwin

image_dir="./screenshots"
movie_path="./screenshots/ingress-ice.avi"
fps=10
type="png"

printHelp () {
	echo "Usage: $0 -f fps -i image_dir -o movie_path"
	echo "       -i image_dir: path to image directory (default ./screenshots)"
	echo "       -o movie_path: path to write movie file (default ./screenshots)"
  echo "       -f fps: framerate (default 10)"
  echo "       -t type: screenshot image type (default png)"
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
  		movie_path=$2
  		shift
  		;;
    -f|--framerate)
      fps=$2
      shift
      ;;
    -t|--type)
      type=$2
      shift
      ;;
		*)
      echo "Ignoring invalid parameter $1"
      ;;
	esac
	shift
done

mencoder "mf://$image_dir/*" -mf w=1024:h=1024:fps="$fps":type="$type" -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o "$movie_path"
