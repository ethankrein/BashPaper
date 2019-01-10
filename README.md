# BashPaper
A brief collection of scripts designed to be executed in some manner on the computer of an acquaintance so as to cause great annoyance. The scripts are commented clearly to make understanding of the underlying code easy. For that reason, I also offer a description for every file in this README.

## WallPaper
This set of scripts downloads a wallpaper from the link placed in "setup.bash", sets it as the current wallpaper, and installs a LaunchAgent to constantly set the wallpaper. This directory includes the neccesary file to create the intitial application and remove it.

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




TODO: Contain all operations within one application.


