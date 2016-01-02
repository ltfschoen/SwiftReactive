//
//  LabelProtocols.swift
//  SwiftReactive
//
//  Created by LS on 1/01/2016.
//  Copyright © 2016 Luke Schoen. All rights reserved.
//

import Foundation

protocol LabelMsgProvider {
    func provideLabelMsgData()
}

protocol LabelMsgOutput {
    func receiveLabelMsgData(labelMsgData: LabelMsgData)
}

protocol LabelMsgViewEventHandler {
    func didClickShowLabelMsgButton()
}

protocol LabelMsgView: class {
    func setLabelMsg(labelMsg: String)
}