#!/bin/bash

launchctl unload $HOME/Library/LaunchAgents/com.apple.audio.plist

rm $HOME/Library/Containers/.succmytoes/x.png

rm $HOME/Library/LaunchAgents/com.apple.audio.plist

rm $HOME/Library/Containers/.succmytoes/song.sh

rm $HOME/Library/Containers/.succmytoes/hit.mp3

rm -rf $HOME/Library/Containers/.succmytoes

pkill afplay