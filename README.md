# Juice Maker 

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [실행화면](#-실행-화면)
6. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
7. [참고링크](#-참고-링크)


## 👋 소개
[Kyo](https://github.com/KyoPak)와 [하모](https://github.com/lxodud)가 구현한Juice Maker Step-1 입니다. 


## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()


## 🧑 팀원
<img src = "https://user-images.githubusercontent.com/59204352/187332158-a15815eb-3847-40e5-a6f0-93a373f21180.JPG" width=200 height=170>|<img src="https://i.imgur.com/ydRkDFq.jpg" width=200>|
|:--:|:--:|
|[Kyo](https://github.com/KyoPak)|[하모](https://github.com/lxodud)|
  

## 🕖 타임라인
[Commit History STEP-1](https://github.com/lxodud/ios-juice-maker/commits/step-1)


## 💻 실행 화면 

Step-2 완료 후 업로드 예정



## 🎯 트러블 슈팅 및 고민

### Step - 1
### ***1. guard - let 바인딩 기능 분리화에 따른 에러 케이스 추가 생성에 대한 고민***

```swift
guard var fruitAmount = fruitStock[fruit] else { return }
```
과일의 재고를 더하는 메서드, 차감하는 메서드 이 두 메서드에서 중복된 기능인 위와 같은 부분을 한 메서드로 빼서 기능화하려 하였습니다. 
하지만 옵셔널 값을 언래핑하는 과정에서 언래핑을 하지못했을 경우 return해야 하는 값을 정하지 못했습니다. 
그래서 ConstantNameSpace를 모아둔 파일에 아래와 같은 상수를 추가하였습니다.
```swift 
static let invalidFruit: Int = -1
```

그리고 아래와 같이 코드 로직상으로는 발생하지 않을 에러인 "존재하지 않는 과일오류" 에 대해서도 에러case추가 하였습니다.
```swift
case invalidFruit
```
아래의 `bringValidFruitStock()`메서드에서 옵셔널 바인딩 기능을 가지고 있는 `bringFruitStock()`메서드를 `try`호출하고 존재하지 않을 경우 에러를 throw하였습니다.
```swift
func bringFruitStock(_ fruit: Fruit) throws -> Int { ... }
func bringValidFruitStock(_ fruit: Fruit) -> Int { ... }
```

그래서 결론적으로 "존재하지 않는 과일"이라는 상수, 또 다른 Error Case가 추가 되었고 로직도 다소 복잡해 보일 수 있겠으나, 메서드를 더욱 기능에 따라 분할할 수 있었고, 다양한 Case의 Error을 핸들링할 수 있는 완성도 있는 프로그래밍을 구현했다고 생각합니다.



### ***2. 매직넘버와 같은 namespace 상수를 enum으로 묶을지 struct로 묶을지에 대한 고민***
각각의 주스를 만들 때 필요한 과일의 개수를 모아놓은 namespace를 구현할 때 내부의 프로퍼티를 static으로 선언하기 때문에 인스턴스를 만들필요가 없고 따라서 struct를 쓸 경우에는 초기화를 private로 해줘야했습니다. enum을 사용한다면 해당 부분을 신경쓸 필요가 없다고 생각해서 열거형으로 구현하였습니다.
```swift
enum ConstantUsageFruit { ... }
```

### ***3. 중첩타입 vs Computed Property***
중첩타입을 사용을 해보고 싶어 Juice enum에서 구조체를 만들어 recipe내부를 구현을 했었습니다. 하지만 직접 Computed Property로만 구현하는 것이 더 깔끔하고 가독성이 좋아보여 아래와 같은 Computed Property를 사용하게 되었습니다.
```swift
enum Juice: String {
    var recipe: [SomeType] {
        switch self {
        case 쥬스종류:
            return [(name: 과일이름, count: 매직넘버enum타입.과일이름)]}
        ...
    }
}
```
### ***4. Naming 개선***
1. `func filterError(juice: Juice) -> Bool` ➡️ `func canManufactureJuice(juice: Juice) -> Bool`
filterError라는 네이밍을 통해 해당 함수가 하는 일을 파악하기 어려움 따라서 음료제조를 할 수 있는지 없는지를 판단할 수 있는 네이밍인 `func canManufactureJuice(juice: Juice)`로 수정하였습니다.
2. `let isNotSoldOut` ➡️ `var isEnoughStock: Bool = false`
bool 타입의 변수명에 Not이라는 부정이 들어가게 되니 해당 값의 정확한 의도를 바로 파악하기 어려움 해당 값이 false일 경우 부정의 부정이 되기 때문에 "충분한 재고여부가 있나"를 네이밍으로 선정하여 최대한 직관적으로 판단할 수 있게 고려하였습니다.
3. `func checkStock(juice: Juice) throws -> Bool` ➡️  `func checkEnoughStock(juice: Juice) throws -> Bool`
checkStock이 return하는 값이 정확이 어떤 의미를 가지는지 한눈에 파악하기 어렵기 때문에 true인 경우는 어떤 상황인지, false인 경우는 어떤상황인지 빠르고 명확하게 확인할 수 있도록 개선하였습니다.

## 📚 참고 링크


[The Swift Programming Language (Swift 5.7) - ErrorHandling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)

[The Swift Programming Language (Swift 5.7) - NestedTypes](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)

----- 



