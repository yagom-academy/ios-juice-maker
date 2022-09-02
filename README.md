# **쥬스 메이커 (juice-maker)**

---

## 1. **소개**

사용자가 버튼을 통해 쥬스를 주문하면 쥬스를 만들어주고 재료를 소모합니다.
재료 수정 페이지를 통해 부족한 재료를 추가할 수 있습니다.

---

## 2. **🧑‍🤝‍🧑 팀원**

### 팀원
| **stone** | **제이푸시** |
| ----- | ----- |
| <img width="180px" src="https://avatars.githubusercontent.com/u/74972815?v=4"> | <img width="180px" src="https://i.imgur.com/JqEDLOf.jpg"> |

## 3. 👩🏻‍💻 실행 화면(기능 설명)
-- 이후 추가

## 4. **🔥 트러블 슈팅**

**`FruitStore`인스턴스의 싱글톤패턴**
- 추후에 재고를 증가,감소 시키는 재고관리, 쥬스생성시 관리를 하는 `FruitsStore`는 프로그램 상 하나의 클래스 인스턴스만 존재하여야 한다고 생각하여, `싱글톤`패턴을 적용해 보았습니다.

- 레시피를 만들때 튜플 배열 or 딕셔너리
    - 레시피를 만들 때 둘 중 어떤 방식을 채택할지 고민했습니다.
        - [.strawberry : 10, .banana : 1]
        - [(.strawberry, 10), (.banana, 1)]
    - 별 다른 차이점을 느끼지 못해서 가독성이 조금 더 좋다고 생각한 딕셔너리를 사용했습니다.

 - switch문을 사용해서 에러 메세지를 catch 할 때 case별로 체크를 해 주면 마지막에 예상외의 에러를 체크해주는 부분을 한번에 묶어주기 위해서 `LocalizedError`를 사용했습니다.
    ```swift
    // localizedError 미사용
    catch errorCase1 {}
    catch errorcase2 {}
    catch {}
    // localizedError 사용
    catch { print(error.localizedDescription) }
    ```
    
**쥬스의 레시피를 가져올 때 고민했던 점**
- enum에서 원시값으로 딕셔너리를 주는 방법을 찾지 못했기 때문에 `struct` 타입을 만들어서 구현해주었습니다. 
- enum의 값들과 중복되는 부분이 많아, enum내에 enum value를 이용해 레시피를 구현하는 방법을 채택했습니다.
    
해결 전
```swift 
struct Recipe {
    static let strawberry: [Fruit : Int] = [.strawberry : 16]
    static let banana: [Fruit : Int] = [.banana : 2]
    static let kiwi: [Fruit : Int] = [.kiwi : 3]
    static let pineapple: [Fruit : Int] = [.pineapple : 2]
    static let strawberryBanana: [Fruit : Int] = [.strawberry : 10, .banana : 1]
    static let mango: [Fruit : Int] = [.mango : 3]
    static let mangoKiwi: [Fruit : Int] = [.mango : 2, .kiwi : 1]

    static func fetchJuiceRecipe(_ juice: Juice) -> [Fruit : Int] {
        switch juice {
        case .strawberry:
            return Recipe.strawberry
        case .banana:
            return Recipe.banana
        case .kiwi:
            return Recipe.kiwi
        case .pineapple:
            return Recipe.pineapple
        case .strawberryBanana:
            return Recipe.strawberryBanana
        case .mango:
            return Recipe.mango
        case .mangoKiwi:
            return Recipe.mangoKiwi
        }
}
```

해결 후
```swift
enum Juice: String {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기쥬스"
        case .banana:
            return "바나나쥬스"
        case .kiwi:
            return "키위쥬스"
        case .pineapple:
            return "파인애플쥬스"
        case .strawberryBanana:
            return "딸바쥬스"
        case .mango:
            return "망고쥬스"
        case .mangoKiwi:
            return "망키쥬스"
        }
    }
    
    // 레시피 부분
    var recipe: [Fruit : Int] {
        switch self {
        case .strawberry:
            return [.strawberry : 16]
        case .banana:
            return [.banana : 2]
        case .kiwi:
            return [.kiwi : 3]
        case .pineapple:
            return [.pineapple : 2]
        case .strawberryBanana:
            return [.strawberry : 10, .banana : 1]
        case .mango:
            return [.mango : 3]
        case .mangoKiwi:
            return [.mango : 2, .kiwi : 1]
        }
    }
}
```

