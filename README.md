# Setup Guide

* Update CocoaPods to 0.39.0 to prevent incompatibility issues
	- ```sudo gem install cocoapods```
* Update Podfile with directory of clone/fork (check directory with ```pwd```)
	```xcodeproj '/<INSTALLED_DIRECTORY>/SwiftReactive/SwiftReactive.xcodeproj'```
* Open SwiftReactive directory. Run Pod Install
	```pod install```
* Xcode > Product > Clean
* Open the following file to load the project in Xcode (NOT .xcodeproj)
	- /\<INSTALLED_DIRECTORY>/SwiftReactive/SwiftReactive/SwiftReactive.xcworkspace

# Usage

* Xcode > Product > Run

* Click the green button to trigger an event action that changes an Observable property that has two-way binding defined with the Label 1 text. This is achieved using ```Observable<String>``` and ```.observe``` from ReactiveKit. Additionally Label 2 changes since it too has two-way binding with Label 1. This is achieved using ```bindTo``` from ReactiveKit.

* Enter text into the Text Field to see it mirrored in Label 2 (when typing or deleting text) due to use of ```rText.bindTo``` from ReactiveKit.