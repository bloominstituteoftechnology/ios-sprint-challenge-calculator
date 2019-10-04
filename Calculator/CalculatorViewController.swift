//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    let calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text else { return }
        let number = calculatorBrain.addOperandDigit(digit)
        updateOutputLabel(with: number)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorString = sender.titleLabel?.text else { return }
        calculatorBrain.setOperator(operatorString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        if let answer = calculatorBrain.calculateIfPossible() {
            updateOutputLabel(with: answer)
            clearTransaction()
        } else {

            updateOutputLabel(with: "error...")
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        updateOutputLabel(with: "0")
    }
    
    // Mark: - Helper Functions
    
    func updateOutputLabel(with number: String) {
        outputLabel.text = number
    }
        
    // MARK: - Private
    
    private func clearTransaction() {
        calculatorBrain.operatorType = nil
        calculatorBrain.operand1String = ""
        calculatorBrain.operand2String = ""
    }
    
}
