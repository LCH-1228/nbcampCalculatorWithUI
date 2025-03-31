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
    
    public func calculate(input: String) -> String {
                
        var array = readFromString(input: input)
        
        while true {
            
            let addIndex = array.firstIndex(of: "+")
            let subIndex = array.firstIndex(of: "-")
            let mulIndex = array.firstIndex(of: "*")
            let divIndex = array.firstIndex(of: "/")
            
            guard addIndex != nil || subIndex != nil || mulIndex != nil || divIndex != nil else { break }
            
            let logic = (addIndex != nil || subIndex != nil, mulIndex != nil || divIndex != nil)
            
            switch logic {
            case (false, false):
                let osLogMessage = "(debug) logic = \(logic)\n(fals, fals) 조건 예외처리 필요"
                os_log(.debug, log: .default, "\(osLogMessage)")
            case (false, true), (true, true):
                guard divIndex != nil else {
                    let osLogMessage = "(debug) 입력에 곱셈 포함. 나눗셈 미포함. 곱셈 먼저"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                    array = getresult(test: MultiplyOperation(), input: array)
                    continue
                }
                
                guard mulIndex != nil else {
                    let osLogMessage = "(debug) 입력에 나눗셈 포함. 곱셈 미포함. 나눗셈 먼저"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                    array = getresult(test: DivideOperation(), input: array)
                    continue
                }
                
                if Int(mulIndex!) < Int(divIndex!) {
                    let osLogMessage = "(debug) 입력에 곱셈, 나눗셈 포함. 곱셈이 먼저 있음"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                    array = getresult(test: MultiplyOperation(), input: array)
                } else {
                    let osLogMessage = "(debug) 입력에 곱셈, 나눗셈 포함. 나눗셈이 먼저 있음"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                    array = getresult(test: DivideOperation(), input: array)
                }
                
            case (true, false): //덧셈뺄셈만 있음
                guard subIndex != nil else {
                    let osLogMessage = "(debug) 입력에 덧셈만 있음"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                    array = getresult(test: AddOperation(), input: array)
                    continue
                }
                
                guard addIndex != nil else {
                    let osLogMessage = "(debug) 입력에 뺄셈만 있음"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                    array = getresult(test: SubtractOperation(), input: array)
                    continue
                }
                
                if Int(addIndex!) < Int(subIndex!) {
                    let osLogMessage = "(debug) 입력에 덧셈, 뺄셈 포함. 덧셈이 먼저 있음"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                    array = getresult(test: AddOperation(), input: array)
                } else {
                    let osLogMessage = "(debug) 입력에 덧셈, 뺄셈 포함. 뺄셈이 먼저 있음"
                    os_log(.debug, log: .default, "\(osLogMessage)")
                    array = getresult(test: SubtractOperation(), input: array)
                }
            }
        }
        return array[0]
    }
    
    func readFromString(input: String) -> [String] {
        let pattern = /\d+|[-+*\/]/
        return input.matches(of: pattern).map { String($0.0) }
    }
    
    func getresult(test: Operation, input: [String]) -> [String] {
        
        var inputArray = input
        var index = 0
        
        switch test {
        case is AddOperation:
            index = inputArray.firstIndex(of: "+")!
        case is SubtractOperation:
            index = inputArray.firstIndex(of: "-")!
        case is MultiplyOperation:
            index = inputArray.firstIndex(of: "*")!
        case is DivideOperation:
            index = inputArray.firstIndex(of: "/")!
        default:
            print("4")
        }
        
        let firstNumber = Double(inputArray[index - 1])!
        let secondNumber = Double(inputArray[index + 1])!
        let tempValue: Int = Int(try! test.calculate(firstNumber, secondNumber))
        
        inputArray.remove(at: index + 1)
        inputArray.remove(at: index)
        inputArray.remove(at: index - 1)
        
        inputArray.insert(String(tempValue), at: index - 1)
        
        return inputArray
    }

}
