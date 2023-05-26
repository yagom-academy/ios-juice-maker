# 쥬스 메이커 🍓🍌🥝🍍🥭
과일 재고 관리, 선택한 과일쥬스를 만들어주는 앱

> 프로젝트 기간: 2023-05-08 ~ 2023-05-26

## 🕺 팀원
|EtialMoon|비모|
|:-:|:-:|
|<img src="https://i.imgur.com/hSdYobS.jpg" width="200"/>|<img height="200px" src="https://avatars.githubusercontent.com/u/67216784?v=4">
|[Github Profile](https://github.com/hojun-jo)|[Github Profile](https://github.com/bubblecocoa)|

</br>

## 📝 목차
1. [타임라인](#-타임라인)
2. [실행화면](#%EF%B8%8F-실행-화면)
3. [다이어그램](#-다이어그램)
4. [참고 링크](#-참고-링크)
6. [팀회고](#-팀회고)

</br>

# 📆 타임라인  
|**날짜**|**진행 사항**|
|:-:|-|
|2023-05-10|- `Fruit`, `Ingredient`, `JuiceMenu` 타입 생성<br>- `FruitStore` 내에 프로퍼티, 초기화, 메서드 생성<br>- `JuiceMenu`에 `recipe` 연산 프로퍼티 추가|
|2023-05-11|- `Fruit에` `CaseIterable` 프로토콜 채택<br>- `FruitStore`의 초기화 수정<br>- `FruitStore` 내의 메서드명 변경<br>- `JuiceMaker`에 쥬스 제작 메서드 생성<br>- `JuiceMaker`의 `make` 메서드에서 재료 검사하는 기능 분리<br>- `JuiceError` 타입 생성<br>- 접근제한자 추가|
|2023-05-16|- `FruitStoreViewController` 추가<br>- `Alert`에서 '예' 터치시 `FruitStoreViewController`로 이동하는 기능 추가<br>- 쥬스 제작 완료 시 과일 레이블에 수량 표기 변경<br>- `JuiceMenu`에 `name` 연산 프로퍼티 추가<br>- 중복되는 액션 정리 및 `JuiceMenu`의 타입 `Int`로 지정<br>- 에러 처리 모델에서 컨트롤러로 이동<br>- 컨트롤러 및 메서드, 프로퍼티명 변경<br>- 접근제한자 추가|
|2023-05-17|- 상속이 필요없는 `class`에 `final` 키워드 추가<br>- 에러 종류에 맞는 `Alert` 생성 및 표시|
|2023-05-18|- `JuiceMenu`의 타입 `Int`제거<br>- `Int`값으로 `JuiceMenu`를 얻는 메서드 `matchJuiceMenu`추가<br>- `setFruitStockLabel`의 에러 처리 제거, `nil 병합연산자` 활용하여 처리
|2023-05-22|- 화면 이동을 위한 버튼 액션 추가<br>- `FruitViewController`의 `IBOutlet`, `IBAction` 연결<br>- `FruitViewDelegate` 추가<br>- `JuiceMakerViewController`에서 `FruitViewDelegate`채택 및 준수<br>- 과일 수량 변경 실패 에러 처리<br>- 싱글톤 `Aelrt`클래스 생성<br>- 모든 `showAlert` 메서드를 `Alert`을 이용하도록 변경<br>- `IBAction` 메서드들의 이름 변경<br>- 접근제한자, `final` 키워드 추가|
|2023-05-24|- 클래스, 메서드, 파리미터명 변경<br>- `FruitStockDelegate` 별도 파일로 분리<br>- `FruitStockViewController`의 `fruitStock` 옵셔널 대신 기본값 지정<br>- 가독성 향상을 위해 `FruitStockDelegate`를 `extension`으로 추가<br>- 인터페이스 빌더 대신 뷰 컨트롤러를 이용해 버튼과 스탭퍼의 태그 지정<br>- `Alert`을 싱글톤에서 빌더 패턴으로 변경, `present`를 각 뷰 컨트롤러에서 담당하도록 변경|
|2023-05-25|- 메서드명 오탈자 수정<br>- `JuiceMaker`에 과일 재고 조회, 수정 요청 메서드 추가<br>- `JuiceMakerViewController`에서 `JuiceMaker`의 `FruitStore` 의존성 제거<br>- 접근제한자 누락 수정|
|2023-05-26|- `AlertBuilder`에 `setPreferredStyle`메서드 추가|

</br>

# 🖥️ 실행 화면
- 주문 성공 - 제조 완료 얼럿 노출, 과일 재고 차감

![주문성공](juice_maker_step2.gif)

- 재고 수정 - 수량 변경 후 [닫기] -> 변경한 재고 적용

![재고수정](juice_maker_step3-1.gif)

- 재고가 부족 - 재고 수정 권유 얼럿

![재고부족](juice_maker_step3-2.gif)

</br>

# 💎 다이어그램
<details>
<summary>이미지 펼쳐 보기 / 닫기</summary>
<div markdown="1">
    <img src="class_diagram.jpg" />
</div>
</details>




</br>

# 🚀 트러블 슈팅
## 1️⃣ 하나의 과일만 담당하는 FruitStore

### 🔍 문제점
```swift
class FruitStore {
    private(set) var fruit: Fruit
    private(set) var stock: Int = 10
    ...
}    
```
초기의 `FruitStore`는 하나의 `Fruit`만 담당하게 작성되었다.
그에 따라 `JuiceMaker`의 저장 프로퍼티는 아래와 같이 작성되었다.
```swift
struct JuiceMaker {
    private let fruitStores: [FruitStore] = [
        FruitStore(fruit: .strawberry),
        FruitStore(fruit: .banana),
        FruitStore(fruit: .pineapple),
        FruitStore(fruit: .kiwi),
        FruitStore(fruit: .mango)
    ]
    ...
}
```
`FruitStore`는 단순했지만, `JuiceMaker`가 많은 `FruitStore`를 관리하게 되었다. 
각 타입의 역할을 생각해 보았을 때, 이러한 설계는 좋아 보이지 않았다.

### ⚒️ 해결방안
```swift
class FruitStore {
    private(set) var fruits: [Fruit : Int] = [:]
    ...
}
```
```swift
struct JuiceMaker {
    let fruitStore = FruitStore()
    ...
}
```
각각의 코드를 위와 같이 변경했다.
`FruitStore`는 여전히 단순하지만 여러 개의 `Fruit`을 다룰 수 있게 되었다.
`JuiceMaker`는 여러 개의 `FruitStore`를 관리해야 하는 책임을 내려놓게 되었다.

## 2️⃣ JuiceMenu의 연산 프로퍼티 recipe

### 🔍 문제점
```swift
struct JuiceRecipe {
    let menu: JuiceMenu
    let ingredients: [Ingredient]
}
```
쥬스 제작을 위한 과일 종류와 필요 수량을 저장할 수 있도록 `JuiceRecipe`라는 타입을 생성했다. 하지만 `JuiceMaker`타입 내에 코드량이 방대해지고, 한 번 수정을 위해서는 여러 곳의 코드가 변경되어야 한다는 문제가 있었다.
```swift
struct JuiceMaker {
    ...
    
    private let juiceRecipes: [JuiceRecipe] = [
        JuiceRecipe(
            menu: .strawberryJuice,
            ingredients: [
                Ingredient(fruit: .strawberry, amount: 16)
            ]
        ),
        JuiceRecipe(
            menu: .bananaJuice,
            ingredients: [
                Ingredient(fruit: .banana, amount: 2)
            ]
        ),
        ...
    ]
    
    ...
}
```
### ⚒️ 해결방안
```swift
enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    ...
    
    var recipe: [Ingredient] {
        switch self {
        case .strawberryJuice:
            return [
                Ingredient(fruit: .strawberry, amount: 16)
            ]
        case .bananaJuice:
            return [
                Ingredient(fruit: .banana, amount: 2)
            ]
    ...
}
```
`JuiceRecipe` 타입은 제거하고 `JuiceMenu` 타입 내에 연산 프로퍼티로 `recipe`를 추가했다.
```swift
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice menu: JuiceMenu) {
        do {
            let availableIngredients = try validIngredients(by: menu.recipe)
    ...
}
```
결과적으로 `JuiceMaker` 내의 코드가 간결해졌다.

## 3️⃣ 같지만 다른 7개의 버튼

### 🔍 문제점
```swift
@IBAction func orderStrawberryJuice(_ sender: UIButton) {
    if juiceMaker.make(juice: .strawberryJuice) {
        setFruitStockLabel()
        present(alertJuiceReady(menu: .strawberryJuice), animated: true)
    } else {
        present(alertShortageStock(), animated: true)
    }
}

@IBAction func orderBananaJuice(_ sender: UIButton) {
    if juiceMaker.make(juice: .bananaJuice) {
        setFruitStockLabel()
        present(alertJuiceReady(menu: .bananaJuice), animated: true)
    } else {
        present(alertShortageStock(), animated: true)
    }
}
...
```
쥬스 종류만 다를 뿐 모든 기능이 같은 코드가 7개 생겼다.
버튼과 쥬스 종류에 공통적인 부분만 발생시키면 모두 하나의 코드로 통일할 수 있을 것 같았다.

### ⚒️ 해결방안
`tag`를 이용했다.
`tag`는 `view object`에 부여할 수 있는 `Int` 타입의 요소이다.
`storyboard scene`에서 어떤 컴포넌트를 클릭 후 `Attributes inspector`를 보면 `tag` 값을 볼 수 있다. 기본값은 `0`이다.
`tag` 값과 새로 작성한 `matchJuiceMenu` 메서드를 이용해 코드를 개선했다.
```swift
// 개선 전 코드
@IBAction func orderStrawberryJuice(_ sender: UIButton) {
    if juiceMaker.make(juice: .strawberryJuice) {
        ...
    } else {
        ...
    }
}

@IBAction func orderBananaJuice(_ sender: UIButton) {
    if juiceMaker.make(juice: .bananaJuice) {
        ...
    } else {
        ...
    }
}
...
```
```swift
// 개선 후 코드
@IBAction func orderJuice(_ sender: UIButton) {
    let menu = try matchJuiceMenu(by: sender.tag)

    if juiceMaker.make(juice: menu) {
        ...
    } else {
        ...
    }
}

func matchJuiceMenu(by tag: Int) -> JuiceMenu {
    switch tag {
    case 0:
        return .strawberryJuice
    ...
    default:
        ...
    }
}
```
덕분에 7개의 액션 메서드를 하나의 메서드로 줄일 수 있었다.

## 4️⃣ label 세팅에 너무 많은 에러 처리

### 🔍 문제점
```swift
private func setFruitStockLabel() {
    do {
        strawberryStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .strawberry))
        bananaStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .banana))
        pineappleStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .pineapple))
        kiwiStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .kiwi))
        mangoStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .mango))
    } catch {
        switch error {
        case JuiceError.nonexistentFruit:
            print("FruitStore에 해당 Fruit이 없습니다.")
            showNonexistentFruitAlert()
        default:
            print("알 수 없는 에러")
            showUnknownErrorAlert()
        }
    }
}
```
과일의 재고 수량을 가져오기 위해 `FruitStore`에 구현해 놓은 `receiveStock` 메서드를 이용했다.
해당 메서드는 `Error`를 `throw`하고 있었기 때문에 메서드를 사용하는 곳에서는 `do-catch`와 `try` 구문이 필요했다.
그런데 만약 해당 코드에서 `FruitStore`에 `banana`라는 과일이 없으면 `strawberryLabel`만 제대로 표기되고 그 후로는 전부 제대로 된 값이 보이지 않는 이슈와, 해당 뷰가 뜨자마자 `showNonexistentFruitAlert` 메서드로 인해 "해당하는 과일 종류가 없습니다."라는 메시지가 노출되었다.

### ⚒️ 해결방안
```swift
private func setFruitStockLabel() {
    strawberryStockLabel.text = String(juiceMaker.fruitStore.fruits[.strawberry] ?? 0)
    bananaStockLabel.text = String(juiceMaker.fruitStore.fruits[.banana] ?? 0)
    pineappleStockLabel.text = String(juiceMaker.fruitStore.fruits[.pineapple] ?? 0)
    kiwiStockLabel.text = String(juiceMaker.fruitStore.fruits[.kiwi] ?? 0)
    mangoStockLabel.text = String(juiceMaker.fruitStore.fruits[.mango] ?? 0)
}
```
다행히도 `FruitStore`의 `fruits` 프로퍼티의 권한은 읽기전용이었다. 이것을 통해 바로 과일을 조회했고, 만약 해당 정보가 없으면 `nil 병합연산자`를 이용해 `0`이 표기되도록 했다.
조회되지 않는 과일은 사용자 입장에서는 `0`인 것과 다르지 않았기 때문에, 이렇게 변경해 불필요한 에러처리를 없애고 사용자에게는 최대한 옳은 정보를 제공할 수 있게 되었다.

## 5️⃣ 중복되는 showAlert 메서드

### 🔍 문제점
`JuiceMakerViewController`와 `FruitStockViewController` 모두 에러 발생 시 사용자에게 얼럿을 띄운다.
```swift
private func showAlert(title: String?, message: String?, actions: [UIAlertAction]?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

    if let actions, !actions.isEmpty {
        actions.forEach {
            alert.addAction($0)
        }
    }

    present(alert, animated: true)
}
```
그 때문에 위 메서드가 두 뷰 컨트롤러 사이에 존재했다.
같은 기능을 가진 코드가 여러 곳에 존재하게 되면 유지 보수의 일관성이 없어지기 때문에 별도 파일로 분리하여 사용하기로 했다.

### ⚒️ 해결방안
`AlertBuilder`라는 클래스 파일을 만들었다.
해당 클래스는 빌더 패턴을 적용하여 사용하는 곳에서 여러 체이닝 과정을 통해 손쉽게 `UIAlertController`를 만들 수 있게 했다. 
```swift
// AlertBuilder.swift
final class AlertBuilder {
    private var title: String?
    private var message: String?
    private var actions: [UIAlertAction] = []
    private var preferredStyle: UIAlertController.Style = .alert
    
    func setTitle(_ title: String) -> AlertBuilder {
        self.title = title
        
        return self
    }
    
    func setMessage(_ message: String) -> AlertBuilder {
        self.message = message
        
        return self
    }
    
    func addAction(title: String, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder {
        actions.append(UIAlertAction(title: title, style: style, handler: handler))
        
        return self
    }
    
    func setPreferredStyle(_ preferredStyle: UIAlertController.Style) -> AlertBuilder {
        self.preferredStyle = preferredStyle
        
        return self
    }
    
    func build() -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        actions.forEach {
            alert.addAction($0)
        }
        
        return alert
    }
}

// Usage - ViewController에서
let alert = AlertBuilder()
    .setTitle("제목입니다.") // 해당 항목이 없으면 기본값 nil
    .setMessage("메시지입니다.") // 해당 항목이 없으면 기본값 nil
    .addAction(title: "버튼1", style: .default)
    .addAction(title: "버튼2", style: .default, handler: { _ in doSomething() }) // 액션이 있는 경우
    .addAction(title: "버튼3", style: .default) { _ in doSomething() } // 후행 클로저 적용
    // .setPreferredStyle(.alert) // 기본값이 있고, 변경하지 않아도 되는 경우 생략 가능
    .build() // build 해주지 않으면 UIAlertController가 리턴되지 않는다.
```
우리 팀의 경우 `AlertBuilder`라는 파일을 만들었지만, 해당 코드는 `UIAlertController` 생성에 필요한 요소 전체를 빌더 패턴으로 전환했기 때문에 `UIAlertController`의 `extention`으로 적용해도 좋을듯하다.

</br>

# 📚 참고 링크

* [🍎 Apple Docs - Caseiterable](https://developer.apple.com/documentation/swift/caseiterable)
* [🍎 Apple Docs - updateValue(_:forKey:)](https://developer.apple.com/documentation/swift/dictionary/updatevalue(_:forkey:))
* [🍎 Apple Docs - tag](https://developer.apple.com/documentation/uikit/uiview/1622493-tag)
* [🍎 Apple Docs - Nil-Coalescing Operator](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Nil-Coalescing-Operator)
* [🌐 medium - builder pattern in swift](https://medium.com/swift2go/builder-pattern-in-swift-for-beginners-79415d30872e)

</br>

# 🙆🏻 팀회고

### 우리 팀이 잘한 점
- 클린코드
- 유지보수, 재사용성을 고려한 코드
- 새로운 디자인 패턴을 공부해 프로젝트에 적용

### 서로에게 피드백
- 비모가 문에게: 이전 팀플때는 계속 달려왔던 느낌이었는데, 생각하는 시간을 갖는 문의 습관 덕분에 저도 이런 저런 공부와, 더 많은 샘플 코드를 작성할 수 있었습니다.
- 문이 비모에게: 페어 프로그래밍을 진행하는 중간 중간 생각할 수 있는 시간을 기다려주시고 코로나에 걸렸을 때도 배려를 많이 해주셔서 감사합니다.