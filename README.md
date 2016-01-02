Progress
========

- [x] **ReactiveKit** implemented
- [x] **VIPER architecture** implemented (non-MV(X)) having layers including Presenter, Interactor (with Data), Entity (of Data), View, and Router. Refer [here](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52#.5rsr96dhp) for information
- [ ] **Application Coordinator** implementation using this [guide](https://slack-files.com/T051G5Y6D-F0HABHKDK-8e9141e191)
- [ ] Unit Testing using VIPER architecture
- [ ] Use Generamba to create VIPER skeleton

Setup Guide
========

* Update CocoaPods to 0.39.0 to prevent incompatibility issues
	- ```sudo gem install cocoapods```
* Update Podfile with directory of clone/fork (check directory with ```pwd```)
	```xcodeproj '/<INSTALLED_DIRECTORY>/SwiftReactive/SwiftReactive.xcodeproj'```
* Open SwiftReactive directory. Run Pod Install
	```pod install```
* Xcode > Product > Clean
* Open the following file to load the project in Xcode (NOT .xcodeproj)
	- /\<INSTALLED_DIRECTORY>/SwiftReactive/SwiftReactive/SwiftReactive.xcworkspace

Usage
========

* Xcode > Product > Run

* Click blue button to create Labels 1 and 2

* Click the green button to trigger an event action that changes an Observable property that has two-way binding defined with the Label 1 text. This is achieved using ```Observable<String>``` and ```.observe``` from ReactiveKit. Additionally Label 2 changes since it too has two-way binding with Label 1. This is achieved using ```bindTo``` from ReactiveKit.

* Enter text into the Text Field to see it mirrored in Label 2 (when typing or deleting text) due to use of ```rText.bindTo``` from ReactiveKit.

* Click the red button to remove both of the UILabels from the superview

* Try entering text in the Text Field or clicking the green button again. The app does not crash even though a .bindTo is associated between these fields and the UILabel that was removed.

Issues
========

* **Optional** Unsuccessfully attempted to add a Cancel HTTP Request button (temperamental in that sometimes both UILabels are appended with "Success" text, whilst other times only one or neither update, and sometimes app crashes). Code associated with this attempt is available in this branch: [alamofire_cancel](https://github.com/ltfschoen/SwiftReactive/tree/alamofire_cancel)