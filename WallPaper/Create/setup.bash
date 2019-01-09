#!/bin/bash

mkdir $HOME/Library/Containers/

mkdir $HOME/Library/Containers/.succmytoes

curl -O http://i.imgur.com/eoxwQ5o.jpg # Replace this link with direct link to desired wallpaper

mv eoxwQ5o.jpg $HOME/Library/Containers/.succmytoes/x.png # Replace "eoxwQ5o.jpg" with the filename of the image from your direct link

sqlite3 /$HOME/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$HOME/Library/Containers/.succmytoes/x.png'" && killall Dock

cp setpaper.sh $HOME/Library/Containers/.succmytoes

chmod +x $HOME/Library/Containers/.succmytoes/setpaper.sh

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

osascript << EOF
tell application "System Events" 
display alert "This is a wallpaper prank! Send it to your friends!" buttons {"Sounds good."}
end tell
EOF
