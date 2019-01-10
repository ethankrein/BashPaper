# BashPaper
A brief collection of scripts designed to be executed in some manner on a computer running MacOS so as to cause great annoyance. The scripts are commented clearly to make understanding of the underlying code easy. For that reason, I also offer a description for every file in this README.

## WallPaper
This set of scripts downloads a wallpaper from the link placed in "setup.bash", sets it as the current wallpaper, and installs a LaunchAgent to constantly set the wallpaper. This directory includes the neccesary files to create the intitial application and remove it.

**The "Create" directory contains the following:**

### setup.bash
* Creates a hidden directory
* Downloads specified image file and moves it into the hidden directory. (Current image is [The entire Bee Movie script except it's a wallpaper](https://i.imgur.com/eoxwQ5o.jpg) by  [Reddit user /u/bionicjoey](https://www.reddit.com/user/bionicjoey))
* Sets the picture to the desktop background
* Copies the "setpaper.sh" script into the hidden directory
* Writes the LaunchAgent that starts "setpaper.sh" on login

### setpaper.sh
* Sets the hidden directory to our current working directory
* Hashes the wallpaper we set
* Loops a check of the current wallpapers hash. If it doesn't match our set wallpaper, we re-set the wallpaper and hash.

### sampleicon.icns
* Cutout of the Bee Movie wallpaper currently referenced in the script.
* Sample icon intended as a placeholder for creation of application using [Sveinbjorn Thordarson's Platypus](https://github.com/sveinbjornt/Platypus).
* Converted from .png to .icns using [offdrive](https://offdrive.com/convert/png/icns).

**The "Remove" directory undoes the above.**

## SongPaper
This set of scripts downloads a wallpaper from the link placed in "setup.bash", sets it as the current wallpaper, and installs a LaunchAgent to play music every X amount of seconds, as well as keeping the wallpaper set while the music is playing. This directory includes the neccesary files to create the intitial application and remove it.

**The "Create" directory contains the following:**

### setup.bash
* Creates a hidden directory
* Downloads specified image file and moves it into the hidden directory. (Current image is [This very nice wallpaper with Rick Astley's face](https://img02.deviantart.net/3eba/i/2009/227/6/6/never_gonna_give_you_up_by_lightfantastic.jpg) by  [I cannot for the life of me find the creator of this image.]())
* Sets the picture to the desktop background
* Copies "hit.mp3" (the chosen song) into the hidden directory. Current song is Rick Astley's "Never Gonna Give You Up"
* Copies the "song.sh" script into the hidden directory
* Writes the LaunchAgent that starts "song.sh" on login

### song.sh
* Sets the hidden directory to our current working directory
* Hashes the wallpaper we set
* The runtime of our song is set in seconds. (212 for "Never Gonna Give You Up")
* A loop runs every X amount of time calculated by adding a random time to a minimum time. (3 hours random time and 1 hour minimum time are our current settings. This means the script will activate at least one hour apart each time, but can go up to 4 hours between plays.)
* Once the time has been met, the song is started using afplay
* Loops a check of the current wallpapers hash while the song plays. If it doesn't match our set wallpaper, we re-set the wallpaper and hash.
* The loop includes setting the volume using apple script so they cannot mute their speakers.

### sampleicon.icns
* Cutout of the Rick Astley wallpaper currently referenced in the script.
* Sample icon intended as a placeholder for creation of application using [Sveinbjorn Thordarson's Platypus](https://github.com/sveinbjornt/Platypus).
* Converted from .png to .icns using [offdrive](https://offdrive.com/convert/png/icns).

**The "Remove" directory undoes the above.**



# TODO
* Contain all operations within one application. (Image added beforehand instead of downloaded.)
* Possibly change SongPaper to constantly set the wallpaper even if music is not playing
* Tips such as word doc icns
* Settings for [Sveinbjorn Thordarson's Platypus](https://github.com/sveinbjornt/Platypus).
* Images of the scripts actions
