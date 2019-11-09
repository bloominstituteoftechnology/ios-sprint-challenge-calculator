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
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    init() {
        self.operatorType = nil
    }
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String += digit
            return(operand1String)
        } else {
            operand2String += digit
            return(operand2String)
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
    }
}

//In setOperator, convert the operatorString passed into this method into an instance of your OperatorType enum, and then assign it to your operatorType property.=====done
//In calculateIfPossible, hopefully you can calculate an answer based on the data you've stored so far in the brain.
//Start by checking that the two operand strings are not empty, as "" wouldn't turn into a valid number.
//Then, check that the operatorType variable isn't nil, since you need a valid operator to perform the arithmetic.
//Convert the two operand strings into Doubles.
//With all that setup done, use the type you found in step 2 to decide which kind of arithmetic you'll perform on the operands. Since you have several possible codepaths and only want to execute one of them at runtime, a switch is likely a good choice here. 😉
//For each kind of arithmetic, use your two operand Doubles to perform either addition, subtraction, multiplication, or division (remember you can't divide-by-zero, so make sure to check for that before actually doing the math to avoid the app crashing. If you do encounter that, simply return "Error" for your answer).
//Whatever your result is from the above arithmetic, return the answer as a String.
//If you can't do the calculation because you're missing some piece of data, return nil.


//In CalculatorBrain.swift:
//
//Above the class, look for the enum called OperatorType. It will help you decide which type of calculation to perform. One case is already created for you, but you'll need to add the other three: subtraction, multiplication, and division. Notice the raw value type of the enum is String, which means each case can have a separate value that is a String.
//Go look at the operator buttons in the storyboard. Notice they use different symbols from +, -, *, /. Copy the following symbols from this document for addition, subtraction, multiplication, and division: +, −, ×, ÷. Place them after each corresponding case (use the addition case as a model). This mapping of case to symbol will let you determine what operation the user wants to perform from the symbol string on the button. ===????
//Inside the CalculatorBrain class, take a look at the 3 properties already declared for you. The first two will hold the values of the operands (so for example, the 2 and the 4 in 2 + 4). The last property holds an instance of OperatorType and represents the kind of operation you'll be calculating (addition, subtraction, multiplication, or division).== nont do anything
//In addOperandDigit, you have to figure out first which operand the passed-in digit belongs to. If the user has entered an operator already, the operatorType you defined above will have a value. Use the presence or absence of an operator to decide where this digit belongs. Append the digit string to the end of either operand1String or operand2String and then return that string to the caller of this method.
