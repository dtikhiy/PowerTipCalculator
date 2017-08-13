//
//  ViewController.swift
//  PowerTipCalculator
//
//  Created by Dmytro Tykhyi on 8/3/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

import UIKit

enum OperationType: Int {
    case OperationTypeTips
    case OperationTypeTotal
}

class PTCTipViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipsLabel: UILabel!
    
    @IBOutlet weak var mainStackViewBottomConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupView()
    }

    func setupView() {
        self.view.backgroundColor = .skyBlue
        self.billAmountTextField.delegate = self
        self.billAmountTextField.becomeFirstResponder()
    }
    
    // MARK: - Calculations
    func calculateTips(operation:OperationType) -> Double {
        let billAmount = Double.init(billAmountTextField.text!)
        let persent = (NSString(string:tipsSegmentedControl.titleForSegment(at: tipsSegmentedControl.selectedSegmentIndex)!).doubleValue) / 100.00
        
        guard (billAmountTextField.text?.characters.count)! > 0 && billAmount != nil else {
            return -1
        }
        
        switch operation {
        case .OperationTypeTips:
            return Double(billAmount! * persent)
        case .OperationTypeTotal:
            return Double(billAmount! * (1.0 + persent))
        }
    }
    
    // MARK: Actions
    @IBAction func billAmountChanged(_ sender: Any) {
        let tips = calculateTips(operation: .OperationTypeTips)
        let total = calculateTips(operation: .OperationTypeTotal)
        
        self.tipsLabel.text = tips > 0 ? tips.dollarFormatting : "$0.00"
        self.totalLabel.text = total > 0 ? total.dollarFormatting : "$0.00"
    }
    
    // MARK: Unwind Actions
    @IBAction func saveSettingsChanges(_ seque: UIStoryboardSegue) {}
    @IBAction func cancelSettingsChanges(_ seque: UIStoryboardSegue) {}
}


// MARK: UITextFieldDelegate
extension PTCTipViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let _:Int = Int.init(string) {
            if ((billAmountTextField.text?.characters.count)! >= 10) {
                return false
            }
        }
        
        if let billAmount = Double.init(textField.text!) {
            let split = billAmount.description.characters.split(separator: ".", maxSplits: 1).map(String.init)
            let decimalSize = split.last?.characters.count
            
            if (decimalSize! >= 2 && !string.isEmpty) {
                return false
            }
        }
        
        if ((self.billAmountTextField.text?.contains("."))! && string == ".") {
            return false
        }
    
        return true
    }
}
