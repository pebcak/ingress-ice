#!/bin/bash

config_file=".ingress-ice.conf"
screenshot_folder="screenshots"
if [ ! -f "$config_file" ]; then
  echo "The configuration file $config_file cannot be found. Did you make a volume for it?" >&2
  echo "$ docker run -v /path/to/.ingress-ice.conf:/srv/ingress-ice/.ingress-ice.conf -v /path/to/screenshots/:/srv/ingress-ice/screenshots ingress-ice"
  exit 1
fi

phantomjs "ice/ice.js" "$config_file"
