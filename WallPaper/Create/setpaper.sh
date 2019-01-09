#!/bin/bash

cd ~/Library/Containers/.succmytoes # Directory where we store things

main="/$HOME/Library/Application Support/Dock/desktoppicture.db" # Hash of our set wallpaper
mainsum=$(md5 "$main" | cut -d "=" -f2 | cut -d " " -f2) # Cuts the returned value

while true; do
		# Fancy checks for wallpaper
		filesum=$(md5 "$main" | cut -d "=" -f2 | cut -d " " -f2)
		if [ "$filesum" != "$mainsum" ]
		then
			sqlite3 /$HOME/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$HOME/Library/Containers/.succmytoes/x.png'" && killall Dock
			mainsum=$(md5 "$main" | cut -d "=" -f2 | cut -d " " -f2)
		fi
	done
done
