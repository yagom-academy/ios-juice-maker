# 🧃 주스메이커


## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

</br>

## 🍀 소개
형민트(`Zion`, `MINT`)팀이 만든 주스 메이커입니다. 주스를 주문하면 메뉴의 레시피에 맞게 과일의 재고를 확인하고 사용합니다.

* 주요 개념: `UIKit`, `Outlet/Action`, `Modality`, `Navigation`, `OOP`, `MVC`, `Singleton`, `Delegation`

</br>

## 👨‍💻 팀원
| MINT | Zion |
| :--------: | :--------: |
| <Img src = "https://hackmd.io/_uploads/SJ6F7HjE2.png"  width="200"> |<Img src= "https://hackmd.io/_uploads/rJqMfSoVn.png" width="200"> |
|[Github Profile](https://github.com/mint3382) |[Github Profile](https://github.com/LeeZion94) |


</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.05.08.| - MVC, initialization 공부 |
|2023.05.09.| - changeFruitCount 함수, Fruit 열거형 생성 <br> - makeFruitJuice(menu) 생성, JuiceMake 생성시 fruitStore 주입 <br> - makeJuice, makeCollaborateJuice , verifyFruitCount 함수 <br> - makeJuice() error에 대응할 수 있도록 수정, 사용하지 않는 라이브러리 삭제 |
|2023.05.10.| - getRecipe 함수를 사용해서 menu 따른 주스 만들도록 수정 | 
|2023.05.11.| - 네이밍 수정 <br> - FruitSore에서 과일 재고를 더할수도 있게 리펙토링 <br> - FruitStore에서 데이터 타입 변경 |
|2023.05.12.| - Fruit enum 외부 파일로 분리 및 수정 <br> - 피드백 사항 반영 |
|2023.05.15.| - JuiceMakeDelegate 구현 | 
|2023.05.16.| - successAlert, failAlert 기능 구현 |
|2023.05.17.| - JuiceMaker 안에 있던 recipe를 init으로 줄 수 있게 리펙토링 <br> - 네이밍 및 컨벤션 수정 |
|2023.05.19.| - Fruit에 있는 RawValue 삭제하는 방향으로 리펙토링 |

</br>

## 👀 시각화된 프로젝트 구조

### Flowchart
<p align="center">
<img width="800" src="https://hackmd.io/_uploads/S1PZZ-zrh.png">
</p>

## 💻 실행 화면 

| 주문 성공 시 알람이 뜨는 화면 |
|:--------:|
|<img src="https://hackmd.io/_uploads/rkd8bO4B2.gif" width="800">|

| 주문 실패 시 알람이 뜨고 화면 전환 |
|:--------:|
|<img src= "https://hackmd.io/_uploads/BJOFbdVHn.gif" width="800">|

| 재고 수정 버튼 누를 시 화면 전환 |
|:--------:|
|<img src= "https://hackmd.io/_uploads/Hk6c-OVS2.gif" width="800">|

</br>

## 🧨 트러블 슈팅

1️⃣ OCP <br>
-
🔒 **문제점** <br>
```swift=
func verifyFruitCount(_ fruit: Fruit, count: Int) -> Bool {
        switch fruit {
        case .strawberry:
            return strawberry >= count ? true : false
        case .banana:
            return banana >= count ? true : false
        case .pineapple:
            return pineapple >= count ? true : false
        case .kiwi:
            return kiwi >= count ? true : false
        case .mango:
            return mango >= count ? true : false
        }
    }
    
    func changeFruitCount(_ fruit: Fruit, count: Int, isUseFruit: Bool = true) {
        let amount = isUseFruit ? (count * -1) : count
        
        switch fruit {
        case .strawberry:
            strawberry += amount
        case .banana:
            banana += amount
        case .pineapple:
            pineapple += amount
        case .kiwi:
            kiwi += amount
        case .mango:
            mango += amount
        }
    }
```
기존에 알고 있던 OCP의 개념은 ``'확장성에는 열려있어야 하지만 그로인한 로직의 수정은 최소화하거나 없어야한다.'`` 였다. 위의 예로 제시한 코드로 살펴 본다면 `enum` 값에 `case orange`가 추가 되었을 때 `verifyFruitCount()`, `changeFruitCount()`가 최소한을 수정되거나 수정되는 부분이 없는 경우 OCP를 잘 준수한 것으로 볼 수 있을 것 같다. 이러한 부분으로 본다면 현재 저희가 작성한 코드에는 위의 예시코드와는 달리 `fruitsStock` 라는 `Dictionary` 형식으로 과일재고에 접근하고 있기 때문에 orange의 case가 늘었을 경우 `fruitsStock`만 수정하면되므로 수정을 최소한 줄일 수 있었다고 생각한다.

하지만 위와 같이 코드를 수정하면서 고민이 되었던 부분이 있었다. 
위의 예시에서처럼 `switch`를 사용하여 로직을 구현했을 경우 새로운 case로 orange가 들어왔을 때, 컴파일 오류가 발생하게 된다. 현재 사용되고 있는 `switch`에서는 orange case를 다루는 구문이 없기 때문이다. 이 컴파일 에러는 개발자로 하여금 `switch`의 모든 경우에 대해 구문을 작성해야한다는 의무를 부여하기도 한다고 생각한다. 마치 `Optional` 값을 `Binding`해서 사용해야한다고 강요하는 것 처럼. PR로 올린 `Dictionary`로 통해 접근하는 부분을 생각해봤을 때 해당 코드는 확장되고자 했을 때, 코드 수정을 최소한으로 줄인 것은 맞지만 오히려 개발자로 하여금 '찾고 고쳐야할 부분을 직접 분석하고 탐색하여야 하는 불편함을 줄 수 있지는 않을까?' 라는 생각도 하게 되었다. 

🔑 **해결방법** <br>
OCP의 개념을 다루면서 확장성에 대한 많은 생각을 하게만드는 주제였다.
과일의 재고관리를 각각의 `Int`변수로 관리하는 것이 아닌 `Dictionary([Fruits:Int])` 형식으로 부여해 위의 문제를 해결했다. `Dictionary`로 변경하게 되면 존재하는 key 값에 대해 재고 값을 `Optional Binding`해서 사용하게되므로 `switch`문의 사용을 줄일 수 있었다. 또한 여러개의 `FruitStore` 가 생성되어 각 `FruitStore`별로 다른 과일 재고를 가지게 될 수 있으므로 위와 같이 `switch-case`를 사용했을 때 보다 불필요한 코드를 줄일 수 있고 확장성을 가졌을 때도 코드의 수정사항이 최소한이 될 수 있는 코드구현이 가능했다.

<br>

2️⃣ **확장성** <br>
-
🔒 **문제점** <br>
`makeJuice` 메서드 구현당시 각각의 쥬스를 만들 과일의 갯수를 체크하는 로직을 과일이 1개인지 2개인지로 나누어서 구현했었다. 그 결과 하나의 쥬스에 2개의 과일이 들어가는 쥬스까지는 무리없이 돌아가지만 하나의 쥬스에 그 이상의 과일이 들어가게 될 경우 코드의 수정이 불가피했다. 확장성이 떨이질 수 있다는 리뷰를 듣게 되었다.

🔑 **해결방법** <br>
처음 그 말을 들었을 때는 요구사항이 바뀌는 것이 확장성과 연관이 있나? 라는 생각이 들었지만, (Step이 넘어간다고 해서 하나의 쥬스에 들어가는 과일의 갯수가 바뀌진 않기 때문에, 또한 요구사항이 개발단계까지 넘어왔다면 바뀌지 않는 것이 당연하다고 생각했기 때문에)

 요구사항은 언제나 항상 바뀌게 되고 그에 따른 대응은 개발자가 해야하는 것이므로 당연히 확장성과 연관이 있을텐데... 너무나 중요하고 당연한 부분을 숙제 하듯이 개발해나가면서 놓쳤다는 생각이 들었다. 그 결과 하나의 쥬스에 몇개의 과일이 들어오더라도 문제없이 쥬스가 만들어질 수 있도록 로직을 수정했고, 오히려 가독성이 좀더 나은 코드를 구현할 수 있었다.


<br>

3️⃣ **recipe의 분류** <br>
-
🔒 **문제점** <br>
주스를 만들 때 `makeJuice` 함수에 매개변수로 소모되는 과일의 종류와 개수를 넣어 recipe를 따로 분류하지는 않았다. 매번 매개변수로 받다보니 만일 과일을 3개 사용하는 신메뉴가 나올 경우 혹은 더 늘어나는 경우 전체적인 로직을 수정해야하는 상황이 있었다. 코드의 확장성적인 부분에서 조금 더 고민해보라는 리뷰를 받게 되었다.
```swift=
func makeJuice(menu: Fruit, count: Int) {
        if store.verifyFruitCount(menu, count: count) {
            store.changeFruitCount(menu, count: count)
        }
    }

func makeCollaborateJuice(main: (fruit: Fruit, count: Int), sub: (fruit: Fruit, count: Int)) {
        if store.verifyFruitCount(main.fruit, count: main.count) &&
            store.verifyFruitCount(sub.fruit, count: sub.count) {
            store.changeFruitCount(main.fruit, count: main.count)
            store.changeFruitCount(sub.fruit, count: sub.count)
        }
    }
```

🔑 **해결방법** <br>
 추후에 레시피에 들어가는 과일의 종류가 몇 개가 되든 상관없게 하기 위해 튜플 배열을 사용하면서 레시피를 따로 부르는 방법으로 변경하였다. 레시피의 내용들을 변수로 선언하여 사용하려다가 함수를 통해 메뉴를 받으면 그 메뉴에 해당하는 레시피를 넘겨주는 것 까지가 레시피의 역할과 책임으로 선언하여 사용하였다.
 
```swift=
func canMakeJuice(menu: Menu) -> Bool {
        let recipe = provideRecipe(menu)
        
        guard recipe.allSatisfy({ fruit, amount in return store.isEnoughFruits(fruit, count: amount) }) else { return false }

        recipe.forEach { fruit, amount in
            store.changeFruitCount(fruit, count: amount)
        }
        return true
    }
```

<br>

4️⃣ **required init?** <br>
현재 `Main Storyboard`에서 `Main-ViewController`에 해당하는 `JuiceOrderViewController` 내부에서 `FruitStore`와 `JuiceMaker`를 가지고있다.

`JuiceMaker`는 `FruitStore`를 초기화시 주입을 받아야하기 때문에 아래와 같이 `lazy` 키워드를 사용해서 선언했다. 하지만 굳이 `lazy`까지 사용하면서 해야할 필요성을 느끼지 못해서 `JuiceOrderViewController`에 사용자 지정 이니셜라이저를 추가해 그 부분에서 `fruitStore`와 `JuiceMaker`를 초기화하고자 했다.

```swift=
    private let fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
    private lazy var yagomJuiceStore = JuiceMaker(fruitStore, recipe)
```

🔒 **문제점** <br>
```swift=
    private let fruitStore: FruitStore
    private var yagomJuiceStore: JuiceMaker

    init() {
        fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
        yagomJuiceStore = JuiceMaker(fruitStore, recipe)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
```
`Main-ViewController`의 특성상 초기화를 통한 의존성 주입은 불가하다고 생각했기 때문에 `init()` 속에서의 초기화만을 `JuiceOrderViewController`의 사용자 지정 이니셜라이저를 통해 진행하려 했지만 실제 프로그램 동작시 사용자 지정 이니셜라이저가 아닌 `required init?`으로 진입되어 원하는 동작을 하지 않았다.

🔑 **해결방법** <br>
먼저, 사용자 지정 이니셜라이저를 사용하는 경우 `UIViewController`에서 정의한 이니셜라이저를 가져다 사용할 수 없기 때문에 `UIViewController`에서 정의된 초기화 메서드들을 정의해줘야한다. `UIView`, `UIController`는 `NSCoding protocol`을 채택하고 있기 때문에 해당 프로토콜에서 선언한 `init`인 `required init?`을 `JuiceOrderViewController`에서 정의해줘야했다.

또한, 사용자 이니셜라이저가 아닌 `required init?`이 호출되는 이유는 스토리보드상에 존재하는 `ViewController`를 로드할 때 어떤 `init`을 사용해서 초기화를 진행해야하는지 개발자가 명시하고있지 않기 때문에 기본적으로 구현해야함을 요구한 `required init?`이 호출될 수 밖에 없다. 따라서 `Main-ViewController`의 경우 `Main-ViewController` 특성상 개발자가 어떤 `initializer`를 사용해 초기화를 진행할 것인지에 대해 명시할 수 없기 때문에 이경우에는 `required init?` 메서드에 초기화를 진행한다면 문제없이 동작함을 확인할 수 있었다.

```swift=
    private let fruitStore: FruitStore
    private var yagomJuiceStore: JuiceMaker

    required init?(coder: NSCoder) {
        fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
        yagomJuiceStore = JuiceMaker(fruitStore, recipe)
        
        super.init(coder: coder)
    }
```


</br>

## 📚 참고 링크
- [🍎Apple Docs: preventing override ](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/#Preventing-Overrides)
- [🍎Apple Docs: choosing between structures](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
- [🍎Apple Docs: initialize](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)
- [📘blog: delegate ](https://zeddios.tistory.com/8)
</br>
