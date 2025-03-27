//
//  CalculatorLabel.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

class CalculatorLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String?) {
        super.init(frame: .zero)
        if let title {
            self.text = title
        }
        setConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
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

class SubCalculatorLabel: CalculatorLabel {
    override internal func setConfig() {
        super.setConfig()
        self.textColor = .gray
        self.font = .boldSystemFont(ofSize: 40)
        
    }
}
