Week 2 README

# Juice Maker [STEP 2]
> 과일의 재고를 화면에 출력하고,
> 사용자가 주문 버튼을 누르면 해당 쥬스를 만들기 위해 필요한 과일의 수량을 소진합니다.
> 과일의 재고가 다 떨어졌을 경우 쥬스를 만들 수 없으며,
> 재고수정 버튼을 통해 재고를 추가하는 화면으로 이동합니다.

## 📚 목차
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고자료](#-참고자료)

## 🧑‍💻 팀원 소개
| <img src="https://i.imgur.com/PmVVM2M.png" width="200"/> | <img src="https://github.com/devKobe24/BranchTest/blob/main/IMG_5424.JPG?raw=true" width="200" height="200"/> |
| :-: | :-: |
| [**maxhyunm**](https://github.com/maxhyunm) | [**Kobe**](https://github.com/devKobe24) |

## ⏰ 타임라인
프로젝트 진행 기간 | 23.05.11.(목) ~ 23.05.16.(화)

| 날짜 | 진행 사항 |
| -------- | -------- |
| 23.05.11.(목)     |'재고수정'버튼을 터치하여 '재고 추가'화면으로 이동하는 기능 구현, StockViewController 생성.<br/>쥬스 주문 버튼 전체 연결 및 Alert 생성.<br/>JuiceMaker 주문 메서드 1차 연결.<br/>버튼 분기처리 및 재고 없을 경우 재고추가 화면으로 이동하는 로직 구현. |
| 23.05.12.(금)     | showStock 함수 생성, getInventoryStatus 함수 생성, FruitStore 타입 변경.<br/>쥬스 제조 완료 얼럿 추가, 레이블명 수정, 스토리지 weak 설정.<br/>개행 컨밴션 수정.     |
| 23.05.15.(월)     | 내비게이션 바 색상 변경, JuiceMaker에 FruitStore 관련 메서드 생성.<br/>addTarget 함수 분리, label, button 변수명 변경, 접근 제어자 추가.<br/>Alert용 Enum 생성, Alert 메서드 분리, replaceStockLabel 메서드명 변경, 재고수정 내비게이션 컨트롤러 삭제 및 Present Modally로 화면전환 변경.<br/>ViewController명 변경.<br/>MainViewController 개행 수정.|
| 23.05.16.(화)     | showAlert 중복 코드 삭제, Alert 열거형 이름 변경, 개행 수정, 화면전환 방법 show에서 present로 변경, 접근제어자 추가.     |

## 📺 실행화면
- JuiceMaker 실행 화면 <br>
![](https://hackmd.io/_uploads/H18ZpV4Sn.gif)

## 🔨 트러블 슈팅 
### 1️⃣ 과일별 재고 표시 <br>
**문제점**<br>
FruitStore의 재고를 파악하는 함수를 JuiceMaker에 따로 구현하지 않았더니, 필요할 때마다 FruistStore에 직접 접근해야 하는 문제가 생겼습니다.
```swift=!
// MainViewController.swift
let fruitStore = FruitStore(equalizedStock: 10)
lazy var juiceMaker = JuiceMaker(fruitStore: fruitStore)
...
let fruitStock: [Fruit: Int] = fruitStore.getInventoryStatus()
```
```swift=!
// JuiceMaker.swift
init(fruitStore: FruitStore) {
    self.fruitStore = fruitStore
}
```

🔑 **해결방법** <br>
FruitStore 관련 내용을 모두 JuiceMaker를 통해서도 접근할 수 있도록 메서드를 생성했습니다. 또한 전체 과일 재고를 한번에 리턴받을 수 있는 메서드도 추가 구현하여 화면 구성에 용이하도록 했습니다.
```swift=!
// MainViewController.swift
let juiceMaker = JuiceMaker(equalizedStock: 10)
...
let fruitStock: [Fruit: Int] = juiceMaker.getFruitInventoryStatus()
```
```swift=!
// JuiceMaker.swift
init(stock: [Fruit: Int]) {
     self.fruitStore = FruitStore(stock: stock)
 }

init(equalizedStock: Int) {
self.fruitStore = FruitStore(equalizedStock: equalizedStock)
...
func changeFruitStock(of fruit: Fruit, quantity: Int) {
     fruitStore.changeStock(of: fruit, quantity: quantity)
 }

 func getFruitInventoryStatus() -> [Fruit: Int] {
     return fruitStore.getInventoryStatus()
 }
```



### 2️⃣ 에러처리 <br>
🔒 **문제점** <br>
makeFruitJuice 메서드에서 에러가 발생했을 경우, 이 내용을 ViewController에 전달하기 위해 해당 에러를 재전달(다시 throw)하는 형식으로 구현하니 불필요한 코드가 발생했습니다.
```swift!
func makeFruitJuice(menu: FruitJuice) throws {
    ...
     do {
         for ingredient in recipe {
             let changedQuantity = try fruitStore.calculateStock(of: ingredient.fruit, quantity: ingredient.quantity)
     ...
     } catch StockError.fruitNotFound {
         print(StockError.fruitNotFound.message)
        throw StockError.fruitNotFound
     } catch StockError.outOfStock {
         print(StockError.outOfStock.message)
        throw StockError.outOfStock
     } catch {
         print(StockError.unKnown.message)
        throw StockError.unKnown
    ...
}
```

🔑 **해결방법** <br>
makeFruitJuice에서 do-catch문을 삭제하고 throws만 남겨 해당 오류를 그대로 전달하도록 변경했습니다.
```swift!
func makeFruitJuice(menu: FruitJuice) throws {
    let recipe = menu.juiceRecipe
    var changedStock: Recipe = []
    for ingredient in recipe {
        let changedQuantity = try fruitStore.calculateStock(of: ingredient.fruit,
quantity: ingredient.quantity)
    changedStock.append((fruit: ingredient.fruit, quantity: changedQuantity))
    }
    changedStock.forEach {
        fruitStore.changeStock(of: $0.fruit, quantity: $0.quantity)
        }
        print("\(menu.name) 제조가 완료되었습니다.")
	}
```


### 3️⃣ Alert <br>
🔒 **문제점** <br>
얼럿창 처리를 구현하면서 얼럿 메시지를 매직리터럴 처리하니 코드의 가독성이 떨어지고, 유지보수에 용이하지 못할 것 같았습니다.

```swift=!
// ViewController.swift
private func orderJuice(_ menuName: FruitJuice) {
    self.storyboard?.instantiateViewController(
        identifier: "StockViewController"
    ) else {
        return
    }
      do {
            try juiceMaker.makeFruitJuice(menu: menuName)
            showStock()
            let alert = UIAlertController(title: "\(menuName.name) 나왔습니다!",
										  message: "맛있게 드세요!",
										  preferredStyle: .alert)
            let ok = UIAlertAction(title: "야호!",
								   style: .default,
								   handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        } catch StockError.fruitNotFound {
            print(StockError.fruitNotFound.message)
        } catch StockError.outOfStock {
            let alert = UIAlertController(title: "재료가 모자라요.",
										  message: "재고를 수정할까요?",
										  preferredStyle: .alert)
            let ok = UIAlertAction(title: "예",
								   style: .default,
								   handler: { _ in
                                               self.navigationController?.show(stockViewController, sender: self)
            })
            let cancel = UIAlertAction(title: "아니오",
									   style: .default,
									   handler: nil)
           alert.addAction(ok)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
             } catch {
            print(StockError.unKnown.message)
        }
```

🔑 **해결방법** <br>
얼럿 관련 메시지들을 enum 처리하고 얼럿 내용을 함수로 구분하여 가독성을 높였습니다.
```swift=!
// MainViewController.swift
private func showAlert(type: AlertText) {
    ...
    let alert = UIAlertController(title: type.title,
                                  message: type.message,
                                  preferredStyle: .alert)

    switch type {
    ...
    case .outOfStock:
        let ok = UIAlertAction(title: AlertActionText.ok.title,
                               style: .default,
                               handler: { _ in self.navigationController?.present(stockViewController, animated: true)
        })
        ...
}

```
```swift!
// AlertEnum.swift
enum AlertText {
    case menuOut(menu: String)
    case outOfStock
    case confirmStockChange
    
    var title: String {
        switch self {
        case .menuOut(menu: let menu):
            return "\(menu) 나왔습니다!"
    ...
}

enum AlertActionText {
    case ok
    case cancel
    case interjection
    
    var title: String {
        switch self {
        case .ok:
            return "예"
    ...
}
```


🤔 **고민했던 점** <br>

화면전환 기법을 Navigation Controller를 활용한 show로 진행할지, 아니면 Modal을 활용할지에 대하여 고민이 많았습니다. 자동으로 버튼이 구현되는 점, 그리고 UI가 Navigation 형식을 따라 그려져있는 점을 보았을 때는 전자로 구현해야 할 것 같았고, 전체 앱의 흐름을 보았을 때는 후자로 구현하는 것이 맞는 것 같았습니다. 결과적으로 두 가지 모두를 적용해 본 뒤, 흐름에 맞게 Modal을 활용하는 것이 좋겠다는 결론을 내렸습니다.


## 📑 참고자료
- [내비게이션 바](https://developer.apple.com/documentation/uikit/uinavigationbar)
- [모달](https://developer.apple.com/design/human-interface-guidelines/modality)
- [얼럿](https://developer.apple.com/documentation/swiftui/alert)
- [클래스와 구조체](https://bbiguduk.gitbook.io/swift/language-guide-1/structures-and-classes)
- [제어 흐름](https://bbiguduk.gitbook.io/swift/language-guide-1/control-flow)
- [에러 처리](https://bbiguduk.gitbook.io/swift/language-guide-1/error-handling)
