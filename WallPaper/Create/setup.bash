#!/bin/bash

# Make some directories
mkdir $HOME/Library/Containers/
mkdir $HOME/Library/Containers/.succmytoes

# Download image and move it into the hidden directory
curl -O https://i.imgur.com/eoxwQ5o.jpg # Replace this link with direct link to desired wallpaper
mv eoxwQ5o.jpg $HOME/Library/Containers/.succmytoes/x.png # Replace "eoxwQ5o.jpg" with the filename of the image from your direct link

# Set desktop picture
sqlite3 /$HOME/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$HOME/Library/Containers/.succmytoes/x.png'" && killall Dock

# Copy script to set the wallpaper into the hidden directory
cp setpaper.sh $HOME/Library/Containers/.succmytoes

# Make the wallpaper script executable
chmod +x $HOME/Library/Containers/.succmytoes/setpaper.sh

#Create directory and LaunchAgents
mkdir $HOME/Library/LaunchAgents

#Write the .plist to LaunchAgents
echo '
<plist version="1.0">
    <dict>
    <key>Label</key>
        <string>com.apple.desktop</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/sh</string>
        <string>'$HOME'/Library/Containers/.succmytoes/setpaper.sh</string>
    </array>
    <key>RunAtLoad</key>
        <true/>
    <key>AbandonProcessGroup</key>
        <true/>
    </dict>
</plist>
' > $HOME/Library/LaunchAgents/com.apple.desktop.plist

#Load the LaunchAgent
launchctl load $HOME/Library/LaunchAgents/com.apple.desktop.plist

# Alert the user to the wallpaper change
osascript << EOF
tell application "System Events" 
display alert "This is a wallpaper prank! Send it to your friends!" buttons {"Sounds good."}
end tell
EOF
