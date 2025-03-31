//
//  nbcampCalculatorWithUITests.swift
//  nbcampCalculatorWithUITests
//
//  Created by Chanho Lee on 3/31/25.
//

import XCTest
import nbcampCalculatorWithUI

final class nbcampCalculatorWithUITests: XCTestCase {
    
    func testAddOperation() {
        
        let calculator = nbcampCalculatorWithUI.AddOperation()
        let num1: Double = 3
        let num2: Double = 5
        let answer = num1 + num2
        let result = try? calculator.calculate(num1, num2)
        
        XCTAssertEqual(result, answer, "실패")
    }
    
    func testSubOperation() {
        
        let calculator = nbcampCalculatorWithUI.SubtractOperation()
        let num1: Double = 3
        let num2: Double = 5
        let answer = num1 - num2
        let result = try? calculator.calculate(num1, num2)
        
        XCTAssertEqual(result, answer, "실패")
    }
    
    func testMulOperation() {
        
        let calculator = nbcampCalculatorWithUI.MultiplyOperation()
        let num1: Double = 3
        let num2: Double = 5
        let answer = num1 * num2
        let result = try? calculator.calculate(num1, num2)
        
        XCTAssertEqual(result, answer, "실패")
    }
    
    func testDivOperation() {
        
        let calculator = nbcampCalculatorWithUI.DivideOperation()
        let num1: Double = 3
        let num2: Double = 5
        let answer = num1 / num2
        let result = try? calculator.calculate(num1, num2)
        
        XCTAssertEqual(result, answer, "실패")
    }
    
    func testRemainderOperation() {
        
        let calculator = nbcampCalculatorWithUI.RemainderOperation()
        let num1: Double = 3
        let num2: Double = 5
        let answer = num1.truncatingRemainder(dividingBy: num2)
        let result = try? calculator.calculate(num1, num2)
        
        XCTAssertEqual(result, answer, "실패")
    }
}
