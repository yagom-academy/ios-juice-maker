# 🥤쥬스 메이커
> 쥬스를 입력받아 재료를 확인하고 재료의 재고가 있으면 레시피대로 쥬스를 만들어 주는 프로그램

**프로젝트 진행 기간** | 23.05.08.(월) ~ 23.05.26.(금)

## 📚 목차
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [시각화 구조](#-시각화-구조)
- [트러블 슈팅](#-트러블-슈팅)
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
- **23/05/10 (수)**
    - 접근제어자 설정 및 네이밍 리팩토링
- **23/05/11 (목)** 
    - 쥬스를 주문받는 메서드와 만드는 기능 분리
- **23/05/12 (금)**
    - 레시피 반환 메서드를 연산 프로퍼티로 수정
- **23/05/16 (화)**
    - 과일 재고 label 추가
    - 쥬스 주문 버튼 메서드 구현
    - alert 메서드 및 과일 수량 레이블 변경 메서드 구현
    - 재료 부족 alert와 재고 수정 버튼에서 화면 전환 기능 구현
- **23/05/18 (목)**
    - 버튼 tag 사용 삭제 및 searchJuice 메서드 수정

## 🔍 시각화 구조
### UML 다이어그램
![](https://hackmd.io/_uploads/rkf3HOErh.png)


## 🔨 트러블 슈팅 
📣코드는 토글 처리 되어있습니다.

### 1️⃣ **오류 처리 (Result type)**
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


### 2️⃣ **복잡한 타입**
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


### **3️⃣ 매개변수 없이 반환하는 메서드**
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

### 4️⃣ **이니셜라이저가 실행되기 전에 다른 프로퍼티에서 초기값 받기**
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

🔑 **최종 해결방법** <br>
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

---

### **5️⃣ 화면 전환 방법 선택하기**
🔒 **고민했던 점 :네비게이션 vs 모달** <br>

  과일의 재고가 부족할 경우나 `JuiceOrderView`에서 재고 수정 버튼을 터치할 경우에 `ChangeStockView`에서 과일의 재고를 추가한 뒤 `JuiceOrderView`로 돌아가는 화면 전환은 어떤 것이 좋을지 고민했습니다.

   - 네비게이션 인터페이스 특징
       - `Navigation Controller`는 주로 계층적 구조의 화면전환을 위해 사용되는 드릴 다운 인터페이스(각 선택할 수 있는 항목에 대한 세부항목이 존재하는 인터페이스)입니다.
       - 뷰 컨트롤러 스택에 따라 화면을 스택에 푸시(`push`)하거나 팝(`pop`)하는 방식으로 화면 전환을 합니다.
       - 화면 전환 시에는 이전 뷰 컨트롤러에서 다음 뷰 컨트롤러로 정보를 전달 할 수 있습니다.
- 모달 특징
    - 화면을 다른 화면위에 띄워서 사용자의 이목을 끌기 위해 사용합니다.
    - 현재 뷰 컨트롤러 위에 겹쳐져서 표시되며 다른 뷰 컨트롤러로 이동하기 위해서는 닫아야 합니다.
    - 모달은 얼럿을 통해 확인/취소 중 하나를 선택하거나 액션시트에서 선택을 하는 등의 특정 선택을 완료 해야한다는 특징이 있습니다.

→ 네비게이션 인터페이스는 주로 앱의 메인 탐색 흐름과 화면 전환을 관리하는 데 사용되고, 모달은 추가 정보나 임시 작업에 필요한 화면 전환에 사용됩니다.

 `ChangeStockView`에서 과일의 재고를 추가한 뒤 `JuiceOrderView`로 돌아가는 화면 전환은 정보의 흐름이 중요하다고 생각했습니다. 그 결과 네비게이션을 통한 화면 전환을 채택하게 되었습니다.
 
### **6️⃣ 매직넘버,리터럴없이 버튼에 접근하기**

🔒 **문제점** <br>
`UIButton`에 접근하기 위한 방법으로 최초로 선택한 방법은 `tag`를 사용해 각 버튼에 `Int`값을 지정해주고 그 `Int`값에 직접 접근하는 방식이었습니다. 하지만 이렇게 접근하게 될 경우 `tag` 자체가 매직넘버가 되기 때문에 추후에 유지보수가 필요하거나 버튼에 변경사항이 생길 때 코드를 수정하는 것에 어려움이 생기게 됩니다.

<details> 
<summary>코드</summary>
    
```swift
        switch tag {
        case 1:
            return .strawberryJuice
        case 2:
            return .bananaJuice
        case 3:
         // 이하 중략
        default:
            return nil
        }
```
</details>
<br>

🔑 **해결방법 첫번째** <br>

첫번째로 찾았던 해결책은 `currentTitle`메서드를 이용해 `UIButton`의 텍스트에 접근하는 방식이었고 이 방식으로 코드의 가독성은 올릴 수 있었습니다. 하지만 근본적으로 매직리터럴을 사용하는 부분을 여전히 고치지 못했고 그렇게 때문에 추후에 tag를 사용할 때와 비슷한 문제점이 발생할 수 있었습니다.
<details> 
<summary>코드</summary>
    
```swift
				switch tag {
        case "딸기쥬스 주문":
            return .strawberryJuice
        case "바나나쥬스 주문":
            return .bananaJuice
        case "파인애플쥬스 주문":
         // 이하 중략
        default:
            return nil
        }
```
</details>
<br>

🔑 **최종 해결방법** <br>

최종적으로 `namespace`패턴을 사용해 해결했습니다. 
열거형에 타입프로퍼티를 넣어주고 그 곳에 `UIButton`의 String값을 할당해주었고 그 값을 가져와 switch문에서 호출해줄 수 있도록 하였습니다.
<details> 
<summary>코드</summary>
    
```swift
private enum ButtonTitle {
        static let strawberryJuiceOrder = "딸기쥬스 주문"
        static let bananaJuiceOrder = "바나나쥬스 주문"
        static let pineappleJuiceOrder = "파인애플쥬스 주문"
        // 이하 중략
        static let mangoKiwiJuiceOrder = "망키쥬스 주문"
    }
    
    private func searchJuice(by buttonTitle: String) -> Juice? {
        switch buttonTitle {
        case ButtonTitle.strawberryJuiceOrder:
            return .strawberryJuice
        case ButtonTitle.bananaJuiceOrder:
            return .bananaJuice
        case ButtonTitle.pineappleJuiceOrder:
            return .pineappleJuice
        // 이하 중략
        case ButtonTitle.mangoKiwiJuiceOrder:
            return .mangoKiwiJuice
        default:
            return nil
        }
    }
```
</details>
<br>

## 📑 참고자료
- [Swift API Design Guidelines - Naming](https://www.swift.org/documentation/api-design-guidelines/#naming)
- [Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)
- [Access control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)
- [Nested Type](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/)
- [Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
