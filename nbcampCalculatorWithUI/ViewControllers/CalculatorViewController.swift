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
        self.view = calculatorView
    }
    
    func buttonClick(sender: String) {
        /*
        guard sender != "=" else {
            let calculator = Calculator()
            if let calculationResult = calculator.calculate(expression: result) {
                result = String(calculationResult)
                calculatorView.subLabel.text = calculatorView.resultLabel.text
                calculatorView.resultLabel.text = result
            }
            return
        }
        guard sender != "ac" else {
            result = "0"
            calculatorView.subLabel.text = calculatorView.resultLabel.text
            calculatorView.resultLabel.text = result
            return
        }
        guard (sender != "+" && sender != "-" && sender != "*" && sender != "/") || result != "0" else {
            print("0에 기호 추가 불가")
            return
        }
        
        guard sender != "+" || result.last != "+" else {
            print("더하기는 연속 입력 불가")
            return
        }
        
        guard sender != "-" || result.last != "-" else {
            print("빼기는 연속 입력 불가")
            return
        }
        
        guard sender != "*" || result.last != "*" else {
            print("곱하기는 연속 입력 불가")
            return
        }
        
        guard sender != "/" || result.last != "/" else {
            print("나누기는 연속 입력 불가")
            return
        }
        
        result += sender
        
        if result.first == "0" {
            result.removeFirst()
        }
        
        calculatorView.resultLabel.text = result
         */
    }
}
