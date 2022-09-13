## 1. 제목: 쥬스 메이커🧃

<br>

## 2. 소개
사용자의 주문에 따른 쥬스 만들기 앱입니다!
실시간 과일 재고를 확인할 수 있고, 과일의 재고 수정도 가능합니다!

<br>

## 3. 팀원
| 애종 | zhilly | bella |
| --- | --- | --- |
| |  | |
<br>

## 4. 타임라인
STEP-1

![image](https://user-images.githubusercontent.com/99257965/188074389-5f11169c-c999-4b12-a3d7-78b1b1ef047d.png)


STEP-2

STEP-3


<br>

## 5. 시각화된 프로젝트 구조
### File Tree

```swift
.
├── Controller
│   ├── AppDelegate.swift
│   ├── JuiceMaker.swift
│   ├── SceneDelegate.swift
│   └── ViewController.swift
├── Info.plist
├── Model
│   ├── Fruit
│   │   ├── Fruit.swift
│   │   ├── FruitStore.swift
│   │   └── Variation.swift
│   └── Juice
│       ├── Juice.swift
│       └── JuiceMaker.swift
├── Protocol
│   ├── FruitStoreProtocol.swift
│   └── JuiceMakerProtocol.swift
└── View
    ├── Assets.xcassets
    │   ├── AccentColor.colorset
    │   │   └── Contents.json
    │   ├── AppIcon.appiconset
    │   │   └── Contents.json
    │   └── Contents.json
    └── Base.lproj
        ├── LaunchScreen.storyboard
        └── Main.storyboard

```

### Flow Chart
#### STEP-1
![](https://i.imgur.com/5Kb3XQ2.jpg)


#### STEP-2

#### STEP-3


<br>

## 6. 실행 화면(기능 설명)


<br>


## 7. 트러블 슈팅
### fruitStock 타입 결정
- 과일의 재고를 관리해주기 위해 재고를 의미하는 fruitStore의 타입을 고민했습니다. 과일의 이름과 그 과일의 재고를 동시에 파악하기 위해 딕셔너리 타입으로 구현했습니다. 

- 재고 확인을 위해 접근할 때 딕셔너리의 특징상 옵셔널을 체크해줘야했습니다. 코드의 재사용성이 높을 것 같아 옵셔널 바인딩 함수를 추가했습니다.


### Juice 추상화
- Juice 파일에서 Netsted Types을 어떻게 활용하여 사용할지 고민했었습니다.Juice 별로 레시피가 다르고 과일을 한 가지만 쓰는 쥬스도 있고 두 가지를 쓰는 쥬스가 있어서 두 번째 값을 옵셔널로 선언을 해줬었는데요. 이렇게 사용하면 문제가 생겼었습니다.
    - 복잡한 후행 처리 : 두 번째 값이 옵셔널로 생성되게 된다면 두 번째 값을 사용할 때 마다 옵셔널을 언래핑해줘야하는 번거로움이 생깁니다.
    - 만약에 세 번째 재료를 사용하는 쥬스가 생긴다면? : 이렇게 되면 위에보다 더 복잡한 처리를 해줘야하는 번거로움이 생깁니다.
- 따라서 옵셔널을 사용하는 방법에서 배열을 사용하는 방식으로 변경하였습니다.
```swift
// 옵셔널을 활용하여 레시피를 표현하는 방법
var recipe: Recipe {
    switch self {
    case .strawberryJuice:
        return Recipe(first: (.strawberry, 16), second: nil)
    case .strawberryBananaJuice:
    return Recipe(first: (.strawberry, 10), second: (.banana, 1))
}

// 배열로 레시피를 표현하는 방법
var recipe: [Recipe] {
    switch self {
    case .strawberryJuice:
        return [Recipe(name: .strawberry, amount: 16)]
    case .strawberryBananaJuice:
        return [Recipe(name: .strawberry, amount: 10), Recipe(name: .banana, amount: 1)]
}

``` 
- 배열을 사용하는 방식을 쓰게 되면 만약에 세 번째 재료를 사용하는 쥬스가 새로 출시된다면 손쉽게 Recipe 구조체만 수정하면 되기 때문에 유지보수 용이성을 가지고 있습니다.

<br>

### Error Handling
- STEP-1의 소스에서는 단순하게 `isEnoughStock()` 함수만을 이용해 단순하게 재고가 수정해야할 양보다 적게되면 오류를 출력해주는 정도로만 사용하고 있는데 후에 ViewController 단위로 작업을 넓혀간다면 `do-try-catch` 또는 `result` 중에 어떤 방법으로 어느 단위에서 구현해야할지 고민중에 있습니다.
- STEP-2 진행 중에 명확하게 구현하는 것이 좋을 것 같습니다.

## 8. 프로젝트 수행 중 핵심 경험

- Nested Types 사용해보기
- Initaliation에 대한 고민

<br>

## 9. 참고 링크

* [API Design Guidlines](https://swift.org/documentation/api-design-guidelines/)
* [Swift Style Guide](https://google.github.io/swift/)
* [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
* [miro.com - flow chart](https://miro.com/)
* The Swift Programming Language (Swift 5.7)
    - [Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
    - [Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
    - [Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
    - [Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
    - [Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
    - [Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)

