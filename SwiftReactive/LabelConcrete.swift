//
//  LabelConcrete.swift
//  SwiftReactive
//
//  Created by LS on 30/12/2015.
//  Copyright © 2015 Luke Schoen. All rights reserved.
//

import Foundation

/**
*  Concrete factory classes dervied from LabelFactory class and overriding its methods
*  to create one of the groups of label product objects
**/

class WhiteLabelFactory: LabelFactory {
    override func createLabelPlan() -> LabelPlan {
        return WhiteLabelPlan()
    }

    override class var sharedInstance: LabelFactory? {
        get {
            struct SingletonWrapper {
                static let singleton = WhiteLabelFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}

class BlackLabelFactory: LabelFactory {
    override func createLabelPlan() -> LabelPlan {
        return BlackLabelPlan()
    }
}