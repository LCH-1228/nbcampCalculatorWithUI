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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController가 로딩되었습니다.")
        
        configureUI()
    }
    
    private func configureUI() {
        let titleList = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
        ]
        makeLabel()
        let greedStackView = makeVerticalStackView(nameList: titleList)
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
    
    private func makeHorizentalStackView(nameList: [String]) -> UIStackView {
        let horizentalStackView = UIStackView()

        horizentalStackView.axis = .horizontal
        horizentalStackView.backgroundColor = .black
        horizentalStackView.spacing = 10
        horizentalStackView.distribution = .fillEqually
        
        for i in 0..<4 {
            let button = UIButton()
            button.setTitle(nameList[i], for: .normal)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 40
            
            horizentalStackView.addArrangedSubview(button)
            
            button.snp.makeConstraints {
                $0.size.equalTo(80)
            }
        }
                
        view.addSubview(horizentalStackView)
        
        horizentalStackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.centerY.equalToSuperview()
        }
        return horizentalStackView
    }
    
    func makeVerticalStackView(nameList: [[String]]) -> UIStackView {
        let verticalStackView = UIStackView()
        
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        for i in 0..<4 {
            let horizontalStackView = makeHorizentalStackView(nameList: nameList[i])
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
