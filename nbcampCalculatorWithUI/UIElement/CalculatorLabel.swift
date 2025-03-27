//
//  CalculatorLabel.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

class CalculatorLabel: UILabel {
    
    static let label = UILabel()
    
    static func makeLabel(variable: Any) -> UILabel {
        
        label.text = "\(variable)"
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        return label
    }
}
