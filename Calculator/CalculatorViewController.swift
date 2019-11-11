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
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle {
            outputLabel.text = brain?.addOperandDigit(buttonTitle)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle {
            brain?.setOperator(buttonTitle)
        }
    }
    
    @IBAction func unaryOperatorTapped(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle, let result = brain?.calculateUnaryOperation(buttonTitle) {
            outputLabel.text = result
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let result = brain?.calculateIfPossible() {
            outputLabel.text = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