---


## 5. **🛠기능 구현**
---
### JuiceMaker
- 프로퍼티
    - let fruitStore - `FruitStore` 클래스 인스턴스를 할당하는 변수
- 메서드
    - makeJuice(_ juice: Juice) - `Juice`타입의 `recipe`값으로 쥬스를 제조하는 메서드
    - validFruitAmount(for recipe : [Fruit : Int]) throws - 과일의 재고를 체크하는 메서드
    
### FruitStore
- 프로퍼티
    - static let shared - `싱글톤`패턴을 사용하기 위한 타입 속성
    - var fruitsStock: [Fruit : Int] - `과일 : 개수` 묶음의 `Dictionary`타입
- 메서드
    - private init() - `싱글톤`패턴을 사용하기 위해 `private` 접근 제어자를 명시한 생성자
    - useFruits(for recipe: [Fruit : Int]) throws - 쥬스 생성시, 과일 갯수를 차감하는 메서드
    - fetchFruitAmount(for fruit: Fruit) throws -> Int - 과일의 갯수를 체크하는 메서드
### Fruit - 과일에 대한 타입의 `enum`
    
### Juice - 쥬스에 대한 타입의 `enum`
- 프로퍼티
    - var name - 쥬스의 `name`을 `String`타입으로 `return`하는 계산 속성
    - var recipe - 쥬스의 `recipe`를 `[Fruit : Int]` Dictionary로 `return`하는 계산속성

### JuiceMakerError
- **fruitAmountError** - 쥬스를 만드는데 필요한 과일 재고가 부족한 경우
- **fruitExistError** - 해당 과일이 과일저장소에 존재하지 않을 경우
- **LocalizedError** - `localizedDescription` 를 사용하기 위해 프로토콜을 채택

---

## **6. 🤔고민한 부분**
---
**이미 유효성을 확인 한 후에 `Dictionary`의 값을 사용할 때**
- `fetchFruitAmount`함수를 사용하여, 과일의 유효성 체크를 하는데, 유효성 체크 후 `useFruits`함수를 사용하여 과일의 갯수를 감소시킵니다.
- `useFruits`함수 내부에서 `Dictionary`값인 `fruits`를 사용하는데,이미 유효성 검사가 끝난 값이라 굳이 `throw`로 에러를 던지지 않고 `return`으로 처리해도 되지 않을까 고민했습니다.
```swift
func useFruits(recipe: [Fruit : Int]) throws {
    for (fruit, amount) in recipe {
        guard let fruitAmount = fruits[fruit] else {
            throw JuiceMakerError.fruitExistError
        }

        self.fruits[fruit] = fruitAmount - amount
    }
}
```

**딕셔너리 [Fruit : Int]를 사용해서 과일 저장소를 구현할 때 Int의 모호함을 해결하기 위한 고민**

딕셔너리로 표현시 처음 보는 사람이 의미를 잘 파악하지 못할 수 있으므로 과일명과 재고를 가지고 `Struct`를 정의해서 구현을 고민했습니다.

1. Typealias 파일을 만들어서 `typealias`들을 명시합니다.
    - 단점: 사용하는 파일에 `typealias`가 무슨 타입인지 구현을 확인해야 합니다.

2. 사용하는 파일에 각각 `typealias`를 명시해줍니다.
    - 단점: 다른 파일의 코드를 가져다 쓴다면 매개변수에 쓰이는 부분때문에 중복 명시가 있습니다.

두가지 방법중 1번의 단점을 좀 더 크게 보고 2번의 방법을 채택하고 싶었으나 파일의 길이가 길어지면 1의 단점이 똑같이 드러나게 된다고 생각했습니다. 2가지 방법으로도 해결을 하지 못한다 생각해서 `Struct`로 딕셔너리를 구현할 생각을 했습니다.
`Sturct`로 구현하는 방법을 채택하여 진행하려 했지만, `Dictionary`를 사용했을 때의 로직들을 전부 리팩토링이 이루어져야해, 비효율적으로 느껴졌습니다. 그래서 `Dictionary` 값을 할당하고 있는 `fruits` 변수의 네이밍 수정을 통하여 `Dictionary`타입의 방식을 채택하기로 결정했습니다.


## 7. **🔗 참고 링크**
