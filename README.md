# ios-juice-maker

> 프로젝트 기간 2022.02.21 ~  </br>
팀원 : [@mmim](https://github.com/JoSH0318) [@marisol](https://github.com/marisol-develop) / 리뷰어 : [@steven](https://github.com/stevenkim18)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
    
## 프로젝트 소개

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## UML
<img width="6112" alt="JuiceMaker STEP2_UML " src="https://user-images.githubusercontent.com/88810018/156316885-de12aa6c-24b2-4045-b3b0-77d737cbf7b5.png">

## 키워드

## [STEP 1]
### 고민한점
- 각각 과일의 재고량을 저장하는 fruitInventory 프로퍼티가 존재한다. 그리고 Juice가 요구하는 과일, 수량이 recipe에서 [Fruit: Int]로 선언되어있다. (필요로 하는 과일 종류가 2가지인 경우가 있어서) Juice를 선택하면 선택된 Juice에 따라 recipe가 필요로하는 과일들과 수량을 제공하고 자동으로 fruitInventory을 차감시키려고 했다. 이 때 어떻게 한 메서드만을 이용하여 선택된 다른 Juice마다 fruitInventory에 변화를 줄지에 대한 고민을 정말 오랜시간 했다.
- Dictionary타입의 타입 프로퍼티를 선언했는데, 이때 타입 프로퍼티의 Initialization에 대한 고민
- JuiceMaker 구조체의 makeJuice() 메서드의 for문 내부에서 value를 사용하지 않는데도 인수를 (key, value) 튜플로 받는 이유가 무엇일까?
```swift
    func makeJuice(by recipe: [Fruit: Int]) throws {
        for (fruit, _ ) in FruitStore.fruitInventory {
            guard let fruitStock = FruitStore.fruitInventory[fruit] else {
                throw ErrorHandling.wrongFormat
            }
            guard let requiredQuantity = recipe[fruit] else {
                continue
            }
            guard fruitStock >= requiredQuantity else { throw ErrorHandling.outOfStock }
            FruitStore.fruitInventory[fruit] = fruitStock - requiredQuantity
        }
    }
```
- 에러 핸들링하는 메서드의 경우 네이밍을 true/false를 나타내는 bool타입으로 지어도 될지 궁금하다.
- 에러 핸들링을 위한 enum 타입의 이름을 ErrorHandling으로 지었는데, 너무 범용적으로 사용되는 이름이라는 생각을 했다.
- JuiceMaker가 struct고 FruitStore가 class인 이유에 대한 고민 (+ 어느 때에 struct와 class를 구분해서 사용하는 것일까?)

### 배운개념
- MVC
- Result 타입
- LocalizedError 프로토콜
---

## [STEP 2]
### 고민한점
#### 과일 재고를 나타내는 Label을 Outlet Collection으로 사용
- 의미가 비슷하고 단순 나열되어 있는 5개의 과일 Label을 하나씩 만들어주지 않고, Outlet Collection으로 만들었습니다. 코드를 간결하게 할 수 있다는 장점이 있어서 Outlet Collection 기능을 사용했습니다.
    
#### 화면 전환을 modal로 선택
- 쥬스를 주문하는 화면에서 재고를 추가하는 화면이 쭉 이어지는 흐름이 아니라고 생각했습니다. 마치 edit과 같은 성격의 화면전환이라 생각했고 modal을 사용하는 것이 적절하다 판단했습니다.
    
#### 여러 IBAction을 하나로 묶어서 사용
- 쥬스 버튼마다 IBAction를 생성할 경우, 비슷한 기능을 하는 IBAction을 7가지를 생성해야 해서 IBAction을 하나로 묶어 하나의 메서드에서 sender를 구분해서 쥬스를 만들도록 했습니다. UIButton마다 tag를 사용해서 구분하였고, switch로 sender.tag를 돌면서 쥬스를 만들고 재고를 업데이트 하도록 했습니다.

#### static을 이용한 singleton pattern 채택
- 과일재고라는 단하나의 자원을 여러 객체에서 공유하는 컨셉이라고 생각했고, 이에 singleton이 적절하다 판단했습니다. 마침 학습활동으로 singleton에 대해 학습했고, 이번 기회에 적용해 사용해보는게 좋을 것 같아 사용했습니다. 이전에 singleton과 static 사용이 미숙하여 좀 더 학습하고 보안해보았습니다. 
   
#### enum OrderError의 사용
- 이번 프로젝트를 보면 error의 종류는 '재고부족', '알수없는 error' 두 가지 밖에 없습니다. 때문에 굳이 error를 enum으로 만들어주어야만 하나...라는 고민을 했습니다. 하지만 주문 버튼을 누르고 주문 과정에서 재고가 있다면 정상 동작해야하고, 재고가 부족하다면 주문 과정을 멈추고 오류를 핸들링해줘야만 했습니다. 이러한 이유로 `enum OrderError: Error {}`가 있어야 우리가 원하는 do-catch로 로직을 구현할 수 있을 거라 판단했습니다.🥲

#### enum Alert의 사용
- Alert을 사용하게 되면서 title과 message를 매직 리터럴을 사용하게 되었고, 만약 프로젝트 규모가 크다면 Alert의 내용을 변경할 때 하나하나 바꿔줘야한다는 생각이 들었습니다. 이 두가지 문제점을 해결하기 위해 enum Alert을 사용하게 됐습니다. 

### 배운개념
- Singleton
- Modality
- H.I.G
- Alert
- Error handling
- NotificationCenter
- IBOutlet
- View Transition(present, navigationController, segue)
- Access control
- UIKit, UIViewController
- Class, Struct

---

## 📜 팀 그라운드 룰

### ✏️ 스크럼
> 스크럼은 딱딱한 분위기보단 자유롭고 부드러운 분위기로 😋
* 매일 아침 10시, 디스코드에서 진행
* 어제의 활동 리뷰
* 오늘 활동 예정 사항 / 목표
* 자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
* 컨디션 공유 😰
* 공유하고 싶은 이슈, 꿀팁 공유
* 스크럼 진행시간은 최대 30분을 넘기지 않기 ⏱
* 상황에 따라 조정 가능

### 🪧 프로젝트
프로젝트 협업 관련된 규칙 ( 지속적으로 업데이트 예정 ) / 야곰캠프에 있는 규칙을 기본으로 🤓

#### **Commit 규칙**
> 커밋 제목은 최대 50자 입력
> 본문은 한 줄 최대 72자 입력

#### **Commit 제목 규칙**
- [chore] : 코드 수정, 내부 파일 수정
- [feat] : 새로운 기능 구현
- [style] : 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
- [add] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
- [fix] : 버그, 오류 해결
- [del] : 쓸모없는 코드 삭제
- [docs] : README나 WIKI 등의 문서 개정
- [mod] : storyboard 파일,UI 수정한 경우
- [correct] : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- [move] : 프로젝트 내 파일이나 코드의 이동
- [rename] : 파일 이름 변경이 있을 때 사용합니다.
- [improve] : 향상이 있을 때 사용합니다.
- [refactor] : 전면 수정이 있을 때 사용합니다
- [merge]: 다른브렌치를 merge 할 때 사용합니다.

#### **Commit Body 규칙**
- 제목 끝에 마침표(.) 금지
- 한글로 작성

#### **태그 이름 규칙**
ex) STEP-start, STEP-PR 

#### **브랜치 이름 규칙**
ex) 5_mmin90, 5_mmin90-2, 5_mmin90-3 


