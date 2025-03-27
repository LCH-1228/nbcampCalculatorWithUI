//
//  RemainderOperation.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

//Operation 프로토콜을 채택하는 나머지 연산 기능의 RemainderOperation 클래스 정의
class RemainderOperation: Operation {
    
    init() {
        
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 두 파라미터의 타입이 모두 BinaryInteger로 동일한 경우에 나머지 연산
    func calculate<T: BinaryInteger>(_ firstNumber: T, _ secondNumber: T) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.remaindZero
        } else if secondNumber == 0 {
            throw CustomError.remaindByZero
        } else {
            let result = firstNumber % secondNumber
            print("\(firstNumber)을(를) \(secondNumber)(으)로 나눈 나머지는 \(result)입니다.")
            return Double(result)
        }
        
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 두 파라미터의 타입이 모두 FloatingPoint로 동일한 경우에 나머지 연산
    func calculate<T: FloatingPoint>(_ firstNumber: T, _ secondNumber: T) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.remaindZero
        } else if secondNumber == 0 {
            throw CustomError.remaindByZero
        } else {
            //정수형 타입이 아닐경우 % 사용불가로 truncatingRemainder 사용하여 나머지 연산
            //
            let result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
            print("\(firstNumber)을(를) \(secondNumber)(으)로 나눈 나머지는 \(result)입니다.")
            return result.toDouble
        }
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 첫번째 파라미터의 타입이 BinaryInteger이고 두번째 파라미터의 타입이 FloatingPoint 경우에 나머지 연산
    func calculate<T1: BinaryInteger, T2: FloatingPoint>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.remaindZero
        } else if secondNumber == 0 {
            throw CustomError.remaindByZero
        } else {
            //정수형 타입이 아닐경우 % 사용불가로 truncatingRemainder 사용하여 나머지 연산
            //연산을 위해 첫번째 파라미터 BinaryInteger 타입을 BinaryFloatPoint로 변환
            let result = Double(firstNumber).truncatingRemainder(dividingBy: secondNumber.toDouble)
            print("\(firstNumber)을(를) \(secondNumber)(으)로 나눈 나머지는 \(result)입니다.")
            return result
        }
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 첫번째 파라미터의 타입이 FloatingPoint이고 두번째 파라미터의 타입이 BinaryInteger 경우에 나머지 연산
    func calculate<T1: FloatingPoint, T2: BinaryInteger>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.remaindZero
        } else if secondNumber == 0 {
            throw CustomError.remaindByZero
        } else {
            //정수형 타입이 아닐경우 % 사용불가로 truncatingRemainder 사용하여 나머지 연산
            //연산을 위해 첫번째 파라미터 BinaryInteger 타입을 BinaryFloatPoint로 변환
            let result = firstNumber.toDouble.truncatingRemainder(dividingBy: Double(secondNumber))
            print("\(firstNumber)을(를) \(secondNumber)(으)로 나눈 나머지는 \(result)입니다.")
            return result
        }
    }
    
    // Operation 프로토콜에서 정의된 calculate의 구현부로 입력된 첫번째 파라미터의 타입이 FloatingPoint이고 두번째 파라미터의 타입이 FloatingPoint 경우에 나머지 연산
    func calculate<T1: FloatingPoint, T2: FloatingPoint>(_ firstNumber: T1, _ secondNumber: T2) throws -> Double {
        if firstNumber == 0 {
            throw CustomError.remaindZero
        } else if secondNumber == 0 {
            throw CustomError.remaindByZero
        } else {
            //정수형 타입이 아닐경우 % 사용불가로 truncatingRemainder 사용하여 나머지 연산
            //연산을 위해 첫번째 파라미터 BinaryInteger 타입을 BinaryFloatPoint로 변환
            let result = firstNumber.toDouble.truncatingRemainder(dividingBy: secondNumber.toDouble)
            print("\(firstNumber)을(를) \(secondNumber)(으)로 나눈 나머지는 \(result)입니다.")
            return result
        }
    }
    
}
