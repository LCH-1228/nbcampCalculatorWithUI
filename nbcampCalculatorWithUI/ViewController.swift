//
//  ViewController.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/26/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let resultLabel = UILabel()
    var greedStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController가 로딩되었습니다.")
        
        configureUI()
    }
    
    private func configureUI() {
        let buttonTitleList = ["7", "8", "9", "+",
                          "4", "5", "6", "-",
                          "1", "2", "3", "*",
                          "AC", "0", "=", "/"]
        makeLabel()
        let buttons = makeGreedButtons(buttonTitleList: buttonTitleList, row: 4, column: 4)
        let horizontalStackViews = makeHorizontalStackViews(greedButtons: buttons)
        let verticalStackView = makeVerticalStackView(horizontalStackViews: horizontalStackViews)
    }
    
    private func makeLabel() {
        resultLabel.text = "12345"
        resultLabel.backgroundColor = .black
        resultLabel.textColor = .white
        resultLabel.textAlignment = .right
        resultLabel.font = .boldSystemFont(ofSize: 60)
        
        view.addSubview(resultLabel)
        
        resultLabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.equalTo(view.snp.leading).inset(30)
            $0.trailing.equalTo(view.snp.trailing).inset(30)
            $0.top.equalTo(view.snp.top).inset(200)
        }
    }
    
    private func makeGreedButtons(buttonTitleList: [String], row: Int, column: Int) -> [[UIButton]] {
        var rowButtons = [[UIButton()]]
        var columnButtons = [UIButton()]
        rowButtons.remove(at: 0)
        for y in 0..<row {
            columnButtons.removeAll()
            for x in 0..<column {
                let index = (y * row) + x
                let button = UIButton()
                button.setTitle(buttonTitleList[index], for: .normal)
                button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                button.layer.cornerRadius = 40
                
                button.snp.makeConstraints {
                    $0.size.equalTo(80)
                }
                columnButtons.append(button)
            }
            rowButtons.append(columnButtons)
        }
        return rowButtons
    }
    
    private func makeHorizontalStackViews(greedButtons: [[UIButton]]) -> [UIStackView] {
        var horizontalStackViews = [UIStackView()]
        
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
    
    func makeVerticalStackView(horizontalStackViews: [UIStackView]) -> UIStackView {
        let verticalStackView = UIStackView()
        
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        for horizontalStackView in horizontalStackViews {
            verticalStackView.addArrangedSubview(horizontalStackView)
        }
        
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(resultLabel.snp.bottom).offset(60)
        }
        return verticalStackView
    }
}
