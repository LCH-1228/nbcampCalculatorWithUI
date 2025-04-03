//
//  CalculatorViewController.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/26/25.
//

import UIKit
import SnapKit

class CalculatorViewController: UIViewController, CalculatorViewDelegate {
    
    var result = "0" // 연산 결과 변수
    var calculatorView = CalculatorView() // CalculatorView클래스로 calculator 인스턴스 생성
    var isContainedDot: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorView.delegate = self // calculator 인스턴스의 delegate를 CalculatorViewController로 지정
        print("ViewController가 로딩되었습니다.") // 디버깅을 위한 print()문
    }
    
    override func loadView() {
        super.loadView()
        self.view = calculatorView // CalculatorViewController의 뷰를 calculatorView로 지정
    }
    
    // 버튼클릭시 동작(delegate를 통해 호출)
    func buttonClick(sender: String) {
        // 연산기호에 = 버튼 입력시 예외처리
        guard sender != "=" || (result.last != "+" && result.last != "-" && result.last != "*" && result.last != "/") else {
            printAlert(title: "연산 불가", message: "연산 기호 이후 숫자가 없습니다.", buttonTitle: "확인")
            return
            }
        
        // 버튼 = 입력시 동작
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
            isContainedDot = false
            return
        }
        
        // AC 버튼 입력시 동작
        guard sender != "AC" else {
            result = "0"
            calculatorView.subLabel.text = calculatorView.resultLabel.text
            calculatorView.resultLabel.text = result
            isContainedDot = false
            return
        }
        
        // 초기값 0에 기호 입력시 예외처리
        guard (sender != "+" && sender != "-" && sender != "*" && sender != "/") || result != "0" else {
            printAlert(title: "입력 불가", message: "초기값 0에 기호 입력은 불가능합니다.", buttonTitle: "확인")
            return
        }
        
        let alertCharacter = result.last ?? "0" // 기호입력시 안내 문구 표시를 위한 상수 alertCharacter
        
        // 연산기호 연속 입력시 예외처리
        guard (sender != "+" && sender != "-" && sender != "*" && sender != "/" && sender != ".") || (result.last != "+" && result.last != "-" && result.last != "*" && result.last != "/" && result.last != ".") else {
            printAlert(title: "입력 불가", message: "\(alertCharacter == "0" ? "연산기호" : "\(alertCharacter)") 입력 이후에 \(sender) 입력은 불가능합니다.", buttonTitle: "확인")
            return
        }
        
        //하나의 숫자에 소수점 2개 입력시 예외처리
        guard sender != "." || isContainedDot != true else {
            printAlert(title: "입력 불가", message: "하나의 숫자에 소수점 2개 입력은 불가능합니다..", buttonTitle: "확인")
            return
        }
        
        //소수점 2개 감지를 위한 Bool 타입 isContainedDot 상태 변경
        if sender == "." {
            isContainedDot = true
        }
        
        result += sender // 버튼입력 result에 추가
        
        if result.first == "0" && !result.contains(".") { //첫 입력이 .이 아닐때 0생략
            result.removeFirst()
        }
        
        calculatorView.resultLabel.text = result // reult값을 reulstLabel로 표시
         
        // 연산자 입력 후 소수점 2개 감지를 위한 Bool 타입 isContainedDot 상태 변경
        if sender == "+" || sender == "-" || sender == "*" || sender == "/"{
            isContainedDot = false
        }
    }
    
    // 알럿표시 메서드
    func printAlert(title: String, message: String, buttonTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .cancel))
        self.present(alertController, animated: true)
    }
}
