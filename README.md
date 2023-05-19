# 🍓🍌🥝 Juice Maker 🍍🥭

> 사용자가 버튼을 통해 쥬스를 주문하면 쥬스에 필요한 과일을 소모하여 쥬스를 제조합니다. 과일의 재고가 부족할 경우 재료 수정 페이지를 통해 부족한 과일 재고를 충전할 수 있습니다.

</br>

## 🗓️ 목차 

1. [팀원](#1.)
2. [타임 라인](#2.)
3. [다이어그램](#3.)
4. [핵심 경험](#4.)
5. [트러블 슈팅](#5.)
6. [실행 화면](#6.)
7. [참고 링크](#7.)


---

</br>

<a id="1."></a>
## 1. 🎩 팀원 👠
|        [myungsun ♌️](https://github.com/myungsun7782)         |        [Karen ♉️](https://github.com/karenyang835)        |
| :----------------------------------------------------------: | :------------------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/74762699?v=4" height="150"/> | <Img src="https://i.imgur.com/auFOXpc.png" width="150"/> |


---
</br>


<a id="2."></a>
## 2. 타임 라인 ⏰
#### Commit 메세지
- 📋[docs]:README나 문서작업
- 🆕[feat]:새로운 기능 구현
- 🪡[style]:스타일 관련 기능(코드의 구조/형태 개선)
- 🛠️[refactor]:전면 수정이 있을 때 사용
- 🔬[fix]:버그, 오류 해결
- 🔀[merge]: 다른 브랜치를 merge 할 때 사용

<details><summary span style="color:black; background-color:#ffff2446; font-size:120%"><b>2주차</b></summary></span> 

|    날 짜    | 내 용                                                        |
| :---------: | ------------------------------------------------------------ |
| 2023.05.15. | 🛠️스토리보드와의 연동을 위해 `Fruit`, `Juice` 열거형의 타입 및 원시값 추가</br>🛠️ 쥬스 주문을 받을 `view`의 `ViewController`명을 `JuiceOrderViewController` 로 변경</br> 🆕 `JuiceOrderViewController`에서 필요한 프로퍼티 생성 및 스토리보드 연동</br>🆕 재고설정 `view`를 컨트롤 해 줄 `StockChangeViewController` 생성 및 `Storyboard`와 연결</br>🆕 `Alert`을 화면에 띄우는 메서드 정의</br>🆕 쥬스 주문이 들어왔을 때 해당 쥬스를 만들어 줄 `orderJuice` 메서드 정의</br> |
| 2023.05.16. | 🪡 코드 컨벤션 수정  </br>🛠️ 화면전환 방식 변경 </br> 🛠️스토리보드 프로퍼티로 사용 </br> |
| 2023.05.17. | 🪡 메서드 호출 순서 변경</br> 🛠️ `JuiceOrderViewController`에서 `juiceMaker`와 `JuiceMaker` 구조체 내에서 `fruitStore` 접근 제어자 변경 </br> 🛠️`JuiceMaker` 구조체에서 `getCurrentStock` 메서드 정의 |


</details>


<!-- <details><summary span style="color:black; background-color:#ffff2476; font-size:120%"><b>3주차</b></summary></span>  -->
</details>


---

</br>

<a id="3."></a>
## 3. 다이어그램
<img src="https://www.planttext.com/api/plantuml/png/fLNRQjj047tNLmnvgGtH3uYG9huaE7KRY9n2AQMifP6zaRmhPbSsxYNVdjsL9KkAJ0t5OE_Ed9bppWoIRvHcf8jDvds0SF5jFZNVjqyBprCf5paZjW6rPh7SSR62X6KAQ-3qoyJpl2XZIi757HLSNm1Ju4vmTGM3wINC-MgjGusOZR82Xu2YsC3rDVm63-1LQMAx9HBjxMt9XFdOKyu5iZpFq5vIlkFsTyF4IeBtjyKOQaau9P9qv3x6pbCX2_sOcA8ejJUqXHDK4V5SSoaWW52JSV-nmVrGy0WTeplzdzlAOClr4JogWMu2zU7JeOmmuZaQcT-T-m1cGl-mYRZ7HE_yEgDpRiQNC66KXiZk2L4CeQogpFY9XS_45eKfsVUmSy7re8qAXZOHhOrwTFCUo2HO7i8hrEE2o23hr06EKLg74ad1iBk8pon5Ecx3NPs9y1B2T5_kmWoqY7J7GEatQ9XlItSXfyEFcB2D1pzBMPl6kKzwL-CZnKXVEUx6KcYIMTPKt9CyPmclbSOedRCbPigkuNdcpcu7BtNpKQ6r50T0UR48_wKUMD0OdgtT6ZaJ7iybYmVEfMQvengx_PKzgWb8o-7g3n6_o6EcyQuZq7No5Ug7Zh85MvMvd51LWooPsdDfeLoN9sJn_jQaz637zJfe0cP25Kd28rwrRE8QApf9vtPqCdlMabg3j9mLwRXGMcxAvzBqt1fbV9cLJ-E973GPxudjXv2JDF9avWXhGtCPiOp_mlZuRco7pkxqFEkPI3Vuhq4Oqnrwtt_tiWx0_C_aMdcdp9kQydLR8z_h-5E1-fwf0BXO8_6JbQSttIZrRb34vX_p3G00" />

---

</br>

<a id="4."></a>
## 4. 핵심 경험 📚
### 1️⃣  과연 `Juice` 타입과 `Fruit` 타입에 `Int` 원시 값을 설정하는 것이 적절할까?

하나의 프로퍼티로 여러 컴포넌트를 관리하고 싶어 `UILabel`(각 과일의 재고를 나타내는 `Label`)과 `UIButton`(각 쥬스를 주문하기 위한 `Button`) 각각을 `IBOutlet Collection`으로 만들어서 사용했습니다. 그래서 `Collection` 안에 있는 컴포넌트들이 어떤 과일과 쥬스를 나타내는지 파악하기 위해서 `Juice` 타입과 `Fruit` 타입에 `Int` 원시 값을 설정해줬습니다. 하지만, `Int`형 원시 값과 `Juice`, `Fruit`과 어떤 연관이 있는지?에 대해 곰곰이 생각해보면 명확한 연관 관계는 없지만, `IBOutlet Collection`에서 각 과일과 쥬스의 순서를 나타내기 위해서는 어쩔 수 없이 열거형에 `Int` 타입에 원시 값을 사용해야 했습니다. 만약, 원시 값을 주지 않는다면 아래와 같이 코드를 작성할 수도 있습니다.

```swift
@IBAction func orderJuice(_ sender: UIButton) {
    let juiceMaker: JuiceMaker = JuiceMaker(fruitStore: fruitStore)
    let juices: [Juice] = [.strawberryBanana, .mangoKiwi, .strawberry, .banana, .pineapple, .kiwi, .mango]
    let selectedJuice = juices[sender.tag]
}
```

위와 같이 `Juice` 타입의 배열을 생성해서 배열에 접근해야 하는데, 이는 개발자로 하여금 실수를 유발할 수도 있고, 시스템 적으로 `IndexOutOfRange` 에러가 발생할 가능성이 생기게 됩니다. 그래서 저희는 결론적으로 `Int`형 원시 값과 `Juice`, `Fruit` 타입의 명확한 연관 관계는 없지만, `IBOutlet Collection`에서 각 과일과 쥬스의 순서를 나타내기 위해 원시 값을 사용하기로 했습니다.


### 2️⃣ 화면 전환 방식은 어떤 방식이 적절할까?
'쥬스 주문 화면' 에서 '재고 추가 화면' 으로 이동할 때 이동 방식에 대해서 고민했습니다. `iOS-Swift`에서 화면을 전환할 때 사용하는 대표적인 2가지 방식으로는 `Navigation(Push & Pop)`과 `Modal(Present & Dismiss)`가 있습니다. 

#### <Navigation(Push & Pop) 방식>
`Navigation(Push & Pop)` 방식은 주로 계층적이고 연속적인 화면 전환에 사용됩니다. 이때, `NavigationController`가 `Navigation Stack` 구조를 사용해 `ViewController`를 관리합니다. 
 예를 들어, 아이폰 설정 앱 내에서 발생되는 이동 방식도 `Navigation` 방식에 해당합니다. 이 방식으로 장점으로는 연관된 화면들을 계층적인 구조로 관리할 수 있고, 계층 구조 안에서 원하는 화면으로 쉽게 돌아갈 수 있습니다. A(화면)->B(화면)->C(화면)으로 이동하고, C화면에서 A화면으로 이동해야 하는 상황에서 `popToViewController(_:animated:)`를 사용해 손쉽게 돌아갈 수 있습니다. 

#### <Modal(Present & Dismiss) 방식>
`Modal(Present & Dismiss)`방식은 현재 화면 위에 새로운 화면을 덮는 방식입니다.이 방식은 다양한 `modalPresentationStyle`과 `modalTransitionStyle` 프로퍼티를 통해 화면을 이동할 수 있지만, `Navigation` 방식과 달리 특정 구조 내에서 관리되는 것이 아니여서 각 `ViewController`들을 관리하기 어렵다는 단점이 있습니다.

#### <결론>
만약, 쥬스 주문 버튼을 눌러서 상세한 주문을 작성하기 위해 뷰를 띄워줘야 한다면 `Navigation(Push & Pop)` 방식이 적절하겠지만, 쥬스를 주문하는 화면과 과일 재고를 주문하는 화면은 다른 흐름을 가지고 있기 때문에 `Modal(Present & Dismiss)` 방식을 사용해 화면전환을 했습니다.


### 3️⃣ 왜 FruitStore는 class이고, JuiceMaker는 Struct일까?
`FruitStore`가 왜 `Class` 로 정의되어 있고, `JuiceMaker`가 왜 `Struct`로 정의되어 있을까?’를 고민해봤습니다. 먼저, `FruitStore`가 `Class`인 이유는 `identity`(주소 값)가 필요하기 때문인 거 같습니다. 만약, `FruitStore`가 구조체 타입이고, A라는 `FruitStore` 타입 인스턴스를 생성하고, B라는 새로운 `FruitStore` 타입 인스턴스에 A 인스턴스를 바인딩한 뒤, A 라는 인스턴스를 통해 과일의 재고를 바꾼 뒤에 B라는 인스턴스 안에 있는 과일 재고를 확인하게 되면 A 인스턴스 안에 있는 과일 재고와 다르기 때문에 동일한 과일 재고로 관리할 수 없게 됩니다. 따라서, `FruitStore`는 `class`로 정의 되야한다고 생각합니다. 반대로 `JuiceMaker`는 `JuiceMaker` 타입의 인스턴스가 생성이 되는 상황에서도 `identity`(주소 값)가 유지되어야 하는 필요성이 없기 때문이라고 생각했습니다.


</br>

<a id="5."></a>
## 5. 트러블 슈팅 🌪️
### 1️⃣ 코드 중복
**1-1.** **UILabel** 

- **문제점**

  - 처음에 각 과일의 재고를 나타내는 `Label`들을 모두 `@IBOutlet` 변수로 생성하여 코드를 작성했으나, `Label`의 `text`를 넣어주는 코드 중복이 많이 발생하고, 각 `Label` 관리가 힘들어지는 문제가 발생했습니다.

  ```swift
  @IBOutlet weak var strawberryStockLabel: UILabel!
  @IBOutlet weak var bananaStockLabel: UILabel!
  @IBOutlet weak var pineappleStockLabel: UILabel!
  @IBOutlet weak var kiwiStockLabel: UILabel!
  @IBOutlet weak var mangoStockLabel: UILabel!
  ```

- **해결 방법**

  - `IBOutlet Collection`을 사용해서 각 과일의 재고를 나타내는 `Label`들을 1개의 `UILabel` 배열로 묶어줬습니다. 이렇게 함으로서 동일한 동작을 수행하는 `UI Component`에 대해 동일한 코드를 작성하는 것을 피할 수 있었습니다.

  ```swift
  @IBOutlet var fruitStockLabels: [UILabel] = []
  ```

**1-2.** **UIButton** 

- **문제점**
  - 각 쥬스에 대한 주문 버튼을 클릭하면 호출되는 `@IBAction` 메서드를 모든 쥬스에 대해 정의해줬으나, 각 쥬스를 주문하는 로직이 중복이 되고, 코드 재사용성이 떨어지는 문제점이 발생했습니다.
      ```swift
      @IBAction func orderStrawberryJuice(_ sender: UIButton) { ... }
      @IBAction func orderBananaJuice(_ sender: UIButton) { ... }
      @IBAction func orderKiwiJuice(_ sender: UIButton) { ... }
      @IBAction func orderPineappleJuice(_ sender: UIButton) { ... }
      @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) { ... }
      @IBAction func orderMangoJuice(_ sender: UIButton) { ... }
      @IBAction func orderMangoKiwiJuice(_ sender: UIButton) { ... }
      ```

- **해결 방법**
  - 하나의 `@IBAction` 메서드를 정의해주고, 각 버튼의 tag 프로퍼티를 다르게 설정하고, 하나의 `@IBAction` 메서드에서 `tag` 프로퍼티 값을 받아 처리하도록 코드를 작성했습니다. `tag` 프로퍼티를 사용함으로서 `IBAction` 메서드 내에서 특정 `UI Component`를 쉽게 찾을 수 있고, `tag` 프로퍼티에 따른 각기 다른 로직을 처리할 수 있었습니다.
    ```swift
    @IBAction func orderJuice(_ sender: UIButton) { ... } 
    ```


### 2️⃣ 캡슐화(Encapsulation)
- **문제점**
    - 처음에 `JuiceOrderViewController`에서 과일의 현재 재고를 가져오기 위해서 `juiceMaker.fruitStore.getCurrentStock(of: fruit)` 와 같은 코드를 작성해 캡슐화가 되지 않았습니다. 이로 인해, 인스턴스 내부 데이터는 일관성을 유지 하지 못할 수도 있고, 나중에 재사용성이 떨어지고, 코드가 바뀌게 되면 이슈가 발생할 가능성이 생겼습니다.

<details>
<summary>코드 상세</summary>


  ```swift
  final class FruitStore {
      private var fruitInventory: [Fruit: Int]
      
     ... 
    
      func getCurrentStock(of fruit: Fruit) -> Int? {
          guard let currentStock = fruitInventory[fruit] else { return nil }
          return currentStock
      }
  }
  
  struct JuiceMaker {
      private(set) var fruitStore: FruitStore
    
     ...
  }
  
  final class JuiceOrderViewController: UIViewController { 
      private let juiceMaker = JuiceMaker(fruitStore: FruitStore(fruitInventory: [.strawberry: 10,
                                                                                  .banana: 10,
                                                                                  .pineapple: 10,
                                                                                  .kiwi: 10,
                                                                                  .mango: 10]))
    
    ...
    
      private func updateFruitStockLabels() {
          for (index, fruitStockLabel) in fruitStockLabels.enumerated() {
              guard let fruit = Fruit(rawValue: index),
                    let fruitCount = juiceMaker.fruitStore.getCurrentStock(of: fruit) else { return }
              fruitStockLabel.text = "\(fruitCount)"
          }
      }
  }
  ```

</details>

- **해결 방법**
    - `JuiceMaker` 구조체 내에서 `fruitStore`의 접근 제어자를 `private(set)`에서 `private`으로 변경하고, `getCurrentStock(of:)` 메서드를 정의한 뒤, 그 안에서 `fruitStore`의 `getCurrentStock(of:)` 메서드를 호출하도록 코드를 작성해 캡슐화를 시켰습니다.

<details>
<summary>코드 상세</summary>

  ```swift
  final class FruitStore {
      private var fruitInventory: [Fruit: Int]
      
    ... 
    
      func getCurrentStock(of fruit: Fruit) -> Int? {
          guard let currentStock = fruitInventory[fruit] else { return nil }
          return currentStock
      }
  }
  
  struct JuiceMaker {
      private let fruitStore: FruitStore
    
    ...
    
     
      func getCurrentStock(of fruit: Fruit) -> Int? {
          return fruitStore.getCurrentStock(of: fruit)
      }
  }
  
  final class JuiceOrderViewController: UIViewController { 
      private let juiceMaker = JuiceMaker(fruitStore: FruitStore(fruitInventory: [.strawberry: 10,
                                                                                  .banana: 10,
                                                                                  .pineapple: 10,
                                                                                  .kiwi: 10,
                                                                                  .mango: 10]))
  
     ...
    
      private func updateFruitStockLabels() {
          for (index, fruitStockLabel) in fruitStockLabels.enumerated() {
              guard let fruit = Fruit(rawValue: index),
                    let fruitCount = juiceMaker.getCurrentStock(of: fruit) else { return }
              fruitStockLabel.text = "\(fruitCount)"
          }
      }
  }
  ```
</details>

---

</br>


<a id="6."></a> 
## 6. 실행 화면📱
- 특정 과일 쥬스 주문 버튼을 누르면 현재 과일의 재고에 따라서 `Alert`이 화면에 나타난다.
    - 해당 과일 쥬스를 만들기 위해서 필요한 과일이 충분한 경우
    
      <br/>
      <img src="https://github.com/yagom-academy/ios-juice-maker/assets/74762699/781f411a-3b5f-4e36-802a-0a48fd532c4e" style="zoom:50%;" />
    
      <br/>
    
    - 해당 과일 쥬스를 만들기 위해서 필요한 과일이 부족한 경우 
    <br/>
    <img src="https://github.com/yagom-academy/ios-juice-maker/assets/74762699/f0c2b5a2-10ff-463e-80eb-4e23155bc26d" style="zoom:50%;" />
    
    
---
</br>

<a id="7."></a> 

## 7. 참고 링크 ⛓️
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [The Swift Language Guide - Preventing Overrides](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/#Preventing-Overrides)
- [The Swift Language Guide - Result Type](https://developer.apple.com/documentation/swift/result)
- [The Swift Language Guide - Properties](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/)
- [The Swift Language Guide - Structures and Classes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/)
- [The Swift Language Guide - Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)
- [Apple Developer - UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)

---

</br>