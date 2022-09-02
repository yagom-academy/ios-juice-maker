## iOS 커리어 스타터 캠프

### 쥬스 메이커 재고관리 저장소

# 목차

1. [제목](#제목)
2. [소개](#소개)
3. [팀원](#팀원)
4. [타임라인](#타임라인)
5. [프로젝트 구조](#프로젝트-구조)
6. [실행화면](#실행화면)
7. [트러블 슈팅](#트러블-슈팅)
8. [참고 링크](#참고-링크)
9. [개발 환경 및 라이브러리](#💻-개발환경-및-라이브러리)

## 제목
- 쥬스 메이커

## 소개
- 원하는 쥬스의 버튼을 눌러서 쥬스를 주문하는 앱입니다.
- 재고수정을 통해서 재고를 수정할 수 있습니다.

## 팀원
- [Aaron](https://github.com/Hashswim)
- [Ayaan](https://github.com/oneStar92)

## 타임라인
- 2022.08.29
    - 프로젝트 진행에 필요한 공식문서 내용 학습
- 2022.08.30
    - 짝프로그래밍을 통한 Step1 진행
    <img src="https://i.imgur.com/9mrQRbz.jpg" width="800" height="400"/>
    - PR 요청.
- 2022.08.31
    - 1차 코멘트 내용에 대한 토의 후 Refactoring진행
    <img src="https://i.imgur.com/DIszdSa.png" width="800" height="400"/>
    - Refactoring진행 사항 코멘트 작성 및 이해가 안되는 내용 질문.
- 2022.09.01
    - 2차 코멘트 내용에 대한 토의 후 Refactoring진행
    <img src="https://i.imgur.com/9mrQRbz.jpg" width="800" height="400"/>
    - re PR 요청.
- 2022.09.02
    - Step2 진행을 위한 Swift UI학습.
    - README.md 작성

## 프로젝트 구조
- Model
    <img src="https://i.imgur.com/JA6ljkH.png" width="400" height="400"/>
- Controller
 Step2 진행 후 작성.
- View
 Step2 진행 후 작성.
 
## 실행화면
 프로젝트 완료 후 작성할 예정.
 
## 트러블 슈팅
- Dictionary타입에 초기값할당 방법.
 Dictionary타입에 enum을 Key값으로 가질때 모든 case를 어떻게 Dictionary타입에 담을지에 대한 고민을 하였습니다.
 단순히 모든 case를 열거해서 Dictionary에 값을 할당하는 방법은 유지 및 보수에 좋지 않으며 코드의 가독성 또한 좋지 못하다고 판단하여 다른 방법들을 고민하였습니다.
 그러던 중 enum의 모든 case를 Array형으로 제공해주는 CaseIterable 프로토콜에 대해 알게 되었고 CaseIterable을 이용해서 해당 고민을 해결하였습니다.
```swift
enum Fruit: CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
}
```

- 메소드 기능 분리.
 메소드의 기능 분리를 위해 `hasEnoughInventory`메소드를 통해 재고량이 충분한지 검증한 후 `reduceInventory`함수를 호출하는 형태로 코드를 작성하였습니다.
 하지만 `reduceInventory`함수 내에서는 Inventory의 음수에 관련된 예외 처리부분이 존재하지 않는 문제가 발생하였습니다.
 해당 문제를 인지하고 충분한 토의를 통해 조건을 판단하고 연산하는 것은 하나의 기능이라는 결론을 내렸고 `reduceInventory`메소드 내부에서 `hasEnoughInventory`를 통해 조건을 판단한 후 연산을 하는 방식으로 문제를 해결하였습니다.
 
- Naming 관련
    - enum Juice `case strawberryJuice`에서 `case strawberry`로 수정
    Juice의 case임으로 Juice는 의미가 중복되는 네이밍이라고 판단하여 수정하였습니다.

## 참고 링크
https://www.swift.org/documentation/api-design-guidelines/
https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
https://developer.apple.com/documentation/swift/caseiterable

## 💻 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()
