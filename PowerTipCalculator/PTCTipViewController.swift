//
//  ViewController.swift
//  PowerTipCalculator
//
//  Created by Dmytro Tykhyi on 8/3/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

import UIKit

class PTCTipViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }

    func setupView() {
        self.view.backgroundColor = .skyBlue
        self.billAmountTextField.becomeFirstResponder()
    }
    
    // MARK: Unwind Actions
    @IBAction func saveSettingsChanges(_ seque: UIStoryboardSegue) {}
    @IBAction func cancelSettingsChanges(_ seque: UIStoryboardSegue) {}
}

