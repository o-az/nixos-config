#!/usr/bin/env bash

set -euox pipefail

# disable spotlight (if you use raycast/alfred/etc)
sudo mdutil -a -i off
sudo mdutil -d /Volumes/"$(diskutil info / | grep "Volume Name" | cut -d ' ' -f 5)"

# system integrity protection (SIP) https://ss64.com/mac/csrutil.html

sudo csrutil disable

# https://github.com/yannbertrand/macos-defaults

# show all extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder

# show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder

# path bar
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder

# default view style (column)
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv" && killall Finder

# title bar icon
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true" && killall Finder

# adjust toolbar title rollover delay
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0" && killall Finder

# Flash clock time separators
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "true" && killall SystemUIServer

# show build duration
defaults write com.apple.dt.Xcode "ShowBuildOperationDuration" -bool "true" && killall Xcode
