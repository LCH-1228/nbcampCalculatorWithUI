//
//  Calculator.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//
//Calculator 클래스 정의
public class Calculator {
    
    
    public init() {
        
    }
    
    public func calculate(input: String) -> String {
        
        let add = AddOperation()
        let sub = SubtractOperation()
        let mul = MultiplyOperation()
        let div = DivideOperation()
        
        let pattern = /\d+|[-+*\/]/
        var array = input.matches(of: pattern).map { String($0.0) }
        
        
        while true {
            
            let addIndex = array.firstIndex(of: "+")
            let subIndex = array.firstIndex(of: "-")
            let mulIndex = array.firstIndex(of: "*")
            let divIndex = array.firstIndex(of: "/")
            
            guard addIndex != nil || subIndex != nil || mulIndex != nil || divIndex != nil else { break }
            
            let logic = (addIndex != nil || subIndex != nil, mulIndex != nil || divIndex != nil)
            
            switch logic {
            case (false, false):
                print("없음")
            case (false, true), (true, true):
                guard divIndex != nil else {
                    print("곱셈 있음")
                    let firstNumber = Int(array[mulIndex! - 1])!
                    let secondNumber = Int(array[mulIndex! + 1])!
                    let tempValue: Int = Int(try! mul.calculate(firstNumber, secondNumber))
                    
                    array.remove(at: mulIndex! + 1)
                    array.remove(at: mulIndex!)
                    array.remove(at: mulIndex! - 1)
                    
                    array.insert(String(tempValue), at: mulIndex! - 1)
                    continue
                }
                
                guard mulIndex != nil else {
                    print("나눗셈 있음")
                    let firstNumber = Int(array[divIndex! - 1])!
                    let secondNumber = Int(array[divIndex! + 1])!
                    let tempValue: Int = Int(try! div.calculate(firstNumber, secondNumber))
                    
                    array.remove(at: divIndex! + 1)
                    array.remove(at: divIndex!)
                    array.remove(at: divIndex! - 1)
                    
                    array.insert(String(tempValue), at: divIndex! - 1)
                    continue
                }
                
                if Int(mulIndex!) < Int(divIndex!) {
                    print("곱셈 먼저")
                    let firstNumber = Int(array[mulIndex! - 1])!
                    let secondNumber = Int(array[mulIndex! + 1])!
                    let tempValue: Int = Int(try! mul.calculate(firstNumber, secondNumber))
                    
                    array.remove(at: mulIndex! + 1)
                    array.remove(at: mulIndex!)
                    array.remove(at: mulIndex! - 1)
                    
                    array.insert(String(tempValue), at: mulIndex! - 1)
                } else {
                    print("나눗셈 먼저")
                    let firstNumber = Int(array[divIndex! - 1])!
                    let secondNumber = Int(array[divIndex! + 1])!
                    let tempValue: Int = Int(try! div.calculate(firstNumber, secondNumber))
                    
                    array.remove(at: divIndex! + 1)
                    array.remove(at: divIndex!)
                    array.remove(at: divIndex! - 1)
                    
                    array.insert(String(tempValue), at: divIndex! - 1)
                }
                
            case (true, false): //덧셈뺄셈만 있음
                guard subIndex != nil else {
                    print("덧셈만 있음")
                    let firstNumber = Int(array[addIndex! - 1])!
                    let secondNumber = Int(array[addIndex! + 1])!
                    let tempValue: Int = Int(try! add.calculate(firstNumber, secondNumber))
                    
                    array.remove(at: addIndex! + 1)
                    array.remove(at: addIndex!)
                    array.remove(at: addIndex! - 1)
                    
                    array.insert(String(tempValue), at: addIndex! - 1)
                    continue
                }
                
                guard addIndex != nil else {
                    print("뺄셈만 있음")
                    let firstNumber = Int(array[subIndex! - 1])!
                    let secondNumber = Int(array[subIndex! + 1])!
                    let tempValue: Int = Int(try! sub.calculate(firstNumber, secondNumber))
                    
                    array.remove(at: subIndex! + 1)
                    array.remove(at: subIndex!)
                    array.remove(at: subIndex! - 1)
                    
                    array.insert(String(tempValue), at: subIndex! - 1)
                    continue
                }
                
                if Int(addIndex!) < Int(subIndex!) {
                    print("덧셈 먼저")
                    let firstNumber = Int(array[addIndex! - 1])!
                    let secondNumber = Int(array[addIndex! + 1])!
                    let tempValue: Int = Int(try! add.calculate(firstNumber, secondNumber))
                    
                    array.remove(at: addIndex! + 1)
                    array.remove(at: addIndex!)
                    array.remove(at: addIndex! - 1)
                    
                    array.insert(String(tempValue), at: addIndex! - 1)
                } else {
                    print("뺄셈 먼저")
                    let firstNumber = Int(array[subIndex! - 1])!
                    let secondNumber = Int(array[subIndex! + 1])!
                    let tempValue: Int = Int(try! sub.calculate(firstNumber, secondNumber))
                    
                    array.remove(at: subIndex! + 1)
                    array.remove(at: subIndex!)
                    array.remove(at: subIndex! - 1)
                    
                    array.insert(String(tempValue), at: subIndex! - 1)
                }
            }
        }
        return array[0]
    }
}
