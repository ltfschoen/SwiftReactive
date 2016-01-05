Progress
========

- [x] **ReactiveKit** implemented
- [x] **Abstract Factory design pattern** implemented
- [x] **VIPER architecture** implemented (non-MV(X)) having layers including Presenter, Interactor (with Data), Entity (of Data), View, and Router. Refer [here](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52#.5rsr96dhp) for information
- [x] **Appium Automated Testing** setup
- [ ] **Application Coordinator** implementation using this [guide](https://slack-files.com/T051G5Y6D-F0HABHKDK-8e9141e191) and [Backchannel SDK](https://github.com/ltfschoen/BackchannelSDK-iOS)
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

Usage of Appium Automated Testing
========
* Appium Installation Guide [http://appium.io/](http://appium.io/)
	- Install Node, Appium, Appium Client (wd)
Note: If encounter problems with permissions when installing node, try: `sudo rm -rf /usr/local/share/systemtap/`
* Appium iOS Configuration
	- Authorise Appium to use iOS Simulator (`sudo authorize_ios`)
	- [Link](https://github.com/appium/appium/blob/master/docs/en/appium-setup/running-on-osx.md)
* Ruby Installation, Gem Update, and Configuration
	- Install RVM, Install Latest Ruby (v2.2.0 compatible with CocoaPods), Install Bundler, Update Gems
	- [Link](http://appium.io/slate/en/tutorial/ios.html?ruby#install-ruby)
* Appium Ruby Console (ARC), Bond, and Flaky Gems Installation
	- Install Appium Console Gem, Install Bond Gem, Remove Ap Gem, Install Flaky Gem
	- [Link](https://github.com/appium/ruby_console/blob/master/osx.md)
* Grunt, Ant, Java (with Cask), and Maven Installation
* Appium Server and Appium Ruby Console (ARC) Execution
	- Open a terminal window tab. Run Appium Server `appium&` (outputs to shell)
	- Open a separate terminal window tab. Run ARC (communication with Appium Server) `arc`. Note that iOS Simulator will automatically open the SwiftReactive app and user may inspect Appium Server terminal window for testing and debugging
	- Kill Appium Server when finished (prevents being unable to run server again)
		- Open Appium Server terminal window tab. Press `CTRL+C`
		- Output to shell a list of ports where Appium already running `ps -ef | grep appium`. Note that the port is the number in the second column. In the next step we kill all rows with port numbers where the 8th column is not `grep app`
		- Kill all open Appium servers (so new one may be started) `kill -9 <insert_port_number>`.

Usage of App
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