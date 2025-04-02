//
//  Operation.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//
import Foundation

protocol CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> Double
    
}

class AddCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> Double {
        return firstNumber.toDouble + secondNumber.toDouble
    }
}

class SubtractCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> Double {
        return firstNumber.toDouble - secondNumber.toDouble
    }
}

class MultiplyCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> Double {
        let decimalNum1 = NSDecimalNumber(string: firstNumber)
        let decimalNum2 = NSDecimalNumber(string: secondNumber)
        
        var result = (decimalNum1 as Decimal) * (decimalNum2 as Decimal)

        var roundedResult = Decimal()
        NSDecimalRound(&roundedResult, &result, 9, NSDecimalNumber.RoundingMode.plain)
        return Double(truncating: roundedResult as NSNumber)
    }
}

class DivideCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> Double {
        let decimalNum1 = NSDecimalNumber(string: firstNumber)
        let decimalNum2 = NSDecimalNumber(string: secondNumber)
        
        var result = (decimalNum1 as Decimal) / (decimalNum2 as Decimal)

        var roundedResult = Decimal()
        NSDecimalRound(&roundedResult, &result, 9, NSDecimalNumber.RoundingMode.plain)
        return Double(truncating: roundedResult as NSNumber)
    }
}
