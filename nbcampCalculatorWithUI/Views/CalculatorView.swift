//
//  MainView.swift
//  nbcampCalculatorWithUI
//
//  Created by Chanho Lee on 3/27/25.
//

import UIKit

protocol CalculatorViewDelegate: NSObject {
    func buttonClick(sender: String)
}

class CalculatorView: UIView {
    
    var delegate: CalculatorViewDelegate? //CalculatorViewDelegate를 dlegate 변수로 지정
    
    let resultLabel = CalculatorLabel(title: "0") //resultLabel 생성
    let subLabel = SubCalculatorLabel(title: "0") //subLabel 생성
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("View가 로딩되었습니다.") // 디버깅을 위한 print()문
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setLabel() // Label 설정
        drawButton() // Button 생성
    }
    
    private func setLabel() {
        
        // resultLabel view에 표시
        self.addSubview(resultLabel)
        
        // resultLabel constraints 설정
        resultLabel.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).inset(30)
            $0.trailing.equalTo(self.snp.trailing).inset(30)
            $0.top.equalTo(self.snp.top).inset(200)
        }
        
        // subLabel view에 표시
        self.addSubview(subLabel)
        
        // subLabel constraints 설정
        subLabel.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).inset(30)
            $0.trailing.equalTo(self.snp.trailing).inset(30)
            $0.bottom.equalTo(resultLabel.snp.top)
        }
    }
    
    private func drawButton() { // 버튼생성
        
        // 숫자버튼 리스트
        let numButtonList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
        
        // 숫자버튼 생성(배경색: 검정)
        let numButtons: [CalculatorButton] = numButtonList.map {
            CalculatorButton(title: $0)
        }
        
        // 숫자버튼 클릭시 buttonClicked 호출
        numButtons.forEach {
            $0.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        }
        
        // 기능버튼 리스트
        let funcButtonList = ["+", "-", "*", "÷", "=", "AC"]
        
        // 기능버튼 생성(배경: 오렌지)
        let funcButtons: [OrangeCalculatorButton] = funcButtonList.map {
            OrangeCalculatorButton(title: $0)
        }
        
        // = 버튼 제약 조건 삭제
        funcButtons[4].snp.removeConstraints()
        
        // 기능버튼 클릭시 buttonClicked 호출
        funcButtons.forEach {
            $0.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        }
        

        // 버튼으로 horizontalStackView 생성
        let firstHorizontalStackView = CalculatorHorizontalStackView(
            axis: .horizontal,
            addArrangedSubview: [
                numButtons[7], numButtons[8], numButtons[9], funcButtons[0] //7, 8, 9, + 버튼
            ])
        let secondHorizontalStackView = CalculatorHorizontalStackView(
            axis: .horizontal,
            addArrangedSubview: [
                numButtons[4], numButtons[5], numButtons[6], funcButtons[1] //4, 5, 6, - 버튼
            ])
        let thirdHorizontalStackView = CalculatorHorizontalStackView(
            axis: .horizontal,
            addArrangedSubview: [
                numButtons[1], numButtons[2], numButtons[3], funcButtons[2] // 1, 2, 3, * 버튼
            ])
        let fourthHorizontalStackView = CalculatorHorizontalStackView(
            axis: .horizontal,
            addArrangedSubview: [
                funcButtons[5], numButtons[0], numButtons[10], funcButtons[3] // AC, 0 , ., / 버튼
            ])
        let fifthHorizontalStackView = CalculatorHorizontalStackView(
            axis: .horizontal,
            addArrangedSubview: [funcButtons[4]] // = 버튼
        )
        

        // horizontalStackView로 verticalStackView 생성
        let verticalStackview = CalculatorStackView(
            axis: .vertical,
            addArrangedSubview: [
                firstHorizontalStackView,
                secondHorizontalStackView,
                thirdHorizontalStackView,
                fourthHorizontalStackView,
                fifthHorizontalStackView
            ])
        
        // verticalStackview view에 표시
        self.addSubview(verticalStackview)
        
        // verticalStackview constainrs 설정
        verticalStackview.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(resultLabel.snp.bottom).offset(60)
        }
    }
    
    // 버튼클릭시 동작
    @objc private func buttonClicked(sender: UIButton) {
        delegate?.buttonClick(sender: sender.currentTitle ?? "") //delegate에게 buttonClick 요청
    }
    
}
