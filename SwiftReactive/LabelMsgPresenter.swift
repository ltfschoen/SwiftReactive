//
//  LabelMsgPresenter.swift
//  SwiftReactive
//
//  Created by LS on 1/01/2016.
//  Copyright © 2016 Luke Schoen. All rights reserved.
//

import Foundation

class LabelMsgPresenter: LabelMsgOutput, LabelMsgViewEventHandler {

    weak var view: LabelMsgView!
    var labelMsgProvider: LabelMsgProvider!

    func didClickShowLabelMsgButton() {
        self.labelMsgProvider.provideLabelMsgData()
    }

    func receiveLabelMsgData(labelMsgData: LabelMsgData) {
        let labelMsg = labelMsgData.msg
        self.view.setLabelMsg(labelMsg)
    }
}