# Radar-AVPlayer-early-skip-backwards
Project created to report a bug on making a left-select gesture on the Siri remote to jump back 10 seconds in a live stream but then going to the beginning of the stream.

![avplayer-left-click](preview/radar-avplayer-left-click.gif)

Example Project:
https://github.com/break2k/Radar-AVPlayer-early-skip-backwards/edit/master/README.md

# Description
When an AVPlayer returns the status `.readyToPlay`, a user should be able to make a click on the left side of the Siri remote to jump back 10 seconds. Unfortunately, it will jump to the beginning of the stream.

## Background
Our live stream has the possibility to scrub back 3600 seconds (1 hour). So, the live position when tuned into the stream is the `AVPlayerItem` currentTime of `3600`. 
When we print the `currentTime()`, we can see that it is `0` as soon as we reproduce this bug.

# Expected 
Whenever a user clicks on the left side of the Siri remote (left-select), the AVPlayer should seek 10 seconds back. Except it in the pause state where the left and right-click gestures do nothing. 

# Steps

- Start the app
- Instantly make click on the left side of the Siri remote.

# Environment

- Xcode Version 11.5 (11E608c)
- Apple TV 4K tvOS 13.4 (17L256)