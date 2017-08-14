//
//  SettingsViewController.swift
//  PowerTipCalculator
//
//  Created by Dmytro Tykhyi on 8/7/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

import Foundation
import UIKit

class PTCSettingsViewController: UITableViewController {
    let defaults = UserDefaults.standard
   
    @IBOutlet weak var percentageSegmentedControl: UISegmentedControl!
    @IBOutlet weak var changePercentStepper: UIStepper!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.percentageSegmentedControl.updateSegmentedControlFromDefaults()
        
        let index = self.percentageSegmentedControl.selectedSegmentIndex
        self.changePercentStepper.value =  NSString(string:percentageSegmentedControl.titleForSegment(at: index)!).doubleValue
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        for i in 0...2 {
            var percent = self.percentageSegmentedControl.titleForSegment(at: i)!
            percent.characters.removeLast(1)
            defaults.set(percent, forKey: String.init(format: "segment%d", i))
        }
    }
    
    @IBAction func defaultChanged(_ sender: Any) {
        let index = self.percentageSegmentedControl.selectedSegmentIndex
        self.changePercentStepper.value =  NSString(string:percentageSegmentedControl.titleForSegment(at: index)!).doubleValue
        
        defaults.set(self.percentageSegmentedControl.selectedSegmentIndex, forKey: Constants.kDefaultSegmentForDefaults)
        defaults.synchronize()
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        self.percentageSegmentedControl.setTitle(Int.init(self.changePercentStepper.value).description + "%", forSegmentAt: self.percentageSegmentedControl.selectedSegmentIndex)
    }
}
