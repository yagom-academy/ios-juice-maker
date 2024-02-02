## 프레이(Prism + Gray)🙏의 쥬스메이커 🧃

### 목차
[1. 소개](#1.-소개)  
[2. 팀원](#2-팀원)  
[3. 타임라인](#3-타임라인)  
[4. 프로젝트 구조](#4-프로젝트-구조)  
[5. 실행 화면](#5-실행-화면)  
[6. 트러블슈팅](#6-트러블슈팅)  
[7. 팀 회고](#7-팀-회고)  
[8. 참고 자료](#8-참고-자료)  

---
### 1. 소개
#### **프레이(Prism + Gray)🙏의 쥬스메이커 🧃**
 쥬스를 주문하여 신선한 과일🍓🍌 쥬스를 만들고, 과일의 재고를 관리할 수 있습니다!
만약, 과일이 부족하여 쥬스를 만들 수 없다면, 과일을 추가해서 맛있는 쥬스를 드셔보세요!!🤩

### 2. 팀원
| <img src="https://avatars.githubusercontent.com/u/27756800?s=48&v=4" width="200"> | <img src="https://avatars.githubusercontent.com/u/139211436?v=4" width="200"> |
| :---: | :---: |
| Prism ([Github](https://github.com/PrismSpirit/)) | Gray ([Github](https://github.com/yawoong2)) |

### 3. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.01.15(월) ~ 01.16(화) | 과일 재고를 관리하는 기능 구현 |
| 24.01.17(수) ~ 01.19(금) | 쥬스 레시피에 따라 과일 재고를 소비하는 기능 구현 |
| 24.01.22(월) | 재고 수정 화면 전환 구현 |
| 24.01.23(화) | 주문 조건에 따른 Alert 구현 |
| 24.01.24(수) ~ 01.26(금) | 재고 수정 화면 Label 구현 |
| 24.01.29(월) ~ 01.30(화) | stepper에 의해 과일 수량의 update 구현 |
| 24.01.31(수) ~ 02.01(목) | 여러 기종에서 UI가 정상적으로 보이도록 Auto Layout 적용 |
| 24.2.2(금) | UML 및 README 작성 |

### 4. 프로젝트 구조
#### Sequence Diagram
![img](https://raw.githubusercontent.com/PrismSpirit/ios-juice-maker/step3/JuiceMaker_SequenceDiagram.png)

#### Class Diagram
![img](https://raw.githubusercontent.com/PrismSpirit/ios-juice-maker/step3/JuiceMaker_ClassDiagram.png)

### 5. 실행 화면
| 상황 | 실행 화면 |
| :---: | :---: |
| 주문 성공 | ![img](https://github.com/PrismSpirit/ios-juice-maker/blob/step3/JuiceMaker_simulate_case1.gif?raw=true) |
| 주문 실패 후<br>재고 수정 화면으로 이동 | ![img](https://github.com/PrismSpirit/ios-juice-maker/blob/step3/JuiceMaker_simulate_case2.gif?raw=true) |
| 초기 화면에서<br>재고 수정 화면으로 이동 | ![img](https://github.com/PrismSpirit/ios-juice-maker/blob/step3/JuiceMaker_simulate_case3.gif?raw=true) |

### 6. 트러블슈팅
#### ❗️에러 처리
##### 📌 문제 상황
```swift
func checkStock(fruit: Fruit, amount: Int) -> Bool {
    do {
        let stockOfFruit = try takeStock(fruit: fruit)

        return stockOfFruit >= amount ? true : false
    } catch FruitStoreError.fruitNotFound {
        print("해당 과일이 존재하지 않습니다.")
    } catch {
        print("알 수 없는 오류입니다.")
    }
        
    return false
}
```
`checkStock()`은 `try takeStock()`으로 throw되는 error를 catch해 예외 처리를 하고 충분한 과일이 있으면 true, false를 반환하도록 구현했습니다. 최종적으로 `juiceMaker()`에서 `checkStock()`을 호출하고 error handling을 하게 되는데, 현재 구현으로는 과일이 부족하거나 다른 error가 발생해 false를 반환 받을 경우 정확히 어떤 원인으로 실패했는지 알기가 어렵고 중간에 error handling을 할 이유가 없다고 판단했습니다.

##### 🛠️ 해결 방법
```swift
func checkStock(fruit: Fruit, amount: Int) throws {
    if try takeStock(fruit: fruit) < amount {
        throw FruitStoreError.outOfStock
    }
}
```
error propagation을 통해 `takeStock()`이 유효하지 않은 과일을 받을 경우 `FruitStoreError.fruitNotFound`, 과일의 수량이 부족할 때 `FruitStoreError.outOfStock`을 throw해 `juiceMaker()`에서 error handling을 할 수 있도록 코드를 수정했습니다.

#### ❗️과일 재고 데이터에 대한 접근
##### 📌 문제 상황
```swift
//JuiceMakerViewController.swift
final class JuiceMakerViewController: UIViewController, JuiceMakerViewDelegate {
    var juiceMaker = JuiceMaker(fruitStore: FruitStore(fruits: [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]))
}
```
```swift
//JuiceMaker.swift
struct JuiceMaker {
    var fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
}
```
```swift
//FruitStore.swift
final class FruitStore {
    var fruitBox: [Fruit: Int] = [:]

    init(fruits: [Fruit: Int]) {
        fruitBox = fruits
    }
}
```
juiceMaker 인스턴스가 자신만의 fruitStore 인스턴스를 소유하도록 코드를 작성했습니다. 이 경우 stockEditView에서 재고를 변경할 때 juiceMaker가 가진 fruitStore 인스턴스에 변경사항을 반영하기가 번거롭다는 문제점이 있었습니다.

##### 🛠️ 해결 방법
```swift
//FruitStore.swift
final class FruitStore {
    static var shared = FruitStore()
    
    var fruitBox: [Fruit: Int] = [:]

    private init() {
        self.fruitBox = [
            .strawberry: 10,
            .banana: 10,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
    }
}
```
singleton pattern을 활용해 FruitStore가 shared 인스턴스를 갖도록 구성했습니다. 프로그램에 전역적 상태를 도입하여 코드의 결합도를 높이는 문제점이 있지만, 프로젝트의 규모와 해당 패턴을 사용함으로써 얻는 데이터 공유의 용이함의 이익을 종합적으로 고려했을 때 본 프로젝트에 가장 적합하다고 판단해 singleton pattern을 채택했습니다.

#### ❗️label에 대한 불필요한 update
##### 📌 문제 상황
```swift
// StockEditViewController.swift
func updateFruitQuantityLabel(_ view: StockEditView) {
    let fruits = FruitStore.shared.fruitBox
    
    view.updateFruitQuantityLabel(fruits: fruits)
}
```
```swift
// StockEditView.swift
@IBAction func adjustStrawberryStepper(_ sender: UIStepper) {
    delegate?.updateSingleFruitStock(fruit: .strawberry, quantity: Int(sender.value))
    delegate?.updateFruitQuantityLabel(self)
}

func updateFruitQuantityLabel(fruits: [Fruit: Int]) {
    for (fruit, quantity) in fruits {
        switch fruit {
        case .strawberry:
            strawberryQuantity.text = String(quantity)
        case .banana:
            bananaQuantity.text = String(quantity)
        case .pineapple:
            pineappleQuantity.text = String(quantity)
        case .kiwi:
            kiwiQuantity.text = String(quantity)
        case .mango:
            mangoQuantity.text = String(quantity)
        }
    }
}
```
stepper value가 변할 경우 과일 재고에 이를 반영하고, 재고를 전부 불러와 label을 update 하도록 했습니다. 하지만 이럴경우, 과일 하나에 대한 stepper를 조작했음에도 모든 과일에 대한 재고를 불러와 일괄적으로 label을 변경하게 돼 효율적이지 않다고 판단했습니다.

##### 🛠️ 해결 방법
```swift
// StockEditViewController.swift
func updateSingleFruitQuantityLabel(_ view: StockEditView, fruit: Fruit) {
    guard let quantity = FruitStore.shared.fruitBox[fruit] else {
        return
    }

    view.updateSingleFruitQuantityLabel(fruit: fruit, quantity: quantity)
}
```
```swift
// StockEditView.swift
@IBAction func adjustStrawberryStepper(_ sender: UIStepper) {
    delegate?.updateSingleFruitStock(fruit: .strawberry, quantity: Int(sender.value))
    delegate?.updateSingleFruitQuantityLabel(self, fruit: .strawberry)
}

func updateSingleFruitStepperValue(fruit: Fruit, quantity: Int) {
    switch fruit {
    case .strawberry:
        strawberryStepper.value = Double(quantity)
    case .banana:
        bananaStepper.value = Double(quantity)
    case .pineapple:
        pineappleStepper.value = Double(quantity)
    case .kiwi:
        kiwiStepper.value = Double(quantity)
    case .mango:
        mangoStepper.value = Double(quantity)
    }
}
```
모든 과일에 대해 label을 일괄 업데이트 하는 코드를 단일 과일에 대해 label을 업데이트 하는 코드로 분해하여 fruitStepper value의 변화가 생길 경우 재고에 변화가 있는 과일에 대해서만 label을 update하도록 개선했습니다.

### 7. 팀 회고
#### 우리팀이 잘한 점 😍
- 프로젝트 초반, 기능 구현에 속도를 내기보다 Model의 구조를 잘 짜는 것에 집중했습니다. 덕분에 프로젝트 진행 중 Model에 대한 큰 수정 사항 없이 이후의 기능 구현에 집중할 수 있었습니다.
- 코드 리팩토링 과정에서 각자 생각한 방법에 대해 서로 의견을 주고 받은 점이 잘했다고 생각합니다.
- 프로젝트 커밋 단위를 작게 가져가면서 프로젝트를 되돌아봐야 하는 상황이 발생했을 때, 기록물로써 활용할 수 있었습니다.
- Delegate Pattern을 활용해 Controller와 View 좀 더 명확하게 분리해 코드의 의존성을 낮추고 재사용성을 높일 수 있었습니다.
- Sequence Diagram 및 Class Diagram을 작성하여 프로젝트 구조를 쉽게 파악할 수 있도록 하였습니다.

#### 우리팀 개선할 점 💦
- ViewController 사이의 데이터를 전달하는 방식이 여러 개 있지만 본 프로젝트에서 사용하지 않은 부분이 있는데, 이 부분에 대해 더 자세히 공부해보면 좋을 것 같습니다. (Segue, Closure 등)
- 프로젝트의 코드를 이해하기 쉽도록 API Design Guidelines에 따라 신중하게 타입을 명명해야합니다.

#### 서로에게 좋았던 점 피드백 😊
- **Prism:** 궁금한 부분에 대해 그냥 넘어가지 않고 물어봐주셨고, 제가 아는 부분에 대해서는 다시 한번 상기하게 되어 좋았습니다. 둘다 모르는 내용은 함께 고민하고 찾아보며 학습할 수 있어 좋았습니다! 😁
- **Gray:** 원하지 않는 방향대로 구현이 되었거나, 막히는 부분이 있을 때 반드시 이해를 하고나서 다음 스텝으로 넘어가시는 학습습관을 보고 감명받았습니다. 개발자의 필수 역량이라고 생각합니다. 그리고 저의 경우 팀 프로젝트의 코드를 쫓아가는게 시간이 많이 소요되었는데, 제가 충분히 이해할 수 있도록 다시 코드를 작성하는 기회를 주시고 기다려주셔서 시간을 뺏어 정말 미안하고, 감사했습니다! 덕분에 코드를 작성하는데 자신감도 생기고 퀄리티를 많이 높일 수 있었던 기회가 되었습니다! 🌝

#### 개인적으로 아쉬웠던 점 💦
- **Prism:** 프로젝트 초반에 클래스 다이어그램 또는 구조들 간의 관계에 대해 좀 더 고민하는 시간을 많이 들였다면 코드를 더 적게 수정할 수 있었을텐데 하는 아쉬움이 있었습니다. 다음 프로젝트를 진행할 때, 이 부분에 대해 더 신경을 많이 쓰고자 합니다! 😄
- **Gray:** 팀 프로젝트의 코드는 제일 실력이 낮은 팀원의 퀄리티로 완성된다고 생각합니다. 그 점에서 프로젝트 기간 동안 프로젝트 내 코드의 많은 내용들을 체화시켰다면, 지금보다 더 컴팩트한 코드가 완성되었을 것입니다. 이번에 새로 배운 많은 것들을 개인 시간에 복습을 해서 반드시 제 것으로 만들어야겠습니다!🧐

### 8. 참고 자료
📍[Swift documentation: Error Handling](<https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/>)  
📍[Swift documentation: Protocol(Delegation)](<https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/#Delegation>)  
📍[Swift documentation: UIStepper](<https://developer.apple.com/documentation/uikit/uistepper>)  
📍[Swift documentation: NotificationCenter](<https://developer.apple.com/documentation/foundation/notificationcenter>)  