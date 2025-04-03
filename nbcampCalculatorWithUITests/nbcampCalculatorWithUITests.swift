//
//  nbcampCalculatorWithUITests.swift
//  nbcampCalculatorWithUITests
//
//  Created by Chanho Lee on 3/31/25.
//

import XCTest
@testable import nbcampCalculatorWithUI

final class nbcampCalculatorWithUITests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }
    
    func testReadFromString() {
        let input = "2.5+3.3"
        let pattern = /\d([|.\d{1,2}]?)+|[-+*\/]/
        let result =  input.matches(of: pattern).map {String($0.0) }
        XCTAssertEqual(result, ["2.5", "+", "3.3"], "2.5+3.5의 계산 결과는 5.8여야 합니다.")
    }
    
    func testSimpleAddition() throws {
        let result = try calculator.calculate(input: "1+2")
        XCTAssertEqual(result, "3")
    }
    
    func testSimpleSubtraction() throws {
        let result = try calculator.calculate(input: "5-3")
        XCTAssertEqual(result, "2")
    }
    
    func testSimpleMultiplication() throws {
        let result = try calculator.calculate(input: "2*4")
        XCTAssertEqual(result, "8")
    }
    
    func testSimpleDivision() throws {
        let result = try calculator.calculate(input: "10/2")
        XCTAssertEqual(result, "5")
    }
        
    func testOrderOfOperations_MultiplicationBeforeAddition() throws {
        let result = try calculator.calculate(input: "2+3*4")
        XCTAssertEqual(result, "14")
    }
    
    func testOrderOfOperations_MixAll() throws {
        let result = try calculator.calculate(input: "10-2*3+4/2")
        XCTAssertEqual(result, "6")
    }
    
    func testDecimalPrecision() throws {
        let result = try calculator.calculate(input: "2.5*2")
        XCTAssertEqual(result, "5")
    }
    
    func testFloatResultWithoutRounding() throws {
        let result = try calculator.calculate(input: "5/2")
        XCTAssertEqual(result, "2.5")
    }
        
    func testLeadingAndTrailingSpaces() throws {
        let result = try calculator.calculate(input: " 3 + 4 ")
        XCTAssertEqual(result, "7")
    }
    
    func testMultipleDigitNumbers() throws {
        let result = try calculator.calculate(input: "100+200*3")
        XCTAssertEqual(result, "700")
    }
    
    func testLongExpression() throws {
        let result = try calculator.calculate(input: "10+6*7+9*9-150/3")
        XCTAssertEqual(result, "83")
    }
}
