# 🥤쥬스 메이커
> 쥬스를 입력받아 재료를 확인하고 재료의 재고가 있으면 레시피대로 쥬스를 만들어 주는 프로그램
> 

## 📚 목차
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [트러블 슈팅](#-트러블-슈팅)
- [참고자료](#-참고자료)

## 🧑‍💻 팀원 소개

| <img src="https://hackmd.io/_uploads/B1I0iwo42.jpg" width="100"/> | <img src="https://i.imgur.com/8mg0oKy.jpg" width="100" height="130"/> | <img src="https://hackmd.io/_uploads/BkLspwoVh.png" width="100" height="130"/>|
| :-: | :-: | :-: |
| [<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Yetti**](https://github.com/iOS-Yetti) | [<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Mary**](https://github.com/MaryJo-github) |[<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **yy-ss99**](https://github.com/yy-ss99) |

## ⏰ 타임라인
**프로젝트 진행 기간** | 23.05.08.(월) ~ 23.05.26.(금)

- **23.05.09.(화)** 
    - 전체 구조에서 필요한 타입들 선언 및 파일별 정리
    - 재고를 조절하는 기능 구현
    - 에러처리를 위한 에러 타입 구현
- **23.05.10.(수)**
    - 접근제어자 설정 및 네이밍 리팩토링
- **23.05.11.(목)** 
    - 쥬스를 주문받는 메서드와 만드는 기능 분리
- **23.05.12.(금)**
    - 레시피 반환 메서드를 연산 프로퍼티로 수정



## 🔨 트러블 슈팅 

### 1️⃣ **오류 처리 (Result type)**
🔒 **문제점** <br>
Result Type의 success부분에 Bool값을 넣어주었지만 실질적으로 반환되는 true값을 사용하지 않는다는 문제가 있었습니다. 그렇기 때문에 들어가는 값이 true이든 false이든 프로그램 실행에는 문제가 없었고 결과적으로 success의 true값은 쓸모없는 값이 되었습니다.
``` swift
private func checkFruitStock(_ recipe: [Recipe]) -> Result<Bool, JuiceMakerError> {
    for fruit in recipe {
        guard let stock = fruitStore.fruitStock[fruit.name] else { return .failure(JuiceMakerError.notExistFruit) }
        guard stock >= fruit.quantity else { return .failure(JuiceMakerError.ingredientShortage) }
    }
    return .success(true)
}
```


🔑 **해결방법** <br>
특정한 값이 반환되어야 한다는 고정관념 때문에 여러 값을 넣어 시도해보았지만 결국 모두 불필요한 값이 되어버렸고 결과적으로는 Void 반환 값을 이용해 success되었다는 의미만 반환될 수 있도록 코드를 수정하였습니다.
``` swift
private func checkFruitStock(_ recipe: [Recipe]) -> Result<Void, JuiceMakerError> {
    for fruit in recipe {
        guard let stock = fruitStore.fruitStock[fruit.name] else { return .failure(JuiceMakerError.notExistFruit) }
        guard stock >= fruit.quantity else { return .failure(JuiceMakerError.ingredientShortage) }
    }
    return .success(())
}
```
<br>


### 2️⃣ **복잡한 타입**
🔒 **문제점** <br>
`Juice` 타입의 `recipe` 프로퍼티는 쥬스를 만들 때 필요한 과일의 종류와 수량을 같이 반환해주어야하고, 필요한 과일의 종류가 2개 이상일 수 있으니 튜플의 배열 타입으로 설정해주었습니다.
하지만 이렇게 구현하면 `recipe` 프로퍼티를 매개변수로 받는 메서드의 정의 부분이 길어져 가독성이 떨어졌습니다.
``` swift
private func checkFruitStock(_ recipe: [(name: Fruits, quantity: Int)]) -> Result<Void, StockError> {}
```

🔑 **해결방법** <br>
`typealias` 를 이용하여 튜플 배열 타입을 정의하였더니 코드가 훨씬 깔끔해졌고, naming을 통해 튜플 배열 타입이 `recipe`의 타입이라는 것이 조금 더 명확해지는 효과를 얻었습니다. 
``` swift
typealias Recipe = (name: Fruits, quantity: Int)

private func checkFruitStock(_ recipe: [Recipe]) -> Result<Void, StockError> {}
```
<br>


### **3️⃣ 매개변수 없이 반환하는 메서드**
🔒 **문제점** <br>
`receiveRecipe`는 매개변수를 받지 않고 정해진 쥬스가 있다면 그 뒤에 메서드가 실행되어 해당 케이스의 값만 가져오는 역할을 하였습니다. 로직 상에 큰 문제는 없었지만 굳이 메서드까지 사용하여 레시피의 반환값만을 가져올 필요는 없었습니다.
``` swift
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

🔑 **해결방법** <br>
결과적으로 `receiveRecipe` 메서드를 `recipe` 연산 프로퍼티로 변경로 변경해주었습니다. 
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
<br>

### 4️⃣ **이니셜라이저가 실행되기 전에 다른 프로퍼티에서 초기값 받기**
🔒 **문제점** <br>
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
`Cannot use instance member 'initialStock' within property initializer; property initializers run before 'self' is available` 
초기값을 주려는 상황에서 이니셜라이저가 실행되기 전에 .self에 접근해서 값을 가져오려고 해서 이런 오류가 발생했습니다.

🔑 **해결방법 첫번째** <br>

``` swift
static let initialStock = 10
var fruitStock: [Fruits: Int] = [
    .strawberry: initialStock, 
    .banana: initialStock,
    .pineapple: initialStock, 
    .mango: initialStock,
    .kiwi: initialStock
]	
```
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

🔑 **최종 해결방법** <br>
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
- 두 번째 방안`lazy` 키워드 사용
    
    `lazy` 키워드 특징
    
    - 프로퍼티가 처음 사용되기 전까지는 메모리에 올라가지 않습니다. 그래서 시간이 오래 소요되는 작업에 `lazy` 를 붙이면 실제 작업이 진행되기 전까지는 실행되지 않아 효율적입니다.  작업이 다른 작업에 의존적인 경우에 사용합니다.

   → `initialStock`은 전역적으로 접근할 필요없고, `fruitStock`를 초기화 할 때만 필요하다고 판단했습니다. 그래서 `static let initialStock`을 활용하는 대신에 `fruitStock`를 `lazy var`로 만들어 접근 시에 값을 할당하도록 수정하였습니다.


## 📑 참고자료
- [Swift API Design Guidelines - Naming](https://www.swift.org/documentation/api-design-guidelines/#naming)
- [Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)
- [Access control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)
- [Nested Type](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/)
- [Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
