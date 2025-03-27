//
//  CalculatorButton.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

class CalculatorButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String?) {
        super.init(frame: .zero)
        if let title {
            self.setTitle(title, for: .normal)
        }
        setConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func setConfig() {
        self.titleLabel?.font = .boldSystemFont(ofSize: 30)
        self.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        self.layer.cornerRadius = 40
        self.snp.makeConstraints {
            $0.size.equalTo(80)
        }
    }
}

class OrangeCalculatorButton: CalculatorButton {
    override internal func setConfig() {
        super.setConfig()
        self.backgroundColor = .orange
    }
}

