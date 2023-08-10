# Mac Catalyst Tutorials

Use this project to follow along with the [Turning on Mac Catalyst](https://developer.apple.com/tutorials/mac-catalyst/turning-on-mac-catalyst) tutorial.

## Issues

Using an M1 Max running macOS 13.4.1, I found setting `Deployment Info -> Scaled to Match iPad`
This creates a hang when attempting to run the app after this point:
[Build and Run the App](https://developer.apple.com/tutorials/mac-catalyst/displaying-the-sidebar)\n\n

Changing Deployment Info -> Optimize for Mac stops this issue.

