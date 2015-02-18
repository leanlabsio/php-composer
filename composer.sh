#!/bin/sh
set -e

composer update --no-dev -o

while inotifywait -e modify composer.json >/dev/null 2>&1; do
      composer update --no-dev -o	
done
