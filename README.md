# Setup Guide

* Update CocoaPods to 0.39.0 to prevent incompatibility issues
	- ```sudo gem install cocoapods```
* Update Podfile with directory of clone/fork (check directory with ```pwd```)
	```xcodeproj '/<INSTALLED_DIRECTORY>/SwiftReactive/SwiftReactive.xcodeproj'```
* Open SwiftReactive directory. Run Pod Install
	```pod install```
* Xcode > Product > Clean
* Open the following file to load the project in Xcode (NOT .xcodeproj)
	- /<INSTALLED_DIRECTORY>/SwiftReactive/SwiftReactive/SwiftReactive.xcworkspace
* Xcode > Product > Run