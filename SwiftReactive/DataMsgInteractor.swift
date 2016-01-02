//
//  DataMsgInteractor.swift
//  SwiftReactive
//
//  Created by LS on 1/01/2016.
//  Copyright © 2016 Luke Schoen. All rights reserved.
//

import Foundation

class DataMsgInteractor: LabelMsgProvider {
//    weak var output: LabelMsgOutput!
    var output: LabelMsgOutput!

    func provideLabelMsgData() {
        let labelTest = LabelTest(labelName: "VIPER Label")
        let labelMsg = LabelMsgData(msg: "VIPER Message")
        self.output.receiveLabelMsgData(labelMsg)
    }
}