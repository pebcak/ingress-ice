[ingress-ice](http://ingress.netlify.com/)
===========
Automatic screenshooter for ingress intel map.
![](https://cloud.githubusercontent.com/assets/2771136/7915684/cfaba8c4-0887-11e5-86b9-5b4fe05ababc.png)

Features:
=========
 - Captures screenshots of ingress intel map every *n* seconds
 - Set your location
 - Authentication using login and password or [cookies](docs/Cookies-Authentication.md) available
 - Supports 2-step authentication
 - Doesn't require X server to be run
 - Set portal levels to display
 - Use IITC (optionally)
 - Timestamp on screenshots (optionally)
 - Fully cross-platform: supports Windows, GNU/Linux and Mac OS X!
 - Hide some features like fields or links from the map (IITC only)
 - It's portable — you can run ice from a flash drive or a DropBox folder
 - Can be run via [Docker](docs/Docker.md) ([Docker Hub](https://hub.docker.com/r/3ch01c/ingress-ice/))

Download
========
### Stable
See [releases](releases) to download the latest stable version. On linux, you may need to install these [dependencies](docs/Dependencies-(Linux).md).
### Development
> *WARNING!* the development version may be unstable.

You can download the whole ingress-ice using the [![Download ZIP](https://cloud.githubusercontent.com/assets/2771136/12703381/36d9adb4-c85b-11e5-81b1-ec0dbef9f679.png)](archive/master.zip) button on the top or clone this repo via git from the link on top. You will need to manually download PhantomJS binary for your platform and put it into `phantomjs.exe` at the root of repo if you are using windows or `phantomjs` otherwise.

PhantomJS binaries' downloads are located [here](http://phantomjs.org/download.html).

To build archives for every operating system, launch `./build.sh`. It will automatically download PhantomJS executables and pack them with Ingress ICE.

Usage
=====
> *WARNING!* ingress-ice may be considered against Ingress ToS (although it hasn't happened before). Use it at your own risk!

### Windows
 1. Unpack the archieve wherever you want
 2. Double-Click `ingress-ice.cmd` and follow the instructions
 3. It will save captured screenshots with into `ice-2014-07-13--09-13-37.png`, `ice-2014-07-13--09-14-07.png`...
 4. You can copy `ice/ingress-ice.conf.sample` to `ingress-ice.conf` in the ice root and enter your settings there, so you can have different configurations for every `ingress-ice`

If you want to reconfigure the script, just double click `reconfigure.cmd`. If you want to use cookies instead of login and password, see [cookies authentication](docs/Cookies-Authentication.md).

### Linux/Mac OS X
 1. Unpack the archive wherever you want
 2. Run `chmod +x ingress-ice.sh&&./ingress-ice.sh` in console and follow the instructions
 3. It will save captured screenshots with into `ice-2014-07-13--09-13-37.png`, `ice-2014-07-13--09-14-07.png`...
 5. You can run it from any folder where you want to save screenshots.

If you want to reconfigure the script, run `./ingress-ice.sh -r`. If you want to use cookies instead of login and password, see [cookies authentication](docs/Cookies-Authentication.md). In case Ingress ICE crashes sometimes, run it with option `-s`: it will run ICE in an endless loop.

### Docker
Install Docker and `docker-compose`. Then, use the `docker-compose.yml` provided:
```
docker-compose up --build
```

#### Creating videos
To create a video from your screenshots, you can use *MPlayer* [(Windows download)](http://oss.netfarm.it/mplayer-win32.php) (install from your repo if on linux). It includes a `mencoder` command. The following will produce an `.avi` video:
(Detailed instruction for windows [here](docs/Creating-videos-(Windows).md)
```
mencoder mf://*.png -mf w=1366:h=768:fps=4:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o ingress-ice.avi
```

Change 1366 and 768 to your width and height, fps=4 to your FPS (more FPS - faster video, but shorter)

#### Troubleshooting
If you have problems logging in, that may be a CAPTCHA (see [#106](issues/106#issuecomment-282949206)). Try visiting https://accounts.google.com/displayunlockcaptcha and following the instructions.

If you receive the error `Something went wrong. Please, sign in to Google via your browser and restart ICE. Don't worry, your Ingress account will not be affected.`, check your intel link uses `www.ingress.com` and not just `ingress.com`.

If that doesn't help or you have a different problem, feel free to [open an issue](issues/new).
