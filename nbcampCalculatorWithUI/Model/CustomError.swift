//
//  CustomError.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//

// 오류처리를 위해 Error 프로토콜을 따르는 열거형 CustomError 선언
enum CustomError: Error {
    case devideZero // DivideOperation에서 0을 나눌시 발생하는 에러
    case devidedByZero // DivideOperation에서 0으로 나눌시 발생하는 에러
}
