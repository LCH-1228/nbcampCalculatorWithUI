//
//  Calculator.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//

//Calculator 클래스 정의
public class Calculator {
    
    // operation 변수에 타입을 Operation 프로토콜로 지정
    var operation: Operation
    
    //operation init으로 의존성 주입가능
    init(operation: Operation) {
        self.operation = operation
    }
    
    //printRsult 메서드에 입력된 두 파라미터의 타입이 모두 BinaryInteger로 동일한 경우에 호출되는 메서드(Int, Int 간 연산)
    func printResult<T: BinaryInteger>(_ firstNumber: T, _ secondNumber: T) {
        do {
            try operation.calculate(firstNumber, secondNumber)
        } catch (let error) {
            switch error as! CustomError {
            case .devideZero: // DivideOperation에서 throw
                print("0을 \(secondNumber)로 나눌 수 없습니다.")
            case .devidedByZero: // DivideOperation에서 throw
                print("\(firstNumber)를 0으로 나눌 수 없습니다.")
            case .remaindZero:// RemainderOperation에서 throw
                print("0을 \(secondNumber)로 나머지 계산할 수 없습니다.")
            case .remaindByZero:// RemainderOperation에서 throw
                print("\(firstNumber)를 0으로 나머지 계산할 수 없습니다.")
            }
        }
    }
    
    //printRsult 메서드에 입력된 두 파라미터의 타입이 모두 FloatingPoint로 동일한 경우에 호출되는 메서드(Float, Flaot나 Double, Double간 연산)
    func printResult<T: FloatingPoint>(_ firstNumber: T, _ secondNumber: T) {
        do {
            try operation.calculate(firstNumber, secondNumber)
        } catch (let error) {
            switch error as! CustomError {
            case .devideZero: // DivideOperation에서 throw
                print("0을 \(secondNumber)로 나눌 수 없습니다.")
            case .devidedByZero: // DivideOperation에서 throw
                print("\(firstNumber)를 0으로 나눌 수 없습니다.")
            case .remaindZero:// RemainderOperation에서 throw
                print("0을 \(secondNumber)로 나머지 계산할 수 없습니다.")
            case .remaindByZero:// RemainderOperation에서 throw
                print("\(firstNumber)를 0으로 나머지 계산할 수 없습니다.")
            }
        }
    }
    
    //printRsult 메서드에 입력된 첫번째 파라미터의 타입이 BinaryInteger이고 두번째 파라미터의 타입이 FloatingPoint 경우에 호출되는 메서드(Int, Float나 Int, Double간 연산)
    func printResult<T1: BinaryInteger, T2: FloatingPoint>(_ firstNumber: T1, _ secondNumber: T2) {
        do {
            try operation.calculate(firstNumber, secondNumber)
        } catch (let error) {
            switch error as! CustomError {
            case .devideZero: // DivideOperation에서 throw
                print("0을 \(secondNumber)로 나눌 수 없습니다.")
            case .devidedByZero: // DivideOperation에서 throw
                print("\(firstNumber)를 0으로 나눌 수 없습니다.")
            case .remaindZero:// RemainderOperation에서 throw
                print("0을 \(secondNumber)로 나머지 계산할 수 없습니다.")
            case .remaindByZero:// RemainderOperation에서 throw
                print("\(firstNumber)를 0으로 나머지 계산할 수 없습니다.")
            }
        }
    }
    
    //printRsult 메서드에 입력된 첫번째 파라미터의 타입이 FloatingPoint이고 두번째 파라미터의 타입이 BinaryInteger 경우에 호출되는 메서드(Float, Int나 Double, Int간 연산)
    func printResult<T1: FloatingPoint, T2: BinaryInteger>(_ firstNumber: T1, _ secondNumber: T2) {
        do {
            try operation.calculate(firstNumber, secondNumber)
        } catch (let error) {
            switch error as! CustomError {
            case .devideZero: // DivideOperation에서 throw
                print("0을 \(secondNumber)로 나눌 수 없습니다.")
            case .devidedByZero: // DivideOperation에서 throw
                print("\(firstNumber)를 0으로 나눌 수 없습니다.")
            case .remaindZero:// RemainderOperation에서 throw
                print("0을 \(secondNumber)로 나머지 계산할 수 없습니다.")
            case .remaindByZero:// RemainderOperation에서 throw
                print("\(firstNumber)를 0으로 나머지 계산할 수 없습니다.")
            }
        }
    }
    
    //printRsult 메서드에 입력된 첫번째 파라미터의 타입이 FloatingPoint이고 두번째 파라미터의 타입이 FloatingPoint 경우에 호출되는 메서드(Float, Double이나 Double, Float간 연산)
    func printResult<T1: FloatingPoint, T2: FloatingPoint>(_ firstNumber: T1, _ secondNumber: T2) {
        do {
            try operation.calculate(firstNumber, secondNumber)
        } catch (let error) {
            switch error as! CustomError {
            case .devideZero: // DivideOperation에서 throw
                print("0을 \(secondNumber)로 나눌 수 없습니다.")
            case .devidedByZero: // DivideOperation에서 throw
                print("\(firstNumber)를 0으로 나눌 수 없습니다.")
            case .remaindZero:// RemainderOperation에서 throw
                print("0을 \(secondNumber)로 나머지 계산할 수 없습니다.")
            case .remaindByZero:// RemainderOperation에서 throw
                print("\(firstNumber)를 0으로 나머지 계산할 수 없습니다.")
            }
        }
    }
}
