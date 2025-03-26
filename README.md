
# 계산기 앱 만들기
![Image](https://github.com/user-attachments/assets/d44a392b-b639-4120-a5ab-a49ce7c36706)
## 1. Project Overview(프로젝트 개요)
- 프로젝트 이름 : nbcampCalculatorWithUI
- 프로젝트 설명 : 내일배움캠프 iOS스타터 과정 4주차 앱개발 입문 주차의 과제인 Swift 언어 학습 결과물

## 2. Key Features (주요 학습내용 및 기능)
1. Lv1 : UILabel의 속성과 AutoLayout을 코드로 작성해서 UI에 표시
2. Lv2 : UIStackView의 속성과 AutoLayout을 코드로 작성해서 가로 스택뷰를 UI에 표시
		- UIStackView안에 버튼 4개 배치
3. Lv3 : UIStackView의 속성과 AutoLayout을 코드로 작성해서 세로 스택뷰를 UI에 표시
		- UIStackView안에 가로 스택뷰 4개 배치
4. Lv4 : UIStackView안에 생성된 UIButton 속성 변경
5. Lv5 : 생성된 UIButton Layer 속성 변경
6. Lv6 : 생성된 숫자입력 UIButton 클릭시 숫자 입력 동작 추가
7. Lv7 : 생성된 초기화 UIButton “AC" 클릭시 모든 값을 지우고 0으로 초기화
8. Lv8 : 생성된 등호 UIButton “="” 클릭시 연산이 수행되도록 구현

## 3. Language
- Swift 5
- Xcode 16.0
- SnapKit

## 4. Libraries/Dependencies
- [**SnapKit (5.7.1)**](https://github.com/SnapKit/SnapKit) : SnapKit은 iOS와 OS X 모두에서 자동 레이아웃을 쉽게 만들 수 있는 DSL(도메인 특화 언어)입니다.

## 5. Project Structure (프로젝트 구조)
```plaintext
nbcampCalculatorWithUI/
├── README.md
├── nbcampCalculatorWithUI
│   ├── AppDelegate.swift
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   ├── Info.plist
│   ├── SceneDelegate.swift
│   └── ViewController.swift
└── nbcampCalculatorWithUI.xcodeproj
    ├── project.pbxproj
    └── project.xcworkspace
        ├── contents.xcworkspacedata
        └── xcshareddata
            └── swiftpm
                ├── Package.resolved
                └── configuration
```