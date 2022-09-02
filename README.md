## iOS 커리어 스타터 캠프
## Juice Maker

---

## 목차
#### 1. [팀원-⏰](#1.-팀원)
#### 2. [타임라인-⏰](#2.-타임라인)
#### 3. [고민해볼 점](#3.-고민해볼-점)
#### 4. [참고 링크 🔎](#4.-참고-링크-🔎)
--- 
### 1. 팀원 👥
| <center>Baem| <center>Jeremy |
| -------- | -------- |
| <a href="https://ibb.co/K6tWhrT"><img src="https://user-images.githubusercontent.com/88357373/188073563-1f58d29f-3a36-4d4d-9698-03cf24113fb3.PNG" alt="Ash" border="0" width="200"></a>  | <a href="https://ibb.co/K6tWhrT"><img src="https://i.imgur.com/RbVTB47.jpg" border="0" width="200"></a>  |
| <center>*@baem2* |<center>*@yjjem* |  

---
  
### 2. 타임라인 ⏰
- **[STEP1 구현]** 
    * FruitStore 타입 정의
    
    기본적으로 FruitStore는 재고 변경 요청을 받아야 메소드를 실행합니다. 즉 명령 없이는 행동하지 않습니다. JuiceMaker 에서 주문을 요청해야만 실해이 됩니다.
    
    FruitStore 타입 내부에는 3개의 항목이 정의되어 있습니다:


    #### FruitStore 는 딕셔너리 타입의 저장소 `stock`에서 과일들을 종류별로 관리합니다.
```swift 
    class FruitStore {
    private var stock: [Fruit: Int] = [
        .strawBerry: 10,
        .banana: 10,
        .pineApple: 10,
        .kiwi: 10,
        .mango: 10
    ]
```

#### `checkStockAvailability(of juice: Juice)` 메소드
요청을 받으면 프로퍼티로 받은 과일의 재고 상태를 확인합니다.

```swift
    func checkStockAvailability(of juice: Juice) throws {
        for (fruitName, requiredamount) in juice.recipe {
            guard let stock = self.stock[fruitName], stock != 0 else {
                throw StockError.outOfFruit
            }
            guard let stock = self.stock[fruitName], stock < requiredamount else {
                throw StockError.notEnoughFruit
            }
        }
    }
```
#### `useStockForRecipe(of juice: Juice)`메소드
프로퍼티 값으로 받은 쥬스의 레시피에 따라 재고를 소모합니다.

```swift
    func useStockForRecipe(of juice: Juice) {
        for (fruitName, requiredAmount) in juice.recipe {
            if let stock = self.stock[fruitName] {
                self.stock.updateValue(stock + requiredAmount, forKey: fruitName)
            }
        }
    }
}

```

### 과일 종류 열거형

```swift
enum Fruit {
    case strawBerry
    case banana
    case pineApple
    case kiwi
    case mango
}
```
### 쥬스 종류 및 레시피 열거형 

```swift
enum Juice {
    case strawBerry
    case banana
    case kiwi
    case pineApple
    case strawBerryBanana
    case mango
    case mangoKiwi
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawBerry:
            return [.strawBerry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineApple:
            return [.pineApple: 2]
        case .strawBerryBanana:
            return [.strawBerry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
```
  

  
  
### 3.**고민해볼 점 🤔** 
- Tuple vs Dictionary vs Class vs Struct
- Namespace


  
---

### 4. 참고 링크 🔎 
- [누구나 쉽게 이해할 수 있는 Git-입문 - 발전편](https://backlog.com/git-tutorial/kr/stepup/stepup1_4.html)
lFlow.html)
- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
- [Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
- [Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
- [Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
- [Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
    
