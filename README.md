# 🥤🧃쥬스 메이커

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

---

## 🍀 소개

`idinaloq`와 `Hemg` 팀이 만든 쥬스 메이커 프로젝트 입니다.
- 쥬스 메이커는 원하는 맛의 쥬스를 만들고, 원하는 과일 재고 수량을 변경할 수 있습니다.

- 주요 개념: `Initialization` ,  `Access Control`, `Nested Types` , `Type Casting` , `Error Handling`

---

## 👨‍💻 팀원

| idinaloq | Hemg |
| :---: | :---: |
| <Img src = "https://user-images.githubusercontent.com/109963294/235301015-b81055d2-8618-433c-b680-58b6a38047d9.png" width = "250" height="300"/> | <Img src="https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="250" height="300"> |
| [Github Profile](https://github.com/idinaloq) | [Github Profile](https://github.com/hemg2)|

---

## 👀 시각화된 프로젝트 구조

| 쥬스 메이커 |
|:--:|
|<img src="https://github.com/idinaloq/testRep/assets/124647187/2f57ac95-bd10-40f9-8b8e-83e987884315" height="600" width="600">|

## 💻 실행 화면

| 쥬스 주문 |
|:--:|
|<img src="https://hackmd.io/_uploads/ryV05YVr2.gif" height="300" width="500">|

| 쥬스 주문시 재고 부족 |
| :--: |
|<img src="https://hackmd.io/_uploads/HycBcF4rh.gif" height="300" width="500">|

| 재고 수정 |
| :--: |
|<img src="https://hackmd.io/_uploads/SJK9XnaS3.gif" height="300" width="500">|

---

## ⏰ 타임라인

| 날짜 | 내용 |
| :---: | --- |
| 2023.05.08. | 팀 룰, 쥬스 메이커 구현 고민 |
| 2023.05.09. | `FruitStore` 객체, `JuiceMaker` 객체 생성|
| 2023.05.10. | `FruitStore` 개방폐쇄원칙 피드백 진행 |
| 2023.05.11. | 전반적인 코드 리팩토링 |
| 2023.05.12. | PR, 피드백 코멘트 작성 및 README 작성 |
| 2023.05.15. | 두번째 화면 생성기능, 화면 전환기능, 알럿컨트롤 추가|
| 2023.05.16. | 쥬스 주문 시 재고에 수량 반영, 주문완료 또는 재고 부족 시 알럿추가 |
| 2023.05.16. | `FruitStore`의 `stock`은닉화 후 재고수량 받아오는 메서드 추가|
| 2023.05.18. | 피드백 반영하여 코드 리팩토링 진행|
| 2023.05.19. | 코드 리팩토링 완료, README |
| 2023.05.22. | 두번째 화면 과일수량 반영, 과일별 `StepperAction` 함수 추가 |
| 2023.05.24. | 함수 네이밍 변경, [`fruit`: `UIlabel`] 중복사용으로 인해 전역 변수 변경(`lazy`활용)|
| 2023.05.25. | `orderJuice()` 쥬스주문 방식`switch`문에서 -> `guard` 문으로 변경 `showOrderedAlert()` 알림표시창 `if` -> `guard`로 변경 |
| 2023.05.26. | 코드 리팩토링 완료, README |
---

## ✍ 트러블 슈팅

### 저장 프로퍼티의 활용성
- 기존 과일 재고에 대해 저장 하기 위해 저장 프로퍼티를 사용하여 하나의 저장 프로퍼티에 하나의 값을 저장 하여 진행 했었는데 이부분에 있어 조금더 효율적으로 진행하고자 하여 `Int` -> `Dictionary`로 변경하여 재고를 저장 하게 되었습니다.
```swift 
class FruitStore {
    var strawBerry = 10
    var banana = 10
    var pineApple = 10
    var kiwi = 10
    var mango = 10
}
```

```swift
 var stock: [Fruit: Int] = [
        .strawBerry: 10,
        .banana: 10,
        .pineApple: 10,
        .kiwi: 10,
        .mango: 10
    ]
```

## 타입변경
### 문제점
- 기존 Juice 타입에서 Juice 주문시에 주문에 맞게 재고를 깍는 개념으로 `decreaseStock()` 를 실행 시키는 함수였습니다. 하지만 이렇게하게 되면 `FruitStore`에서 `Juice`까지 알아야 하기에 문제점이 발생 할 수있기에 타입을 변경 했어야 했습니다.
- 
### 해결방법
- 결합도를 낮추기 위해 하나의 객체가 여러개의 일을 하면 문제가 될 수있다고 생각을 했으며 1,2,3,4,5 에서 1=2, 2=3, 3=4, 4=5 이런식으로 단일 책임을 갖게 되면 좋을꺼 같아 타입을 변경하여 진행 하게 되었습니다.
```swift
func decreaseStock(with juice: Juice) {
        let recipe: [Fruit: Int] = juice.recipe
        for (fruit, quantity) in recipe {
            if let stock = self.stock[fruit] {
                self.stock[fruit] = stock - quantity
            }
        }
    }
```
- 기존 `Juice` 타입에서 -> `Fruit` 타입으로 변경 하여 `decreaseStock()` 함수를 재구현 했습니다.

```swift
 func decreaseStock(with fruits: [Fruit: Int]) {
        for (fruit, quantity) in fruits {
            if let stock = self.stock[fruit] {
                self.stock[fruit] = stock - quantity
            }
        }
    }
```

## 코드 가독성, 중복되는 코드 (1)
### 문제점
- 기존에 각각의 쥬스제조 버튼에 모든 액션함수들을 따로 선언했었습니다.
- 이렇게 할 경우, 가독성의 문제와 같은 코드들이 반복적으로 사용되는 문제가 있었고 결국 코드의 유지보수성도 떨어뜨리는 문제가 있었습니다.

```swift
   @IBAction func strawBerryBananaJuiceButton(_ sender: UIButton) {
        if juiceMaker.order(.strawBerryBananaJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock(sender)
        } else {
            notEnoughFruitStock()
        }
    }
@IBAction func bananaJuiceButton(_ sender: UIButton) { ... }
@IBAction func pineappleJuiceButton(_ sender: UIButton) { ... }
@IBAction func kiwiJuiceButton(_ sender: UIButton) { ... }
@IBAction func mangoKiwiJuiceButton(_ sender: UIButton) { ... }
@IBAction func mangoJuiceButton(_ sender: UIButton) { ... }
```

### 해결방법
- 기존의 액션함수들을 하나로 합치고 `sender`로 들어오는 `UIButton`타입의 `Label`을 읽어서 구분하도록 했습니다. 따라서 중복되는 기능을 제거하는 한편 코드의 유지보수성도 높아질 수 있도록 수정할 수 있었습니다.
```swift
@IBAction func orderJuice(_ sender: UIButton) {
        guard let senderTitle = sender.titleLabel?.text else { return }
        let juiceNameFromSendTitle = senderTitle.components(separatedBy: "쥬스").first
        
        switch juiceNameFromSendTitle {
        case "딸기":
            showOrderedAlert(sender, by:.strawBerryJuice)
        case "딸바":
            showOrderedAlert(sender, by:.strawBerryBananaJuice)
        case "바나나":
            showOrderedAlert(sender, by:.bananaJuice)
        case "파인애플":
            showOrderedAlert(sender, by:.pineAppleJuice)
        case "키위":
            showOrderedAlert(sender, by:.kiwiJuice)
        case "망키":
            showOrderedAlert(sender, by:.mangoKiwiJuice)
        case "망고":
            showOrderedAlert(sender, by:.mangoJuice)
        default:
            print("없는 메뉴입니다.")
        }
        modifyFruitStockOnLabel()
    }
```

## 코드 가독성, 중복되는 코드 (2)
### 문제점
- 코드 가독성, 중복되는 코드(1)에서 ```switch-case```구문으로 변경을 진행했는데, 이 것 역시 각각의 쥬스가 추가될 때 마다 case를 하나씩 추가해줘야되는 문제가 있었습니다.
- case의 조건 특성상 어쩔 수 없이 하드코딩이 된다는 느낌을 받아서 수정을 진행하였습니다.

### 해결 방법
- ```Juice```타입에 ```rawValue```를 다음과 같이 할당하였습니다.
```swift
enum Juice: String {
    case strawberryJuice = "딸기"
    case bananaJuice = "바나나"
    case pineappleJuice = "파인애플"
    case kiwiJuice = "키위"
    case mangoJuice = "망고"
    case strawberryBananaJuice = "딸바"
    case mangoKiwiJuice = "망키"
    }
```
- 그 다음 ```Juice```의 ```rawValue```값을 활용하여 기존 switch처럼 case를 따로 추가하지 않아도 되도록 수정을 하였습니다.
```swift
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let senderTitle = sender.titleLabel?.text,
              let juiceNameFromSendTitle = senderTitle.components(separatedBy: "쥬스").first,
              let juice = Juice(rawValue: juiceNameFromSendTitle) else { return }
        
        showOrderedAlert(by: juice)
        modifyFruitStockOnLabel()
    }
```

## 코드 가독성, 중복되는 코드 (3)
### 문제점
- ```viewController```특성상 규모가 커지고 그와 동시에 ```if-else```의 빈번한 사용, 중복된 코드로 인해 가독성이 떨어지고 속도에도 영향을 미칠 수 있는 문제가 있었습니다.
- ```changeStockViewController```에서 ```UILabel```, ```UIStepper```를 배열로 사용할 때, 각각의 함수에서 다음과 같이 선언하여 사용하였습니다. 
```swift
final class ChangeStockViewController: UIViewController {
    lazy var fruitAndLabel: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel
    ]
    private func updateFruitStockOnStepper() {
        let fruitAndStepper: [Fruit: UIStepper] = [
            .strawberry: strawberryStepper,
            .banana: bananaStepper,
            .pineapple: pineappleStepper,
            .kiwi: kiwiStepper,
            .mango: mangoStepper
        ]
    }
    @IBAction func changeStockOnLabel(by sender: UIStepper) {
        let stepperAndLabel: [UIStepper: UILabel] = [
            strawberryStepper: strawberryStockLabel,
            bananaStepper: bananaStockLabel,
            pineappleStepper: pineappleStockLabel,
            kiwiStepper: kiwiStockLabel,
            mangoStepper: mangoStockLabel
        ]
    }
}
```
### 해결방법
- ```typealias```와 ```tuple```을 사용하여 ```FruitComponent```라는 타입을 만들고, 이를 활용해서 기존의 선언된 ```UIStepper```, ```UILabel```, ```Fruit```을 사용하는 배열을 합칠 수 있었고, ```if-else``` 구문들을 전부 ```guard```로 변경을 진행하였습니다.
```swift
final class ChangeStockViewController: UIViewController {    
    typealias FruitComponent = (fruit: Fruit, label: UILabel, stepper: UIStepper)
    
    lazy var fruitComponents: [FruitComponent] = [(.strawberry, strawberryStockLabel, strawberryStepper),
                                                  (.banana, bananaStockLabel, bananaStepper),
                                                  (.pineapple, pineappleStockLabel, pineappleStepper),
                                                  (.kiwi, kiwiStockLabel, kiwiStepper),
                                                  (.mango, mangoStockLabel, mangoStepper)]
}
```

## 화면전환, 데이터 전달
### 문제점
- 기존 ```delegate``` 패턴에서 ```singleton```으로 변경을 진행하였는데, ```ChangeStockViewController```에서 ```MakeJuiceViewController```로 화면이 넘어가는 동시에 데이터는 전달되나, 화면이 업데이트가 되지 않는 문제가 있었습니다.

### 해결방법
- 첫 번째 문제로는 ```present```로 화면을 보여줄 때, 두 번째 화면인 ```ChangeStockViewController```가 전체화면이 아닌, 위에 팝업창 같이 나타나서 첫 번째인 ```MakeJuiceViewController```가 종료되지 않는 문제를 해결하기위해 
```swift
private func presentChangeStockViewController() {
    changeStockNavigationController.modalPresentationStyle = .fullScreen
}
```
- ```presentChangeStockViewController()``` 메서드에 ```fullScreen```기능을 사용하여 두 번째화면이 팝업이 아닌, 전체화면으로 보이고 그와 동시에 첫 번째 화면이 종료될 수 있도록 하였습니다.
- 두 번째 문제로는 ```ViewController```의 생명주기와 관련이 있었습니다. 
- 기존에 ```viewDidLoad()```에 수량 레이블을 최초에 업데이트만 했기 때문에, 화면이 다시 전환된 후 재고수량이 변경될 수 있도록  ```viewWillApear()```에서 업데이트를 진행하도록 다음과 같이 추가하였습니다.
```swift
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        modifyFruitStockOnLabel()
    }
```

---

## 📚 참고 링크

- [🍎Apple Docs: Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization//)
- [🍎Apple Docs: Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)
- [🍎Apple Docs: Nested Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [🍎Apple Docs: Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/)
- [🍎Apple Docs: Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
- [🍎Apple Docs: API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)

---

## 👬 팀 회고

## 우리팀이 잘한 점
- `if` `switch` 조건문을 최대한 사용하지 않았다.
- 최소한의 코드 구현으로 프로젝트 구현을 진행했다.
## 우리팀 개선할 점
- 코드의 가독성을 생각한 부분이 부족했다.
- 네이밍이 어색한 부분 개선이 필요하다.
- 함수의 기능을 분리하는 점에서 개선이 필요하다.
## 서로에게 좋았던 점 피드백
- 서로 다른 생각을 가지고 있었기에 문제 해결 진행에 있어 여러가지 방안이 제시 되었다.
- 프로젝트 끝까지 포기하지 않고 늦은 시간까지 텐션을 잃지 않아서 열심히 할 수 있었다.
## 서로에게 아쉬웠던 점 피드백
- 리팩토링 부분을 찾는 시간을 갖지 못했다
- STEP2를 진행할 때 커밋 관리가 잘 안되었던 점 (STEP1, STEP3에서는 이상 없었다.)
