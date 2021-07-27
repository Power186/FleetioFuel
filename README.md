# FleetioFuel - work sample assessment

## Get Started:
* To run locally: download zip, open project in Xcode, and change development team to your preference.
## Notes: 
- Cloud user defaults are configured, but didn't add the Capability for CloudKit key value storage as it is unknown if all parties involved evaluating have an Apple Developer Account.
- StoreKit isn't configured as a Capability for the same reason above, but the functionality works for testing, running locally.  Works on real device just can't submit (it's grayed out).
- Simulator has inconsistencies with the sound at the start of the app, but works as expected on real device.
- No third party dependencies added. If adding images to be displayed from API, I would've used KingFisher via Swift Package Manager.

## Built with:
* Swift
* MVVM / MVC
* SwiftUI
* UIKit
* MapKit
* MessageUI - sending message via iMessage
* Combine - for keyboard events
* XCTest - unit tests
* User Defaults
* Dynamic Type support - custom fonts
* Voice Over - configured, but still needs work
* Haptics
* AVKit
* StoreKit - recommend apps, rate app
* Light/Dark mode support
* Preference for pure functions
* Singleton
* Generic networking - URLSession
* Caching - URLCache
