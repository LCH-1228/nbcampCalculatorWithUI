//
//  FloatingPointExtension.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//
import Foundation
//String 확장
extension String {
    
    // func todouble() -> { 로도 정의 가능하나 호출시 .toDouble이 아닌 .toDouble()로 호출해야함.
    var toDouble: Double {
        
        //String을 NSDecimalNumber로 변환 후 다시 Double로 변환함
        return Double(truncating: NSDecimalNumber(string: self))
    }
}
