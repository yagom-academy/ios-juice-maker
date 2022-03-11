# 🧃ios-juice-maker

> 📅 프로젝트 기간 2022.02.21 ~ 2022.03.11 </br>
🎓 팀원 : [@mmim](https://github.com/JoSH0318) [@marisol](https://github.com/marisol-develop) / 👑 리뷰어 : [@steven](https://github.com/stevenkim18)

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [UML](#uml)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 3](#step-3)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [트러블슈팅](#트러블슈팅)
- [기술의 장단점](#기술의-장단점)
    
## 프로젝트 소개 및 기능
1️⃣ 쥬스 주문시 재고 차감 후 얼럿 표시
![](https://i.imgur.com/LksXAzw.gif)

2️⃣ 재고 부족시 얼럿 띄우고 재고추가 화면으로 이동
![](https://i.imgur.com/TKovVvj.gif)

3️⃣ 재고수정 버튼 클릭시 재고추가 화면으로 이동
![](https://i.imgur.com/IqYtGA6.gif)


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## UML
<img width="4612" alt="JuiceMaker_UML_STEP3" src="https://user-images.githubusercontent.com/88810018/157645606-09fdfbff-f86d-405c-ad2e-94622356cae6.png">

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

---

## [STEP 3]
### 고민한점
#### Property observer
- A라는 값을 label에 보여지고자 할 때, `label.text = A`라고 직접 넣어주는 방식을 택했습니다. 하지만 A의 값이 변할 때 마다 label 값에 직접 대입해야했고 property observer를 사용해보는 게 어떨까 고민했습니다. 
```swift
let A = 10 {
    didSet {
        label.text = "\(A)"    
    }
}
```
이런 식으로 property observer를 설정해준다면, 주문 또는 stepper의 변화로 인해 A값의 변화를 인지하고 자동으로 label를 갱신이 가능하겠구나 생각했습니다. 하지만 A의 값이 변할때마다 `juiceMaker.fruitStore.inventory`값도 갱신시켜줘야했고, 이러한 이유로 오히려 코드가 길어지고, 복잡해진다는 것을 깨닫고 철회했습니다.

#### Delegation pattern
- OrderViewController와 StockViewController가 서로 과일 재고의 데이터를 주고 받아야 했고, 데이터 전송의 방법 중 notification center와 delegation pattern을 고민해보았습니다. notification center는 특정 이벤트에 대해 알림을 요청한 구독자 모두에게 해당 이벤트가 발생하면 알림 발송해주는데, 일대일로 데이터를 주고 받는 방식에서는 쥬스메이커의 상황에서는 delegation pattern이 적절하다고 생각해서 delegation pattern을 공부해서 사용하게 되었습니다.

#### Dictionary
- 과일의 종류와 해당 과일의 재고를 매칭해서 관리해주기 위해 key로 과일에 접근하면 해당 과일의 재고를 파악할 수 있도록 Dictionary를 선택하게 되었습니다. 하지만 과일의 재고를 확인해야 할 때마다 Dictionary의 key를 통해 접근해야 했기 때문에 항상 optional binding을 해줘야 하는 문제점이 있었습니다. StockViewController의 `showCurrentStock()`메서드 내에서 과일마다 forEach를 돌면서 현재 과일의 재고를 label과 stepper에 세팅해줘야 했고, `strawberryStepper.value = Double(currentStocks[.strawberry] ?? 0)`처럼 Coalesce를 사용하지 않으면 두 번 들여쓰기를 하게 되어, guard let / if let과 고민하던 중, Coalesce를 사용하게 되었습니다.

#### Switch문 & if문
- switch문은 모든 case를 언급하지 않으면 default 구문을 사용해줘야 합니다. 따라서 무결점한 코드가 이뤄지기 어렵다는 단점이 있습니다. 만약 enum 타입과 같이 case가 명확히 정해져있다면 switch문을 통해 각 case를 구현해준다면 무결점한 코드가 되겠지만, 그렇지 않다면 default를 언급해줘야해서 무결점하지 못하다는 것을 알게 됐습니다. 이러한 경우에는 오히려 if-if else문으로 구현하는 것이 좀 더 무결점하다는 생각을 했습니다. 

#### 코드의 간결성 vs 코드의 가독성
- 반복되는 코드를 줄이기 위해 label과 stepper를 outletCollection으로 묶어주었습니다. 그리고 과일의 재고를 표시하는 라벨마다 tag를 붙이고, Fruit 열거형의 rawValue에 원시값을 넣어 tag를 이용해 라벨의 outletCollection에 index로 접근했습니다.
```swift
Fruit.allCases.forEach{ fruit in
    stockLabels[fruit.rawValue].text = currentStocks[fruit]?.description
    stockSteppers[fruit.rawValue].value = Double(currentStocks[fruit] ?? 0)
}
```
이렇게 하면 반복되는 코드가 줄고 매우 간결하게 표현할 수 있다는 장점이 있지만, 과일이 추가될 때마다 tag를 달아줘야하고, 혹시라도 tag과 fruit의 rawValue가 매칭되지 않는 경우에 문제가 발생할 수 있다는 단점이 있는 것 같습니다. 이전 코드보다 매우 간결해졌지만 가독성 부분에서 좋지 않은 것 같다는 생각도 들었습니다.

### 배운개념
- Delegation Pattern
- Auto-Layout
- Property Observer ( didSet )
- Protocol
- UML

---
## 트러블슈팅

---

## 기술의 장단점
- `Dictionary` 형태의 데이터 저장
   - 장점
      - key(과일)값에 따라 각각의 value(재고량)이 존재하여 정보의 매칭이 편리하다.
      - key값만으로 value값에 접근할 수 있다.
   - 단점
      - value값에 접근할 때, nil값에 주의해야한다.(Optional binding과정이 필수)
- `Delegation Pattern`으로 데이터 전달
   - 장점
       - 제3의 객체 없이 데이터 전달이 가능하다. (ex: notification center)
       - 객체간 서로 의존하지 않아 결합도가 낮다.
   - 단점
      - 패턴을 따라야해서 코드가 길어진다.
      - delegate에 nil 값이 들어가지 않도록 주의해야한다.
- `Modality` 화면 전환
    - 장점
        - 현재 작업과 다른 작업을 수행할 때 사용자가 집중하게 할 수 있다.
    - 단점
        - 만약 depth가 깊어진 상황에서 Modality를 사용하면 사용자로 하여금 현재 위치를 파악하기 어려워진다.
        - `Modality`에서 다시 mainVC로 전환될 때, `viewWillDisapear`, `viewWillApear` 등이 호출되지 않아 해당시점에 특정 동작을 제어할 없다.
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

#### **브랜치 이름 규칙**
ex) 5_mmim90, 5_mmim90-2, 5_mmim90-3 



