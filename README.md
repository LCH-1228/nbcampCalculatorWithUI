
# nbcampCalculatorWithUI

nbcampCalculatorWithUI는 Swift 학습을 목적으로 작성된 iOS용 계산기 애플리케이션입니다.

---

<p align="center">
  <img src="https://github.com/LCH-1228/nbcampCalculatorWithUI/blob/develop/Docs/SampleImage.png?raw=true" alt="SwiftCalculator Screenshot" width="300">
</p>

## 1. 프로젝트 개요

- **프로젝트 이름**: nbcampCalculatorWithUI  
- **설명**: 내일배움캠프 iOS 스타터 과정 4주차 앱 개발 입문 주차의 과제로, Swift 언어 학습의 결과물입니다.  
- **목표**: UIKit을 활용한 UI 구성, AutoLayout 적용, 사용자 인터랙션 구현 등 iOS 앱 개발 기초 학습

---

## 2. 기술 스택

### 언어 및 도구
- Swift 5
- Xcode 16.0
- SnapKit

### 아키텍처
- MVC 구조 기반: View / Controller / Model 분리

### UI 구성
- UIKit
- UILabel, UIButton, UIStackView
- AutoLayout (SnapKit 활용)

### 연산 및 처리 로직
- `Calculator.swift`: 계산 상태 및 입력 흐름 관리
- `Calculation.swift`: 실제 사칙연산 로직
- `CustomError.swift`: 사용자 정의 에러 타입 정의
- `CalculatorButton`, `CalculatorLabel`, `CalculatorStackView`: 커스텀 UI 컴포넌트

---

## 3. 주요 기능 및 학습 내용
1. **Lv1**: UILabel과 AutoLayout을 코드로 구성하여 화면에 출력  
2. **Lv2**: 가로 UIStackView 생성 및 내부에 UIButton 4개 배치  
3. **Lv3**: 세로 UIStackView 생성 및 내부에 Lv2에서 만든 스택뷰 4개 배치  
4. **Lv4**: 스택뷰 내부 UIButton 속성 설정  
5. **Lv5**: UIButton의 Layer 속성 설정 (둥글기 등)  
6. **Lv6**: 숫자 버튼 클릭 시 숫자가 화면에 표시되도록 구현  
7. **Lv7**: “AC” 버튼 클릭 시 값 초기화  
8. **Lv8**: “=” 버튼 클릭 시 실제 연산 수행
9. **기타사항** : 버튼입력 예외처리, 연산 로직 직접 작성
---

## 4. 사용 라이브러리

- [**SnapKit (v5.7.1)**](https://github.com/SnapKit/SnapKit)  
  iOS와 macOS에서 AutoLayout을 쉽게 구성할 수 있도록 도와주는 DSL(도메인 특화 언어)  입니다.

---

## 5. Project Structure (프로젝트 구조)
```plaintext
nbcampCalculatorWithUI/
├── Docs
│   └── SampleImage.png
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
│   ├── Model
│   │   ├── Calculation.swift
│   │   ├── Calculator.swift
│   │   └── CustomError.swift
│   ├── SceneDelegate.swift
│   ├── UIElement
│   │   ├── CalculatorButton.swift
│   │   ├── CalculatorLabel.swift
│   │   └── CalculatorStackView.swift
│   ├── ViewControllers
│   │   └── CalculatorViewController.swift
│   └── Views
│       └── CalculatorView.swift
├── nbcampCalculatorWithUI.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   └── xcshareddata
│   │       └── swiftpm
│   │           ├── configuration
│   │           └── Package.resolved
│   └── xcshareddata
│       └── xcschemes
│           └── nbcampCalculatorWithUI.xcscheme
├── nbcampCalculatorWithUITests
│   └── nbcampCalculatorWithUITests.swift
└── README.md
```

---

## 6. 설치 및 실행 방법

1. Git clone 명령어로 저장소를 복사합니다

```bash
git clone https://github.com/YourUsername/nbcampCalculatorWithUI.git
```

2. Xcode를 사용하여 해당 프로젝트를 열어 실행합니다.