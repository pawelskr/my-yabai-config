#!/usr/bin/env bash

DIR=$1

if ! yabai -m window --warp $DIR; then
	curWindowId="$(yabai -m query --windows --window | jq -re ".id")"

	if [ "$DIR" == "west" ]; then
		DISP="prev"
		PLACE="last"
	elif [ "$DIR" == "east" ]; then
		DISP="next"
		PLACE="first"
	fi

	yabai -m window --display $DISP
	yabai -m window --focus "$curWindowId"
	yabai -m window --warp $PLACE
fi
