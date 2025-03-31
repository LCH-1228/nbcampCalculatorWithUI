//
//  Operation.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//

// Operation 프로토콜 정의
protocol Operation {
    
    // Operation 프로토콜에서 정의된 calculate 메서드로 입력된 두 파라미터의 타입이 BinaryInteger로 동일한 경우에 동작(Int, Int 간 연산)
    func calculate<T: BinaryInteger>(_ firstNumber: T, _ secondNumber: T) throws -> Double
    
    // Operation 프로토콜에서 정의된 calculate 메서드로 입력된 두 파라미터의 타입이 FloatingPoint로 동일한 경우에 동작(Float, Flaot나 Double, Double간 연산)
    func calculate<T: FloatingPoint>(_ firstNumber: T, _ secondNumber: T) throws -> Double
    
    // Operation 프로토콜에서 정의된 calculate 메서드로 입력된 첫번째 파라미터의 타입이 BinaryInteger이고 두번째 파라미터의 타입이 FloatingPoint 경우에 동작(Int, Float나 Int, Double간 연산)
    func calculate<T1: BinaryInteger, T2: FloatingPoint>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double
    
    // Operation 프로토콜에서 정의된 calculate 메서드로 입력된 첫번째 파라미터의 타입이 FloatingPoint이고 두번째 파라미터의 타입이 BinaryInteger 경우에 동작(Float, Int나 Double, Int간 연산)
    func calculate<T1: FloatingPoint, T2: BinaryInteger>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double
    
    // Operation 프로토콜에서 정의된 calculate 메서드로 입력된 첫번째 파라미터의 타입이 FloatingPoint이고 두번째 파라미터의 타입이 FloatingPoint 경우에 동작(Float, Double이나 Double, Float간 연산)
    func calculate<T1: FloatingPoint, T2: FloatingPoint>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double
    
}
