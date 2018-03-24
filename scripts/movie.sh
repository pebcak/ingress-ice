# Create a video of $DATE
SS_DIR="/screenshots"
MOVIE_DIR="/screenshots/movies"
DATE=$1 # $(date +%Y-%m-%d -d yesterday)

mencoder "mf://$SS_DIR/ice-$DATE*.png" -mf w=1024:h=1024:fps=10:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o "$MOVIE_DIR/ice-$DATE.avi"
