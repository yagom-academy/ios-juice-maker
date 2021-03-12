# 🍎 Juice Maker

### by Jay, 요시킴



## 1. 목표

- 보다 효율적인 방식을 고민하고 그 고민을 기록하며 프로그래밍하기
- 왜(Why)? 에 대한 고민을 하고 그 답변을 고민해보기
- 의미가 잘 드러나는 네이밍하기
- 스토리보드보다 코드 베이스로 코딩하기



## 2. 프로그래밍 설계

1. Flow Chart

   ![JuiceMaker](https://user-images.githubusercontent.com/58765757/110633358-0325b580-81ec-11eb-91bc-0be8a4cc6fd2.jpg)



2. JuiceMaker의 타입 결정하기
   - class vs struct
   - struct: class를 써야할 이유가 특별히 없다면 struct을 쓰는 것을 권장한다.
     - 단순 데이터 타입 -> object 자체로 잘 정의되어 있어서 따로 이들이 갖는 object 사이의 관계는 따로 전달할 필요가 없다.
     - 멀티 쓰레드 환경이라면 struct가 더 안전하다.(데드락 등의 위험없이 다른 쓰레드로 복사)
     - Struct의 properties는 String 등의 기본 타입처럼 value 타입이다.
   - class: 다른 class를 상속받을 수 있다는 장점이 존재
   - 본 프로젝트의 경우 JuiceMaker라는 타입은 상속이 필요가 없고 단일해서 struct를 사용하려고 했으나 문제가 많이 발생해 class로 작성. (정확한 차이를 알고 싶음)



3. 과일 재고의 타입 결정하기

   - 과일 재고의 타입 후보로 고민한 것은 enum(Int), dictionary, struct(tuple)이다.

     - ~~enum(열거형) 사용~~

       ```swift
       enum FruitStock: Int {
               case strawberry, banana, pineapple, kiwi, mango
           }
       ```

       열거형을 생각한 이유는 다음과 같다

       > - 제한된 선택지를 주고 싶을 때 -> 과일의 종류가 결정되어 있어서 성립
       >
       > - 정해진 값 외에는 입력받고 싶지 않을 때 -> 유저에게 과일 추가 선택지가 없어서 성립
       >
       > - 예상된 입력 값이 한정되어 있을 때 -> 개수는 Int값으로 한정되어 있어서 성립
       >
       >   ref: https://velog.io/@jayb/Swift-%EC%97%B4%EA%B1%B0%ED%98%95Enum

       해당 과일의 재고를 표현하기 위해 가장 먼저 생각나는 것은 rawValue를 사용하는 것이지만, rawValue의 개념을 생각해보면 중복되지 않는 값으로 case마다 구분된다. 재고의 특성상 개수가 같아지는 과일이 있을 수 있고. 초기 개수가 모두 10개로 세팅되기 때문에 애초에 구별되는 rawValue의 특성과 맞지 않는다고 판단했다. 그래서 typealias를 통해 이름과 개수를 튜플로 갖는 enum을 생각했지만 enum에는 튜플을 사용할 수 없다. 

     - ~~dictionary를 사용~~

       ```swift
       var FruitStock: [String : Int] = ["apple" : 10, "banana" : 10, "pineapple" : 10, "kiwi" : 10, "mango" : 10]
       ```

       dictionary를 생각한 이유는 요소에 접근 했을 때, 개수를 표현하는데 제약이 없고 추가적인 사용자의 입력이 없어 오류의 가능성이 적다고 판단했다. 또 추가적으로 과일의 종류가 늘어났을 때 추가하기 어렵지 않다고 생각했다. 타입을 지정하는 것과 딕셔너리로 관리할 때 데이터 관리 측면에서 유불리가 있는지 궁금하다. 

     - ~~struct를 사용~~

       ```swift
       struct FruitStock {
               var name: String
               var stockAmount: Int
           }
           private var strawberryStock: FruitStock = FruitStock(name: "strawberry", stockAmount: 10)
           private var bananaStock: FruitStock = FruitStock(name: "banana", stockAmount: 10)
           private var pineappleStock: FruitStock = FruitStock(name: "pineapple", stockAmount: 10)
           private var kiwiStock: FruitStock = FruitStock(name: "kiwi", stockAmount: 10)
           private var mangoStock: FruitStock = FruitStock(name: "mango", stockAmount: 10)
       ```

       Struct로 타입을 생성해 인스턴스로서 과일 재고 정보를 각각 담는 것이다.

       조건이 "읽기 전용"으로 과일 재고를 확인하므로 외부에서 직접적으로 과일 재고를 변경할 필요가 없으므로 private으로 선언했다.

   - ~~위의 후보 중 struct로 결정한 이유는 다음과 같다.~~  -> 많은 문제가 발생(inout, mutating 등)

     - enum의 경우 rawValue로 수량을 정하는 것은 rawValue의 기본 개념과 맞지 않는다고 생각하고, dictionary의 경우 담을 수 있는 정보가 한정된다고 생각했다. 즉, 이름과 수량 말고도 나중에 추가적으로 과일 재고에 대한 정보(입고 날짜, 상태 등)를 추가하고 싶을 때 dictionary는 정보를 추가하기가 어렵기 때문에(Int 대신 새로운 dictionary나 array 필요) 유지 보수 측면에서 struct가 더 유리하다고 판단했다.
     - 아쉬운 점은 각각의 재고 인스턴스는 공통적으로 묶여서 생각 할 수 있는 개념인데 각각의 인스턴스가 따로 생성되므로 그 부분에 대한 고민을 추가적으로 진행했다(생성된 인스턴스들을 함께 담을 변수 생성).

   - 과일의 재고라는 객체를 생성해서 사용할 수 있도록 Singleton Pattern을 적용

     - why Singleton?: 과일의 재고를 하나의 객체로 생성해서 공유하며 여러 View나 다른 객체에서 사용해도 그 데이터는 하나의 개념으로 공유되므로 Singleton으로 관리될 수 있다.

     - 파일로서 따로 관리하기 위해 재고를 관리할 파일 FruitStockManager를 생성했다.

       ```swift
       class FruitStockManager {
           static let shared = FruitStockManager()
           private(set) var fruitStockAmounts: [String:Int] = [:] // 외부에서는 과일 재고 수량이 직접 변경 불가한 읽기 전용이므로 private(set) 설정
           private(set) var fruitTypes: [String] = ["strawberry", "banana", "pineapple", "kiwi", "mango"] // 외부에서는 과일의 종류를 직접 변경할 수 없으므로 private set으로 설정
           
           private init() {
               initializeFruitStockAmount(with: 10)
           }
           
           private func initializeFruitStockAmount(with baseFruitAmount: Int) {
               for fruitType in fruitTypes {
                   fruitStockAmount[fruitType] = baseFruitAmount
               }
           }
       }
       ```

     - 이 매니저에서 재고를 관리하기 위해 과일의 개수를 추가하고 삭제하는 메소드를 구현한다.

       - 재고 추가 네이밍 increase vs add: add는 의미적으로 새로운 것을 더하는 의미이고 increase는 존재하는 것을 증가시키는 의미이므로 increase를 사용했다.(감소는 subtract가 아닌 decrease)
       - 재고를 감소시킬 때 0 이하일 경우 생기는 문제를 여기서 처리할 수 있지만 그것보다는 여기서는 단순히 재고를 변동하는 것만 생성하고 재고의 확인은 다른 메소드에서 하는게 낫다고 판단했다.

       ```swift
       func increaseStockAmount(of fruitType: String, by fruitNumber: Int) {
               if var fruitTypeStockAmount = fruitStockAmounts[fruitType] {
                   fruitTypeStockAmount += fruitNumber
           }
       }
           
       func decreaseStockAmount(of fruitType: String, by fruitNumber: Int) {
         if var fruitTypeStockAmount = fruitStockAmounts[fruitType] {
           fruitTypeStockAmount -= fruitNumber
           }
       }
           
       func isMoreThanOne(fruitType: String) -> Bool {
               guard let fruitTypeStockAmount = fruitStockAmounts[fruitType] else { return false }
               if fruitTypeStockAmount > 0 {
                   return true
               }
               return false
           }
       ```
     
     - 추가적으로 기능을 구현해도 되서 과일을 추가하는 메소드가 필요하지 않을까 하는 생각에 과일의 종류를 추가하는 메소드를 구현했다.

       ```swift
       func add(fruitType: String) {
               fruitTypes.append(fruitType)
           }
       ```
     
       

4. 과일 재고를 네이밍하기
   - Fruit를 생각해봤지만 추후 과일의 다른 정보가 들어올 수 있고 단순히 과일이라는 이름은 정보가 부족하다는 생각이 들었다.
   
- ~~재고라는 의미의 stock을 사용하기로 해서 FruitStock으로 결정했다.~~
   
   - FruitStock의 증감 기능도 있기 때문에 관리한다는 의미의 Manager를 이름에 추가했다.
   
     
   
5. Juice 레시피 만들기

   - Juice 레시피 역시 따로 관리하기위해 파일을 생성했다. 

   - Juice 레시피에서 프로퍼티로 각 레시피를 담을까 딕셔너리로 구현할까를 고민했다.

     - property로 구현할 경우 쥬스의 종류가 많아짐에 따라 너무 많은 property가 생성될 것 같아서 딕셔너리를 사용하기로 했다. (뭐가 더 나을지 궁금)
     - 필요한 것만 가져다 쓸 수 있게 각각을 다른 property로 사용하려고 했지만 어차피 JuiceRecipe 객체 자체가 생성되면 그 안에 있는 값이 모두 메모리에 올라가므로 의미가 없다고 생각했다.

   - typealias를 통해서 재료를 담을 수 있는 배열을 선언

   - 재료를 바깥에서 볼 수 있는 함수를 생성(private(set)이 안됨..)

     ```swift
     typealias FruitTypeAndAmount = [(String, Int)]
     typealias RecipeBook = [String:FruitTypeAndAmount]
     
     struct JuiceRecipe {
         private let juiceIngredients: RecipeBook = [
             "strawberryJuice":[("strawberry", 16)],
             "bananaJuice":[("banana", 2)],
             "kiwiJuice":[("kiwi", 3)],
             "pineappleJuice":[("pineapple", 2)],
             "strawberryBananaJuice":[("strawberry", 10), ("banana", 1)],
             "mangoJuice":[("mango", 3)],
             "mangoKiwiJuice":[("mango", 2), ("kiwi", 1)]]
         
         func getJuiceIngredients() -> RecipeBook {
             return juiceIngredients
         }
     }
     ```


6. JuiceMaker 만들기
   - singleton으로 생성된 재고 관리 매니저를 불러오고, 레시피를 가져와서 쥬스를 만든다.
   - 재고가 부족한 상황은 STEP 1에 없으므로 우선 재고확인 절차 없이 무조건 만드는 기능을 구현하였다.

