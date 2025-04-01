//
//  FloatingPointExtension.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/31/25.
//

//FloatingPoint 확장
extension FloatingPoint {
    
    // func todouble() -> { 로도 정의 가능하나 호출시 .toDouble이 아닌 .toDouble()로 호출해야함.
    var toDouble: Double {
        
        //FloatingPoint를 Double 옵셔널로 다운캐스팅하여 반환함
        //실패시 Float로 강제 다운캐스팅하여 Double로 타입변환 실시하여 반환함.
        return self as? Double ?? Double(self as! Float)
    }
}
