# 쥬스 메이커

## 목차
[1. ✏️ 프로젝트 소개](1.✏️-프로젝트-소개) </br>
[2. 🧑‍🤝‍🧑 팀원](2.-🧑‍🤝‍🧑-팀원) </br>
[3. 🔍 프로젝트 구성 - ClassDiagram](3.-🔍-프로젝트-구성(ClassDiagram)) </br>
[4. 👩🏻‍💻 실행 예시](4.-👩🏻‍💻-실행-예시) </br>
[5. 🔥 트러블 슈팅](5.-🔥-트러블-슈팅) </br>
[6.  🔗 참고 링크](6.-🔗-참고-링크) </br>

---

## 1. ✏️ 프로젝트 소개

`맛있는 쥬스를 만들어 드려요!` 화면에서 사용자가 원하는 쥬스의 주문 버튼을 누르면, JuiceMaker는 FruitStore의 과일을 이용해 juice를 제작합니다.
  - 쥬스 주문 결과(성공/실패)를 alert창을 통해 사용자에게 결과를 알려줍니다.
  - 과일의 재고가 부족할 경우, 쥬스 주문에 실패합니다.
  - 쥬스 주문 실패 시 뜨는 alert창에서, `재고 수정` 화면으로 이동할 수 있습니다.
 
`재고수정` 버튼을 누르면 `재고 수정` 화면으로 이동해 과일의 재고를 조정할 수 있습니다.


---

## 2. 🧑‍🤝‍🧑 팀원


| SummerCat                                                 | SunnyCookie                                             |
| --------------------------------------------------------- | ------------------------------------------------------- |
| <img width="180px" src="https://i.imgur.com/TVKv7PD.png"> | <img width="180" src="https://i.imgur.com/z4FjnKX.png"> 

---

## 3. 🔍 프로젝트 구성(ClassDiagram)

### 1️⃣ Model
<img width = 900, src = "https://i.imgur.com/drYww31.png">

### 2️⃣ ViewController + Model
<img width = 900, src = "https://i.imgur.com/dgYUo8O.png">

---


## 4. 👩🏻‍💻 실행 예시

### **1️⃣ [맛있는 쥬스를 만들어드립니다]** View에서 쥬스를 주문
    
- 쥬스 제작에 필요한 과일의 재고가 충분할 시 성공 Alert을 띄웁니다.   
- 과일 재고가 부족하면 실패 Alert을 띄웁니다.
    | **주문 성공 시 성공 Alert 예시**                            |
    | ---------------------------------------------------------- |
    |<img width = 400, src = "https://i.imgur.com/4SDmkYJ.gif">|
    | **주문 실패 시 실패 Alert 예시**                            |
    | |
    |<img width = 400, src = "https://i.imgur.com/zRWTBGt.gif"> |
    
</br>   

### **2️⃣ [재고수정]** View에서 재고를 수정
- Stepper로 재고를 수정 하면 [맛있는 쥬스를 만들어드립니다] View의 재고에 적용됩니다.
    | **재고 수정 예시**                            |
    | ---------------------------------------------------------- |
    |<img width = 400, src = "https://i.imgur.com/mkfb4rT.gif">|


### **3️⃣ AutoLayout** 적용
- AutoLayout을 적용해 디스플레이 사이즈가 변경되어도 각 view가 변경된 화면의 크기에 맞추어 리사이징됩니다.
    | **iPhone SE 시뮬레이터 예시**                            |
    | ---------------------------------------------------------- |
    |<img width = 400, src = "https://i.imgur.com/Iyac12q.gif">|
    | **iPhone 13 Pro 시뮬레이터 예시**                            |
    | |
    |<img width = 400, src = "https://i.imgur.com/1qlXlIb.gif"> |





---

## 5. 🔥 트러블 슈팅

