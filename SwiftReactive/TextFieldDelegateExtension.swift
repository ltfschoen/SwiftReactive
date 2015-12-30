//
//  TextFieldDelegateExtension.swift
//  SwiftReactive
//
//  Created by LS on 30/12/2015.
//  Copyright © 2015 Luke Schoen. All rights reserved.
//

import Foundation

extension ViewController: UITextFieldDelegate {
    
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
}
