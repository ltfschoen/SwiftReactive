//
//  LabelParts.swift
//  SwiftReactive
//
//  Created by LS on 30/12/2015.
//  Copyright © 2015 Luke Schoen. All rights reserved.
//

import Foundation

// TODO: Use different base type instead of String for the enum
enum Labels: String {
    case WHITE = "White"
    case BLACK = "Black"
}

// Entity
struct Label {
    var labelType: Labels
    var labelPlan: LabelPlan

    init(labelType: Labels, labelPlan: LabelPlan) {
        self.labelType = labelType
//        let concreteFactory = LabelFactory.getFactory(labelType)
//        self.labelPlan = concreteFactory!.createLabelPlan()
        self.labelPlan = labelPlan
    }

    func printDetails() {
        print("Label Type: \(labelType.rawValue)")
    }
}