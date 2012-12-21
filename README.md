# MHOverlayWindow

A simple example of how to make a `UIWindow` that appears on top of everything else, including the status bar.

To add controls to this window, create a new `UIViewController` and set it as the window's `rootViewController`. That will automatically take care of rotation events, and so on.
