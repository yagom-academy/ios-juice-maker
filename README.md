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
8. [팀 회고](#8.)


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

## 2. ⏰ 타임 라인

#### Commit 메세지

- 📋[docs]:README나 문서작업
- 🆕[feat]:새로운 기능 구현
- 🪡[style]:스타일 관련 기능(코드의 구조/형태 개선)
- 🛠️[refactor]:전면 수정이 있을 때 사용
- 🔬[fix]:버그, 오류 해결
- 🔀[merge]: 다른 브랜치를 merge 할 때 사용

<details><summary span style="color:black; background-color:#23ff2921; font-size:120%"><b>1주차</b></summary></span> 


|    날 짜    | 내 용                                                        |
| :---------: | :----------------------------------------------------------- |
| 2023.05.08. | 📝코드 구조 및 협의                                           |
| 2023.05.09. | 🆕 과일의 재고를 관리하는 `FruitStore` 타입과 과일 쥬스를 제조하는 `JuiceMaker`타입을 정의 후 `initializer` 설정</br>🆕 과일의 재고 수량을 갱신 해주는 기능 추가</br>🆕 현재 남아있는 과일의 수량을 알려주는 기능 추가</br> 🆕 해당 쥬스를 만들 수 있는지 체크하는 기능 추가</br>🆕 쥬스를 만드는 기능 추가 |
| 2023.05.10. | 🪡 불필요한 주석 제거 및 `creator수정`</br> 🛠️ 전체적으로 어색한 네이밍 수정</br> 🛠️ `FruitStore` 생성자 수정</br> 🛠️ `canMake에` 옵셔널 바인딩 추가</br> 🛠️ `enum` 파일들을 `Model` 디렉토리로 위치 변경 |
| 2023.05.12. | 🛠️ 반환되어지는 오류 타입 변경(`throws`-> `Result`로 변경)</br> 🛠️ 과일의 재고 수량을 갱신 해주는 기능 추가</br> 🛠️ `FruitStore` 클래스 `Preventing Overrides` 처리 및 기능 분리</br> 📋 1주차 `README` 작성 |

</details>

<details><summary span style="color:black; background-color:#d2ffd2; font-size:120%"><b>2주차</b></summary></span> 


|    날 짜    | 내 용                                                        |
| :---------: | ------------------------------------------------------------ |
| 2023.05.15. | 🛠️스토리보드와의 연동을 위해 `Fruit`, `Juice` 열거형의 타입 및 원시값 추가</br>🛠️ 쥬스 주문을 받을 `view`의 `ViewController`명을 `JuiceOrderViewController` 로 변경</br> 🆕 `JuiceOrderViewController`에서 필요한 프로퍼티 생성 및 스토리보드 연동</br>🆕 재고설정 `view`를 컨트롤 해 줄 `StockChangeViewController` 생성 및 `Storyboard`와 연결</br>🆕 `Alert`을 화면에 띄우는 메서드 정의</br>🆕 쥬스 주문이 들어왔을 때 해당 쥬스를 만들어 줄 `orderJuice` 메서드 정의</br> |
| 2023.05.16. | 🪡 코드 컨벤션 수정  </br>🛠️ 화면전환 방식 변경 </br> 🛠️스토리보드 프로퍼티로 사용 </br> |
| 2023.05.17. | 🪡 메서드 호출 순서 변경</br> 🛠️ `JuiceOrderViewController`에서 `juiceMaker`와 `JuiceMaker` 구조체 내에서 `fruitStore` 접근 제어자 변경 </br> 🛠️`JuiceMaker` 구조체에서 `getCurrentStock` 메서드 정의 |
| 2023.05.19. | 📋 2주차 `README` 작성                                        |


</details>


<details><summary span style="color:black; background-color:#aaebaa; font-size:120%"><b>3주차</b></summary></span> 


|    날 짜    | 내 용                                                        |
| :---------: | ------------------------------------------------------------ |
| 2023.05.22. | 🛠️ `FruitStoreError` 열거형에서 `Error` 프로토콜 삭제</br> 🆕 `JuiceMaker` 구조체와 `FruitStore` 클래스에 캡슐화 된 `getFruitStore`, `update` 메서드 추가</br> 🆕 `StockChangeViewController에서` 관련 컴포넌트 연결 및 `fruitStore` 프로퍼티 추가 </br>  🆕 `StockChangeViewController`에서 `Stepper` 기능 구현</br> 🆕 `StockChangeViewController`에서 과일 재고를 업데이트 해주는 기능 구현 </br> 🆕 `StockChangeDelegate` 프로토콜 선언</br> 🆕 과일 재고 데이터를 주고 받기 위해 `delegate패턴` 적용</br> 🆕 `StockChangeViewController`를 닫아줄 `tapCloseButton` 메서드 구현</br>🆕 `StockChangeViewController`에서 `Autolayout` 설정 </br> |
| 2023.05.23. | 🛠️ `JuiceOrderViewController에서` 파인애플쥬스 주문 버튼 글자 크기 축소 |
| 2023.05.24. | 🛠️ `navigationController` 인스턴스 생성 방법 수정</br> 🛠️ 부적절한 네이밍 된 함수명 네이밍 변경 </br> 🛠️ `FruitStore`와 `JuiceMaker`에서 불필요한 `update` 메서드 삭제 |
| 2023.05.25. |                                                              |
| 2023.05.26. | 📋 3주차 README 작성                                          |

</details>

---

</br>

<a id="3."></a>

## 3.📊 다이어그램

![](https://github.com/myungsun7782/TIL/assets/74762699/2978717f-46f1-4514-9151-9d2850835bfc)



---

</br>

<a id="4."></a>

## 4. 🤔 고민한 부분

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


### 4️⃣ DelegatePattern을 어떻게 활용하면 좋을까?

- '쥬스 주문' 화면에서 '재고 추가' 화면으로 이동한 뒤, 과일 재고를 수정하고 '쥬스 주문' 화면으로 돌아가 각 과일의 재고를 갱신해줄 때 `Delegate Pattern`을 사용했습니다. 처음 `Delegate Pattern`을 사용할 때 어느 뷰 컨트롤러가 위임을 하는 녀석이고, 어느 뷰 컨트롤러가 위임을 받는 녀석인지 구분하는 것이 헷갈렸습니다. 그런데, 조금 더 공부를 하다보니 명확해졌습니다. 
- 현재 상황에서 `StockChangeViewController`는 과일의 재고를 변경하는 일을 `JuiceOrderViewController`에게 위임을 하는 녀석이고, `JuiceOrderViewController`는 `StockChangeViewController`으로부터 위임을 받아 과일의 재고를 변경하는 일을 실제로 수행하는 녀석이라는 결론을 내렸습니다. 이렇게 **위임을 하는 녀석과 위임을 받는 녀석으로 구분함으로서 특정 클래스나 구조체가 수행해야 하는 작업을 다른 클래스나 구조체로 분리**할 수 있고, 이것이 각 클래스나 구조체가 자신의 책임 범위 내에서 독립적으로 작동하여 코드 관리가 용이해지게 된다는 사실도 깨달았습니다.

### 5️⃣ '재고 추가' 화면에 Navigation Controllers가 embed 되었을까?

- '재고 추가' 화면에 왜 `Navigation Controller`가 `embed` 되었는지 고민해봤습니다. 확실하지는 않지만, 추후에 '재고 추가' 화면과 같은 흐름의 화면들을 `Navigation Stack`을 이용하여 관리해주고, 쥬스 주문 화면과 다른 흐름의 화면 임을 명시해주기 위해서 `Navigation Controller` 를 embed 한 거 같습니다.

### 6️⃣ `weak`키워드를 사용하는 이유는 무엇인가?

- `Delegate Pattern`을 사용할 때 `AnyObject`, `weak` 키워드를 사용하게 되는데, 왜 사용하는지에 대해서 고민을 해봤습니다. 특정 프로토콜이 클래스 전용 프로토콜로 선언하기 위해서 `AnyObject`를 사용한다고 공부했습니다. `AnyObject`를 채택한 프로토콜은 구조체, 열거형에서 채택하여 사용할 수 없습니다. 그리고 `weak` 키워드는 강한 참조 사이클로 인한 메모리 누수를 해결하기 위해서 사용한다고 알고 있습니다. 만약 `weak` 키워드가 없다면, `StockChangeViewController`가`delegate` 프로퍼티를 통해서 `JuiceOrderViewController`를 가르키고(`Reference Count`가 증가하고), `JuiceOrderViewController도 StockChangeViewController` 를 가리키게 된다면(`Reference Count`가 증가한다면) ` JuiceOrderViewController`와 `StockChangeViewController`가 서로를 참조하는 상황이 발생할 수도 있기 때문에 강한 참조 사이클이 발생하여 변수의 참조에 `nil`을 할당해도 메모리에 해제가 되지 않는 메모리 누수의 상황이 발생할 수도 있다는 생각을 했습니다. 그래서 `weak` 키워드를 붙여줌으로서 가르키는 인스턴스의 `Reference Count`의 숫자를 올라가지 않도록 해야한다고 생각했습니다.

</br>

<a id="5."></a>

## 5. 🚨 트러블 슈팅

### 1️⃣ 기능 분리

- #### 문제점

  - `FruitStore` 클래스 내 `changeStock` 메서드는 재고를 변경하는 기능인데, 재고를 확인하는 기능까지 수행하고 있었습니다.

- #### 해결 방법

  - 재고를 수행하는 기능인 `checkStock` 메서드를 `FruitStore` 클래스에 새로 생성해서 기능을 분리했습니다.

<details>
<summary>코드 상세</summary>   

#### 수정 전

```swift
func changeStock(of fruit: Fruit, by quantity: Int) {
    guard let currentStock = fruitInventory[fruit],
           currentStock + quantity >= 0 else { return }
    fruitInventory[fruit] = currentStock + quantity
}
```

#### 수정 후

```swift
func changeStock(of fruit: Fruit, by quantity: Int) {
    guard let currentStock = fruitInventory[fruit] else { return }
    fruitInventory[fruit] = currentStock + quantity
}

func checkStock(of fruit: Fruit, for amount: Int) -> Bool {
    guard let currentStock = fruitInventory[fruit],
              currentStock >= amount else { return false }
    return true
}
```

</details>

### 2️⃣ 코드 컨벤션 

- #### 문제점 

  - 페어 프로그래밍을 진행할 때 코드 컨벤션에 관한 문제점이 있었습니다. 특히, 명확하지 않은 네이밍과 타입 선언 통일성이 맞지 않음으로서 코드의 가독성에 문제가 생겼습니다.

- #### 해결 방법

  - [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)를 참고하여 문제를 해결했습니다.

<details>
<summary>코드 상세</summary>


- Dictionary 선언 컨벤션 불일치

```swift
// 수정 전
private var fruitInventory: [Fruit: Int] = Dictionary<Fruit, Int>()

// 수정 후 
private var fruitInventory: [Fruit: Int] = [:]
    
```

- 에러 메시지 네이밍

```swift
// 수정 전 
enum FruitStoreError: Error {
    case insufficientError
}

// 수정 후 
enum FruitStoreError: Error {
    case outOfStock
}
    
```

- 메서드 네이밍

```swift
// 1-1 update 메서드 
// 수정 전 
func update(_ fruit: Fruit, by quantity: Int) {}

// 수정 후 
func changeStock(of fruit: Fruit, by quantity: Int) {}

// 1-2 canProduceJuice 메서드
// 수정 전 => 메서드를 봤을 때 can produce juice juice로 읽히게 됩니다.
func canProduceJuice(_ juice: Juice) -> Bool {}

// 수정 후 
func canMake(_ juice: Juice) -> Bool {} 

// 1-3 produceJuice 메서드
// 수정 전
func produceJuice(_ juice: Juice) -> Juice? {}

// 수정 후 
func make(_ juice: Juice) -> Juice? {}
    
```

</details>
    

### 3️⃣ 에러 타입 변경 

- #### 문제점 

  - `JuiceMaker` 구조체 내 `make` 메서드에서 `canMake(juice)`가 true일 경우에는 `try fruitStore.changeStock(of: fruit, by: -amount)` 메서드는 절대 에러를 던지지 않는 문제가 발생했습니다. 

- #### 해결 방법

  - `Result` 타입을 사용해서 `case .success`와 `case .failure`에 따라 에러를 처리하는 코드로 수정하여 문제를 해결했습니다.

<details>
<summary>코드 상세</summary>


#### 수정 전

```swift
func make(_ juice: Juice) throws -> Juice? {
    if canMake(juice) {
        for (fruit, amount) in juice.recipe {
            try fruitStore.changeStock(of: fruit, by: -amount)
        }
        return juice
    }
    return nil
}
```

#### 수정 후

```swift
func make(_ juice: Juice) -> Result<Juice, FruitStoreError> {
    let result = canMake(juice)
    
    switch result {
    case .success(_):
        for (fruit, amount) in juice.recipe {
            fruitStore.changeStock(of: fruit, by: -amount)
        }
        return .success(juice)
    case .failure(let error):
        return .failure(error)
    }
}
```

</details>

### 4️⃣ 코드 중복

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

### 5️⃣ 캡슐화(Encapsulation)

- **문제점**
  - 처음에 `JuiceOrderViewController`에서 과일의 현재 재고를 가져오기 위해서 `juiceMaker.fruitStore.getCurrentStock(of: fruit)` 와 같은 코드를 작성해 캡슐화가 되지 않았습니다. 이로 인해, 인스턴스 내부 데이터는 일관성을 유지 하지 못할 수도 있고, 나중에 재사용성이 떨어지고, 코드가 바뀌게 되면 이슈가 발생할 가능성이 생겼습니다.
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

### 6️⃣ 화면 전환 (NavigationItem이 보이지 않는 문제)

- **문제점**
  - 처음에 '쥬스 주문' 화면에서 '재고 추가' 화면으로 이동할 때 StockChangeViewController으로 present를 했는데 이렇게 하니깐 Navigation Item 부분이 보이질 않았습니다. 현재 Storyboard에서 StockChangeViewController은 Navigation Controller가 embed 된 상태였기 때문에 StockChangeViewController으로 present를 해주게 되면 Navigation Controller가 embed 되지 않은 상태로 화면에 나타났습니다.  
- **해결 방법**
  - UINavigationController 인스턴스를 생성한 뒤, 해당 인스턴스로 present를 해줘야 문제가 해결됐습니다.

<details>
<summary>코드 상세</summary>


**수정 전 코드**

```swift
    private func presentStockChangeViewController() {
    guard let stockChangeViewController = storyboard?.instantiateViewController(withIdentifier: "StockChangeViewController") as? StockChangeViewController else { return }
  
    present(stockChangeViewController, animated: true)
}
```

**수정 후 코드**

```swift 
private func presentStockChangeViewController() {
    guard let stockChangeViewController = storyboard?.instantiateViewController(withIdentifier: "StockChangeViewController") as? StockChangeViewController else { return }
    let navigationController = UINavigationController(rootViewController: stockChangeViewController)
        
    present(navigationController, animated: true)
}
```

</details>

### 7️⃣ 재고 추가 화면에서 잘못된 Autolayout 설정

- **문제점** 
  - 처음에 전체 StackView에 각 컴포넌트들을 넣은 상태로 CenterX, CenterY만 맞춰주는 것으로 레이아웃을 잡아줘서 작은 화면의 디바이스를 사용하는 경우에 왼쪽, 오른쪽 부분이 잘리는 부분이 발생했습니다. 

<img src="https://media.discordapp.net/attachments/1105069664570183740/1111214160294973450/240643618-d387512b-21cf-4684-b59f-24e84493a317.png" style="zoom:50%;" />

- **해결 방법**

  - `leading`, `trailing` 방향으로 제약 조건을 주고, StackView Distribution 프로퍼티를 `Fill Equally` 으로 설정한 뒤, 각 `Stepper`를 `Label`과 `Equal Width` 로 만들어서 문제를 해결했습니다.

  <img src="https://github.com/yagom-academy/ios-juice-maker/assets/74762699/755ee854-4f2a-45a2-a33a-33d7e9e456ed" style="zoom:50%;" />

---

</br>

<a id="6."></a> 

## 6.📱실행 화면

<br/>**특정 과일 쥬스 주문 버튼을 누르면 현재 과일의 재고에 따라서 `Alert`이 화면에 나타납니다.**

- 해당 과일 쥬스를 만들기 위해서 필요한 과일이 충분한 경우 

  - 기존 과일의 재고를 사용해서 쥬스를 제조합니다.

- 해당 과일 쥬스를 만들기 위해서 필요한 과일이 부족한 경우

  - '재고 추가 화면'으로 이동한 뒤 부족한 과일의 재고를 충전합니다.

  <br/><img src="https://github.com/myungsun7782/TIL/assets/74762699/2328ec33-9837-450c-b3c6-ea48f36f7e50" style="zoom:43%;" />

---

</br>

<a id="7."></a> 

## 7. ⛓️ 참고 링크

- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [The Swift Language Guide - Preventing Overrides](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/#Preventing-Overrides)
- [The Swift Language Guide - Result Type](https://developer.apple.com/documentation/swift/result)
- [The Swift Language Guide - Properties](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/)
- [The Swift Language Guide - Structures and Classes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/)
- [The Swift Language Guide - Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)
- [The Swift Language Guide - Delegation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/#Delegation)
- [Apple Developer - UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)

---

</br>

<a id="8."></a>

## 8. 💌 팀 회고

### 👏🏻 우리팀이 잘한 점

- 이유가 있는 코드를 작성하려고 노력했습니다.
  - 중요한 시점마다 선택의 기로에 섰을때마다 더 나은 방법이 무엇일지 해당 상황에 맞게 적용하려고 노력했습니다.
- 문서 작성을 꼼꼼하게 하려고 노력했습니다. 
- 둘 다 이해하는 코드를 바탕으로 프로젝트를 진행했습니다.


### 👊🏻 우리팀이 개선할 점

- 조금 더 코드를 작성할 때 깊은 고민을 했어야 했는데 미션 일정을 맞추고 싶어서 놓쳤던 부분인 것 같습니다.
- 공식 문서를 더 꼼꼼하게 읽고 기본기를 더 탄탄히 다져야 될 것 같습니다. 


</br>
    

### 💜 서로에게 좋았던 점 피드백

#### Dear. myungsun

- 코드 작성과 분석이 빠르고 기억력이 좋습니다.👍🏻
- 꼼꼼한 성격이시고 한 번 알려드린 사항은 꼭 지키시려고 하셨고 계속 인지해서 습관화 하시려는 부분이 배워야 될 점인것 같습니다.
- 2번의 프로젝트를 거쳐오면서 아쉬웠던 점이나 피드백 받은 사항에 대해 개선하고 발전해나가시려는 모습이 좋았습니다.
- 아낌 없이 조언해주고 경험을 토대로 방법을 알려주시면서 잘 이끌어주셨습니다.(공부 방향 제시를 해주었습니다.)
- 자아성찰을 할 수 있게 해주시고, 한 단계 성장하는데 많은 도움을 받았습니다. 
- 학구열이 높으시고 막히는 부분이 생겼을 때 계속해서 고민하고 찾아보시면서 해결해나가시려는 모습이 멋졌습니다.
  - 본질적인것을 잘 파악하시고 의문점을 자주 제기하셔서 잘 찾아나가시는 것 같습니다.

#### Dear. Karen

- 프로젝트를 할 때 제가 시간 변동될 일이 많았었는데, 카렌은 그 때마다 매번 잘 맞춰주셔서 너무 감사합니다.
- 프로젝트를 진행하는 동안 저를 너무 많이 배려해주셔서 감사합니다.
- 프로젝트를 할 때 그냥 넘어가지 않고 끝까지 이해하려고 하시는 모습이 너무 좋았습니다.
- 문서 작성을 너무 잘 하셔서 문서 작성하는 방법을 많이 배웠습니다.

</br>
    

### :pray: 서로에게 아쉬웠던 점 피드백

#### Dear. myungsun

- 다음 프로젝트에서 못 만나는게 아쉬운점인 것 같습니다.
- 아쉬운거라고 한다면 제가 조금 더 성장했을 때 다시 한번 더 뵙고 싶습니다. 배울 점이 많고 학구열이 높은분이라 제가 지금보다 더 성장한 후에 만나뵙게 되면 이번 프로젝트때보다 더 좋은 시너지가 날 것 같습니다.

#### Dear. Karen

- 저도 다음 프로젝트에서 못 만나는게 아쉽네요!! 
- 모르는 부분에 대해서 제 개인적으로 아는 만큼 설명드렸는데, 제 스스로 생각할 때 완벽하게 설명드리지 못한 거 같아 아쉬웠습니다.

</br>