//
//  Calculator.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//
//Calculator 클래스 정의
import OSLog // Calculator 클래스 기능 구현 중 연산 로직 디버깅을 위해 사용

class Calculator {
    
    init() {
        
    }
    
    func calculate(input: String) throws -> String {
                
        var array = readFromString(input: input) //문자열 입력을 숫자와 기호로 분리하여 문자열 배열로 생성
        
        while true {
            
            let addIndex = array.firstIndex(of: "+") ?? -1
            let subIndex = array.firstIndex(of: "-") ?? -1
            let mulIndex = array.firstIndex(of: "*") ?? -1
            let divIndex = array.firstIndex(of: "/") ?? -1
            
            let indexArray = [addIndex, subIndex, mulIndex, divIndex]
            
            let isAdd = addIndex > 0
            let isSub = subIndex > 0
            let isMul = mulIndex > 0
            let isDiv = divIndex > 0
            
            guard isAdd || isSub || isMul || isDiv else { break } // 생성된 배열에서 연산기호가 없으면 반복문 종료
            
            let logic = (isAdd || isSub, isMul || isDiv) // switch문에서 case 분리를 위해 튜플 사용
            
            do {
                switch logic {
                case (false, false): // 배열에 사칙연산 기호가 모두 없을 경우 위의 가드문에서 종료되어야하나 default case 사용하지 않고 log 표시를 위해 작성함.
                    let osLogMessage = "(debug) logic = \(logic)\n(fals, fals) 조건 예외처리 필요"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                case (false, true), (true, true): // 배열에 곱셈 또는 나눗셈이 있을경우
                    guard isDiv != false else {
                        let osLogMessage = "(debug) 입력에 곱셈 포함. 나눗셈 미포함. 곱셈 먼저"
                        os_log(.debug, log: .default, "\(osLogMessage)")
                        array = try getresult(operation: MultiplyCalculation(), input: array, indexArray: indexArray)
                        continue
                    }
                    
                    guard isMul != false else {
                        let osLogMessage = "(debug) 입력에 나눗셈 포함. 곱셈 미포함. 나눗셈 먼저"
                        os_log(.debug, log: .default, "\(osLogMessage)")
                        array = try getresult(operation: DivideCalculation(), input: array, indexArray: indexArray)
                        continue
                    }
                    
                    if Int(mulIndex) < Int(divIndex) {
                        let osLogMessage = "(debug) 입력에 곱셈, 나눗셈 포함. 곱셈이 먼저 있음"
                        os_log(.debug, log: .default, "\(osLogMessage)")
                        array = try getresult(operation: MultiplyCalculation(), input: array, indexArray: indexArray)
                    } else {
                        let osLogMessage = "(debug) 입력에 곱셈, 나눗셈 포함. 나눗셈이 먼저 있음"
                        os_log(.debug, log: .default, "\(osLogMessage)")
                        array = try getresult(operation: DivideCalculation(), input: array, indexArray: indexArray)
                    }
                    
                case (true, false): //배열에 덧셈뺄셈만 있을 경우
                    guard isSub != false else {
                        let osLogMessage = "(debug) 입력에 덧셈만 있음"
                        os_log(.debug, log: .default, "\(osLogMessage)")
                        array = try getresult(operation: AddCalculation(), input: array, indexArray: indexArray)
                        continue
                    }
                    
                    guard isAdd != false else {
                        let osLogMessage = "(debug) 입력에 뺄셈만 있음"
                        os_log(.debug, log: .default, "\(osLogMessage)")
                        array = try getresult(operation: SubtractCalculation(), input: array, indexArray: indexArray)
                        continue
                    }
                    
                    if Int(addIndex) < Int(subIndex) {
                        let osLogMessage = "(debug) 입력에 덧셈, 뺄셈 포함. 덧셈이 먼저 있음"
                        os_log(.debug, log: .default, "\(osLogMessage)")
                        array = try getresult(operation: AddCalculation(), input: array, indexArray: indexArray)
                    } else {
                        let osLogMessage = "(debug) 입력에 덧셈, 뺄셈 포함. 뺄셈이 먼저 있음"
                        os_log(.debug, log: .default, "\(osLogMessage)")
                        array = try getresult(operation: SubtractCalculation(), input: array, indexArray: indexArray)
                    }
                }
            } catch {
                throw error
            }
        }
        
        let result = array[0]
        return result
    }
    
    // 문자열을 파싱하여 숫자와 연산기호를 분리하여 문자열 배열로 생성함
    func readFromString(input: String) -> [String] {
        let pattern = /\d([|.\d{1,2}]?)+|[-+*\/]/
        return input.matches(of: pattern).map { String($0.0) }
    }
    
    //입력받은 배열에서 입력받은 index를 기준으로 이전 인덱스의 숫자와 다음 인덱스의 숫자이에 입력받은 연산을 진행 후 연산한 숫자와 연산기호를 제거하고 그자리에 연산 값을 삽입 하여 배열 반환하는 메서드
    func getresult(operation: CalculationProtocol, input: [String], indexArray: [Int]) throws -> [String] {
        
        var inputArray = input
        var index = 0
        
        switch operation {
        case is AddCalculation:
            index = indexArray[0]
        case is SubtractCalculation:
            index = indexArray[1]
        case is MultiplyCalculation:
            index = indexArray[2]
        case is DivideCalculation:
            index = indexArray[3]
        default:
            print("out of index")
        }
        
        let firstNumber = inputArray[index - 1]
        let secondNumber = inputArray[index + 1]
        
        do {
            let tempValue = try operation.calculate(firstNumber, secondNumber)
            inputArray.remove(at: index + 1)
            inputArray.remove(at: index)
            inputArray.remove(at: index - 1)
            
            inputArray.insert(String(tempValue), at: index - 1)
        } catch {
            throw error
        }
        
        return inputArray
    }

}
