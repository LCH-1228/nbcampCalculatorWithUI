//
//  CalculatorViewController.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/26/25.
//

import UIKit
import SnapKit

class CalculatorViewController: UIViewController {
    
    var result = "0"
    var calculatorView = CalculatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController가 로딩되었습니다.")
    }
    
    override func loadView() {
        super.loadView()
        
//        var calculatorView = CalculatorView(frame: self.view.frame)
        self.view = calculatorView
    }
    
    
    private func resultLabelUpdateByButton(button: String) {
        guard button != "ac" else {
            result = "0"
//            resultLabel.text = result
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
        
//        resultLabel.text = result
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
//            resultLabel.text = result
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
