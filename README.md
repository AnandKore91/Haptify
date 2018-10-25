# Haptify

Make your iOS app's user experience better with Haptify. Haptify provides easy APIs to integrate and use Taptic/Haptic and Vibration feedback.


## Requirements
iOS 10.0+
Swift 4.2

## Installation
CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:
```
$ gem install cocoapods
```

To integrate Haptify into your Xcode project using CocoaPods, specify it in your Podfile:
```
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Haptify'
end
```

Then, run the following command:
```
$ pod install
```

## Using Haptify
Import Haptify module as follows:
```
import Haptify
```

Check if Haptic or Taptic engines supported:
```
if UIDevice.current.hasTapticEngine {
    title.append(supported)
}
if UIDevice.current.hasHapticFeedback {
    title.append(supported)
}

```

Play user touch vibration feedback:
```
- Haptifyy(feed: .Peek)
- Haptifyy(feed: .Pop)
- Haptifyy(feed: .Cancelled)
- Haptifyy(feed: .Retry)
- Haptifyy(feed: .Success)
- Haptifyy(feed: .Warning)
- Haptifyy(feed: .Error)

```

Or play standard vibrations:
```
- Haptifyy(feed: .StandardVibration)
- Haptifyy(feed: .StandardAlertVibration)
```
