# Readme
![](https://i.imgur.com/D8eljos.png)
# **1. 제목: JuiceMaker🍹**

# **2. 소개💬**
사용자가 버튼을 통해 쥬스를 주문하면 재료를 소모하여 쥬스를 제조합니다.
재료 수정 페이지를 통해 부족한 재료를 추가할 수 있습니다.

# **3. 팀원👩‍💻👩‍💻**
|LJ|Som|
|:----:|:-----:|
|![](https://i.imgur.com/7Fovx27.png)|![](https://i.imgur.com/1AzO7gz.png)|

# **4. 타임라인⏳**
## 2022/08/30
- 과일종류와 재고갯수를 저장하는 Fruit 열거형 정의
- 과일재고를 관리하는 과일창고 FruitStore 클래스 정의
- 쥬스 메뉴를 갖는 Juice 열거형 정의
- 과일창고 재고상태 확인 후 예외의 경우 메세지를 출력하는 OrderError 열거형 정의  

## 2022/08/31
- 과일창고에 재고 없는지 여부 확인하는 메서드
- 과일창고에 재고가 필요한만큼 있는지 확인하는 메서드
- 재고부족 메세지 수정

## 2022/09/01
- 초기재고 선언방법 변경


# **5. 시각화된 프로젝트 구조📊**
![](https://i.imgur.com/lwIAOvB.png)



# **6. 실행 화면📱**
- 이후 추가

# **7. 트러블 슈팅🧐**
- 과일을 2가지 쓰는 음료에 대한 고민: 1개의 과일은 재고가 없고, 나머지 과일만 재고가 있을 경우, 나머지 과일만 차감되는 상황
→ changeFruitStock 메서드를 기능 분리하여 과일의 재고를 체크하고 차감하는 형태로 변경
```swift
func checkStockBeUsed(in juice: Juice) throws {
        for (fruit, amountOfFruit) in juice.recipeOfJuice {
            guard let stock = stock[fruit], stock != 0 else {
                throw OrderError.emptyStock
            }
            guard stock >= amountOfFruit else {
                throw OrderError.outOfStock
            }
        }
    }
    
func changeFruitStock(to juice: Juice) {
    for (fruit, amountOfFruit) in juice.recipeOfJuice {
        if let stock = stock[fruit] {
           self.stock.updateValue(stock - amountOfFruit, forKey: fruit)
        }
    }
}
```
- 2가지 이상의 과일이 들어가는 음료를 만들게 될 경우
```swift
// 기존의 코드 
enum Juice: String {
  case strawberryJuice = "딸기쥬스"
  case bananaJuice = "바나나쥬스"
  case kiwiJuice = "키위쥬스"
  case pineAppleJuice = "파인애플쥬스"
  case strawberryBananaJuice = "딸바쥬스"
  case mangoJuice = "망고쥬스"
  case mangoKiwiJuice = "망고키위쥬스"

  struct Ingredient {
      let first: (Fruit, Int)
      let second: (Fruit, Int)?
  }
    
  var recipeOFJuice: Ingredient {
      switch self {
      case .strawberryJuice:
          return Ingredient(first: (.strawberry, 16), second: nil)
      case .bananaJuice:
          return Ingredient(first: (.banna, 2), second: nil)
      case .kiwiJuice:
          return Ingredient(first: (.kiwi, 3), second: nil)
      case .pineAppleJuice:
          return Ingredient(first: (.pineApple, 2), second: nil)
      case .strawberryBananaJuice:
          return Ingredient(first: (.strawberry, 10), second: nil)
      case .mangoJuice:
          return Ingredient(first: (.mango, 3), second: nil)
      case .mangoKiwiJuice:
          return Ingredient(first: (.mango, 2), second: (.kiwi, 1))
       }
    }
}
```
과일이 들어가는 순서를 `first`와 `second`로 정했기 때문에, 이 구조는 과일이 2가지밖에 들어가지 못 한다. 그래서 `recipeOFJuice`를 딕셔너리 타입으로 구현했다.
```swift
enum Juice: String {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangoKiwiJuice:
            return "망고키위쥬스"
        }
    }
    
    var recipeOfJuice: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
```


# **8. 참고 링크🙇‍♀️**
[Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html) <br>
[Swift Language Guide - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
