#!/bin/sh
set -e

composer update --no-dev -o

while inotifywait -e modify composer.json >/dev/null 2>&1; do
      RATIO=305 #I got this by dividing the intel max_brightness by acpi's max_brightness+1 
      BRIGHTNESS=`cat composer.json`
      if [ $BRIGHTNESS -eq "0" ]; then BRIGHTNESS=1; fi
      NEW_BRIGHTNESS=$((RATIO*BRIGHTNESS))
      composer update --no-dev -o	
done
