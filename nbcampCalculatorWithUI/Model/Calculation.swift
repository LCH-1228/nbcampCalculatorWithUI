//
//  Operation.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//
import Foundation

protocol CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String
    
}

class AddCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String {
        let decimalNum1 = NSDecimalNumber(string: firstNumber)
        let decimalNum2 = NSDecimalNumber(string: secondNumber)
        
        let result = (decimalNum1 as Decimal) + (decimalNum2 as Decimal)
        
        return NSDecimalNumber(decimal: result).stringValue
    }
}

class SubtractCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String {
        let decimalNum1 = NSDecimalNumber(string: firstNumber)
        let decimalNum2 = NSDecimalNumber(string: secondNumber)
        
        let result = (decimalNum1 as Decimal) - (decimalNum2 as Decimal)
        
        return NSDecimalNumber(decimal: result).stringValue
    }
}

class MultiplyCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String {
        let decimalNum1 = NSDecimalNumber(string: firstNumber)
        let decimalNum2 = NSDecimalNumber(string: secondNumber)
        
        let result = (decimalNum1 as Decimal) * (decimalNum2 as Decimal)
        
        return NSDecimalNumber(decimal: result).stringValue
    }
}

class DivideCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String {
        guard firstNumber != "0" else {
            throw CustomError.devideZero
        }
        guard secondNumber != "0" else {
            throw CustomError.devidedByZero
        }
        let decimalNum1 = NSDecimalNumber(string: firstNumber)
        let decimalNum2 = NSDecimalNumber(string: secondNumber)
        
        let result = (decimalNum1 as Decimal) / (decimalNum2 as Decimal)

        return NSDecimalNumber(decimal: result).stringValue
    }
}