### 1️⃣ `enum Juice` 타입에서 사용하는 과일의 종류, 갯수 연결하기
열거형으로 정리한 쥬스타입의 case마다 레시피로 사용되는 각 과일의 갯수를 연관지어 지정해놓고 싶었습니다. 예를 들어, 딸기바나나쥬스는 딸기 10개 바나나 1개를 사용하기 때문에 `case 딸기바나나쥬스` 에는 딸기 10개, 바나나 1개를 연결하고 싶었습니다.
- **시도1 : 연관값(Associated Values) 사용**
    ```swift
    case strawberryBananaJuice(strawberry: 10, banana: 1)
    ```
    - 연관값을 사용할 경우, 만들 쥬스를 고르기 위해 case를 불러올 때 연관값을 반드시 초기화(할당)해야 해서 최초에 할당한 연관값을 재사용할 수 없는 문제가 있었습니다.

 - **시도2 : 튜플을 리턴해주는 메서드, 프로퍼티 사용**
     ```swift
        enum Juice {
            case bananaJuice
            case strawberryBananaJuice

            var ingredient: (first: FruitStore.Fruit, second: FruitStore.Fruit?) {
                switch self {
               case .bananaJuice:
                    return (.banana, nil)
               case .strawberryBananaJuice:
                    return (.strawberry, .banana)
                }
            }

            func ingredientsCount() -> (first: Int, second: Int) {
                switch self {
                case .bananaJuice:
                    return (2,0)
                case .strawberryBananaJuice:
                    return (10, 1)

                }
            }

    //사용 시
    let firstfruitType = Juice.ingredient.first 
    let firstfruitCount = Juice.ingredients.first         
    let secondfruitType = Juice.ingredient.second //옵셔널바인딩 포함
    let secondruitCount = Juice.ingredients.socond       
    ```
    - 과일타입과 갯수를 튜플로 묶어 리턴하는 방법을 시도했지만, 과일이름과 갯수를 서로 다른 프로퍼티와 메서드에서 따로 리턴해주기 때문에 코드를 읽는 사람입장에서 어떤 과일이 몇개가 쓰이는지 연결짓기가 어려울 것 같다고 생각했습니다. 
    - 한개의 튜플에 라벨을 달아 과일명과 갯수를 같이 넣어주는 방법도 있지만 튜플은 그 크기가 정해져있기에 과일을 한 개만 사용하는 쥬스와 두 개를 사용하는 쥬스를 프로퍼티(혹은 메서드)한 곳에 같이 담기가 어려워 사용하지 않았습니다.

- **시도 3. 딕셔너리 타입을 리턴해주는 프로퍼티 사용**
    ```swift
     var recipe: Dictionary<FruitStore.Fruit, Int> {
                switch self {
                case .strawberryJuice:
                    return [.strawberry: 16]
                case .strawberryBananaJuice:
                    return [.strawberry: 10, .banana: 1]
                }
     }
    ```
    - `recipe` 프로퍼티에 과일 종류와 개수를 딕셔너리로 반환시켜주는 컨셉을 채택했습니다. 과일 종류와 개수를 명확히 보여줄 수 있고, 그 크기도 정해져있지 않고 순서도 중요하지 않기 때문에 딕셔너리를 사용하는게 베스트라고 생각했습니다.

---

### 2️⃣ `재고수정` 화면으로 이동할 때, 내비게이션 방식과 모달 방식 중 어느 것을 쓸 것인가?

`내비게이션 방식`은 현재 화면의 연장선상으로 세부사항을 열어보거나 다음 step으로 넘어갈 때 사용합니다.
`모달 방식`은 지금 화면에서 조금 벗어나 잠시 다른 일을 처리하거나, 연장선을 벗어나 새로운 갈래로 나갈 때 사용합니다.

쥬스를 주문하는 현재 화면에서 재고를 변경해주는 화면으로 이동할 때는 쥬스 주문과는 별개로 잠시 연장선상을 벗어나 다른 일을 처리한 후 돌아온다고 생각하여 화면 전환 방식으로 모달 방식을 채택했습니다. 

---

### 3️⃣ 과일 재고의 개수를 `ViewController`와 `FruitStockViewController`간에 공유하게 하는 방법

검색을 통해 프로퍼티로 직접 전달하는 방법, delegation을 이용하는 방법 등 다양한 방법이 있다는 것을 알게 되었지만, 활동학습 시간에 배운 Singleton Pattern을 이용하기로 했습니다.

그 이유는 이 프로젝트가 매우 단순한 구조의 프로젝트이기 때문이기도 하고, 현재 구조체로 정의되어 있는 `JuiceMaker`가 프로퍼티로 클래스 `FruitStore`의 인스턴스를 `private`으로 가지고 있었기 때문에, 클래스로 되어있는 `FruitStore`에 싱글톤 패턴을 적용하는 편이 낫다고 생각했습니다.
`FruitStore`에 싱글톤 패턴을 적용할 경우, `JuiceMaker`, `ViewController`, `FruitStockViewController`에서 모두 하나의 인스턴스에 접근이 가능하기 때문입니다.

---

### 4️⃣ `UILabel`과 `UIButton`을 다룰 때, 코드에서 중복되는 부분을 줄일 방법

