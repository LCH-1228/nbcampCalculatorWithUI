//
//  Calculator.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/28/25.
//
import Foundation

class Calculator {
    
    func calculate(expression: String) -> Int? {
            let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}
