//
//  ViewController.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/26/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var result: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController가 로딩되었습니다.")
        
        configureUI()
    }
    
    private func configureUI() {
        makeUIElement()
        makeConstraint()
    }
    
    private func makeUIElement() {
        CalculatorLabel.makeLabel(variable: result)
        
        let buttonsTitleList = ["7", "8", "9", "+",
                               "4", "5", "6", "-",
                               "1", "2", "3", "*",
                               "AC", "0", "=", "/"]
        
        let buttonsSelectorList = ["num7", "num8", "num9", "add",
                                  "num4", "num5", "num6", "sub",
                                  "num1", "num2", "num3", "mul",
                                  "ac", "num0", "result", "div"]
        
        CalculatorButton.makeGreedButtons(buttonTitleList: buttonsTitleList,
                                          selectorList: buttonsSelectorList,
                                          row: 4, column: 4)
        
        let calculationButtonList = [CalculatorButton.greedButtons[0][3],CalculatorButton.greedButtons[1][3], CalculatorButton.greedButtons[2][3], CalculatorButton.greedButtons[3][3], CalculatorButton.greedButtons[3][2], CalculatorButton.greedButtons[3][0]]
        
        CalculatorButton.setCalculationButtonCollor(buttons: calculationButtonList, color: .orange)
        
        CalculatorStackView.makeHorizontalStackViews(greedButtons: CalculatorButton.greedButtons)
        
        CalculatorStackView.makeVerticalStackView(horizontalStackViews: CalculatorStackView.horizontalStackViews)
        
        setSelectorOnGreedButtons(greedButtons: CalculatorButton.greedButtons, selectorList: buttonsSelectorList)
    }
    
    private func makeConstraint() {
        
        view.addSubview(CalculatorLabel.label)
        
        CalculatorLabel.label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.equalTo(view.snp.leading).inset(30)
            $0.trailing.equalTo(view.snp.trailing).inset(30)
            $0.top.equalTo(view.snp.top).inset(200)
        }
        
        view.addSubview(CalculatorStackView.verticalStackView)
        
        CalculatorStackView.verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(CalculatorLabel.label.snp.bottom).offset(60)
        }
    }
    
    func setSelectorOnGreedButtons(greedButtons: [[UIButton]], selectorList: [String]) {
        for y in 0...3 {
            for x in 0...3 {
                let index = (y * 4) + x
                
                let selector = Selector("\(selectorList[index])ButtonClicked")
                greedButtons[y][x].addTarget(self, action: selector, for: .touchUpInside)
            }
        }
    }
    
    private func resultLabelUpdateByButton(button: String) {
        guard button != "ac" else {
            result = "0"
            CalculatorLabel.label.text = result
            return
        }
        guard (button != "+" && button != "-" && button != "*" && button != "/") || result != "0" else {
            print("0에 기호 추가 불가")
            return
        }
        
        guard button != "+" || result.last != "+" else {
            print("더하기는 연속 입력 불가")
            return
        }
        
        guard button != "-" || result.last != "-" else {
            print("빼기는 연속 입력 불가")
            return
        }
        
        guard button != "*" || result.last != "*" else {
            print("곱하기는 연속 입력 불가")
            return
        }
        
        guard button != "/" || result.last != "/" else {
            print("나누기는 연속 입력 불가")
            return
        }
        
        result += button
        
        if result.first == "0" {
            result.removeFirst()
        }
        
        CalculatorLabel.label.text = result
    }
    
    @objc
    func num0ButtonClicked() {
        resultLabelUpdateByButton(button: "0")
    }
    
    @objc
    func num1ButtonClicked() {
        resultLabelUpdateByButton(button: "1")
    }
    
    @objc
    func num2ButtonClicked() {
        resultLabelUpdateByButton(button: "2")
    }
    
    @objc
    func num3ButtonClicked() {
        resultLabelUpdateByButton(button: "3")
    }
    
    @objc
    func num4ButtonClicked() {
        resultLabelUpdateByButton(button: "4")
    }
    
    @objc
    func num5ButtonClicked() {
        resultLabelUpdateByButton(button: "5")
    }
    
    @objc
    func num6ButtonClicked() {
        resultLabelUpdateByButton(button: "6")
    }
    
    @objc
    func num7ButtonClicked() {
        resultLabelUpdateByButton(button: "7")
    }
    
    @objc
    func num8ButtonClicked() {
        resultLabelUpdateByButton(button: "8")
    }
    
    @objc
    func num9ButtonClicked() {
        resultLabelUpdateByButton(button: "9")
    }
    
    @objc
    func acButtonClicked() {
        resultLabelUpdateByButton(button: "ac")
    }
    
    @objc
    func addButtonClicked() {
        resultLabelUpdateByButton(button: "+")
    }
    
    @objc
    func subButtonClicked() {
        resultLabelUpdateByButton(button: "-")
    }
    
    @objc
    func mulButtonClicked() {
        resultLabelUpdateByButton(button: "*")
    }
    
    @objc
    func divButtonClicked() {
        resultLabelUpdateByButton(button: "/")
    }
    
    @objc
    func resultButtonClicked() {
        if let calculation = calculate(expression: result) {
            result = String(calculation)
            CalculatorLabel.label.text = result
        }
    }
    
    func calculate(expression: String) -> Int? {
        if let result = NSExpression(format: expression).expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}
