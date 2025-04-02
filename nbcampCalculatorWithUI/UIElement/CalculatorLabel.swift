//
//  CalculatorLabel.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

//UILabel을 상속받은 커스텀 UIButton CalculatorButton 클래스 정의
class CalculatorLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // CalculatorLabel 인스턴스 생성시 title을 입력받도록 init
    init(title: String?) {
        super.init(frame: .zero)
        if let title {
            self.text = title
        }
        setConfig() //init시 setConfig 메서드 호출
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 인스턴스가 생성될때 초기 설정 값 설정 메서드
    internal func setConfig() {
        self.backgroundColor = .black
        self.textColor = .white
        self.textAlignment = .right
        self.font = .boldSystemFont(ofSize: 60)
        self.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
}

//CalculatorLabel을 상속받는 SubCalculatorLabel 정의
class SubCalculatorLabel: CalculatorLabel {
    override internal func setConfig() {
        super.setConfig()
        self.textColor = .gray
        self.font = .boldSystemFont(ofSize: 40)
        
    }
}
