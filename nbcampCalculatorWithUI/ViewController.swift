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
        makeLabel()
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
}
