# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

목차
1. [제목](#제목)
2. [소개](#소개)
3. [타임라인](#타임라인)
4. [프로젝트 구조](#프로젝트-구조)
5. [트러블 슈팅](#트러블-슈팅)
6. [참고 링크](#참고-링크)
 
# 제목: 쥬스 메이커
## 소개
주스재고에서 과일을 꺼내어 주스를 만들어주는 프로그램입니다.
|![캡처](https://avatars.githubusercontent.com/u/66786418?v=4)|![CCF2339F-606F-4EE9-97EC-88620DE7174A (1) (1)](https://user-images.githubusercontent.com/71054048/188081997-a9ac5789-ddd6-4682-abb1-90d2722cf998.jpg)|
|---|---|
|토털이|인호|

## 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시
![](https://i.imgur.com/o7ZDmZH.png)
![](https://i.imgur.com/oehAZxd.png)


## 트러블 슈팅
### `fruitStock`프로퍼티 초기화 방법
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

### `Juice`타입에 중첩된 `Recipe`구조체
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

## 참고 링크
- [Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
- [Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
- [Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
- [Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
- [Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
