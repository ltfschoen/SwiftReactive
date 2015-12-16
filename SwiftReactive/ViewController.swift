//
//  ViewController.swift
//  SwiftReactive
//
//  Created by LS on 16/12/2015.
//  Copyright © 2015 Luke Schoen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var button1: UIButton?
    var button2: UIButton?
    var label1: UILabel?
    var label2: UILabel?
    var textField1: UITextField?

    var label1Text: String?
    var label2Text: String?
    var label1Ref: Observable<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Button 1
        self.button1 = UIButton(type: UIButtonType.System) as UIButton
        self.button1!.frame = CGRectMake(0, 200, 300, 50)
        self.button1!.backgroundColor = UIColor.greenColor()
        self.button1!.setTitle("Button 1", forState: UIControlState.Normal)
        self.button1!.addTarget(self, action: "button1ClickAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.button1!)

        // Label 1
        self.label1Text = "Label1"
        self.label1 = UILabel(frame: CGRectMake(0, 0, 200, 20))
        self.label1!.center = CGPointMake(160, 100)
        self.label1!.textAlignment = NSTextAlignment.Center
        self.label1!.text = self.label1Text
        self.view.addSubview(self.label1!)
        self.label1Ref = Observable(self.label1Text!)
        self.label1Ref!.observe { (newLabel1Text) -> () in
            print("Observed Label 1 Text Change: \(newLabel1Text)")
            self.label1!.text = newLabel1Text
        }

        // Label 2
        self.label2Text = "Label2"
        self.label2 = UILabel(frame: CGRectMake(0, 0, 200, 20))
        self.label2!.center = CGPointMake(160, 150)
        self.label2!.textAlignment = NSTextAlignment.Center
        self.label2!.text = self.label2Text
        self.view.addSubview(self.label2!)

        // Bind (Label 1 and Label 2)
        self.label1Ref!.bindTo(self.label2!)

        // Text Field 1
        self.textField1 = UITextField(frame: CGRectMake(20, 250, 300, 40))
        self.textField1!.placeholder = "Enter Text"
        self.textField1!.font = UIFont.systemFontOfSize(15)
        self.textField1!.borderStyle = UITextBorderStyle.RoundedRect
        self.textField1!.autocorrectionType = UITextAutocorrectionType.No
        self.textField1!.keyboardType = UIKeyboardType.Default
        self.textField1!.returnKeyType = UIReturnKeyType.Done
        self.textField1!.clearButtonMode = UITextFieldViewMode.WhileEditing;
        self.textField1!.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        self.textField1!.delegate = self
        self.view.addSubview(self.textField1!)

        // Bind (Text Field and Label 2
        self.textField1!.rText.bindTo(self.label2!)
    }

    func button1ClickAction() {
        self.label1Ref!.value = "Label 1 Text Changed"
//        self.label1Ref!.next("Label 1 Text Changed")
    }

    // MARK: Textfield Delegates
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField Did Begin Editing")
    }

    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField Did End Editing")
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("TextField Should Begin Editing")
        return true;
    }

    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("TextField Should Clear")
        return true;
    }

    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("TextField Should End Editing")
        return true;
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("Entering Characters")
        return true;
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    // MARK: Textfield Delegates

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

