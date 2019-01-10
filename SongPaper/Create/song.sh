#!/bin/bash

cd ~/Library/Containers/.succmytoes # Directory where we store things

main="/$HOME/Library/Application Support/Dock/desktoppicture.db" # Hash of our set wallpaper
mainsum=$(md5 "$main" | cut -d "=" -f2 | cut -d " " -f2) # Cuts the returned value

runtime=212 # Set song duration in seconds

while true; do # Loop the music
sleep $(( ( RANDOM % 120 ) + 60 )) # Time between plays. Random time within 3 hours, adds minimum 1 hour cooldown
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