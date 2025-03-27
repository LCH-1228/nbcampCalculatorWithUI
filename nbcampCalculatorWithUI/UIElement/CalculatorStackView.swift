//
//  CalculatorStackView.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

class CalculatorStackView: UIStackView {
    
    static var horizontalStackViews = [UIStackView()]
    static let verticalStackView = UIStackView()
    
    static func makeHorizontalStackViews(greedButtons: [[UIButton]]) -> [UIStackView] {
        
        horizontalStackViews.remove(at: 0)
        for buttonY in greedButtons {
            
            let horizontalStackView = UIStackView()
            
            for buttonX in buttonY {
                horizontalStackView.axis = .horizontal
                horizontalStackView.backgroundColor = .black
                horizontalStackView.spacing = 10
                horizontalStackView.distribution = .fillEqually
                
                horizontalStackView.addArrangedSubview(buttonX)
            }
            
            horizontalStackView.snp.makeConstraints {
                $0.height.equalTo(80)
            }
            
            horizontalStackViews.append(horizontalStackView)
        }
        
        return horizontalStackViews
    }
    
    static func makeVerticalStackView(horizontalStackViews: [UIStackView]) -> UIView {
        
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        for horizontalStackView in horizontalStackViews {
            verticalStackView.addArrangedSubview(horizontalStackView)
        }
        
        return verticalStackView
    }
}
