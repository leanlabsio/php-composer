#!/bin/sh
set -e

composer update

while inotifywait -e modify composer.json >/dev/null 2>&1; do
      composer update	
done
