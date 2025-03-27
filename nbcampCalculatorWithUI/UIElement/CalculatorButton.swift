//
//  CalculatorButton.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

class CalculatorButton: UIButton {
    
    static var greedButtons = [[UIButton()]]
    
    static func makeGreedButtons(buttonTitleList: [String], selectorList: [String], row: Int, column: Int) -> [[UIButton]] {
        var columnButtons = [UIButton()]
        greedButtons.remove(at: 0)
        for y in 0..<row {
            columnButtons.removeAll()
            for x in 0..<column {
                let index = (y * row) + x
                let button = UIButton()
                button.setTitle(buttonTitleList[index], for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                button.layer.cornerRadius = 40
                
                let selector = Selector("\(selectorList[index])ButtonClicked")
//                button.addTarget(self, action: selector, for: .touchUpInside)
                
                button.snp.makeConstraints {
                    $0.size.equalTo(80)
                }
                columnButtons.append(button)
            }
            greedButtons.append(columnButtons)
        }
        return greedButtons
    }
    
    static func setCalculationButtonCollor(buttons: [UIButton], color: UIColor) {
        
        for button in buttons {
            button.backgroundColor = color
        }
    }
}

