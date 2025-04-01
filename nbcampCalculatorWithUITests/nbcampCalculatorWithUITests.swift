//
//  nbcampCalculatorWithUITests.swift
//  nbcampCalculatorWithUITests
//
//  Created by Chanho Lee on 3/31/25.
//

import XCTest
import nbcampCalculatorWithUI

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
    
    // 덧셈 테스트
    func testAddition() {
        let input = "2+3"
        let result = calculator.calculate(input: input)
        XCTAssertEqual(result, "5.0", "2+3의 계산 결과는 5.0여야 합니다.")
    }
    
    // 뺄셈 테스트
    func testSubtraction() {
        let input = "5-3"
        let result = calculator.calculate(input: input)
        XCTAssertEqual(result, "2.0", "5-3의 계산 결과는 2.0여야 합니다.")
    }
    
    // 곱셈 테스트
    func testMultiplication() {
        let input = "2*3"
        let result = calculator.calculate(input: input)
        XCTAssertEqual(result, "6.0", "2*3의 계산 결과는 6.0이어야 합니다.")
    }
    
    // 나눗셈 테스트
    func testDivision() {
        let input = "8/2"
        let result = calculator.calculate(input: input)
        XCTAssertEqual(result, "4.0", "8/2의 계산 결과는 4.0여야 합니다.")
    }
    
    // 덧셈과 곱셈이 함께 있는 경우
    func testMixedOperators_MultiplicationPrecedence() {
        let input = "2+3*4"
        let result = calculator.calculate(input: input)
        XCTAssertEqual(result, "14.0", "연산자 우선순위에 따라 2+3*4의 결과는 14.0여야 합니다.")
    }
    
    // 뺄셈과 나눗셈이 함께 있는 경우
    func testMixedOperators_DivisionPrecedence() {
        let input = "10-2/2"
        let result = calculator.calculate(input: input)
        XCTAssertEqual(result, "9.0", "연산자 우선순위에 따라 10-2/2의 결과는 9.0여야 합니다.")
    }
    
    // 여러 개의 동일 연산자에 대한 테스트: 1+2+3
    func testMultipleSamePrecedence() {
        let input = "1+2+3"
        let result = calculator.calculate(input: input)
        XCTAssertEqual(result, "6.0", "연속된 덧셈 연산은 왼쪽부터 계산되어 1+2+3의 결과는 6.0이어야 합니다.")
    }
    
    // 복합 연산 테스트
    func testComplexExpression() {
        let input = "2+3*4-5/1"
        let result = calculator.calculate(input: input)
        XCTAssertEqual(result, "9.0", "복합 연산 2+3*4-5/1의 결과는 9.0여야 합니다.")
    }
}
