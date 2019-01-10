#!/bin/bash

cd ~/Library/Containers/.succmytoes # Directory where we store things

main="/$HOME/Library/Application Support/Dock/desktoppicture.db" # Hash of our set wallpaper
mainsum=$(md5 "$main" | cut -d "=" -f2 | cut -d " " -f2) # Cuts the returned value

runtime=212 # Set song duration in seconds

while true; do # Loop the music
sleep $(( ( RANDOM % 10800 ) + 3600 )) # Time between plays in seconds. The non-random time (currently 3600 seconds/1 hour) is a minimum amount of time between plays, added to a random number (currently 10800/3 hours) to be less predictable.

	afplay hit.mp3 & # Starts our song in the background
	
	SECONDS=0 # Reset seconds timer for use with loop

# This is the loop to set wallpaper and volume
	while ((SECONDS < runtime)); do

		# Fancy checks for wallpaper
		filesum=$(md5 "$main" | cut -d "=" -f2 | cut -d " " -f2)
		if [ "$filesum" != "$mainsum" ]
		then
			sqlite3 /$HOME/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$HOME/Library/Containers/.succmytoes/x.png'" && killall Dock
			mainsum=$(md5 "$main" | cut -d "=" -f2 | cut -d " " -f2)
		fi


	       	osascript -e 'set volume 3'
	done
done
