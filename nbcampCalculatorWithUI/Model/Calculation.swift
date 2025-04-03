//
//  Operation.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//
import Foundation

//CalculationProtocol 정의
protocol CalculationProtocol {
    
    //CalculationProtocol에서는 String 타입의 매개변수 firstNumber와 secondNumber를 가지고 String을 반환하는 calculate 함수 구현이 필요함을 정의
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String
    
}

// CalculationProtocol을 채택하는 덧셈 기능의 AddCalculation 클래스
class AddCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String {
        let decimalNum1 = NSDecimalNumber(string: firstNumber) //String을 Decimal로 연산하기 위해 NSDecimalNumber로 변환
        let decimalNum2 = NSDecimalNumber(string: secondNumber) //String을 Decimal로 연산하기 위해 NSDecimalNumber로 변환
        
        return decimalNum1.adding(decimalNum2).stringValue //덧셈 결과 NSDecimalNumber를 String으로 반환
    }
}

// CalculationProtocol을 채택하는 뺄셈 기능의 SubtractCalculation 클래스
class SubtractCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String {
        let decimalNum1 = NSDecimalNumber(string: firstNumber) //String을 Decimal로 연산하기 위해 NSDecimalNumber로 변환
        let decimalNum2 = NSDecimalNumber(string: secondNumber) //String을 Decimal로 연산하기 위해 NSDecimalNumber로 변환
                
        return decimalNum1.subtracting(decimalNum2).stringValue //뺄셈 결과 NSDecimalNumber를 String으로 반환
    }
}

// CalculationProtocol을 채택하는 곱셈 기능의 MultiplyCalculation 클래스
class MultiplyCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String {
        let decimalNum1 = NSDecimalNumber(string: firstNumber) //String을 Decimal로 연산하기 위해 NSDecimalNumber로 변환
        let decimalNum2 = NSDecimalNumber(string: secondNumber) //String을 Decimal로 연산하기 위해 NSDecimalNumber로 변환
                
        return decimalNum1.multiplying(by: decimalNum2).stringValue //곱셈 결과 NSDecimalNumber를 String으로 반환
    }
}

// CalculationProtocol을 채택하는 나눗셈 기능의 DivideCalculation 클래스
class DivideCalculation: CalculationProtocol {
    
    func calculate(_ firstNumber: String, _ secondNumber: String) throws -> String {
        guard firstNumber != "0" else {
            throw CustomError.devideZero
        }
        guard secondNumber != "0" else {
            throw CustomError.devidedByZero
        }
        let decimalNum1 = NSDecimalNumber(string: firstNumber) //String을 Decimal로 연산하기 위해 NSDecimalNumber로 변환
        let decimalNum2 = NSDecimalNumber(string: secondNumber) //String을 Decimal로 연산하기 위해 NSDecimalNumber로 변환
        
        return decimalNum1.dividing(by: decimalNum2).stringValue //나눗셈 결과 NSDecimalNumber를 String으로 반환
    }
}
