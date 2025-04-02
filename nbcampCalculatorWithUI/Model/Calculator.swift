//
//  Calculator.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//
//Calculator 클래스 정의
import OSLog

public class Calculator {
    
    public init() {
        
    }
    
    public func calculate(input: String) throws -> String {
                
        var array = readFromString(input: input)
        
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
            
            guard isAdd || isSub || isMul || isDiv else { break }
            
            let logic = (isAdd || isSub, isMul || isDiv)
            
            do {
                switch logic {
                case (false, false):
                    let osLogMessage = "(debug) logic = \(logic)\n(fals, fals) 조건 예외처리 필요"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                case (false, true), (true, true):
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
                    
                case (true, false): //덧셈뺄셈만 있음
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
        let formattedResult = result.toDouble
        print(formattedResult)
        
        if formattedResult == formattedResult.rounded(.down) {
            return String(format: "%.0f", formattedResult)
        } else {
            return result
        }
    }
    
    public func readFromString(input: String) -> [String] {
        let pattern = /\d([|.\d{1,2}]?)+|[-+*\/]/
        return input.matches(of: pattern).map { String($0.0) }
    }
    
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
