//
//  CalculatorButton.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

//UIButton을 상속받은 커스텀 UIButton CalculatorButton 클래스 정의
class CalculatorButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // CalculatorButton 인스턴스 생성시 title을 입력받도록 init
    init(title: String?) {
        super.init(frame: .zero)
        if let title {
            self.setTitle(title, for: .normal)
        }
        setConfig() //init시 setConfig 메서드 호출
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 인스턴스가 생성될때 초기 설정 값 설정 메서드
    internal func setConfig() {
        self.titleLabel?.font = .boldSystemFont(ofSize: 30)
        self.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        self.layer.cornerRadius = 40
        self.snp.makeConstraints {
            $0.size.equalTo(80)
        }
    }
}

//CalculatorButton을 상속받는 OrnageCalculatorButton 정의
class OrangeCalculatorButton: CalculatorButton {
    override internal func setConfig() {
        super.setConfig()
        self.backgroundColor = .orange
    }
}

