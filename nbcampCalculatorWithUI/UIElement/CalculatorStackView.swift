//
//  CalculatorStackView.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

class CalculatorStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(axis: NSLayoutConstraint.Axis, addArrangedSubview: [UIView]?) {
        super.init(frame: .zero)
        self.axis = axis
        if let addArrangedSubview {
            for i in 0..<addArrangedSubview.count {
                self.addArrangedSubview(addArrangedSubview[i])
            }
        }
        setConfig()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func setConfig() {
        self.backgroundColor = .black
        self.spacing = 10
        self.distribution = .fillEqually
        
    }
}

class CalculatorHorizontalStackView: CalculatorStackView {
    override internal func setConfig() {
        super.setConfig()
        self.snp.makeConstraints {
            $0.height.equalTo(80)
        }
    }
}
