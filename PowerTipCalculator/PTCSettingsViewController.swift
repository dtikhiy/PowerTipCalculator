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
    
    @IBOutlet weak var percentageSegmentedControl: UISegmentedControl!
    @IBOutlet weak var changePercentStepper: UIStepper!
    
    let defaults = UserDefaults.standard
    var defaultSegmentIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.percentageSegmentedControl.updateSegmentedControlFromDefaults()
        
        self.defaultSegmentIndex = self.percentageSegmentedControl.selectedSegmentIndex
        self.changePercentStepper.value =  NSString(string:percentageSegmentedControl.titleForSegment(at: defaultSegmentIndex)!).doubleValue
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let maxIndexOfSegments = self.percentageSegmentedControl.numberOfSegments - 1
        
        for i in 0...maxIndexOfSegments  {
            var percent = self.percentageSegmentedControl.titleForSegment(at: i)!
            percent.characters.removeLast(1)
            defaults.set(percent, forKey: String.init(format: "segment%d", i))
        }
        
        if (self.percentageSegmentedControl.selectedSegmentIndex != defaultSegmentIndex) {
            // isSettingsChanged set to true to show the popup message for changed default tip value
            let tipController = navigationController?.viewControllers.first as? PTCTipViewController
            tipController?.isSettingsChanged = true
            tipController?.alertMessageTextType = .AtertMessageTypeDefaultValueChanged
        }
    }
    
    // MARK: Change Percentage methods
    @IBAction func defaultChanged(_ sender: Any) {
        let index = self.percentageSegmentedControl.selectedSegmentIndex
        self.changePercentStepper.value =  NSString(string:percentageSegmentedControl.titleForSegment(at: index)!).doubleValue
        
        defaults.set(self.percentageSegmentedControl.selectedSegmentIndex, forKey: Constants.kDefaultSegmentForDefaults)
        defaults.synchronize()
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        self.percentageSegmentedControl.setTitle(Int.init(self.changePercentStepper.value).description + "%", forSegmentAt: self.percentageSegmentedControl.selectedSegmentIndex)
        
        // isSettingsChanged set to true to show the popup message for changed percentages
        let tipController = navigationController?.viewControllers.first as? PTCTipViewController
        tipController?.isSettingsChanged = true
        tipController?.alertMessageTextType = .AtertMessageTypePercentageUpdated
    }
}
