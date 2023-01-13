# 쥬스 메이커 🧃

# 목차
[1. 프로젝트 소개](#1-프로젝트-소개)

[2. 팀원](#2-팀원)

[3. 타임라인](#3-타임라인)

[4. 시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)

[5. 실행 화면](#5-실행-화면)

[6. 트러블 슈팅](#6-트러블-슈팅)

[7. 참고 링크](#7-참고-링크)


# 1. 프로젝트 소개
쥬스 메이커 앱에서는 버튼을 통해 원하는 쥬스를 선택하여 만들 수 있습니다.

<br>

# 2. 팀원

| Harry | kokkilE  |
|:----:| :----: |
| <img src="https://i.imgur.com/BYdaDjU.png" width="130" height="130"/> | <img src="https://i.imgur.com/4I8bNFT.png" width="130" height="130"/>     |
| [Github 링크](https://github.com/HarryHyeon) |[Github 링크](https://github.com/kokkilE) |

<br>

# 3. 타임라인

- 23.01.02(월) ~ 23.01.04(수)
    - 과일 가게 클래스 구현
    - 쥬스 메이커 구조체 구현
- 23.01.06(금)
    - 메인화면에서 재고 수정화면으로 화면전환 구현
    - 쥬스 제조시 성공, 실패 alert 구현
- 23.01.09(월) ~ 23.01.10(화)
    - Autolayout 적용
    - 과일의 개수를 나타내는 레이블에 개수 표시 구현
    - 재고 수정화면에서 재고 수정 기능 구현
    - 화면 전환 시 과일의 개수를 나타내는 레이블 업데이트 구현

<br>

# 4. 시각화된 프로젝트 구조
``` swift
├── Controller
|   ├── AppDelegate
|   ├── SceneDelegate
|   ├── JuiceMakeViewController
|   └── StockManagerViewController
├── Model
|   ├── FruitStore
|   ├── JuiceMaker
|   ├── Juice
|   ├── JuiceMakerError
|   └── Fruit
└── View
    ├── Main
    └── Assets
```
# 5. 실행 화면

- 쥬스 주문 버튼을 클릭하면 재료의 재고가 있을 경우 주문에 성공한다.
![](https://i.imgur.com/5GIKKbh.gif)

<br>

- 쥬스 주문 버튼을 클릭하면 재료의 재고가 없을 경우 주문에 실패하며 재고 수정 화면으로 이동할 수 있는 Alert이 표시된다.
![](https://i.imgur.com/tsQtEZr.gif)

<br>

- 재고수정 화면에서 과일의 개수를 조정했을 때 첫번째 화면에 수정한 개수가 반영된다.
![](https://i.imgur.com/0HwtU9I.gif)


# 6. 트러블 슈팅
 
## 에러처리 (옵셔널 바인딩)
```swift
func addStock(fruit: Fruit, quantity: Int) throws {
        guard let selectedFruitStock = fruitStock[fruit] else {
            throw FruitStoreError.invalidFruitInput
        }
        
        fruitStock.updateValue(selectedFruitStock + quantity, forKey: fruit)
    }
```
- 위 메서드를 예시로 `fruitStock[fruit]` 딕셔너리 값을 가져올때, 옵셔널 바인딩이 필요했다.
- 저 부분에서 `fruitStock`에서 인덱스로 `Fruit` 타입을 받고, 후에 버튼 입력으로 해당 메서드를 기능하게 한다고 가정했을때 저 부분에서 옵셔널 바인딩이 되지않아 에러를 던져주는 경우는 없을거라 생각이 된다.
- 따라서 guard let 을 통해 옵셔널 바인딩이 되지않을 경우 return 을 해주어 그냥 함수를 종료시키는 것이 맞을지, 아니면 저런식으로 일어날 가능성이 없는 에러를 던져주는 것이 맞는지 고민을 했다.
- 결론적으로, 에러를 던져서 **"이 흐름은 내가 의도한 방향이 아니다, 올바른 흐름이 아니다"** 라고 표시하는 것이 협업하는 팀원과 미래의 내가 봤을 때 명확할 것이라 판단해 에러처리를 했다.

## 쥬스 레시피 타입 프로퍼티에서 연산 프로퍼티로 변경
``` swift
enum Juice {
     case strawberryJuice
     case bananaJuice
     case kiwiJuice
     case pineappleJuice
     case strawberryBananaJuice
     case mangoJuice
     case mangoKiwiJuice

     var recipe: [Fruit: Int] {
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
- 이전에는 주스 레시피를 case를 사용하지 않고 static let 키워드로 사용해 딕셔너리를 저장했다.
- 주스의 레시피는 메서드의 파라미터로 들어가기 때문에 하나의 타입으로써 표현하는 것이 메서드를 사용하기에 더 좋을 것 같아주스 각각의 메뉴명을 케이스로 지정하고 연산 프로퍼티를 통해 딕셔너리를 반환하는 방식으로 바꾸었다.

<br>

## 화면 전환 시 이벤트 전달 방법
두번째 화면에서 재고 수정작업이 끝나고 화면이 `dismiss` 될때, 변경사항을 첫번째 화면의 레이블을 업데이트 하기위해 세 가지 방법을 고려했다.

1. **delegate 패턴** 적용
2. **Notification**
3. `UIViewController`의 **State Method** 활용

3번의 방법은 이벤트 전달은 아니지만, 첫 번째 화면이 Appear될 때 마다 실행하게 할 수 있으므로 편하게 적용이 가능했다. 하지만 이번 프로젝트에서는 이벤트 전달을 구현해보고자 이 방법은 채택하지 않았다.
이벤트를 전달받는 수신지가 여러 객체일 경우 **Notification**을 적용하기 좋지만, 이번 프로젝트는 이벤트 수신지가 한 군데 뿐이고, **delegate 패턴**을 적용하는 것이 가독성이 좋다고 생각해 **delegate 패턴**을 적용했다.

<br>

# 7. 참고 링크
- [Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
- [Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
- [Swift Langauge Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
- [Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
