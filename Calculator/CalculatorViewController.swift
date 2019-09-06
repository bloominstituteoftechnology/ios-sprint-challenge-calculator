//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    var lastButtonPressWasEquals = false
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if lastButtonPressWasEquals {
            clearTransaction()
        }
        lastButtonPressWasEquals = false
        
        guard let operandString = sender.titleLabel!.text else {
            print("Unable to get string from button title.")
            return
        }
        
        let outputText = brain?.addOperandDigit(operandString)
        
        outputLabel.text = outputText
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        lastButtonPressWasEquals = false
        
        guard let operatorString = sender.titleLabel!.text else {
            print("Unable to get string from button title.")
            return
        }
        
        brain?.setOperator(operatorString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        lastButtonPressWasEquals = true
        if let result = brain?.calculateIfPossible() {
            outputString(result)
            brain?.operand1String = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        lastButtonPressWasEquals = false
        clearTransaction()
        outputLabel.text = "0"
    }
    
    @IBAction func negateTapped(_ sender: UIButton) {
        if brain?.operatorType == nil || lastButtonPressWasEquals {
            if brain?.operand1String.prefix(1) != "-" {
                brain?.operand1String = "-\(brain?.operand1String ?? "")"
            } else {
                brain?.operand1String = String((brain?.operand1String.dropFirst())!)
            }
            outputString(brain!.operand1String)
        } else {
            if brain?.operand2String.prefix(1) != "-" {
                brain?.operand2String = "-\(brain?.operand2String ?? "")"
            } else {
                brain?.operand2String = String((brain?.operand2String.dropFirst())!)
            }
            outputString(brain!.operand2String)
        }
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        //brain?.operand2String = ""
        brain?.operatorType = nil
    }
    
    private func outputString(_ string: String) {
        if string.suffix(2) == ".0" {
            outputLabel.text = String(string.dropLast(2))
        } else {
            outputLabel.text = string
        }
    }
}
