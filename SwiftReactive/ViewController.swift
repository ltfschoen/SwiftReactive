//
//  ViewController.swift
//  SwiftReactive
//
//  Created by LS on 16/12/2015.
//  Copyright © 2015 Luke Schoen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, LabelMsgView {

    // START - VIPER
    var eventHandler: LabelMsgViewEventHandler!
    var showLabelMsgButton: UIButton?
    var labelMsgLabel: UILabel?
    var presenter: LabelMsgPresenter?
    var interactor: DataMsgInteractor?
    // END - VIPER

    var button1: UIButton?
    var button2: UIButton?
    var button3: UIButton?

    var label1: UILabel?
    var label2: UILabel?

    var labelCollection = ObservableCollection([UILabel]())

    var textField1: UITextField?

    var label1Text: String?
    var label2Text: String?
    var label1Ref: Observable<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // START - VIPER
        self.presenter = LabelMsgPresenter()
        self.interactor = DataMsgInteractor()
        self.eventHandler = self.presenter
        self.presenter!.view = self
        self.presenter!.labelMsgProvider = self.interactor
        self.interactor!.output = self.presenter

        self.showLabelMsgButton = UIButton(type: UIButtonType.System) as UIButton
        self.showLabelMsgButton!.frame = CGRectMake(10, 300, 300, 20)
        self.showLabelMsgButton!.backgroundColor = UIColor.yellowColor()
        self.showLabelMsgButton!.setTitle("VIPER Placeholder Title", forState: UIControlState.Normal)
        self.showLabelMsgButton!.titleLabel!.textAlignment = .Center
        self.view.addSubview(self.showLabelMsgButton!)
        self.showLabelMsgButton!.addTarget(self, action: "didClickShowLabelMsgButton:", forControlEvents: .TouchUpInside)

        self.labelMsgLabel = UILabel(frame: CGRectMake(10, 320, 300, 20))
        self.labelMsgLabel!.backgroundColor = UIColor.whiteColor()
        self.labelMsgLabel!.textAlignment = NSTextAlignment.Center
        self.labelMsgLabel!.text = "VIPER Placeholder Message"
        self.view.addSubview(self.labelMsgLabel!)
        // END - VIPER

        // Button 3
        self.button3 = UIButton(type: UIButtonType.System) as UIButton
        self.button3!.frame = CGRectMake(10, 140, 300, 20)
        self.button3!.backgroundColor = UIColor.blueColor()
        self.button3!.setTitle("Click to Create Labels 1 and 2 with HTTP", forState: UIControlState.Normal)
        self.button3!.titleLabel!.textAlignment = .Center
        self.button3!.addTarget(self, action: "button3ClickAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.button3!)

        // Button 1
        self.button1 = UIButton(type: UIButtonType.System) as UIButton
        self.button1!.frame = CGRectMake(10, 200, 300, 20)
        self.button1!.backgroundColor = UIColor.greenColor()
        self.button1!.setTitle("Click to Change Label 1 Text (Label 2 Bind)", forState: UIControlState.Normal)
        self.button1!.titleLabel!.textAlignment = .Center
        self.button1!.addTarget(self, action: "button1ClickAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.button1!)

        labelCollection.observe { e in
            print("array: \(e.collection), inserts: \(e.inserts), deletes: \(e.deletes), updates: \(e.updates)")
        }

        // Text Field 1
        self.textField1 = UITextField(frame: CGRectMake(10, 250, 300, 40))
        self.textField1!.placeholder = "Enter Text to show Binding to Label 2"
        self.textField1!.font = UIFont.systemFontOfSize(15)
        self.textField1!.borderStyle = UITextBorderStyle.RoundedRect
        self.textField1!.autocorrectionType = UITextAutocorrectionType.No
        self.textField1!.keyboardType = UIKeyboardType.Default
        self.textField1!.returnKeyType = UIReturnKeyType.Done
        self.textField1!.clearButtonMode = UITextFieldViewMode.WhileEditing;
        self.textField1!.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        self.textField1!.delegate = self
        self.view.addSubview(self.textField1!)

        // Button 2 (Delete All Labels
        self.button2 = UIButton(type: UIButtonType.System) as UIButton
        self.button2!.frame = CGRectMake(10, 180, 300, 20)
        self.button2!.backgroundColor = UIColor.redColor()
        self.button2!.setTitle("Click to Remove All Labels", forState: UIControlState.Normal)
        self.button2!.titleLabel!.textAlignment = .Center
        self.button2!.addTarget(self, action: "button2ClickAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.button2!)
    }

    // START - VIPER Protocol Methods
    func didClickShowLabelMsgButton(button: UIButton) {
        self.eventHandler.didClickShowLabelMsgButton()
    }
    
    func setLabelMsg(labelMsg: String) {
        self.labelMsgLabel!.text = labelMsg
    }
    // END - VIPER Protocol Methods

    func button1ClickAction() {
        guard self.labelCollection.count != 0 else { return }

        self.label1Ref!.value = "Label 1 Text Changed"
//        self.label1Ref!.next("Label 1 Text Changed")
    }

    func button2ClickAction() {
        guard self.labelCollection.count != 0 else { return }

        self.deleteLabel(0)
        self.deleteLabel(0)
    }

    func button3ClickAction() {

        // Only recreate both buttons when no buttons exist
        guard self.labelCollection.count == 0 else { return }

        // Label 1
        let factoryWhite = LabelFactory.getFactory(Labels.WHITE)
        
        if factoryWhite != nil {
            let labelWhite = Label(labelType: Labels.WHITE, labelPlan: factoryWhite!.createLabelPlan())
            labelWhite.printDetails()
            self.label1Text = "Label 1 Text"
            self.labelCollection.append(labelWhite.labelPlan.label)
            self.labelCollection[0].text = self.label1Text
            self.view.addSubview(self.labelCollection[0])
            
            self.label1Ref = Observable(self.label1Text!)
            self.label1Ref!.observe { (newLabel1Text) -> () in
                print("Observed Label 1 Text Change: \(newLabel1Text)")
                
                // Check if label is in view and not deleted before attempting to update
                if self.labelCollection.count != 0 {
                    self.labelCollection[0].text = newLabel1Text
                }
            }
        } else {
            print("Error: Concrete Factory for Label Type not found")
        }
        
        // Label 2
        let factoryBlack = LabelFactory.getFactory(Labels.BLACK)
        
        if factoryBlack != nil {
            let labelBlack = Label(labelType: Labels.BLACK, labelPlan: factoryBlack!.createLabelPlan())
            labelBlack.printDetails()
            self.label2Text = "Label 2 Text"
            self.labelCollection.append(labelBlack.labelPlan.label)
            self.labelCollection[1].text = self.label2Text
            self.view.addSubview(self.labelCollection[1])
        } else {
            print("Error: Concrete Factory for Label Type not found")
        }
        
        // Bind (Label 1 and Label 2)
        self.label1Ref!.bindTo(self.labelCollection[1])

        // Bind (Text Field and Label 2
        self.textField1!.rText.bindTo(self.labelCollection[1])

        fetchTitles().retry(0).observe(on: Queue.main.context) { event in
            switch event {
            case .Next(let title):
                print("Operation produced title \(title)")
            case .Success:
                print("Operation successful")
            case .Failure(let error):
                print("Operation failed with error \(error)")
            }
        }
    }

    /**
    *  ReactiveKit Operation wraps HTTP request for observation.
    *  Operation closure that performs the HTTP request is passed to constructor and
    *  takes an 'observer' argument for sending events about the operation state using .next
    *  method.
    */
    func fetchTitles() -> Operation<String, NSError> {

        // Declare object to be registered as observer and passed to closure in the operation constructor
        var arr: [String] = []
        if self.label1Text != nil && self.label2Text != nil {
            arr.append(self.label1Text!)
            arr.append(self.label2Text!)
        }

        return Operation { observer in

            let request = Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["key": "value"])
                .response { request, response, data, error in
                    print(request)  // original URL request
                    print(response) // URL response
                    print(data)     // server data

                    if let error = error {
                        observer.failure(error)
                    } else {
                        if arr.count != 0 && self.labelCollection.count != 0 {
                            for i in 0 ..< arr.count {
                                observer.next(arr[i])
                                self.labelCollection[i].text! += " Success"
                            } // end for loop
                        }
                        observer.success()
                    }
                }
            return BlockDisposable {
                request.cancel()
            }
        }
    }

    func deleteLabel(index: Int) {
        print("Request to delete label at index: \(self.labelCollection[index])")
        /*
        *  Check if UILabel exists at provided index.
        *  Temporarily store UILabel at index so available to remove from both array and view
        */
        if let labelRefAtIndex: UILabel? = self.labelCollection[index] {
            // Remove label at index in the array before deleting it from the array
            self.labelCollection[index].removeFromSuperview()
            // Check at least one label in array before deleting
            print("Collection count is: \(self.labelCollection.count)")
            if self.labelCollection.count != 0 {
                self.labelCollection.removeAtIndex(index)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
