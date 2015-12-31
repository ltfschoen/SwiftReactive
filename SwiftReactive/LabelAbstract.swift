//
//  LabelAbstract.swift
//  SwiftReactive
//
//  Created by LS on 30/12/2015.
//  Copyright © 2015 Luke Schoen. All rights reserved.
//

import Foundation

/**
*  Abstract Factory class used as base class for deriving concrete factory classes.
*  Method that returns objects that implement a product protocols.
*  getFactory Method accepts value from Labels enum to select and return and instance
*  of a concrete factory to the calling component as a LabelFactory object.
*  The details of which concrete factory is kept private.
**/

class LabelFactory {

    required init() {
    }

    // Method implementing the Label Protocol
    func createLabelPlan() -> LabelPlan {
        fatalError("Not implemented")
    }

    final class func getFactory(label: Labels) -> LabelFactory? {

        var factoryType: LabelFactory.Type

        switch (label) {
            case .WHITE:
                factoryType = WhiteLabelFactory.self
            case .BLACK:
                factoryType = BlackLabelFactory.self
        }

        var factory = factoryType.sharedInstance

        if (factory == nil) {
            factory = factoryType.init()
        }

        return factory
    }

    class var sharedInstance: LabelFactory? {
        get {
            return nil
        }
    }
}