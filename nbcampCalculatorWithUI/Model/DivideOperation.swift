//
//  DivideOperation.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//

//Operation 프로토콜을 채택하는 나눗셈 기능의 DivideOperation 클래스 정의
public class DivideOperation: Operation {
    
    
    public init() {
        
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 두 파라미터의 타입이 모두 BinaryInteger로 동일한 경우에 나누기 연산(Int, Int 간 연산)
    public func calculate<T: BinaryInteger>(_ firstNumber: T, _ secondNumber: T) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.devideZero
        } else if secondNumber == 0 {
            throw CustomError.devidedByZero
        } else {
            return Double(firstNumber / secondNumber)
        }

    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 두 파라미터의 타입이 모두 FloatingPoint로 동일한 경우에 나누기 연산(Float, Flaot나 Double, Double간 연산)
    public func calculate<T: FloatingPoint>(_ firstNumber: T, _ secondNumber: T) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.devideZero
        } else if secondNumber == 0 {
            throw CustomError.devidedByZero
        } else {
            return (firstNumber / secondNumber).toDouble
        }
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 첫번째 파라미터의 타입이 BinaryInteger이고 두번째 파라미터의 타입이 FloatingPoint 경우에 나누기 연산(Int, Float나 Int, Double간 연산)
    public func calculate<T1: BinaryInteger, T2: FloatingPoint>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.devideZero
        } else if secondNumber == 0 {
            throw CustomError.devidedByZero
        } else {
            return Double(firstNumber) / secondNumber.toDouble
        }
        
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 첫번째 파라미터의 타입이 FloatingPoint이고 두번째 파라미터의 타입이 BinaryInteger 경우에 나누기 연산(Float, Int나 Double, Int간 연산)
    public func calculate<T1: FloatingPoint, T2: BinaryInteger>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.devideZero
        } else if secondNumber == 0 {
            throw CustomError.devidedByZero
        } else {
            return firstNumber.toDouble / Double(secondNumber)
        }
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 첫번째 파라미터의 타입이 FloatingPoint이고 두번째 파라미터의 타입이 BinaryInteger 경우에 나누기 연산(Float, Double이나 Double, Float간 연산)
    public func calculate<T1: FloatingPoint, T2: FloatingPoint>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.devideZero
        } else if secondNumber == 0 {
            throw CustomError.devidedByZero
        } else {
            return firstNumber.toDouble / secondNumber.toDouble
        }
    }
}

