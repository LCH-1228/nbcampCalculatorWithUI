//
//  ViewController.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/26/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var result = "0"
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
        let buttonSelectorList = ["num7", "num8", "num9", "add",
                                  "num4", "num5", "num6", "sub",
                                  "num1", "num2", "num3", "mul",
                                  "ac", "num0", "result", "div"]
        makeLabel()
        let buttons = makeGreedButtons(buttonTitleList: buttonTitleList, row: 4, column: 4, selectorList: buttonSelectorList)
        let calculationButtons = [buttons[0][3], buttons[1][3], buttons[2][3], buttons[3][0], buttons[3][2], buttons[3][3]]
        let horizontalStackViews = makeHorizontalStackViews(greedButtons: buttons)
        makeVerticalStackView(horizontalStackViews: horizontalStackViews)
        setCalculationButtonCollor(buttons: calculationButtons)
    }
    
    private func makeLabel() {
        resultLabel.text = "\(result)"
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
    
    private func makeGreedButtons(buttonTitleList: [String], row: Int, column: Int, selectorList: [String]) -> [[UIButton]] {
        var rowButtons = [[UIButton()]]
        var columnButtons = [UIButton()]
        rowButtons.remove(at: 0)
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
                button.addTarget(self, action: selector, for: .touchUpInside)
                
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
    
    private func makeVerticalStackView(horizontalStackViews: [UIStackView]) {
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
    }
    
    private func setCalculationButtonCollor(buttons: [UIButton]) {
        for button in buttons {
            button.backgroundColor = .orange
        }
    }
    
    private func resultLabelUpdateByButton(button: String) {
        guard button != "ac" else {
            result = "0"
            resultLabel.text = result
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
        
        resultLabel.text = result
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
            resultLabel.text = result
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
