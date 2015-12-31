//
//  ViewController.swift
//  SwiftReactive
//
//  Created by LS on 16/12/2015.
//  Copyright © 2015 Luke Schoen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button1: UIButton?
    var button2: UIButton?
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

        // Button 1
        self.button1 = UIButton(type: UIButtonType.System) as UIButton
        self.button1!.frame = CGRectMake(10, 200, 300, 50)
        self.button1!.backgroundColor = UIColor.greenColor()
        self.button1!.setTitle("Click Button to Change Label 1 Text", forState: UIControlState.Normal)
        self.button1!.titleLabel!.textAlignment = .Center
        self.button1!.addTarget(self, action: "button1ClickAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.button1!)

        labelCollection.observe { e in
            print("array: \(e.collection), inserts: \(e.inserts), deletes: \(e.deletes), updates: \(e.updates)")
        }

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
                self.labelCollection[0].text = newLabel1Text
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

        // Bind (Text Field and Label 2
        self.textField1!.rText.bindTo(self.labelCollection[1])

        self.deleteLabel(0)
        self.deleteLabel(0)
    }

    func button1ClickAction() {
        self.label1Ref!.value = "Label 1 Text Changed"
//        self.label1Ref!.next("Label 1 Text Changed")
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
