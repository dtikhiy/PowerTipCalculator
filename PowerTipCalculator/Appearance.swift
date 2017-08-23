//
//  Appearance.swift
//  PowerTipCalculator
//
//  Created by Dmytro Tykhyi on 8/3/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

import Foundation
import UIKit

struct Appearance {
    static func setGlobalAppearance() {
        // MARK: UINavigationBar
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .skyBlue
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // MARK: UISegmentedControl
        UISegmentedControl.appearance().tintColor = .ocean
        let attributes = [NSForegroundColorAttributeName : UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for:.normal)
    }
}

extension UIColor {
    class var skyBlue: UIColor {
        return UIColor(red: 84.0 / 255.0, green: 199.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    }
    
    class var ocean: UIColor {
        return UIColor(hue:0.58, saturation:1.00, brightness:0.50, alpha:1.00)
    }
}
