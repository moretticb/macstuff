#!/bin/sh

datadir_dir="$HOME/Documents/chrome_instances"
datadir="$(ls -a "$datadir_dir" | choose -m -n 4)"

[ "$?" != "0" ] && exit 0

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "--user-data-dir=$datadir_dir/$datadir" &

## TODO: change "Person 1" name from the created user data dir. Identify by $datadir variable

