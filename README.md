# 쥬스 메이커

# 소개

# 팀원

| Harry | kokkilE  |
|:----:| :----: |
| <img src="https://i.imgur.com/BYdaDjU.png" width="130" height="130"/> | <img src="https://i.imgur.com/4I8bNFT.png" width="130" height="130"/>     |
| 드라이버, 내비게이터 |드라이버, 내비게이터 |

# 타임라인

- 23.01.02(화) ~ 23.01.04(목)
    - 과일 가게 클래스 구현
    - 쥬스 메이커 구조체 구현

# 시각화된 프로젝트 구조 <br/>

# 실행 화면

# 트러블 슈팅
 
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

# 참고 링크

# 팀회고
