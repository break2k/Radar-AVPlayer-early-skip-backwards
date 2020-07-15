# Radar-AVPlayer-early-skip-backwards
Project created to report a bug on making a left-select gesture on the siri remote to jump back 10 seconds in a live stream but then going to the beginning of the stream.

# Description
When an AVPlayer returns the status `.readyToPlay`, a user should be able to make a click on the left side of the siri remote to jump back 10 seconds. Unfortunately it will jump to the beginning of the stream.

## Background
Our live stream have the possiblity to scrub back 3600 seconds (1 hour). So, the live position when tuned into the stream is the `AVPlayerItem` currentTime of `3600`. 
When we print the `currentTime()`, we can see that it it is `0` as soon as we reproduce this bug.

# Expected 
Whenever a user clicks on left side of the siri remote (left-select), the AVPlayer should seek 10 seconds back. Except it in the pause state where left and right click gestures do nothing. 

# Steps

- Start the app
- Instantly make click on the left side of the siri remote.

# Environment

- Xcode Version 11.5 (11E608c)
- Apple TV 4K tvOS 13.4 (17L256)
