# 🥤쥬스 메이커
> 쥬스를 입력받아 재료를 확인하고 재료의 재고가 있으면 레시피대로 쥬스를 만들어 주는 프로그램

**프로젝트 진행 기간** | 23.05.08.(월) ~ 23.05.26.(금)

## 📚 목차
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [시각화 구조](#-시각화-구조)
- [실행 화면](#-실행-화면)
- [트러블 슈팅](#-트러블-슈팅)
- [팀 회고](#-팀-회고)
- [참고자료](#-참고자료)


## 🧑‍💻 팀원 소개

| <img src="https://hackmd.io/_uploads/B1I0iwo42.jpg" width="100"/> | <img src="https://i.imgur.com/8mg0oKy.jpg" width="100" height="130"/> | <img src="https://hackmd.io/_uploads/BkLspwoVh.png" width="100" height="130"/>|
| :-: | :-: | :-: |
| [<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Yetti**](https://github.com/iOS-Yetti) | [<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Mary**](https://github.com/MaryJo-github) |[<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **yy-ss99**](https://github.com/yy-ss99) |

## ⏰ 타임라인
###### 날짜와 중요한 커밋 위주로 작성되었습니다.

- **23/05/09 (화)**
    - 전체 구조에서 필요한 타입들 선언 및 파일별 정리
    - 재고를 조절하는 기능 구현
    - 에러처리를 위한 에러 타입 구현
- **23/05/11 (목)** 
    - 쥬스를 주문받는 메서드와 만드는 기능 분리
- **23/05/12 (금)**
    - 레시피 반환 메서드를 연산 프로퍼티로 수정
- **23/05/16 (화)**
    - 쥬스 주문 버튼 메서드 구현
    - alert 메서드 및 과일 수량 레이블 변경 메서드 구현
    - 재료 부족 alert와 재고 수정 버튼에서 화면 전환 기능 구현
- **23/05/23 (화)**
    - 재고 추가 화면 진입시 과일의 현재 재고 수량 표시 기능 구현
    - Stepper를 이용한 재고 수정 기능 구현

## 🔍 시각화 구조
### UML 클래스 다이어그램
![](https://hackmd.io/_uploads/ry0Dr26S3.png)


## 📱 실행 화면
- iPhone 14 Pro

- iPhone SE(3generation)



## 🔨 트러블 슈팅 
📣코드는 토글 처리 되어있습니다.

### 1️⃣ **값 전달 방법 결정하기**
🔑 **첫번째 방안 - delegate pattern**

- **장점**

    - 객체 간의 결합도를 낮추는데 효과적입니다. 객체들은 독립적으로 개발되고 변경될 수 있으며, 변경 사항이 다른 객체에 미치는 영향이 최소화됩니다.
    - 코드의 유지보수성과 확장성을 향상시킵니다. `delegate pattern`사용 시 기능을 확장하거나 변경시에 `protocol`와 `extension`을 수정하거나 해당 객체에 적용하는 방식으로 쉽게 수정할 수 있습니다.
    - `protocol`과 `extension`으로 구현되기 때문에 명확하게 정의하고 문서화 할 수 있어 개발자들이 상호작용을 쉽게 파악할 수 있습니다.

- **단점**

    - 상황에 따라 객체 간의 양방향 의존성이 생길 수 있고 기능이 분산 됨으로 객체 간의 관계 파악이 어려워집니다.
    
<details> 
<summary>코드</summary>
    
```swift
final class JuiceOrderViewController: UIViewController {
    ...
    private func presentChangeStockViewController() {
        guard let viewController = storyboard?
            .instantiateViewController(identifier: "ChangeStockViewController") as? ChangeStockViewController else { return }
        viewController.delegate = self
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
     ...
}

extension JuiceOrderViewController: StockDelegate {
    func getCurrentStock() -> [Int] {
        return Fruits.allCases.map { fruits in
            juiceMaker.fruitStore.bringQuantity(of: fruits) }
    }
    
    func addStock(quantities: [Int]) {
        for (index, fruit) in Fruits.allCases.enumerated() {
            juiceMaker.fruitStore.addStock(fruit: fruit, quantity: quantities[index])
        }
    }
}
```

```swift
protocol StockDelegate: AnyObject {
    func getCurrentStock() -> [Int]
    func addStock(quantities: [Int])
}

final class ChangeStockViewController: UIViewController {
    ...
    weak var delegate: StockDelegate?
    ... 
    private func initializeStockLabels() {
        guard let currentStock = delegate?.getCurrentStock() else { return }
        initialStock = currentStock
        for (index, label) in stockChangeLabels.enumerated() {
            label.text = "\(initialStock[index])"
        }
    }
    
    @IBAction private func hitDismissButton(_ sender: UIBarButtonItem) {
        delegate?.addStock(quantities: additionalStock)
        dismiss(animated: true)
    }
    ...
}
```
</details>
<br>
    
🔑 **두번째 방안 - closure**

- **장점**

    - 간단하게 구현할 수 있습니다.

- **단점**

    - 여러 개를 사용하려고 할 수록 코드가 조밀해져서 가독성을 해칠만한 우려가 있습니다.

<details> 
<summary>코드</summary>
    
```swift
final class JuiceOrderViewController: UIViewController {
    ...
    private func presentChangeStockViewController() {
        guard let viewController = storyboard?
            .instantiateViewController(identifier: "ChangeStockViewController") as? ChangeStockViewController else { return }
        viewController.getCurrentHandler = self.getCurrentStock
        viewController.addStockHandler = self.addStock
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    private func getCurrentStock() -> [Int] {
        return Fruits.allCases.map { fruits in
            juiceMaker.fruitStore.bringQuantity(of: fruits) }
    }

    private func addStock(_ quantities: [Int]) {
        for (index, fruit) in Fruits.allCases.enumerated() {
            juiceMaker.fruitStore.addStock(fruit: fruit, quantity: quantities[index])
        }
    }
    ...
}
```
```swift
final class ChangeStockViewController: UIViewController {
    ...
    var getCurrentHandler: (() -> [Int])?
    var addStockHandler: ((_ quantities:[Int]) -> Void)?
    ...    
    private func initializeStockLabels() {
        guard let currentStock = getCurrentHandler?() else { return }
        initialStock = currentStock
        for (index, label) in stockChangeLabels.enumerated() {
            label.text = "\(initialStock[index])"
        }
    }
    
    @IBAction private func hitDismissButton(_ sender: UIBarButtonItem) {
        addStockHandler?(additionalStock)
        dismiss(animated: true)
    }
    ...
}
```
</details>
<br>

🔑 **세번째 방안 - notification**
- **장점**

    - 다수의 객체에 동시에 이벤트를 전달할 수 있습니다.
    - 여러가지 설정해줄 필요없이 짧은 코드로 쉽게 구현할 수 있습니다.

- **단점**

    - 오류의 추적이 쉽지 않습니다. 왜냐하면 `notificationName` 또는 `userInfo`의 `key`값이  `String`값으로 들어가게 되는데 이 부분에 오타가 나서 `post`하는 부분과 `addObserver`부분이 달라지게 되더라도 컴파일이나 런타임에서 에러를 뱉어주지 않기 때문에 직접 눈으로 발견하지 않는 이상 노티피케이션에서 나는 에러인지 인지하기 쉽지 않습니다.
    - `post`가 된 후에 다시 `post`한 부분으로 정보를 받아올 수 없습니다.

<details> 
<summary>코드</summary>
    
```swift
final class JuiceOrderViewController: UIViewController {
    ...
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(addStock(_:)),
                                               name: Notification.Name("changeStock"),
                                               object: nil)
    }
        ...    
    @objc func addStock(_ notification: NSNotification) {
        guard let notifi = notification.userInfo?["additionalStock"] as? [Int] else { return }
        for (index, fruit) in Fruits.allCases.enumerated() {
        juiceMaker.fruitStore.addStock(fruit: fruit, quantity: notifi[index])
        }
    }
}
```
    
```swift 
final class ChangeStockViewController: UIViewController {
		...    
    @IBAction private func hitDismissButton(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: Notification.Name("changeStock"),
                                        object: nil,
                                        userInfo: ["additionalStock": additionalStock])
        dismiss(animated: true)
    }
    ...
}
```
</details>
<br>

→ **코드로 직접 구현해보고 장단점을 고려한 결과 `delegate pattern`을 사용하기로 결정했습니다.**

### **2️⃣ 화면 전환 방법 선택하기**
🔒 **고민했던 점 :네비게이션 vs 모달** <br>

  과일의 재고가 부족할 경우나 `JuiceOrderViewController`에서 재고 수정 버튼을 터치할 경우에 `ChangeStockViewController`에서 과일의 재고를 추가한 뒤 `JuiceOrderViewController`로 돌아가는 화면 전환은 어떤 방식이 좋을지 고민했습니다.

   - 네비게이션 인터페이스 특징
       - `Navigation Controller`는 주로 계층적 구조의 화면전환을 위해 사용되는 드릴 다운 인터페이스(각 선택할 수 있는 항목에 대한 세부항목이 존재하는 인터페이스)입니다.
       - 뷰 컨트롤러 스택에 따라 화면을 스택에 푸시(`push`)하거나 팝(`pop`)하는 방식으로 화면 전환을 합니다.
- 모달 특징
    - 화면을 다른 화면위에 띄워서 사용자의 이목을 끌기 위해 사용합니다.
    - 현재 뷰 컨트롤러 위에 겹쳐져서 표시되며 다른 뷰 컨트롤러로 이동하기 위해서는 닫아야 합니다.
    - 모달은 얼럿을 통해 확인/취소 중 하나를 선택하거나 액션시트에서 선택을 하는 등의 특정 선택을 완료 해야한다는 특징이 있습니다.

→ 네비게이션 인터페이스는 주로 앱의 메인 탐색 흐름과 화면 전환을 관리하는 데 사용되고, 모달은 추가 정보나 임시 작업에 필요한 화면 전환에 사용됩니다.

 `ChangeStockViewController`는 쥬스 주문 과는 관계없이 재고를 수정하는 화면을 띄우는 역할입니다. 이는 흐름상 연결되지 않기 때문에 **모달**로 화면전환을 하는 것이 더 적절하다고 판단했습니다. 
 만약 재고 추가 뷰컨트롤러가 아닌 “주문을 확인중입니다…” 메시지를 띄워주는 뷰컨트롤러로 화면전환을 한다면 쥬스 주문과 같은 흐름이기 때문에 이럴 때에는 네비게이션 인터페이스 방식이 더 적절할 것 같습니다.
 
<br>

### **3️⃣ 여러개의 버튼을 한 개의 IBAction으로 처리하기**

🔒 **문제점** <br>

`JuiceOrderViewController`에는 쥬스를 주문하는 여러개의 버튼이 있고, 버튼을 클릭하면 `placeAnOrder(for:)`메서드를 호출하게 하기 위해 각각의 IBAction을 만들어주었습니다. 하지만 이렇게 구현하니 코드가 중복되는 문제점이 있었습니다.

<details> 
<summary>코드</summary>
    
```swift
@IBAction private func hitStrawberryJuiceOrderButton(_ sender: UIButton) {
		placeAnOrder(for: .strawberryJuice)
}

@IBAction private func hitBananaJuiceOrderButton(_ sender: UIButton) {
		placeAnOrder(for: .bananaJuice)
}

...
```
</details>
<br>

🔑 **해결방법 첫번째** <br>

첫번째로 찾았던 해결책은 `tag`를 이용하는 방식이었고 이를 이용하면 여러개의 버튼을 하나의 IBAction으로 처리할 수 있어 중복되는 코드를 줄일 수 있었습니다. 하지만 어떤 버튼이 `tag`가 몇인지 한 눈에 알기 어려웠고, 각 버튼의 태그를 하나하나 지정해주어야해서 확장성이 좋지 않다고 판단하였습니다.

<details> 
<summary>코드</summary>
    
```swift
private func searchJuice(by tag: Int) -> Juice? {
    switch tag {
    case 1:
        return .strawberryJuice
    case 2:
        return .bananaJuice
		...
    default:
        return nil
    }
}

@IBAction private func hitJuiceOrderButton(_ sender: UIButton) {
    guard let choosedJuice = searchJuice(by: sender.tag) else { return }
		placeAnOrder(for: choosedJuice)
}
```
</details>
<br>

🔑 **최종 해결방법** <br>

최종적으로 여러개의 버튼을 하나의 IBAction으로 묶어주고, 버튼의 `title`을 기준으로 쥬스를 반환해주도록 수정하였습니다. `tag` 방법과는 달리 `title`이 문자열이기 때문에 어떤 버튼인지 한 눈에 알기 쉬워 해당 방법으로 채택하였습니다.

<details> 
<summary>코드</summary>
    
```swift
private func searchJuice(by tag: Int) -> Juice? {
    switch tag {
    case 1:
        return .strawberryJuice
    case 2:
        return .bananaJuice
		...
    default:
        return nil
    }
}

@IBAction private func hitJuiceOrderButton(_ sender: UIButton) {
    guard let choosedJuice = searchJuice(by: sender.tag) else { return }
		placeAnOrder(for: choosedJuice)
}
```
</details>
<br>

### **4️⃣ 매직리터럴 제거하기**

🔒 **문제점** <br>
쥬스를 주문하는 버튼의 title에 따라 쥬스를 반환해주는 `searchJuice`메서드를 만들어주었습니다. 하지만 switch문 안에 버튼의 타이틀을 문자열로 직접 작성해주니 매직리터럴이 되어 문자열의 의미를 한 눈에 알기 어려웠습니다.

<details> 
<summary>코드</summary>
    
```swift
private func searchJuice(by buttonTitle: String) -> Juice? {
    switch buttonTitle {
    case "딸기쥬스 주문":
        return .strawberryJuice
    case "바나나쥬스 주문":
        return .bananaJuice
    ...
    default:
        return nil
    }
}
```
</details>
<br>

🔑 **해결방법** <br>
    
매직리터럴을 해결하기 위해 Juice타입의 연관값 활용, 연산 프로퍼티 활용 등 다양한 방법을 생각해봤지만 코드가 길어져 오히려 가독성이 떨어질 것 같았습니다. 다른 방법을 찾다가 case가 없는 enum을 활용하는 방법을 알게 되었습니다.
해당 방법은 열거형이지만 case가 없기 때문에 초기화는 안되고, 순수히 namespace로서만 작동 가능하다는 장점이 있습니다.
쥬스메이커에 적용은 `ButtonTitle` 열거형에 타입프로퍼티로 각 버튼의 타이틀인 String값을 할당해주었고 그 값을 가져와 switch문에서 호출해줄 수 있도록 하였습니다.
<details> 
<summary>코드</summary>
    
```swift
private enum ButtonTitle {
    static let strawberryJuiceOrder = "딸기쥬스 주문"
    static let bananaJuiceOrder = "바나나쥬스 주문"
    ...
}
    
private func searchJuice(by buttonTitle: String) -> Juice? {
    switch buttonTitle {
    case ButtonTitle.strawberryJuiceOrder:
        return .strawberryJuice
    case ButtonTitle.bananaJuiceOrder:
        return .bananaJuice
		...
    default:
        return nil
    }
}
```
</details>
<br>

### **5️⃣ 이니셜라이저가 실행되기 전에 다른 프로퍼티에서 초기값 받기**
🔒 **문제점** <br>
`Cannot use instance member 'initialStock' within property initializer; property initializers run before 'self' is available` 
초기값을 주려는 상황에서 이니셜라이저가 실행되기 전에 .self에 접근해서 값을 가져오려고 해서 이런 오류가 발생했습니다.

<details>
<summary>코드</summary>
    
``` swift
let initialStock = 10
var fruitStock: [Fruits: Int] = [
    .strawberry: initialStock, 
    .banana: initialStock,
    .pineapple: initialStock, 
    .mango: initialStock,
    .kiwi: initialStock
]	
```
</details>

<br>

🔑 **해결방법 첫번째** <br>
- 첫번째 방안  : `static` 사용
    
    `static` 키워드 장점
    
    - `static`은 해당 구조체의 인스턴스나 클래스가 생성되지 않아도 접근이 가능하다는 장점 때문에 전역적인 기능을 제공 할 수 있습니다.
    - 클래스나 구조체의 인스턴스와는 독립적인 값을 저장할 필요가 있는 경우 `static` 키워드를 사용하여 전역으로 정의할 수 있습니다. 예를 들어, 애플리케이션 전체에서 사용하는 설정값이나 상수 값을 정의할 때 유용합니다.
    
    `static` 키워드 단점
    
    - `static`으로 선언되면 프로퍼티나 메서드는 오버라이딩이 불가능합니다.
    - `static` 키워드를 사용하여 선언된 프로퍼티나 메서드는 클래스나 구조체 내부에서만 사용 가능하기 때문에, 다른 모듈에서 접근하기 어렵습니다. 이를 해결하기 위해서는 `public static`과 같이 선언해야 합니다.
    - `static` 키워드를 사용하여 선언된 프로퍼티나 메서드는 메모리 내에 딱 한 번만 할당되므로, 런타임 동안 값이 변경될 경우 다른 인스턴스나 스레드에서도 변경된 값이 반영됩니다.
    - 종료시까지 메모리가 할당된 채로 존재하므로 많은 `static` 생성시 프로그램 퍼포먼스에 악영향을 줄 수도 있습니다.

  →`stactic` 장단점을 고려했을 때 지금 현재에 코드에 적절한 더 좋은 방안이 있을 것이라고 판단했습니다.
  
<details>
<summary>코드</summary>
    
```swift
static let initialStock = 10
var fruitStock: [Fruits: Int] = [
    .strawberry: initialStock, 
    .banana: initialStock,
    .pineapple: initialStock, 
    .mango: initialStock,
    .kiwi: initialStock
]	
```
</details>

<br>

🔑 **해결방법 두번째** <br>
- 두 번째 방안`lazy` 키워드 사용
    
    `lazy` 키워드 특징
    
    - 프로퍼티가 처음 사용되기 전까지는 메모리에 올라가지 않습니다. 그래서 시간이 오래 소요되는 작업에 `lazy` 를 붙이면 실제 작업이 진행되기 전까지는 실행되지 않아 효율적입니다.  작업이 다른 작업에 의존적인 경우에 사용합니다.

   → `initialStock`은 전역적으로 접근할 필요없고, `fruitStock`를 초기화 할 때만 필요하다고 판단했습니다. 그래서 `static let initialStock`을 활용하는 대신에 `fruitStock`를 `lazy var`로 만들어 접근 시에 값을 할당하도록 수정하였습니다.
   
<details> 
<summary>코드</summary>
    
``` swift
private let initialStock = 10
private(set) lazy var fruitStock: [Fruits: Int] = [
    .strawberry: initialStock, 
    .banana: initialStock,
    .pineapple: initialStock, 
    .mango: initialStock,
    .kiwi: initialStock
]	
```
</details>
    
    
<br>

🔑 **최종 해결방법** <br>


- `init` 메서드 활용
    - `lazy`는 프로퍼티의 초기화 과정이 복잡하거나 다른 값에 의존성을 가지고 있는 경우 초기화 될 때 문제가 발생할 가능성이 있어서 코드의 복잡성을 증가시킨다는 단점이 있다고 생각했습니다. 다른 방안이 있지 않을까 고민하던 중에 `init`메서드를 활용하는 것이 좋다는 생각이 들었습니다.
    - `initialStock`의 초기값은 변경될 수 있을 것 같아 `init`메서드의 매개변수로 받아주었고, `fruitStock`은 `initialStock`프로퍼티를 통해 초기 재고를 설정하도록 구현하였습니다.
    
    → `lazy`키워드를 사용하면 `fruitStock`이 처음 사용될 때 초기화되었지만 변경된 코드에서는 `FruitStore` 인스턴스가 생성될 때 만들어지기 때문에 더 일찍 초기화하게 됩니다.
<details> 
<summary>코드</summary>
    
``` swift
init(initialStock: Int = 10) {
    self.fruitStock = [.strawberry: initialStock,
                        .banana: initialStock,
                        .pineapple: initialStock,
                        .kiwi: initialStock,
                        .mango: initialStock]
    }
```
</details>

### 6️⃣ **오류 처리 (Result type)**
🔒 **문제점** <br>
Result Type의 success부분에 Bool값을 넣어주었지만 실질적으로 반환되는 true값을 사용하지 않는다는 문제가 있었습니다. 그렇기 때문에 들어가는 값이 true이든 false이든 프로그램 실행에는 문제가 없었고 결과적으로 success의 true값은 쓸모없는 값이 되었습니다.
<details> 
<summary>코드</summary>
    
``` swift
private func checkFruitStock(_ recipe: [Recipe]) -> Result<Bool, JuiceMakerError> {
    for fruit in recipe {
        guard let stock = fruitStore.fruitStock[fruit.name] else { return .failure(JuiceMakerError.notExistFruit) }
        guard stock >= fruit.quantity else { return .failure(JuiceMakerError.ingredientShortage) }
    }
    return .success(true)
}
```
</details>
<br>

🔑 **해결방법** <br>
특정한 값이 반환되어야 한다는 고정관념 때문에 여러 값을 넣어 시도해보았지만 결국 모두 불필요한 값이 되어버렸고 결과적으로는 Void 반환 값을 이용해 success되었다는 의미만 반환될 수 있도록 코드를 수정하였습니다.
<details> 
<summary>코드</summary>
    
``` swift
private func checkFruitStock(_ recipe: [Recipe]) -> Result<Void, JuiceMakerError> {
    for fruit in recipe {
        guard let stock = fruitStore.fruitStock[fruit.name] else { return .failure(JuiceMakerError.notExistFruit) }
        guard stock >= fruit.quantity else { return .failure(JuiceMakerError.ingredientShortage) }
    }
    return .success(())
}
```
</details>
<br>


###  **7️⃣ 복잡한 타입**
🔒 **문제점** <br>
`Juice` 타입의 `recipe` 프로퍼티는 쥬스를 만들 때 필요한 과일의 종류와 수량을 같이 반환해주어야하고, 필요한 과일의 종류가 2개 이상일 수 있으니 튜플의 배열 타입으로 설정해주었습니다.
하지만 이렇게 구현하면 `recipe` 프로퍼티를 매개변수로 받는 메서드의 정의 부분이 길어져 가독성이 떨어졌습니다.
<details> 
<summary>코드</summary>
    
``` swift
private func checkFruitStock(_ recipe: [(name: Fruits, quantity: Int)]) -> Result<Void, StockError> {}
```
</details>
<br>

🔑 **해결방법** <br>
`typealias` 를 이용하여 튜플 배열 타입을 정의하였더니 코드가 훨씬 깔끔해졌고, naming을 통해 튜플 배열 타입이 `recipe`의 타입이라는 것이 조금 더 명확해지는 효과를 얻었습니다. 
<details> 
<summary>코드</summary>
    
``` swift
typealias Recipe = (name: Fruits, quantity: Int)

private func checkFruitStock(_ recipe: [Recipe]) -> Result<Void, StockError> {}
```
</details>
<br>


### **8️⃣ 매개변수 없이 반환하는 메서드**
🔒 **문제점** <br>
`receiveRecipe`는 매개변수를 받지 않고 정해진 쥬스가 있다면 그 뒤에 메서드가 실행되어 해당 케이스의 값만 가져오는 역할을 하였습니다. 로직 상에 큰 문제는 없었지만 굳이 메서드까지 사용하여 레시피의 반환값만을 가져올 필요는 없었습니다.
<details>
<summary>코드</summary>
    
``` Swift
func receiveRecipe() -> [Recipe] {
    switch self {
    case .strawberryJuice:
        return [(.strawberry, 16)]
    case .bananaJuice:
        return [(.banana, 2)]
    case .kiwiJuice:
        return [(.kiwi, 3)]
    case .pineappleJuice:
        return [(.pineapple, 2)]
    case .strawberryBananaJuice:
        return [(.strawberry, 10), (.banana, 1)]
    case .mangoJuice:
        return [(.mango, 3)]
    case .mangoKiwiJuice:
        return [(.mango, 2), (.kiwi, 1)]
    }
}
```
</details>

<br>

🔑 **해결방법** <br>
결과적으로 `receiveRecipe` 메서드를 `recipe` 연산 프로퍼티로 변경로 변경해주었습니다. 
<details>
<summary>코드</summary>
    
``` swift
var recipe: [Recipe] {
    switch self {
    case .strawberryJuice:
        return [(.strawberry, 16)]
    case .bananaJuice:
        return [(.banana, 2)]
    case .kiwiJuice:
        return [(.kiwi, 3)]
    case .pineappleJuice:
        return [(.pineapple, 2)]
    case .strawberryBananaJuice:
        return [(.strawberry, 10), (.banana, 1)]
    case .mangoJuice:
        return [(.mango, 3)]
    case .mangoKiwiJuice:
        return [(.mango, 2), (.kiwi, 1)]
    }
}
```
</details>

<br>
    

## 👥 팀 회고
    
### 우리 팀이 잘한 점
- 그라운드 룰로 정한 시간에 잘 모이려 노력했습니다.
- 서로 모르는 부분에 대해 자유롭게 질문 했습니다. 
- 팀원에게 아는 부분에 대해서 자세하게 설명했습니다.
- 팀 프로젝트의 의의에 맞게 함께 고민하는 과정에서 얻는 게 많았습니다.

### 우리 팀이 고쳐야 할 부분 
- 프로젝트에 치중되어 개인공부에 부족함이 있었습니다.

### To. yyss99(와이)
- Yetti: 모르는 부분은 확실하게 이해하려고 노력하는 모습이 좋았습니다! 👍
- Mary: 정확하게 이해하시려는 열정 덕분에 저도 부족한 부분이 무엇인지 알게 되어 공부에 많은 도움이 되었습니다 👍
    
### To. Mary(메리)
- yyss99(와이): 따로 공부한 것들을 잘 공유해주시고 알기 쉽게 설명해주셔서 좋았습니다. 😆
- Yetti: 어떻게 하면 더 나은 코드가 될지를 지속적으로 고민하는 모습이 좋았습니다!👍

### To. Yetti(예티)
- yyss99(와이): 자유롭게 질문하고 모르는 부분에 대해 공유해주셔서 같이 배울 수 있는 분위기를 형성해 주셔서 정말 좋았습니다.😆
- Mary: 프로젝트 전반적인 분위기를 잘 이끌어주셨던 것 같습니다. 또한 열정적으로 공부하시는 모습이 좋았습니다. 👍

    
## 📑 참고자료
- [Swift API Design Guidelines - Naming](https://www.swift.org/documentation/api-design-guidelines/#naming)
- [Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)
- [Access control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)
- [Nested Type](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/)
- [Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
- [Protocol-Delegation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols#Delegation)
- [Properties-Lazy Stored Properties](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties#Lazy-Stored-Properties)
