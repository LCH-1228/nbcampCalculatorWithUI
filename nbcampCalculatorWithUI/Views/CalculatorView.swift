//
//  MainView.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

class CalculatorView: UIView {
    
    let resultLabel = CalculatorLabel(title: "0")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("View가 로딩되었습니다.")
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        drawLabel()
        drawButton()
    }
    
    private func drawLabel() {
        
        self.addSubview(resultLabel)
        
        resultLabel.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).inset(30)
            $0.trailing.equalTo(self.snp.trailing).inset(30)
            $0.top.equalTo(self.snp.top).inset(200)
        }
    }
    
    private func drawButton() {
        let num0Button = CalculatorButton(title: "0")
        let num1Button = CalculatorButton(title: "1")
        let num2Button = CalculatorButton(title: "2")
        let num3Button = CalculatorButton(title: "3")
        let num4Button = CalculatorButton(title: "4")
        let num5Button = CalculatorButton(title: "5")
        let num6Button = CalculatorButton(title: "6")
        let num7Button = CalculatorButton(title: "7")
        let num8Button = CalculatorButton(title: "8")
        let num9Button = CalculatorButton(title: "9")
        
        let addButton = OrangeCalculatorButton(title: "+")
        let subButton = OrangeCalculatorButton(title: "-")
        let mulButton = OrangeCalculatorButton(title: "*")
        let divButton = OrangeCalculatorButton(title: "/")
        
        let acButton = CalculatorButton(title: "AC")
        let resultButton = CalculatorButton(title: "=")
                
        let firstHorizontalStackView = CalculatorHorizontalStackView(axis: .horizontal, addArrangedSubview: [num7Button, num8Button, num9Button, addButton])
        let secondHorizontalStackView = CalculatorHorizontalStackView(axis: .horizontal, addArrangedSubview: [num4Button, num5Button, num6Button, subButton])
        let thirdHorizontalStackView = CalculatorHorizontalStackView(axis: .horizontal, addArrangedSubview: [num1Button, num2Button, num3Button, mulButton])
        let fourthHorizontalStackView = CalculatorHorizontalStackView(axis: .horizontal, addArrangedSubview: [acButton, num0Button, resultButton, divButton])

        let verticalStackview = CalculatorStackView(axis: .vertical, addArrangedSubview: [firstHorizontalStackView, secondHorizontalStackView, thirdHorizontalStackView, fourthHorizontalStackView])
        
        self.addSubview(verticalStackview)
        
        verticalStackview.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(resultLabel.snp.bottom).offset(60)
        }
    }
}
