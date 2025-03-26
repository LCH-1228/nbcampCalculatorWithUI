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
        let titleList = ["7", "8", "9", "+"]
        makeLabel()
        makeHorizentalStackView(nameList: titleList)
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
}
