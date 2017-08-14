//
//  Helpers.swift
//  PowerTipCalculator
//
//  Created by Dmytro Tykhyi on 8/13/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

import Foundation
import UIKit

enum Constants {
    static let kBillAmountKeyForDefaults = "billAmount"
    static let kDefaultSegmentForDefaults = "defaultPercentage"
    static let kCustomPropertiesSetFlag = "isCustomPropertiesSet"
    static let kFirstSegmentIDForDefaults = "segment0"
    static let kSecondSegmentIDForDefaults = "segment1"
    static let kThirdSegmentIDForDefaults = "segment2"
}

extension UISegmentedControl {
    func updateSegmentedControlFromDefaults() {
        self.selectedSegmentIndex = UserDefaults.standard.integer(forKey: Constants.kDefaultSegmentForDefaults)
        self.sendActions(for: UIControlEvents.valueChanged)
        self.setTitle(UserDefaults.standard.string(forKey: Constants.kFirstSegmentIDForDefaults)! + "%", forSegmentAt:0)
        self.setTitle(UserDefaults.standard.string(forKey: Constants.kSecondSegmentIDForDefaults)! + "%", forSegmentAt:1)
        self.setTitle(UserDefaults.standard.string(forKey: Constants.kThirdSegmentIDForDefaults)! + "%", forSegmentAt:2)
    }
}

