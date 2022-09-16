# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

목차
1. [제목](#제목)
2. [소개](#소개)
3. [앱실행화면](#앱-실행-화면)
4. [타임라인](#타임라인)
5. [프로젝트 구조](#프로젝트-구조)
6. [트러블 슈팅](#트러블-슈팅)
    <ul>
    <li><a href="#Step1">Step1</a></li>
    <li><a href="#Step2">Step2</a></li>
    <li><a href="#Step3">Step3</a></li>
    </ul>
7. [참고 링크](#참고-링크)
 
# 제목: 쥬스 메이커
## 소개
주스재고에서 과일을 꺼내어 주스를 만들어주는 프로그램입니다.
|![캡처](https://avatars.githubusercontent.com/u/66786418?v=4)|![CCF2339F-606F-4EE9-97EC-88620DE7174A (1) (1)](https://user-images.githubusercontent.com/71054048/188081997-a9ac5789-ddd6-4682-abb1-90d2722cf998.jpg)|
|:---:|:---:|
|토털이|인호|

## 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시
| 날짜 | 중요 진행 상황 | 코드 관련 사항
|---|---|---|
|8/30| `STEP1` 시작, 과일 쥬스 제조 및 수량 변경 기능 구현 | `FruitStore`에 `addStock`, `useStock`등등 메서드 구현, `JuiceMaker`속 `Recipe`를 `enum`으로 만들어 레시피에 맞는 쥬스 제조 기능 구현, `JuiceMakerError`로 에러 처리 구현
|9/1| 코드 리뷰 후 리팩토링| `useStock`, `addStock`을 `use`로 변경, `Recipe` 타입 내 프로퍼티를 딕셔너리 타입으로 수정하여 가독성을 높임
|9/2| `FruitStock` 재고 초기화 자동화 | `CaseIterable` 프로토콜을 사용하여 `allCase`로 `forEach`문을 사용해 초기화를 자동화 시킴
|9/5| `STEP 2` 시작, 첫 화면 구현 및 제조 알람 구현 | 과일 별 IBOutlet 레이블 설정후 `juiceMaker`를 통해 데이터를 받아와 화면에 구현, `juiceMaker`를 활용해 주문 기능 구현. 주문실패 및 주문 성공시 `Alert` 인스턴스에 확인을 누르면 `alert`이 사라지도록 구현
|9/6| 주문시 과일 레이블 업데이트 구현 | `stockEditButtonPressed`로 메서드 이름 변경, 모든 과일을 업데이트 해주는 `updateAllStockLabels()` 메서드로 과일을 업데이트, 
|9/8| 코드 리뷰 후 리팩토링| 함수 네이밍 수정 및 접근 제어자 수정, modal 방식 변경, 모든 과일을 업데이트 해주는 방법에서 부분적으로 업데이트 해주도록 `updateStockLable(of fruit)` 메서드 추가, `Juice` 타입에 해당하는 알람의 메세지를 옮겨줌
|9/9| 코드 리뷰 후 리팩토링 | 뷰컨트롤러 이름 `JuiceMakerViewController`로 수정, `Juice`타입에 `orderFailedMessage` 프로퍼티로 추가
|9/12|`STEP3` 시작, 닫기 버튼 및 Stepper 기능 및 데이터 전달방법 구현 | `Stepper` `IBOutlet`선언 및 값 변경에 따라 `JuiceMaker` 속 데이터를 변경하고 이전 화면에 전달하는 기능을 프로퍼티, Delegate 순으로 구현, 오토레이아웃 설정 |
|9/16|코드 리뷰 후 리펙토링|`FruitStore`참조값을 이용한 데이터 전달 방법 적용, 뷰컨트롤러 네이밍 `VC`에서 `ViewController`로 수정|

## 앱 실행 화면

### 1. 주문 화면 및 알람
![](https://i.imgur.com/kkN5ROz.gif)
### 2. 재고 수정 화면
![](https://i.imgur.com/hxP5eDk.gif)
### 3. 재고 부족시 재고 수정 화면으로 전환
![](https://i.imgur.com/VAFYgUo.gif)
### 4. AutoLayout 적용으로 여러 기기에서 실행 가능
![](https://i.imgur.com/ghNSrqO.gif)


## 트러블 슈팅
<details>
<summary id="Step1"><h4>Step1</h4></summary>
<div markdown="1">
    
#### 1. `fruitStock`프로퍼티 초기화 방법
과일마다 재고를 초기화 해주기 위해 몇가지 방법을 고민했다.
1. 프로퍼티에 직접 과일별로 갯수를 입력하는 방법
```swift
var fruitStock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
```
- 위 방법은 가독성이 좋고 각 과일의 초기값이 다를때에 활용할 수 있지만 일일이 적어준다는 단점이 있다.

2. `Fruit`타입의 `allCases`,`forEach`를 이용하여 초기화하는 방법
```swift
let initialStock = 10
var fruitStock = [Fruit: Int]()

init() {
    Fruit.allCases.forEach { fruit in
        fruitStock[fruit] = initialStock
    }
}
```
- 위 방법은 한번에 같은 값을 초기화 해주기에 좋지만 직관성이 떨어진다.
3. `Fruit`타입에 연산프로퍼티와 초기화 함수 모두 사용하는 방법
```swift
enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
    var initialStock: Int {
        switch self {
        default:
            return 10
        }
    }
}

init() {
    Fruit.allCases.forEach { fruit in
        fruitStock.updateValue(fruit.initialStock, forKey: fruit)
    }
}
```
- 1, 2번의 단점을 보완하기 위해 최종적으로 사용한 코드이다.
- `Fruit`타입 내에 `initialStock`프로퍼티의 `switch`문을 이용하여 각 케이스 별로 초기값이 다른 상황을 처리할 수 있고 `fruitStock`프로퍼티에 값을 일일이 넣어주지 않도록 작성되었다.

#### 2. `Juice`타입에 중첩된 `Recipe`구조체
- 처음 레시피 구조체는 아래와 같은 형태로 여러개의 과일과 수량을 담을 수 없는 레시피의 형태였다. 그래서 하나의 주스에 대해 여러개의 레시피가 있는 것 같은 코드가 작성되었다.
```swift
struct Recipe {
    let fruit: Fruit, amount: Int
}

case .strawberryBananaJuice:
    return Recipe[(fruit: .strawberry, amount: 10), Recipe(fruit: .banana, amount: 1)]
```
- 이를 아래와 같이 한개의 레시피에 여러개의 재료가 있는 코드로 수정되었다.
```swift
struct Recipe {
    let ingredient: [Fruit: Int]
}

case .strawberryBananaJuice:
    return Recipe(ingredient: [.strawberry: 10, .banana: 1])
```

</div>
</details>

<details>
<summary id="Step2"><h4>Step2</h4></summary>
<div markdown="1">

#### `JuiceMakerViewController`에서 과일 재고량 레이블 업데이트 방법
앱을 실행하거나 과일 주문 버튼이 눌려 과일 수량이 변경되었을 때, 각 수량이 레이블에 반영되어야 한다.
이를 구현할때, 각 과일별 레이블을 관리하는 메서드를 만드는 대신
`updateStockLabel(of fruit: Fruit)`인 하나의 메서드에서 `switch`문을 이용하여 원하는 레이블을 업데이트 한다.
```swift
func updateStockLabel(of fruit: Fruit) {
    guard let fruitStock = try? juiceMaker.fetchStock(of: fruit) else { return }
        
    switch fruit {
    case .strawberry:
        strawberryStockLabel.text = String(fruitStock)
    case .banana:
        bananaStockLabel.text = String(fruitStock)
    ...
    }
}
```

#### 과일 주문 버튼 처리방법
앱 내에 음료 주문 버튼이 총 7개가 있다. 이때 각 버튼에 대한 액션을 일일이 만들어야 하나 고민하다가, 버튼의 `tag`값을 이용하여 하나의 메서드로 관리하도록 구현했다. 
```swift
@IBAction func touchUpOrderButton(_ sender: UIButton) {
    if let orderedJuice = JuiceMaker.Juice(rawValue: sender.tag) {
        do {
            try juiceMaker.produce(juice: orderedJuice)
            showOrderedAlert(juice: orderedJuice)
        } catch JuiceMakerError.outOfStock {
            showOrderFailedAlert()
        }
        ...
    }
}
```
- 위 방법은 비효율을 줄이는 장점이 있지만, 음료나 버튼의 갯수가 많아지면 tag 값을 관리하기 어렵거나 tag 값과 음료가 매치되지 않아서 유지보수에 단점이 있다.
- 그래서 두번째 뷰 컨트롤러의 `stepper`을 다루는 부분에서는 하나하나 관리하도록 구현했다.

#### 화면 전환 방법
앱 내에는 `JuiceMakerViewController`, `StockEditViewController` 두가지가 있고, 각 뷰컨트롤러에는 네비게이션 컨트롤러가 연결되어 있다. 

</div>
</details>

<details>
<summary id="Step3"><h4>Step3</h4></summary>
<div markdown="1">

#### 뷰 컨트롤러 간에 데이터 전달 방법
총 3가지의 방법을 이용해봤다.
1. `JuiceMakerViewController`에서 `StockEditViewController`로 넘어갈때는 fruitStock프로퍼티에 접근하여 값을 전달하는 방법
```swift
class StockEditViewController: UIViewController {
    var fruitStock = [Fruit: Int]()
    ...
}
    
class JuiceMakerViewController: UIViewController {
    ...
    Fruit.allCases.forEach({ fruit in
        guard let fruitStock = try? juiceMaker.fetchStock(of: fruit) else { return }
            
        stockEditVC.fruitStock[fruit] = fruitStock
    })
}
```
2. `StockEditViewController`에서 재고 수정을 마친 데이터를 `JuiceMakerViewController`로 보낼때 delegate를 이용하는 방법.
```swift
protocol StockEditDelegate {
    func didEndStockEditing(fruitStock: [Fruit: Int])
}

class StockEditViewController: UIViewController {   
    var delegate: StockEditDelegate?
    ...
    @IBAction func dismissButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.didEndStockEditing(fruitStock: fruitStock)
        dismiss(animated: true)
    }
    ...
}

extension JuiceMakerViewController: StockEditDelegate {
    func didEndStockEditing(fruitStock: [Fruit: Int]) {
        juiceMaker.updateAllStock(using: fruitStock)
        updateAllStockLabels()
    }
}
```

3. 하나의 `FruitStock`인스턴스를 모듈 내에서 활용하는 방법
```swift
class FruitStore {
    private var fruitStock: [Fruit: Int] = [:]
    ...
}

class StockEditViewController: UIViewController {
    private var fruitStore: FruitStore?
    ...
    func setFruitStore(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    ...
}

class JuiceMakerViewController: UIViewController {
    ...
    stockEditViewController.setFruitStore(fruitStore: juiceMaker.fetchFruitStore())
}
```
#### `StockEditViewController`내 요소 업데이트 방법(label, stepper)

`JuiceMakerViewController`에서 여러 버튼을 관리할때 하나의 메서드에서 tag를 이용한 것과 달리
여러 stepper에 대한 `outlet`과 `action`을 연결하여 독립적으로 관리하도록 구현했다. 
```swift
@IBOutlet weak var strawberryStepper: UIStepper!

@IBAction func strawberryStepperPressed(_ sender: UIStepper) {
    fruitStore?.updateFruitStock(fruit: .strawberry, amountOf: Int(sender.value))
    strawberryStockLabel.text = Int(sender.value).description
}
```

#### 오토 레이아웃 적용
- `StockEditViewController`에서 오토레이아웃을 정할때, 각 과일의 이미지, 레이블, 스테퍼를 하나의 수직stackView로 만들고, 그렇게 만들어진 5개의 stackView를 하나의 수평stackView에 담았다.
- `Ipod touch`기기에서 stepper의 요소가 잘리는 문제가 있었는데, 이를 해결하기 위해서
가장 포괄적인 수평stackView의 width를 safe Area 너비의 80% 이상으로 지정해서
작은 화면에서도 요소가 잘리지 않도록 했다.(오토레이아웃 화면 참고)

</div>
</details>

## 참고 링크
- [Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
- [Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
- [Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
- [Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
- [Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
