//
//  LabelPlans.swift
//  SwiftReactive
//
//  Created by LS on 30/12/2015.
//  Copyright © 2015 Luke Schoen. All rights reserved.
//

import UIKit

/**
*  Protocol defined representing label and associated conforming class configurations
**/

protocol LabelPlan {
    var label: UILabel! { get }

    init()
}

class WhiteLabelPlan: LabelPlan {
    var label: UILabel!

    required init() {
        self.label = UILabel(frame: CGRectMake(0, 0, 200, 20))
        self.label!.center = CGPointMake(160, 75)
        self.label.backgroundColor = UIColor.whiteColor()
        self.label!.textAlignment = NSTextAlignment.Center
    }
}

class BlackLabelPlan: LabelPlan {
    var label: UILabel!

    required init() {
        self.label = UILabel(frame: CGRectMake(0, 0, 200, 20))
        self.label!.center = CGPointMake(160, 95)
        self.label!.textColor = UIColor(red: 0.500, green: 0.500, blue: 1.000, alpha: 1.0)
        self.label.backgroundColor = UIColor.blackColor()
        self.label!.textAlignment = NSTextAlignment.Center
    }
}
