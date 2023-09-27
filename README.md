# 🤜쥬스 메이커

사용자가 쥬스를 선택하면 과일 재고를 확인하고 
쥬스 레시피에 따라 과일 재고를 소진하여 쥬스를 만든다.
재고가 부족할 시 재고를 수정한 후 쥬스를 만든다.

## 목차

1. [팀원](#1-팀원)
2. [다이어그램](#2-다이어그램)
3. [타임라인](#3-타임라인)
4. [실행 화면(기능 설명)](#4-실행화면기능-설명)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [참고 링크](#6-참고-링크)
7. [팀 회고](#7-팀-회고)

<br>

## 1.팀원

| [Toy](https://github.com/woohyeon3382)  | [uemu](https://github.com/ue-mu) |
| :--------: | :--------: |
|<img src=https://github.com/mireu79/ios-rock-paper-scissors/assets/125941932/b4a69222-b338-4a7f-984c-be5bd78dc1d8 height="150"/> |<img src=https://github.com/mireu79/ios-rock-paper-scissors/assets/125941932/2f6e81f9-f2f4-4830-982f-a513622c3fcc height="200"/> | 

<br>

## 2. 다이어그램
![](https://hackmd.io/_uploads/Syyi4vWep.png)


<br>

## 3. 타임라인
|날짜|내용|
|------|---|
|23.09.12|STEP1 FruitStore와 JuiceMaker타입의 기능 구현<br>`FruitStore에 과일의 재고를 가지고있는 딕셔너리 구현, 과일의 수량을 변경하는 함수 구현`
|23.09.13|STEP1 Pr 피드백 수정 <br> `JuiceMaker에 과일의 재고를 소모하는 함수 구현, 에러타입 선언 및 사용`
|23.09.14 |STEP1 Pr 피드백 수정 <br> `LocalizedError프로토콜을 사용하여 catch한 에러 처리`
|23.09.18|STEP2 초기화면 기능구현<br>`Label Outlet 연결 및 재고를 Label에 표시하는 함수 구현, 주문버튼 동작 함수 구현, 쥬스제조 성공과 실패에 따른 Alert창 구현, 재고 수정 화면으로 화면이동 구현`
|23.09.19|STEP2 Pr 피드백 수정 <br> `불필요한 주석제거 및 네이밍 수정`
|23.09.22|STEP2 재고감소 함수와 유효성 검사 함수 로직 변경|
|23.09.25|STEP3 재고 수정 기능구현 <br> `재고 수정 화면 오토레이아웃 설정, 재고 수정 화면 레이블 연결 및 수량 표시, Stepper를 사용하여 재고 변경 기능 구현, 닫기 버튼을 통해 재고를 업데이트하는 기능 구현`
|23.09.26|STEP3 재고 수정 기능구현 <br> `Stepper를 사용했을때 '-'버튼이 비활성화 되는 문제 해결`
|23.09.27|STEP3 피드백 수정 및 READ ME작성|

## 4. 실행화면(기능 설명)
- 쥬스 주문 시 재고 감소 및 재고 수정 화면이동


| 쥬스 주문 시 얼럿창 이동 | 재고 부족 시 수정 화면으로 이동 |
| :--------: | :--------: |
| <img src=https://github.com/ue-mu/ios-juice-maker/assets/123448121/0a7ee3f1-fddb-4cea-9ded-5b2d6f0d316c> | <img src=https://github.com/ue-mu/ios-juice-maker/assets/123448121/a52824f0-090b-44a4-ba6c-87deaac4a9f0> |


- Stepper를 사용한 재고 수정 및 업데이트


| 재고 수정 | 수정 된 재고 업데이트 |
| :--------: | :--------: |
| <img src=https://hackmd.io/_uploads/ByoaCwWgT.gif height="150"> | <img src=https://hackmd.io/_uploads/SJGHPvdRh.gif> | ![](https://hackmd.io/_uploads/H1Aiew_An.gif)|

  
<br>

## 5. 트러블 슈팅
### 1️⃣ 접근 제어자에 대한 고찰

- 적재 적소에 접근 제어자를 두어 안정성, 모듈화, 유지 보수에 이점을 둔다.
   - 가장 낮은 접근 레벨로 private은 정의한 블록 내부에서만 접근 가능하다.
다음 레벨에는 fileprivate로 하나의 파일 내에서만 접근 가능하며,
그 위로는 기본 접근제어자인 internal은 internal레벨로 선언되면 해당 모듈 전체에서 사용 가능하다.
가장 높은 레벨의 접근 제어자는 open 과 public으로 모듈 외부에서도 접근이 가능하다.
open과 public의 차이 점으로는 open은 다른 모듈에서 오버라이드와 서브클래싱이 가능하지만 public 접근자로 선언된 것은 다른 모듈에서는 오버라이드와 서브클래싱이 불가능 하다.



 

 
### 2️⃣ 유효성 검사로 인한 재고 감소 트러블
 - Dictonary로 인한 유효성 검사 시 딸바 쥬스를 제조할 때 딸기의 제고가 부족함으로 인해 에러 메세지가 출력이 됨에도 바나나의 재고가 감소되는 오류가 있어서 유효성 검사를 JuiceMaker의 manufactureFruitJuice에서 에러를 발생 시키고, ViewController의 manufactureJuice에서 에러를 처리하게 만들었습니다.



<br>

 - 수정 전
~~~ swift
    func reduceFruitQuantity(in fruiJuice: FruitJuice) throws {
        try fruiJuice.juiceRecipe.forEach {(fruit, quantity) in
            guard let number = fruitQuantity[fruit] else { return }
            if checkQuantity(number: number, quantity: quantity) {
                fruitQuantity[fruit] = number - quantity
            } else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
~~~
<br>

~~~swift
struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    func manufactureFruitJuice(in fruitJuice: FruitJuice) {
        do {
            try fruitStore.reduceFruitQuantity(in: fruitJuice)
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }
}
~~~
 - 수정 후
~~~ swift
 func reduceFruitQuantity(fruitJuice: FruitJuice) {
        fruitJuice.juiceRecipe.forEach { (fruit, number) in
            guard let quantity = fruitQuantity[fruit] else { return }
            fruitQuantity[fruit] = quantity - number
        }
    }
~~~
<br>

~~~swift
struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    func manufactureFruitJuice(in fruitJuice: FruitJuice) throws {
        if fruitStore.validateJuiceMaker(fruitJuice: fruitJuice) {
            fruitStore.reduceFruitQuantity(fruitJuice: fruitJuice)
            return
        } else {
            throw JuiceMakerError.outOfStock
        }
    }
}
~~~
### 3️⃣ Back Button
- Navigation Bar로 인해 Back Button이 왼쪽 상단에 생성되어 어떻게 오른쪽에 Back Button 아이템을 구현할지 고민해 봤습니다.
  - Back Button을 오른쪽 상단으로 이동할 수 있는지 찾아보다가 고정되어 있는것을 알고 난 뒤 Back Button을 숨기고 오른쪽 상단에 Bar Button Item을 새로 구현했습니다.
  
<br>

### 4️⃣ UIStepper
- Stepper 에 대한 초기설정에 관련된 코드를 넣어주지 않아서 - 버튼이 활성화되지 않는 문제가 있었습니다.
   -  재고 수정 화면에 접근할 때 과일의 재고를 stepper의 초깃값으로 설정 되도록 수정하여 해결하였습니다. 

- 수정 전
~~~ swift
   private func updateStockToLabel() {
        fruitStore.fruitQuantity.forEach{(key, value) in
            switch key {
            case .strawberry:
                strawberryLabel.text = String(value)
            case .banana:
                bananaLabel.text = String(value)
            case .kiwi:
                kiwiLabel.text = String(value)
            case .mango:
                mangoLabel.text = String(value)
            case .pineapple:
                pineappleLabel.text = String(value)
            }
        }
    }
~~~


 - 수정 후
~~~ swift
 private func updateStockToLabel() {
        fruitStore.fruitQuantity.forEach{(fruit, count) in
            let (label, stepper) = convertFruitsToUIComponents(from: fruit)
            label.text = String(count)
            stepper.value = Double(count)
        }
    }
~~~
### 5️⃣ switch
- ViewController에서 너무 많은 switch문을 사용함으로써 더 큰 프로젝트를 진행할 경우에 유지 보수와 재사용성, 확장성에 어려움이 있다는 것을 깨달은 이후 convertFruitsToUIComponents(from fruit: Fruit) -> (label: UILabel, stepper: UIStepper) 메서드를 사용해서 Label과 Stepper를 튜플 형태로 반환하여 코드의 재사용성을 높였습니다.

~~~ swift
  private func convertFruitsToUIComponents(from fruit: Fruit) -> (label: UILabel, stepper: UIStepper) {
        switch fruit {
        case .strawberry:
            return (strawberryLabel, strawberryStepper)
        case .banana:
            return (bananaLabel, bananaStepper)
        case .kiwi:
            return (kiwiLabel, kiwiStepper)
        case .mango:
           return (mangoLabel, mangoStepper)
        case .pineapple:
           return (pineappleLabel, pineappleStepper)
        }
    }
~~~

<br>

## 6. 참고 링크
[📖 공식문서 Naming](https://www.swift.org/documentation/api-design-guidelines/)<br>
[📖 공식문서 Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)<br>
[📖 공식문서 Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)<br>
[📖 공식문서 Nested Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)<br>
[📖 공식문서 Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/)<br>
[📖 공식문서 Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)


<br>

## 7. 팀 회고
- 😄우리팀이 잘한 점
    - 문제가 생겼을때 여러가지 방향으로 시도해보고 의견조율을 적절하게 하여 시간낭비를 줄일수 있었습니다.
     - 서로의 의견을 자유롭게 말하고 피드백을 줄수 있는 분위기에서 프로젝트를 진행 할 수 있어서 학습하는데 많은 도움이 될수 있었습니다.

<br>

- 😅우리팀이 개선할 점
    - 프로젝트의 문제 해결에 치중하여 학습하는데 시간을 많이 쏟지 못한 것 같습니다.