처음에는 각 `label`과 `button`을 일일이 직접 매핑하거나 `switch case`로 구분하도록 작성했었습니다. 하지만 두 가지 경우 모두 각 케이스마다 중복되는 코드가 많아 중복되는 코드를 줄일 방법을 고민(구글링)해 보았고, 아래의 글을 참고해 개선해 보았습니다.
(참고: https://stackoverflow.com/questions/52548196/shorten-long-switch-case)

`label`의 경우, `.text = String(FruitStore.sharedFruitStore.fetchStockOf(.strawberry))`부분이 `.strawberry`라는 과일 값만 빼고는 모두 똑같이 중복되고 있습니다.

```swift
// 최초에 작성한 코드 - label을 일일이 매핑
strawberryStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.strawberry))
        bananaStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.banana))
        pineappleStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.pineapple))
        kiwiStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.kiwi))
        mangoStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.mango))
```


아래와 같이 `[UILabel: Fruit]` 딕셔너리를 생성하고, `for-in`을 사용해 딕셔너리를 순회하면서 값을 `label`에 넣어주도록 수정해 보았습니다.


```swift
// 최종 수정한 코드
let fruitLabel: [UILabel: Fruit] = [
    strawberryStockLabel: .strawberry,
    bananaStockLabel: .banana,
    pineappleStockLabel: .pineapple,
    kiwiStockLabel: .kiwi,
    mangoStockLabel: .mango,
    ]
        
    for (label, fruit) in fruitLabel {
    label.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))
    }
```

`button`을 식별해서 `switch case`를 이용해 `juiceMaker.makeJuice(Juice, total: Int)`에 넣어주는 부분 역시 `makeJuice` 메서드를 호출해서 `result`에 넣어주는 부분이 반복되고 있었습니다.

```swift
// 최초에 작성한 코드 - button을 switch case로 구분
 @IBAction func orderJuice(sender: UIButton) {
    switch sender {
        case strawberryBananaJuiceButton:
            result = juiceMaker.makeJuice(.strawberryBananaJuice, total: 1)
        case mangoKiwiJuiceButton:
            result = juiceMaker.makeJuice(.mangoKiwiJuice, total: 1)
        case strawberryJuiceButton:
            result = juiceMaker.makeJuice(.strawberryJuice, total: 1)
        case bananaJuiceButton:
            result = juiceMaker.makeJuice(.bananaJuice, total: 1)
        case pineappleJuiceButton:
            result = juiceMaker.makeJuice(.pineappleJuice, total: 1)
        case kiwiJuiceButton:
            result = juiceMaker.makeJuice(.kiwiJuice, total: 1)
        case mangoJuiceButton:
            result = juiceMaker.makeJuice(.mangoJuice, total: 1)
        default:
            return
        }
     ...
 }
```

이 부분도 아래와 같이 `[UIButton: Juice]` 딕셔너리를 생성하고, `juiceButton[sender]`의 값을 `juice`에 할당해 옵셔널 바인딩 해주니 `result`를 생성하는 `makeJuice()` 메서드를 한 번만 호출하도록 개선했습니다.

```swift
 @IBAction func orderJuice(sender: UIButton) {
    let juiceButton: [UIButton: Juice] = [
        strawberryBananaJuiceButton: .strawberryBananaJuice,
        mangoKiwiJuiceButton: .mangoKiwiJuice,
        strawberryJuiceButton: .strawberryJuice,
        bananaJuiceButton: .bananaJuice,
        pineappleJuiceButton: .pineappleJuice,
        kiwiJuiceButton: .kiwiJuice,
        mangoJuiceButton: .mangoJuice,
        ]

    guard let juice = juiceButton[sender] else { return }

    let result = juiceMaker.makeJuice(juice, total: 1)
    ...
 }
```

---

### 5️⃣ [재고수정] View의 Navigation bar가 보이지 않는 문제

#### **[방법1]** `VC -> FruitStockVC`로 직접 화면 전환
`FruitStockVC` 내비게이션 바가 보이지 않아 새로운 내비게이션 바를 화면에 추가해 보았습니다.
  - 이럴 경우, 한 VC에 2개의 내비게이션 바가 존재하는 다소 이상한 상황이라고 생각해 다른 방법을 찾아보기로 했습니다.
  - 스토리보드상에는 보였던 `FruitStockVC`의 내비게이션 바가 실행 화면에서 보이지 않았던 이유가, `FruitStockVC`가 어떤 내비게이션 스택 안에도 담기지 않았기 때문이라고 생각했습니다.
 
#### **[방법2]** `VC -> NavigationController -> FruitStockVC`로 이동
`VC`에서 `FruitStockVC`로 직접 이동하지 않고, `FruitStockVC`를 담고 있는 내비게이션 컨트롤러로 이동해 그 내비게이션 컨트롤러의 루트 뷰 컨트롤러인 `FruitStockVC`를 띄우도록 하면 `FruitStockVC`는 내비게이션 스택 안에 존재하게 되므로 내비게이션 바가 화면에 보일 것이라고 생각했습니다.

내비게이션 바를 새로 추가하지 않고도 스토리보드 상에 보이는 내비게이션 바가 실행 화면에서도 정상적으로 출력되어 title을 작성할 수 있었고 navigationBarButton을 이용해 '닫기'버튼을 구현할 수 있었습니다.

---

### 6️⃣ stepper의 `-` 버튼이 작동하지 않는 문제

Stepper를 이용해서 재고를 수정하기 위해 처음에 작성했던 코드는 아래와 같습니다.

```swift
@IBAction func changeFruitStock(_ sender: UIStepper) {
    let fruitStepper: [UIStepper: Fruit] = [
        strawberryStepper: .strawberry,
        bananaStepper: .banana,
        pineappleStepper: .pineapple,
        kiwiStepper: .kiwi,
        mangoStepper: .mango
    ]

    sender.minimumValue = -1

    guard let fruit = fruitStepper[sender],
        let fruitLabel = fruitLabel[fruit] else { return }

    FruitStore.sharedFruitStore.changeStockOf(fruit: fruit, by: Int(sender.value))

    fruitLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))

    sender.value = 0
}
```

  - `-` 값을 전달할 수 있도록 stepper가 전달하는 값의 최소값을 `-1`로 설정
 
  -  stepper를 누를 시, stepper는 값을 기억하고 있으므로 stepper를 누를 때마다 stepper의 value가 1 > 2 > 3 > 4 > ... 로 증가하게 되어 `changeStockOf`에 전달되는 값은 +1 > +3 > +6 > ... 로 변하게 됩니다.
        - 한 번 누를 때마다 `sender.value`를 통해 전달되는 값이 1 또는 -1이 되기를 원해서, 마지막에 `sender.value = 0`으로 stepper가 기억하고 있는 값을 초기화 해 주었습니다.

  - 그런데.. 아래와 같이 코드를 작성할 시 재고를 수정하는 모달 창으로 넘어왔을 때 Stepper의 `-` 버튼을 눌러도 아무런 동작을 하지 않는 문제가 발생했습니다.
      - `+` 버튼을 한 번이라도 누른 후 `-` 버튼을 누를 시 정상적으로 재고의 개수가 줄어들었지만, `-` 버튼만 누르면 아무 동작을 하지 않았습니다.
      - `sender.value`를 출력하는 함수를 작성해보니, 맨 처음에 `-` 버튼을 누를 시 아무것도 출력되지 않는 것을 확인해 작동 자체를 하지 않았다는 것을 알 수 있었습니다.

stepper의 작동 방식에 대해 열심히 구글링 해 보았지만 저희가 원하는 답을 찾을 수 없어, 동료 캠퍼들은 어떻게 구현했는지 질문해서 답을 얻을 수 있었습니다.

```swift
func assignStepperValue() {
    for (stepper, fruit) in fruitStepper {
        stepper.value = Double(FruitStore.sharedFruitStore.fetchStockOf(fruit))
    }
}

@IBAction func changeFruitStock(_ sender: UIStepper) {
    guard let fruit = fruitStepper[sender],
        let fruitLabel = fruitLabel[fruit] else { return }
        
    let changedValue = Int(sender.value) - FruitStore.sharedFruitStore.fetchStockOf(fruit)
    FruitStore.sharedFruitStore.changeStockOf(fruit: fruit, by: changedValue)
        
    fruitLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))
}
```
- 각 stepper에 각 과일의 재고를 value로 할당하면, stepper가 설계된 의도대로 `+`를 두 번 누를 시 +2가 되고, `-`를 5번 누르면 -5가 되도록 작동하는 것을 확인할 수 있었습니다.

---

### 7️⃣ Auto Layout: stackView 이용

`과일 이미지, 과일 재고 label, stepper`가 담긴 `Stack View`의 `alignment`를 `fill`로 설정할 경우, 기기에 따라 과일 이미지와 과일 재고 label의 크기는 커지지만 stepper의 크기는 커지지 않았고, stepper는 `leading`으로 정렬된 것 처럼 보였습니다.

Stepper는 크기를 변경할 수 없기 때문에, 세 요소의 너비를 일치시키기 위해 과일 재고 label과 과일 이미지의 크기를 stepper의 크기에 맞추는 제약을 설정한 후, `Stack View`의 `alignment`를 `center`로 변경하여 해결했습니다.


---

## 6.  🔗 참고 링크
### Apple 공식문서
- [Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
- [Structures and Classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
- [loadView()](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621454-loadview)

### 그 외 출처
- [구글의 Swift 컨벤션](https://google.github.io/swift/#braces)
- https://stackoverflow.com/questions/52548196/shorten-long-switch-case
- https://medium.com/@Alpaca_iOSStudy/viewcontroller-view-lifecycle-daed5766e02b
