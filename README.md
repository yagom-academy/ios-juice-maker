# 쥬스메이커 프로젝트 🧃
쥬스 메이커가 레시피에 따라 후르츠 스토어의 과일을 사용하여 쥬스를 만드는 프로젝트

---
## 목차 📋
1. [팀원 소개](#1-팀원-소개)
2. [타임 라인](#2-타임라인-230102--230120)
3. [프로젝트 순서도](#3-프로젝트-순서도)
4. [실행화면](#4-실행화면)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [참고 링크](#6-참고-링크)

---
## 1. 팀원 소개
|Andrew|혜모리|
|---|---|
|<img src="https://github.com/Andrew-0411/ios-juice-maker/blob/step1/images/Andrew.png" width="250">|<img src="https://github.com/Andrew-0411/ios-juice-maker/blob/step1/images/hyemory.png" width="250">|

## 2. 타임라인 (23.01.02. ~ 23.01.20.)
|날짜|진행 내용|
|---|---|
|2023-01-02|프로젝트 시작 <br/> FruitStore, JuiceMaker 타입과 각 기능 구현|
|2023-01-03|네이밍 정리, 테스트 코드 삭제 후 STEP1 PR 발송|
|2023-01-04|review 내용 확인 및 반영 (기능 분리, 접근 제어자 추가)|
|2023-01-05|FruitStore의 stock 프로퍼티를 은닉화하도록 기능 분리
|2023-01-06|STEP2 진행 시작, UIKit 학습|
|2023-01-09|미션 전체 내용 수행 및 STEP2 PR 발송|
|2023-01-10|싱글톤, notification 학습|
|2023-01-11|Auto-Sizing, Auto-Layout 학습|
|2023-01-12|stepper 생성, 싱글톤, notification, AutoLayout 추가|
|2023-01-13|코드 컨벤션 정리 및 STEP3 PR 발송|

## 3. 프로젝트 순서도
<img src="https://github.com/Andrew-0411/ios-juice-maker/blob/3edc3de4f1aee5ba4fa858eb5f604a47281a6dac/images/JuiceMakerFlowchart.jpg" width="550">

## 4. 실행화면
![fruitStore](https://user-images.githubusercontent.com/45560895/212246572-87854fb2-1b59-4c61-9c41-3e5d6802f328.gif)

## 5. 트러블 슈팅
#### 🔒 **과일과 재고 수량을 함께 담는 방법?** <br/> 
- 과일과 과일의 재고 수량을 담는 방법을 고민하다가 `Dictionary`를 사용하여 과일은 중복될 일이 없고 과일과 재고를 묶어 사용하는 것이 효율적이라 판단하여 과일(key), 재고 수량(value)을 한번에 담았습니다.
이와 같은 의도로 각 쥬스의 레시피도 `Dictionary`를 사용하였습니다.

#### 🔒 **Cannot use instance member 'Label명' within property initializer; property initializers run before 'self' is available** <br/>
- 이번 프로젝트에서는 과일의 종류와 UI 오브젝트를 연결하기위해 딕셔너리를 많이 사용하였습니다.
그러나 UI오브젝트를 선언하면 선언할 당시에는 초기값이 없기 때문에 그대로 딕셔너리로 담으려고 하면 해당 컴파일 오류를 만납니다.
구글링 결과 `lazy` 키워드를 사용하면 선언하고서 바로가 아닌, 사용될 때 메모리에 할당되기 때문에 오류가 발생하지 않았습니다.
사용되는 함수에서 지역변수로 선언하면 `lazy`를 사용하지 않아도 되지만, 코드 가독성을 위해 프로퍼티로 선언하였습니다.

```swift
@IBOutlet private weak var strawberryLabel: UILabel!
@IBOutlet private weak var bananaLabel: UILabel!
@IBOutlet private weak var pineappleLabel: UILabel!
@IBOutlet private weak var kiwiLabel: UILabel!
@IBOutlet private weak var mangoLabel: UILabel!
    
private lazy var fruitStockValue: [FruitStore.Fruit: UILabel] = [
    .strawberry: strawberryLabel,
    .banana: bananaLabel,
    .pineapple: pineappleLabel,
    .kiwi: kiwiLabel,
    .mango: mangoLabel
]
```

#### 🔒 **쥬스를 만드는 기능(`makeJuice` 메서드)과 과일을 빼는 기능(`substractFruit` 메서드)** <br/> 
- 처음엔 `makeJuice` 메서드에 `FruitStore`의 재고 정보를 가져와서 함께 비교하려고 하였는데, 역할을 나누고자 `FruitStore` 타입에서 재고 정보와 필요한 과일의 개수를 비교하여 사용한 과일의 개수를 빼주는 `substractFruit` 메서드를 구현하였습니다.

#### 🔒 **Result Type 사용 시 에러처리?** <br/> 
- 에러처리를 위해 만든 열거형 `JuiceMakerError`가 Error 프로토콜을 채택할 뿐이라 마지막에 catch한 error와 함께 `failure`의 Error로 묶을 수가 없었습니다. 그래서 extension을 이용하여 `LocalizedError` 프로토콜을 수정하였고 하나의 error로 사용할 수 있게 됐습니다. 또한 `LocalizedError`의 `localizedDescription` 기능으로 오류에 대한 문구 출력도 간편해졌습니다.
```swift
func makeJuice(_ juice: Juice) -> Result<Juice, Error> {
    do {
        try checkFruitStore(for: juice)
        try useFruit(for: juice)
        return .success(juice)
    } catch let error {
        return .failure(error)
    }
}
```

#### 🔒 **싱글톤의 단점** <br/>
- `FruitStore` 클래스에 `shared`라는 싱글톤만 사용하면 편하게 재고를 수정할 수 있었으나,
싱글톤을 여기저기서 남발하면 결합도가 증가한다고 판단하여 `NotificationCenter`를 적용하기로 결정했습니다.

#### 🔒 **notification 적용하기** <br/>
- 현재 상태에서 어떻게하면 조금이라도 결합도를 낮출지 고민해 보았습니다.
FruitStoreViewController 클래스에서 바로 재고를 업데이트하지 않고 notification에 설정한 재고를 전달해서, JuiceMakerViewController가 업데이트하는 방법을 고안해 보았습니다.

- a. 변경한 재고를 딕셔너리에 담아 notification center에 전달하기
```swift
// 수정한 재고를 빈 딕셔너리에 담기
private func addStockListByStepper() -> [FruitStore.Fruit: Int] {
    var stockList: [FruitStore.Fruit: Int] = [:]
        
    for (fruit, value) in fruitStockValue {
        guard let quantityAdded = value.text, let stockToBeAdded = Int(quantityAdded) else {
            return addStockListByStepper()
        }
        stockList[fruit] = stockToBeAdded
    }
    return stockList
}

// FruitStoreViewController viewWillDisappear에 post 추가
center.post(name: .stockNotification, object: nil,
                    userInfo: ["newStock": addStockListByStepper()])
```

- b. 받아온 notification을 현재 재고에 반영하기
```swift
// JuiceMakerViewController viewDidLoad에 옵저버 추가
center.addObserver(self, selector: #selector(updateStock(_:)), name: .stockNotification, object: nil)

// 받아온 notification을 재고에 반영
@objc private func updateStock(_ noti: Notification) {
    guard let addStockList = noti.userInfo?["newStock"] as? [FruitStore.Fruit: Int] else {
        return
    }
        
    for (fruit, afterStock) in addStockList {
        let beforeStock = FruitStore.shared.checkStockValue(fruit: fruit)
            
        if beforeStock != afterStock {
            let finalStock = afterStock - beforeStock
            try? FruitStore.shared.addStock(fruit: fruit, amount: finalStock)
        }
    }
}
```

#### 🔒 **초기값이 있는 stepper의 value 증감** <br/> 
- 과일 `Label`에 현재 재고를 적용하고 `stepper`로 재고를 수정하라는 요구사항이 있었습니다.
처음엔 과일 Label들의 값에 stepper 액션을 더해서 그 결과를 Label에 담아보려고 했으나...

```swift
@IBAction private func changeStrawberryStock(_ sender: UIStepper) {
        strawberryLabel.text = "\((Int(strawberryLabel.text ?? "0") ?? 0) + Int(sender.value))"
    }
```

- stepper의 증가 값이 (현재재고+1) + (현재재고+2) + (현재재고+3) + (현재재고+4) + (현재재고+5)...가 되는 바람에 stepper에 초기값을 넣어주는 방법으로 변경했습니다.
앞서 사용한 현재 재고를 Label에 업데이트하는 방법과 같이 각각의 과일, stepper를 딕셔너리로 짝을 지어준다음 `for-in` 구문으로 초기값을 적용해주었습니다.

```swift
private lazy var fruitStockStepper: [FruitStore.Fruit: UIStepper] = [
        .strawberry: strawberryStepper,
        .banana: bananaStepper,
        .pineapple: pineappleStepper,
        .kiwi: kiwiStepper,
        .mango: mangoStepper
]

private func setFruitStepper() {
        for (fruit, stepper) in fruitStockStepper {
            stepper.value = Double(FruitStore.shared.checkStockValue(fruit: fruit))
        }
}
```

#### 🔒 **Storyboard AutoLayout에 stackView 적용하기** <br/>
- stackView를 사용하지 않을시 객체 하나 하나를 AutoLayout을 설정해 줘야 하며 일정한 간격으로 layout을 배치하기가 까다로웠습니다. <br/>
<img src="https://github.com/Andrew-0411/ios-juice-maker/blob/f82289b0209f3b7c0c063d428d142c17336d4e9c/images/autolayout.png" width="550">

- Storyboard에 있는 stackView 기능으로 Image, Label, Stepper를 stackView로 설정하고 설정한 객체들을 다시 한번 stackView로 설정하므로써 일정한 간격으로 layout을 배치하게 되었습니다. <br/>
<img src="https://github.com/Andrew-0411/ios-juice-maker/blob/f82289b0209f3b7c0c063d428d142c17336d4e9c/images/stackView.png" width="250">

## 6. 참고 링크
1. [애플 개발자 공식문서 : Result](https://developer.apple.com/documentation/swift/result)
2. [애플 개발자 공식문서 : LocalizedError](https://developer.apple.com/documentation/foundation/localizederror)
3. [애플 개발자 공식문서 : AutoLayout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html)
4. [애플 개발자 공식문서 : NotificationCenter](https://developer.apple.com/documentation/foundation/notificationcenter)
5. [애플 개발자 공식문서 : Stepper](https://developer.apple.com/documentation/swiftui/stepper)
6. [애플 개발자 공식문서 : UIStepper](https://developer.apple.com/documentation/uikit/uistepper)
7. [애플 개발자 공식문서 : Singleton](https://developer.apple.com/documentation/swift/managing-a-shared-resource-using-a-singleton)
8. [Cannot use instance member within property initializer 컴파일 오류](https://yeniful.tistory.com/54)
