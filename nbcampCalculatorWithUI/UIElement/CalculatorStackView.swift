//
//  CalculatorStackView.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

//UILabel을 상속받은 커스텀 UIButton CalculatorButton 클래스 정의
class CalculatorStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // CalculatorStackView 인스턴스 생성시 axis, addArrangedSubview를 입력받도록 init
    init(axis: NSLayoutConstraint.Axis, addArrangedSubview: [UIView]?) {
        super.init(frame: .zero)
        self.axis = axis
        if let addArrangedSubview {
            for i in 0..<addArrangedSubview.count {
                self.addArrangedSubview(addArrangedSubview[i])
            }
        }
        setConfig() //init시 setConfig 메서드 호출
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 인스턴스가 생성될때 초기 설정 값 설정 메서드
    internal func setConfig() {
        self.backgroundColor = .black
        self.spacing = 10
        self.distribution = .fillEqually
        
    }
}

//CalculatorStackView을 상속받는 CalculatorHorizontalStackView 정의
class CalculatorHorizontalStackView: CalculatorStackView {
    override internal func setConfig() {
        super.setConfig()
        self.snp.makeConstraints {
            $0.height.equalTo(80)
        }
    }
}
