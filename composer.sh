#!/bin/sh
set -e

composer update --ignore-platform-reqs

while inotifywait -e modify composer.json >/dev/null 2>&1; do
      composer update --ignore-platform-reqs
done
