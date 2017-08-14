//
//  ViewController.swift
//  PowerTipCalculator
//
//  Created by Dmytro Tykhyi on 8/3/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

import UIKit

// Different types of operations are allowed
enum OperationType: Int {
    case OperationTypeTips
    case OperationTypeTotal
}

let kMaxNumberOfDigits = 10

class PTCTipViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipsLabel: UILabel!
    
    @IBOutlet weak var mainStackViewBottomConstraint: NSLayoutConstraint!
    
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .skyBlue
        
        let formatter = NumberFormatter.init()
        formatter.numberStyle = .currency
        
        self.billAmountTextField.placeholder = formatter.currencySymbol
        self.billAmountTextField.delegate = self
        self.billAmountTextField.becomeFirstResponder()

        self.self.tipsSegmentedControl.updateSegmentedControlFromDefaults()
        self.billAmountTextField.text = defaults.string(forKey: Constants.kBillAmountKeyForDefaults)
        self.billAmountChanged(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(self.billAmountTextField.text!, forKey: Constants.kBillAmountKeyForDefaults)
        defaults.synchronize()
    }
    
    // MARK: Actions
    @IBAction func billAmountChanged(_ sender: Any) {
        let tips = calculateTips(operation: .OperationTypeTips)
        let total = calculateTips(operation: .OperationTypeTotal)
        
        self.tipsLabel.text = tips > 0 ? tips.dollarFormatting : 0.dollarFormatting
        self.totalLabel.text = total > 0 ? total.dollarFormatting : 0.dollarFormatting
    }
}

// MARK: - Tips Calculations
extension PTCTipViewController {
    func calculateTips(operation:OperationType) -> Double {
        let billAmount = Double.init(billAmountTextField.text!)
        let persent = (NSString(string:tipsSegmentedControl.titleForSegment(at: tipsSegmentedControl.selectedSegmentIndex)!).doubleValue) / 100.00
        
        // Guard if the textField contains inproper value
        guard (billAmountTextField.text?.characters.count)! > 0 && billAmount != nil else {
            return -1
        }
        
        // Calculate Total or Tips depends on the operation type
        switch operation {
        case .OperationTypeTips:
            return Double(billAmount! * persent)
        case .OperationTypeTotal:
            return Double(billAmount! * (1.0 + persent))
        }
    }
}

// MARK: UITextFieldDelegate
extension PTCTipViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Stop input if number of digits exceed kMaxNumberOfDigits constant
        if let _:Int = Int.init(string) {
            if ((billAmountTextField.text?.characters.count)! >= kMaxNumberOfDigits) {
                return false
            }
        }
        
        // User can input only two digits after floating point
        if let billAmount = Double.init(textField.text!) {
            let split = billAmount.description.characters.split(separator: ".", maxSplits: 1).map(String.init)
            let decimalSize = split.last?.characters.count
            
            if (decimalSize! >= 2 && !string.isEmpty ) {
                return false
            }
        }
        
        // User can input only one period for the floating point number
        if ((self.billAmountTextField.text?.contains("."))! && string == ".") {
            return false
        }
    
        return true
    }
}
