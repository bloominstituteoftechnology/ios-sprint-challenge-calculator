//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
    }
    
    func setOperator(_ operatorString: String) {
        
        switch operatorString {
        case "+": operatorType = .addition
        case "−": operatorType = .subtraction
        case "×": operatorType = .multiplication
        case "÷": operatorType = .division
        default: return
        }
    }
    
//    func calculateIfPossible() -> String? {
//
//    }
}
