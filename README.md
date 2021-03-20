# James & Tak CommitMessage Rules
# <타입>: <제목>

##### 제목은 최대 우측 '|' 까지만 입력 ######## -> |



# 본문은 위에 작성
##########본문은 우측 '|' 까지만 입력 ######################## -> |


# 꼬릿말은 아래에 작성: Ex #issue number

# --- COMMIT END ---
# <타입> 리스트
#   feat    : 기능 (새로운 기능)
#   fix     : 버그 (버그 수정)
#   refactor: 리팩토링
#   style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
#   docs    : 문서 (문서 추가, 수정, 삭제)
#   test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
#   chore   : 기타 변경사항 (빌드 스크립트 수정 등)
# ------------------
#     제목 첫 글자를 대문자로
#     제목은 명령문으로
#     제목 끝에 마침표(.) 금지
#     제목과 본문을 한 줄 띄워 분리하기
#     본문은 "어떻게" 보다 "무엇을", "왜"를 설명한다.
#     본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
# ------------------
프로젝트 3 - 쥬스 메이커 README

21/03/08

![juicemaker_structure](https://user-images.githubusercontent.com/69072471/111748945-73ab9100-88d4-11eb-9610-1445aa46499d.png)

간단하게 쥬스메이커 설계도를 Tak과 같이 구상한 뒤 FlowChart를 이용하여 형상황 해 봤다. 아직 초기단계라 어떻게 앱을 구현할지 같이 구상하는 시간을 가졌다.



21/03/09
쥬스메이커를 처음 구상할 때에는  `dictionary`를 활용하여 각 과일마다 수량을 정해 준 뒤 설계할까 생각했었다. 

각 딕셔너리의 `key`에 과일이름 그리고 `value`에 해당과일재고를 넣으면 좀 더 효과적으로 해당 데이터를 관리할 수 있을 것이라 생각했다. 이런 생각을 공유 했더니 이번 프로젝트 같은 경우 딕셔너리가 적합한 수단이 아닐 것 같다는 의견을 듣고 고민 하는 시간을 가졌다.

🙋  왜 딕셔너리 사용은 적합하지 않은 상황일까? 곰곰히 생각 해 보고 나름대로 내린 결론을 남기자면 딕셔너리는 말 그대로 사전과 같이 데이터와 해당 데이터의 내용을 저장하는 용도로 사용해야 하지 쥬스메이커 처럼 수량이 변화하는 메뉴판과 같은 데이터를 다루기에는 적합하지 않을것 같다는 생각이 들었다. 사전을 펼칠 때 마다 단어의 뜻이 변화한다면 그 사전은 더이상 사전이 아닌 것이 되버리기 때문이다.

그러던 와중 열거형과 타입프로퍼티를 활용 해 보라는 피드백을 반영해서 코드를 작성 해 보았다.

기존에는 구조체, 열거형, 클래스의 인스턴스를 만든 뒤 해당 인스턴스를 통해서 프로퍼티를 접근 했지만.

타입 프로퍼티는 별도 인스턴스 생성 필요 없이 타입이름 뒤에 점(.)을 통해서 프로퍼티의 접근이 조금 더 수월하다는 것을 깨달았다.

그래서 아래와 같이 과일타입과 주스타입을 `static property` 로 구현 해 보았다.

```swift
enum FruitType {
    static let strawberry = Fruit()
    static let banana = Fruit()
    static let kiwi = Fruit()
    static let pineapple = Fruit()
    static let mango = Fruit()
}

enum JuiceType {
    static let strawberryJuice = Juice()
    static let bananaJuice = Juice()
    static let kiwiJuice = Juice()
    static let pineappleJuice = Juice()
    static let strawberryBananaJuice = Juice()
    static let mangoJuice = Juice()
    static let mangoKiwiJuice = Juice()
}
```

```swift
class Fruit {
    private(set) var fruitStock = 32
    func addStock() {
        fruitStock += 1
    }
    func useStock(amount: Int) {
        fruitStock -= amount
    }
}
```

- `enum`과 `static let` 을 활용하여 각 과일을 타입프로퍼티로 활용하여 값을 처리하려 하였으나 처음 보는 개념이라 이해가 잘 되지 않았다. 이것을 어떻게 사용해야 하는지 꽤나 오랜시간 애를 먹었다. 

🙋 또한 왜 `static property`를 활용하는게 더 나은 방법일까에 대한 생각이 머릿속에 꽤나 오래 남아 있었다.

```swift
func makeStrawberryJuice() throws {
        let requiredAmount: Int = 16
        if FruitType.strawberry.fruitStock > requiredAmount || FruitType.strawberry.fruitStock == requiredAmount {
            FruitType.strawberry.useStock(amount: requiredAmount)
        }
        else {
            throw AppError.outOfStock
        }
```

`static property`를 활용하여 프로젝트 step1의 방향성만 잡아봤다. 인스턴스를 생성하지 않아도 각 과일의 프로퍼티를 메소드를 통해 변화를 줄 수 있다는 점이 신기했다. 추후에 더 효율적인 방향으로 수정할 예정이다.

구글링을 통해 타입프로퍼티를 사용하면서 얻는 이점에 대해서도 조금이나마 깨닫게 되었다. property에 static접두사를 붙여서 사용함으로써 과일이라는 정적인 개체를 `instance` 로 생성하지 않고도 전역변수 처럼 전체 앱에서 활용할 수 있다는 점이 큰 메리트라 생각됐고 또한 후에 배울 객체의  `singleton` 또한 `static property`를 활용하여 만들 수 있다는 점을 고려했을 때 type레벨에서 과일 을 설정하는 것이 좀 더 알맞은 방향이라는 결론에 다다를 수 있었다.

참고: [Effectively using static and class methods and properties – Donny Wals](https://www.donnywals.com/effectively-using-static-and-class-methods-and-properties/)

21/03/11

9일자 코드에 조금 더 살을 붙여보았습니다.

```swift
struct Fruit {
  private(set) var quantity: Int = 10
  mutating func useStock(amount: Int) {
        quantity -= amount
  }

  mutating func addStock() {
        quantity += 1

  }

  mutating func subtractStock() {
         quantity -= 1
  }
}

enum FruitType {

  static var strawberry: Fruit = Fruit()
  static var banana: Fruit = Fruit()
  static var kiwi: Fruit = Fruit()
  static var pineapple: Fruit = Fruit()
  static var mango: Fruit = Fruit()

 

struct JuiceMaker {
  func makeJuice(juice: JuiceRecipe.Recipe) throws {
    switch juice {
      
    case JuiceRecipe.strawberryJuiceRecipe:
        if FruitType.strawberry.quantity >= JuiceRecipe.strawberryJuiceRecipe[0].requiredQuantity {
        FruitType.strawberry.useStock(amount: JuiceRecipe.strawberryJuiceRecipe[0].requiredQuantity)

     }
     default: ()
        }
  }

struct JuiceRecipe {

  typealias Recipe = [ingredient]
  static let strawberryJuiceRecipe: Recipe = [ingredient("딸기", 16)]
  static let bananaJuiceRecipe: Recipe = [ingredient("바나나", 2)]
  static let kiwiJuiceRecipe: Recipe = [ingredient("키위", 3)]
  static let pineappleJuiceRecipe: Recipe = [ingredient("파인애플", 2)]
  static let strawberryBananaJuiceRecipe: Recipe = [ingredient("딸기", 10), ingredient("바나나", 1) ]
  static let mangoJuiceRecipe: Recipe = [ingredient("망고", 3)]
  static let mangoKiwiJuiceRecipe: Recipe = [ingredient("망고", 2), ingredient("키위", 1)]

}
  
struct ingredient: Equatable {

  let fruit: String
  let requiredQuantity: Int
  let a: A

  init(_ fruit: String, _ requiredQuantity: Int) {
    self.fruit = fruit
    self.requiredQuantity = requiredQuantity
    self.a = A()
  }
}
```
- struct와 class 중 고민을 하다 따로 상속을 할 필요가 없기도 하고 struct가 제공하는 멤버와이즈 이니셜라이져가 매우 매력적이게 다가와서 struct type으로 쥬스메이커를 구현하였습니다.
- static 프로퍼티를 활용하여 과일 객체를 구현 했습니다.  비슷한 논리로 쥬스 레시피 또한 static 프로퍼티로 구현을 하였고 배열을 활용하여 레시피의 데이터 값을 처리하려 했습니다.
- 과일 저장소의 과일 갯수는 외부에서 확인이 가능하나 외부에서 수정은 못하도록 설정을 하고 싶어서`Private(set) var` 변수를 사용하여 quantity 저장 프로퍼티를 읽기만 가능하도록 제한을 두었습니다.
- `mutating func()` 메소드를 활용하여 Fruit 내부의 재고를 수정할 수 있도록 하였습니다.
- 과일데이터와 레시피데이터를 담으려고 배열과 튜플을 활용하였습니다.

이렇게 타입을 구현한 뒤 switch문을 활용해서  과일과 쥬스 레시피의 프로퍼티 값을 비교해서 쥬스레시피에 맞는 쥬스를 return받으려고 코드를 구성 해 보았습니다.

[Trouble Shooting]

- 과일데이터를 관리하기 위해 배열 속 튜플을 활용하였는데 튜플 자체가 값이 변화하지 않는 것이 특징인데 이를 변화하는 데이터로써 활용하는 것이 적합하지 않다는 것을 깨달았고 배열 인덱스를 활용해서 해당 데이터를 불러오는 것 또한 적절하지 않다는 생각이 들었습니다.

```swift
struct JuiceMaker {
    func makeJuice(fruit: inout Fruit, requiredAmount: Int) {
            fruit.useStock(amount: 16)
    }
}
```



- 쥬스메이커에서 저장소의 과일 데이터를 수정하려 프로퍼티를 접근하려 하였으나 아래와 같은 오류가 발생하였습니다:

  cannot use mutating member on immutable value is a 'let' constant

  해결방법: struct에서 프로퍼티를 호출하면 이는 call by value 즉 사본을 전달 받는데 우리는 struct내부의 변수 값을 변경하려 했기 때문에 위와 같은 오류가 난 것으로 이해했다. 그래서 호출하려는 makeJuice 메서드 파라메터안에 inout을 명시 해 주니 문제가 해결 되었다.

해결된 부분도 있지만 다 짜고 보니까 일단 코드 가독성이 매우 떨어지고 struct가 아직 Tak과 저에게는 활용하기 어려운 타입이라 생각이 들었습니다. 거기에 저희 프로젝트에서 튜플로 데이터를 담는 것은 적절치 않다고 생각이 들었습니다. 그래서 고심 끝에 다시 처음부터 차근차근 다시 설계 해 보려합니다. 동료 캠퍼의 조언을 따라 MVC 디자인 패턴과 Singleton 디자인 패턴을 참고하여 천천히 다시 구현 할 것입니다.



21/03/12

앱 설계 관련해서 야곰과 면담시간을 가졌습니다. 어떻게 설계할지 고민하던 저희에게 쥬스메이커의 요소를 타입별로 나눈 뒤 이를 Flowchart로 표현 해 보라고 하셨기에 아래와 같은 설계도를 같이 다시 구현했습니다.

![2021-03-12_11 58 42](https://user-images.githubusercontent.com/69072471/111752787-7957a580-88d9-11eb-80ab-9ecb1cec49ec.png)

- 전에 Dictionary를 왜 사용하면 안될지 나름대로 결론을 내었으나 Tak과 다른 캠퍼들과 Dictionary관련된 얘기를 나누면서 오히려 Dictionary가 값이 변경하는 데이터를 관리하기에 적합하다는 생각이 들었습니다. Key에 해당되는 value를 업데이트 하는 기능이 존재한다는 것을 깨닫고 이를 요긴하게 활용할 수 있다는 생각이 들어서 Dictionary를 사용하여 데이터를 구축하기로 결정하였습니다.

- 전반적인 쥬스메이커의 설계는 MVC모델에 기반하여 재 설계하였습니다.  과일 데이터를 담아두는 데이터 그릇은 유동적으로 활용해야 한다는 판단아래 싱글톤 모델 형식으로 구축한였습니다.

```swift
class FruitStorage {
    static let shared = FruitStorage()
    private(set) var refrigerator: [Fruit: Int]
    
    private init() {
        refrigerator = [:]
        setInitialFruitAmount()
    }
    func setInitialFruitAmount() {
        refrigerator = [Fruit.strawberry: 10, Fruit.banana: 10, Fruit.kiwi: 10, Fruit.mango: 10, Fruit.pineapple: 10]
    }
}
```

위와 같은 싱글톤을 활용하여 과일 데이터를 구축하여서 다른 클래스에서 해당 데이터를 공유하기 쉽게 설계하였습니다.

```swift
func makeJuice(input: Fruit, for juice: Juice) {
  do {
    _ = try isJuiceAvailable(fruit: input, for: juice)
    print("주스가 나왔습니다.")
  } catch {
    print("재고가 부족합니다.")
  }
}
func remainingFruits(fruit: Fruit) throws -> Int {
  guard let remainder = fruitStorage[fruit] else {
    throw AppError.unknownError
  }
  return remainder
}

func requiredFruitsForRecipe(juice: Juice, fruit: Fruit) throws -> Int {
  let needs = juiceRecipe(recipe: juice)
  guard let requirements = needs[fruit] else {
    throw AppError.unknownError
  }
  return requirements
}

func isJuiceAvailable(fruit: Fruit, for juice: Juice) throws -> Bool {
  let fruitsInStock = try remainingFruits(fruit: fruit)
  let requiredFruits = try requiredFruitsForRecipe(juice: juice, fruit: fruit)
  if fruitsInStock < requiredFruits {
    throw AppError.outOfStock
  }
  return true
}
func juiceRecipe(recipe: Juice) -> [Fruit: Int] {
  switch recipe {
    case .strawberryJuice:
    return [Fruit.strawberry: 16]
    case .bananaJuice:
    return [Fruit.banana: 2]
    case .kiwiJuice:
    return [Fruit.kiwi: 3]
    case .pineappleJuice:
    return [Fruit.pineapple: 2]
    case .mangoJuice:
    return [Fruit.mango: 3]
    case .strawberryBananaJuice:
    return [Fruit.strawberry: 10, Fruit.banana: 1]
    case .mangoKiwiJuice:
    return [Fruit.mango: 2, Fruit.kiwi: 1]
  }
}
}
```

과일 데이터를 쥬스 데이터로 변환하도록 juiceRecipe() 메서드를 사용하였고 

1. remainingFruits() 메서드와 requiredFruitsForRecipe()메서드를 통해 특정 과일 쥬스를 만들기 위해 필요한 과일 양이 얼마나 되는지 확인하도록 구현한 뒤 
2. 해당 메서드들을  isJuiceAvailabe() 메서드로 호출해서 Juice를 만들 수 있는 상황인지 확인하도록 검사하는 메서드를 추가로 설계하였습니다. 
3. 마지막으로 해당 메서드를 makeJuice()메서드로 호출하여 마지막 오류처리후 문제가 없으면 쥬스를 만들도록 구현하였습니다.



[Trouble Shooting]

- 그런데...구현하고 보니까 바나나쥬스, 딸기쥬스와 같이 단일 과일을 필요로 하는 쥬스 같은 경우 문제 없이 구현이 되는 반면 딸바쥬스, 망키쥬스와 같이 두 개의 과일을 요하는 쥬스 같은 경우 올바른 데이터를 불러오지 못하였습니다. 이 부분을 해결해야 합니다. makeJuice() 로직을 다시 수정할 예정입니다.



21/03/13

![JuiceMaker_MVC](https://user-images.githubusercontent.com/69072471/111753716-888b2300-88da-11eb-9157-813ce161a804.png)

쥬스메이커의 설계도를 조금 더 MVC 패턴에 부합하도록 수정하였습니다.

```swift
enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var recipe: [Fruit : Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana: 1]
        case .mangoJuice:
            return [.mango : 3]
        case .mangoKiwiJuice:
            return [.mango : 2, .kiwi : 1]
            
        }
    }
}
```

- 기존에 사용했던 juiceRecipe()메서드를 지우고 Juice 열거형 속 recipe라는 변수로 생성하여 대체하였습니다. 그리고 해당 변수에 쥬스에 필요한 과일 데이터를 넣어주었습니다. 이렇게 설정하니 굳이 메서드에 과일 인자값을 넣지 않고 바로 `enum`을 통해 레시피 데이터에 좀 더 수월하게 접근할 수 있다는 것을 깨달았습니다. 

```swift
func executeJuiceMaker(juice: Juice) {
        do {
            try makeJuice(for: juice)
        } catch {
        }
    }
    
    func makeJuice(for juice: Juice) throws -> Bool {
        for (fruit, requirements) in juice.recipe {
            guard let stock = fruitStorage[fruit]
            else {
                throw AppError.unknownError
            }
            if stock >= requirements {
                fruitStorage.updateValue(stock - requirements, forKey: fruit)
            }
            else {
                throw AppError.outOfStock
            }
        }
        return true
    }
```

- 과일데이터와 쥬스레시피 데이터를 for문을 통해 돌려서 각 recipe에서 요구하는 특정 과일들의 갯수를 저장소에서 빼주는 로직을 구현하였고 각 과일 저장소에 존재하는 과일 갯수보다 레시피에서 요구하는 갯수가 많을 경우 에러가 발생하도록 설정하였습니다. 이렇게 설정을 하니 딸바쥬스와 망키쥬스가 문제 없이 구현되는 것을 확인하였습니다. 드디어 Step1의 요구사항을 얼추 다 맞춘 것 같아서 기쁜 마음으로 PR 요청을 하였습니다. 다음 주에는 @Idevjinie의 피드백을 토대로 코드 리팩토링을 진행할 것 입니다.

21/03/16 ~ 21/03/18 

피드백 반영

![2021-03-16_12 322 10](https://user-images.githubusercontent.com/69072471/111756400-824a7600-88dd-11eb-8e1b-0cc32ca33a6e.png)

MVC 패턴에 대해 조금 더 숙지할 필요가 있다는 피드백을 받았습니다. 저희가 처음에 생각한 MVC 패턴의 Model은 그저 데이터를 담고 있는 그릇이라 생각했는데 조금 더 찾아 보니 Model은 데이터를 담는 것 뿐 아니라 해당 데이터를 활용하는 작업을 도맡아 한다는 것을 깨달았습니다. 그래서 기존에는 Fruit Storage를 Model, JuiceMaker를 Controller 그리고 앱 내 인터페이스를 View라고 생각했으나 이는 잘못된 해석이었습니다.

- 쥬스메이커와 FruitStorage 모두 데이터를 저장하고 활용하는 역할을 하기 때문에 Model로써 설계 하는 것이 맞다는 생각이 들었습니다. 따라서 위 차트와 같이 설계도를 수정하였습니다.

![2021-03-16_12 32 28](https://user-images.githubusercontent.com/69072471/111756235-562ef500-88dd-11eb-9e32-1b33b76bf510.png)

그리고 기존에는 데이터를 FruitStorage에 저장 해 놓고 JuiceMaker가 해당 저장소를 접근해서 정보를 가져오도록 설계 하였는데 데이터 저장소가 자신에게 있는 데이터를 관리 하는 것이 더 적절한 설계일 것이라는 피드백을 반영하여 JuiceMaker의 책임을 덜어줌과 동시에 FruitStorage가 자신의 data를 관리하는것을 중점적으로 코드를 재 작성하였습니다. 

```swift
class JuiceMaker {
    private var fruitRefrigerator = FruitStorage.shared.refrigerator
    
    func makeJuice(flavor juice: Juice) throws -> Bool {
        for (fruit, requirements) in juice.recipe {
            guard let stock = fruitRefrigerator[fruit] else {
                throw JuiceMakerError.unavailableAccess
            }
            if stock >= requirements {
                fruitRefrigerator.updateValue(stock - requirements, forKey: fruit)
            }
            else {
                throw JuiceMakerError.outOfStock
            }
        }
        return true
    }
}
```

기존에는 위와 같은 방식으로 JuiceMaker가 직접 과일 재고를 업데이트하도록 코드를 작성하였습니다. 피드백을 반영하여 쥬스메이커가 과일저장소를 통해서 재고를 관리하도록 코드를 수정하였습니다.

```swift
class JuiceMaker {
    
    func makeJuice(order: Juice) -> Juice {
        do {
            try FruitStorage.shared.manageFruit(juice: order)
        } catch {
            print("재고가 부족합니다.")
        }
        return order
    }
}
```

이 외 의미없는 줄바꿈과 공백제거, 메서드와 프로퍼티 네이밍등 피드백 받은 부분 수정 완료하였습니다.



21/03/18 ~ 21/03/19 

![JuiceMaker_MVCpattern](https://user-images.githubusercontent.com/69072471/111803406-5bf2fd80-8912-11eb-9682-269f3ffdccb8.jpg)

이번 프로젝트 Tak과 James의 마지막 앱 청사진 입니다.

18일부터 19일간은 저희가 구현한 쥬스메이커 MVC Design Pattern을 가지고 쥬스메이커 앱 View Controller를 구현하였습니다.

- @ IBOutlet fruitStockLabel을 활용하여 과일 수량을 표현하였습니다.

- @ IBAction TouchUpMakeJuiceButton을 활용하여 아래와 같은 기능을 구현하였습니다.

  - 각 주스 레시피에 맞게 과일 수량 소모

  - 주스 재조후 alert 표시

    ```swift
    @IBAction func touchUpMakeStrawberryJuiceButton(_ sender: UIButton) {
            do {
                try juiceMaker.makeJuice(order: Juice.strawberryJuice)
                guard let stockOfStrawberry = FruitStorage.shared.refrigerator[.strawberry] else {
                    throw JuiceMakerError.invalidAccess
                }
                strawberryStockLable.text = String(stockOfStrawberry)
                juiceIsReadyAlert(message: "\(Juice.strawberryJuice.description) 나왔습니다. 맛있게 드세요")
            } catch {
                notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
            }
        }
    ```

    위와 같은 버튼을 7개 추가로 생성하여 각 과일 주스별로 해당되는 과일 사용, 과일 재고 감소, 그리고 알림창 생성을 성공적으로 구현하였습니다. 하지만 여기까지 오는 길은 매우 험난 했습니다.

[Trouble Shooting ] 

화면에 재고가 충분히 남아있는데도 과일주스 재조가 안되는 문제:

```swift
func manageFruit(juice: Juice) throws {
        for (fruit, requirements) in juice.recipe {
            guard let stock = refrigerator[fruit] else {
                throw JuiceMakerError.invalidAccess
            }
            if stock >= requirements {
                refrigerator.updateValue(stock - requirements, forKey: fruit)
            }
            else {
                throw JuiceMakerError.outOfStock
            }
        }
.
.
.
func makeJuice(order: Juice) -> Juice {
        do {
            try FruitStorage.shared.manageFruit(juice: order)
        } catch {
            
        }
        return order
    }
.
.
.
@IBAction func touchUpMakeBananaJuiceButton(_ sender: UIButton) {
        juiceMaker.makeJuice(order: Juice.bananaJuice)
        guard let stockOfBanana = FruitStorage.shared.refrigerator[.banana]
        else {
            return
        }
        bananaStockLable.text = String(stockOfBanana)
        print(stockOfBanana)
    }
```

기존 주스 재조 로직은 위와 같은 코드로 작성하였습니다. @IBaction 메서드에서 makeJuice()메서드를 호출하면 makeJuice() 메서드가 다시 FruitStorage class 속 manageFruit() 메서드를 호출하여 재고를 관리한 뒤 주스를 제조하도록 구현을 하였습니다.

- 그런데 이렇게 코드를 짜니까 막상 화면에서는 재고가 남아있음에도 불구하고 과일주스 제조가 안되고 화면에 보이는 재고 label 또한 정상적으로 바뀌지 않는 것을 확인하였습니다.
- 또한 에러처리를 미리 manageFruit에서 해 버리니까 재고에 따른 에러메세지 알림창을 어떻게 화면에서 구현 해야 하는지 감이 안왔습니다.. @IBAction에서 재고에 따른 조건을 또 다시 적자니 구현해야하는 작업이 겹치는 상황 때문에 우리 팀은 딜레마에 빠졌었습니다. 이러한 문제점을 어떻게 해결해야 하나 고민하면서 다른 캠퍼에게 조언을 구했습니다.



문제 해결:

```swift
class FruitStorage {
  func manageFruit(fruit: Fruit, quantity: Int) {
        guard let stock = refrigerator[fruit] else {
            return
        }
        refrigerator.updateValue(stock + quantity, forKey: fruit)

    }
    
    func hasEnoughFruit(fruit: Fruit, requiredQuantity: Int) -> Bool {
        guard let stock = refrigerator[fruit],requiredQuantity > 0, stock - requiredQuantity >= 0 else {
            return false
        }
        return true
    }
}

```

과일 저장소의 재고관리 코드 부터 refactor 해봤다. 특별히 hasEnoughFruit()메서드를 생성하여 재고물량과 필요한 과일재고를 비교 하도록 메서드를 구현한 뒤

```swift
class JuiceMaker {
    
    private func grindFruit(fruit: Fruit, amount: Int) {
        FruitStorage.shared.manageFruit(fruit: fruit, quantity: -amount)
    }
    
    func makeJuice(order: Juice) throws {
        for (ingredients, requirements) in order.recipe {
            if FruitStorage.shared.hasEnoughFruit(fruit: ingredients, requiredQuantity: requirements) {
                grindFruit(fruit: ingredients, amount: requirements)
            }
            else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
}
```

새로 개편한 FruitStorage 메서드를 활용하여 makeJuice() 메서드를 수정하였습니다. 이렇게 수정하니 JuiceMaker와 FruitStorage에게 좀 더 알맞은 역할을 할당함과 동시에 코드 또한 더 직관적이게 작성할 수 있다는 부분이 긍정적으로 다가왔습니다. hasEnoughFruit()을 사용해서 재고와 레시피에서 요구하는 값을 먼저 비교한뒤 `throw`에러 처리를 makeJuice()메서드에서 사용하니 이를 ViewController의 @IBAction 메서드로 받아서 `do-catch` 로 에러처리를 받은 뒤 상황 별 알림 설정까지 가능하게 설계할 수 있었습니다. 도움을 준 @Fezz에게 박수!!!

```swift
@IBAction func touchUpMakeStrawberryJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.strawberryJuice)
            guard let stockOfStrawberry = FruitStorage.shared.refrigerator[.strawberry] else {
                throw JuiceMakerError.invalidAccess
            }
            strawberryStockLable.text = String(stockOfStrawberry)
            juiceIsReadyAlert(message: "\(Juice.strawberryJuice.description) 나왔습니다. 맛있게 드세요")
        } catch {
            notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
```

이렇게 2주간의 주스메이커 프로젝트를 드디어 끝냈습니다.



#### 배운 점

- Singleton과 MVC Design Pattern의 활용법
- dictionary의 활용하여 데이터 관리
- enum과 switch의 활용해서 데이터 필터링
- @IBOutlet과 @IBAction을 활용하여 앱 view 구성
- UIAlertController의 활용법

#### 아쉬운 점

- 재고수정 페이지 기능을 구현하지 못한 것
- Tag를 활용하여 @IBActionButton을 묶어서 코드를 간소화 하지 못한 것
- storyboard 외 코드로 화면을 조금 더 완성도 있게 구현하지 못한 것
- 과일저장소 내 과일 데이터를 구체화하지 못한 부분



아직은 미숙하지만 추후에 더 나은 앱으로 찾아올게요. 읽어주셔서 감사합니다 😁

https://user-images.githubusercontent.com/69072471/111803758-b429ff80-8912-11eb-87c8-cc215b102820.mov



