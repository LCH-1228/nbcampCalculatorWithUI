//
//  CustomError.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

enum CustomError: Error {
    case devideZero // DivideOperation에서 0을 나눌시 발생하는 에러
    case devidedByZero // DivideOperation에서 0으로 나눌시 발생하는 에러
    case remaindZero // RemainderOperation에서 0을 나누어 나머지 연산시 발생하는 에러
    case remaindByZero // RemainderOperation에서  0으로 나누어 나머지 연산시 발생하는 에러
}
