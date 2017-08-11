//
//  Formatting.swift
//  PowerTipCalculator
//
//  Created by Dmytro Tykhyi on 8/7/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

import Foundation

extension Float {
    var dollarFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: NSNumber(value: self))!
    }
}
