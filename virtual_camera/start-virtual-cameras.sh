#!/bin/bash

PID_FILE=.cameras.pid

if [ -f "$PID_FILE" ]; then
	while read PID; do
		echo "Killing ffmpeg with pid $PID"
		kill $PID
	done <$PID_FILE
	rm $PID_FILE
fi;

if [ "$1" == "stop" ]; then
	echo "Stopped"
	exit 0
fi;

for i in $(seq 1 3); do
	ffmpeg -re -f lavfi -i testsrc=s=1280x720 -f v4l2 "/dev/video$i" &>/dev/null &
	echo $! >> $PID_FILE
done;
echo "Started"
