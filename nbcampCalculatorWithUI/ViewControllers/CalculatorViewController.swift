//
//  CalculatorViewController.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/26/25.
//

import UIKit
import SnapKit

class CalculatorViewController: UIViewController, CalculatorViewDelegate {
    
    var result = "0"
    var calculatorView = CalculatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorView.delegate = self
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
            calculatorView.resultLabel.text = result
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
        
        calculatorView.resultLabel.text = result
    }
    
    @objc
    func resultButtonClicked() {
        if let calculation = calculate(expression: result) {
            result = String(calculation)
            calculatorView.resultLabel.text = result
        }
    }
    
    func calculate(expression: String) -> Int? {
        if let result = NSExpression(format: expression).expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
    func buttonClick(sender: String) {
        resultLabelUpdateByButton(button: sender)
    }
}
