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
        guard sender != "=" || (result.last != "+" && result.last != "-" && result.last != "*" && result.last != "/") else {
            print("기호에 = 불가")
            return
            }
        guard sender != "=" else {
            let calculator = Calculator()
            do {
                let calculateResult =  try calculator.calculate(input: result)
                result = calculateResult
                calculatorView.subLabel.text = calculatorView.resultLabel.text
                calculatorView.resultLabel.text = result
            } catch(let error) {
                switch error as! CustomError {
                case .devideZero:
                    printAlert(title: "연산 불가", message: "입력값 중 0을 나눌수 없어\n 입력값을 초기화 했습니다.", buttonTitle: "확인")
                    result = "0"
                    calculatorView.subLabel.text = result
                    calculatorView.resultLabel.text = result
                case .devidedByZero:
                    printAlert(title: "연산 불가", message: "입력값 중 0으로 나눌수 없어\n 입력값을 초기화 했습니다.", buttonTitle: "확인")
                    result = "0"
                    calculatorView.subLabel.text = result
                    calculatorView.resultLabel.text = result
                }
            }
            return
        }
        guard sender != "AC" else {
            result = "0"
            calculatorView.subLabel.text = calculatorView.resultLabel.text
            calculatorView.resultLabel.text = result
            return
        }
        guard (sender != "+" && sender != "-" && sender != "*" && sender != "/") || result != "0" else {
            print("초기값 0에 기호 추가 불가")
            return
        }
        
        guard (sender != "+" && sender != "-" && sender != "*" && sender != "/") || (result.last != "+" && result.last != "-" && result.last != "*" && result.last != "/") else {
            print("연산기호 연속 입력 불가")
            return
        }
        
        result += sender
        
        if result.first == "0" {
            result.removeFirst()
        }
        
        calculatorView.resultLabel.text = result
    }
    
    func printAlert(title: String, message: String, buttonTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .cancel))
        self.present(alertController, animated: true)
    }
}
