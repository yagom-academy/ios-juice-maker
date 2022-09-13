# README(1) **쥬스 메이커**

---

### 1. 🍹 프로젝트 소개 (STEP 1)

- JuiceMaker는 FruitStore의 과일을 이용해 juice를 제작합니다.
- Juice별 Recipe에 따라 FruitStore의 과일 재고를 파악하고 재고가 충분할 때만 Juice를 제작할 수 있습니다.


---

### 2. 🧑‍🤝‍🧑 팀원


|SummerCat|SunnyCookie|
|------|---|
|<img width="180px" src="https://i.imgur.com/TVKv7PD.png">|  <img width="180" src="https://i.imgur.com/z4FjnKX.png">

---

### 3. ✏️ 프로젝트 구조

#### `FruitStore`
- `FruitStore`는 `enum` 타입의 `Fruit`를 통해 취급하는 과일을 명시합니다.
- 각 과일의 재고는 `[Fruit: Int]` 형태의 딕셔너리 `fruitStock` 프로퍼티에서 관리합니다.
    ```swift=
    private var fruitStock: Dictionary<Fruit, Int> = [
            .strawberry : 10,
            .banana : 10,
            .pineapple : 10,
            .kiwi : 10,
            .mango : 10,
        ]
    ```
    - `fruitStock` 딕셔너리 작성 시 마지막 Element 뒤에 `,`를 붙인 이유
        - [구글의 Swift 컨벤션](https://google.github.io/swift/#braces)
        - array와 dictionary의 각 element가 한 줄에 하나씩 작성되었을 경우, 뒤에 꼭 `,`를 붙여야 한다. 이렇게 해야 나중에 항목이 추가되었을 때 더 명확하게 차이를 알 수 있다.
     ![](https://i.imgur.com/LXCgkly.png)
      - 접근제어자를 `private`으로 설정한 이유: 과일가게의 과일의 재고 값을 외부에서 마음대로 바꾸지 못하도록 해야 한다고 생각해서 `private`을 사용해 `FruitStore` 내에서만 접근이 가능하도록 설정했습니다. 

- `changeStockOf` 함수
    - `FruitStore`가 가지고 있는 과일의 재고의 수량을 변경하는 함수입니다.
    ```swift
    func changeStockOf(fruit: Fruit, by quantity: Int) {
            guard let currentStock = fruitStock[fruit] else {
                return
            }

            fruitStock[fruit] = currentStock + quantity
        }
    ```
    - `guard`문을 사용해 현재의 재고 수량을 옵셔널 바인딩 해서 `currentStock`에 넣은 후, 조정한 수량만큼 `fruitStock[fruit]`에 넣어줍니다.
    - `fruitStock[fruit] = currentStock = quantity`에서 옵셔널 바인딩이 필요하지 않은 이유는, `fuitStock[fruit]`의 값이 존재하지 않더라도, `currentStock + quantity`의 값을 새로 할당해주기 때문입니다.

-  `checkStockOf` 함수
    - `JuiceMaker`가 요청한 과일의 수량을 확인하는 함수입니다.
    - 요청이 들어온 과일이 존재하지 않을 경우, `noSuchFruit` 에러를 반환합니다.
    - 요청이 들어온 과일의 수량이 부족할 경우, `stockShortage` 에러를 반환합니다.

#### `JuiceMaker`
- `JuiceMaker`는 `FruitStore`를 소유하기 위해 `fruitStore`라는 `FruitStore`의 인스턴스를 갖습니다.
- `JuiceMaker`는 `enum` 타입의 `Juice`를 통해 취급하는 쥬스를 명시합니다. `enum` 타입 안에 `juiceName` 프로퍼티를 만들어 각 쥬스의 한글이름을 반환할 수 있도록 하고,  `recipe` 프로퍼티에 사용하는 과일과 갯수를 딕셔너리로 정리해 주었습니다.
    - 딕셔너리를 사용해서 `recipe`를 작성한 이유: **고민한 부분**에 작성
- `makeJuice` 메서드는 쥬스 제작이 가능한지 확인하기 위해 `checkFruitStore` 메서드를 통해 레시피에 맞는 과일갯수를 체크하고, 사용한 과일만큼 `useFruitStore` 메서드를 통해 `fruitStore`의 과일 재고를 조정합니다. 
    - 이 과정중 do - try - catch 구문을 사용하여 error를 처리합니다.
    - `JuiceMakerError`로 다운캐스팅 된 `error` 상수를 catch에서 정의해, `errorDescription`으로 에러 메시지를 불러옵니다.
    - error가 catch 될 시에 음료제작을 중단하기 위해 return처리 됩니다. 
- `checkFruitStore` 메서드는 `recipe`에서 필요한 과일의 개수와 `fruitStore`의 재고를 비교하기 위해 `FruitStore`의 `checkStockOf` 메서드를 이용합니다. `checkStockOf`에 과일의 종류와, 해당 과일의 필요한 총량을 전달합니다. 딕셔너리의 key값을 이용하기 위해 for - in 구문을 이용했습니다.
    - `JuiceMaker`의 `changeStockOf`에서 던진 오류를 `checkFruitStore`에서 처리할 수도 있지만, 그렇게 작성할 경우 함수의 depth가 깊어져 가독성이 떨어진다고 판단해 오류를 한번 더 던져서 `makeJuice`에서 오류를 처리하도록 했습니다.

- `useFruit` 메서드는 `fruitStore`의 과일의 재고를 조정합니다.


#### `JuiceMakerError`
- `JuiceMakerError`에서는 `Error` 프로토콜을 채택한 `enum`타입을 이용해 에러를 case별로 정리했습니다.
- `extension`을 이용해 do-catch구문에서 에러메세지로 이용할 구문을 `errorDescription` 프로퍼티에 정리했습니다. 사용시에는 as로 다운캐스팅하여 `errorDescription`을 이용해 에러메세지를 출력할 수 있도록 하였습니다.
    - `LocalizedError` 프로토콜에 이미 `errorDescription`이 구현되어 있지만 `LocalizedError`를 채택하지 않은 이유는, `LocalizedError`에 구현되어 있는 `errorDescription`의 반환값이 `String?`이기 때문입니다.
    - 정의된 유형의 에러가 발생했을 때에만 `errorDescription`을 내보내는 방향으로 설계했기 때문에 옵셔널 타입으로 반환할 필요가 없다고 생각해, `String`을 반환하는 `errorDescription`을 `extension`에 새로 정의해서 사용했습니다.


---

### 4. 👩🏻‍💻 실행 화면(기능 설명)
    
| 코드 | 출력 |
|------|---|
|<img width="350" src="https://i.imgur.com/DuDhrbk.png"> |<img width="350" src="https://i.imgur.com/82VzY4r.png">|

- `딸바쥬스`를 만들고 난 후`딸기`의 재고가 0이기 때문에, 이후에 `딸바쥬스`를 만들어달라고 요청한 경우 쥬스를 만들지 않고 `재고 부족` 메시지를 출력합니다.
    - 이 때, 두 과일(`딸기`, `바나나`) 중 하나라도 재고가 부족한 경우 쥬스를 만들지 않고 두 과일의 재고 모두 조정되지 않습니다.

---

### 5. 🔥 트러블 슈팅

#### `enum Juice` 타입에서 사용하는 과일의 종류, 갯수 연결하기
열거형으로 정리한 쥬스타입의 case마다 레시피로 사용되는 각 과일의 갯수를 연관지어 지정해놓고 싶었습니다. 예를 들어, 딸기바나나쥬스는 딸기 10개 바나나 1개를 사용하기 때문에 `case 딸기바나나쥬스` 에는 딸기 10개, 바나나 1개를 연결하고 싶었습니다.
- **시도1 : 연관값(Associated Values) 사용**
    ```swift
    case strawberryBananaJuice(strawberry: 10, banana: 1)
    ```
    - 연관값을 사용할 경우, 만들 쥬스를 고르기 위해 case를 불러올 때 연관값을 반드시 초기화(할당)해야 해서 최초에 할당한 연관값이 사용되지 않는 문제가 있었습니다.

 - **시도2 : 튜플을 리턴해주는 메서드, 프로퍼티 사용**
     ```swift
        enum Juice {
            case bananaJuice
            case strawberryBananaJuice

            var ingredient: (first: FruitStore.Fruit, second: FruitStore.Fruit?) {
                switch self {
               case .bananaJuice:
                    return (.banana, nil)
               case .strawberryBananaJuice:
                    return (.strawberry, .banana)
                }
            }

            func ingredientsCount() -> (first: Int, second: Int) {
                switch self {
                case .bananaJuice:
                    return (2,0)
                case .strawberryBananaJuice:
                    return (10, 1)

                }
            }

    //사용 시
    let firstfruitType = Juice.ingredient.first 
    let firstfruitCount = Juice.ingredients.first         
    let secondfruitType = Juice.ingredient.second //옵셔널바인딩 포함
    let secondruitCount = Juice.ingredients.socond       
    ```
    - 과일타입과 갯수를 튜플로 묶어 리턴하는 방법을 시도했지만, 과일이름과 갯수를 서로 다른 프로퍼티와 메서드에서 따로 리턴해주기 때문에 코드를 읽는 사람입장에서 어떤 과일이 몇개가 쓰이는지 연결짓기가 어려울 것 같다고 생각했습니다. 
    - 한개의 튜플에 라벨을 달아 과일명과 갯수를 같이 넣어주는 방법도 있지만 튜플은 그 크기가 정해져있기에 과일을 한 개만 사용하는 쥬스와 두 개를 사용하는 쥬스를 프로퍼티(혹은 메서드)한 곳에 같이 담기가 어려워 사용하지 않았습니다.

- **시도 3. 딕셔너리 타입을 리턴해주는 프로퍼티 사용**
    ```swift
     var recipe: Dictionary<FruitStore.Fruit, Int> {
                switch self {
                case .strawberryJuice:
                    return [.strawberry: 16]
                case .strawberryBananaJuice:
                    return [.strawberry: 10, .banana: 1]
                }
     }
    ```
    - `recipe` 프로퍼티에 과일 종류와 개수를 딕셔너리로 반환시켜주는 컨셉을 채택했습니다. 과일 종류와 개수를 명확히 보여줄 수 있고, 그 크기도 정해져있지 않고 순서도 중요하지 않기 때문에 딕셔너리를 사용하는게 베스트라고 생각했습니다.

---

### 6. 👆🏻 추가로 수정해보고 싶은 내용
#### `Recipe` 구현 방식 수정
- [다른 조의 리뷰 내용](https://github.com/yagom-academy/ios-juice-maker/pull/248#discussion_r959716917)을 보니, `Recipe`를 dictionary가 아닌 tuple, struct, class 등 다른 타입으로 구현했을 때 어떤 장단점이 있을 지 생각해 보면 좋을 것 같다는 내용이 있었다. 
- class나 struct로 구현해보면 좋을 것 같다는 생각이 들어서 STEP 2를 진행하면서 한번 도전해 보려고 한다!
#### `makeJuice` 메서드의 반환값 설정
- 현재는 반환값이 없는 함수인데, STEP 2의 내용을 확인해보니 쥬스 만들기 성공/실패에 따른 반환값이 필요해 보인다. 크게 `Result` 타입을 반환하는 방법, `Bool` 타입을 반환하는 방법 두 가지가 있을 것 같다.
#### 아직 해결되지 않은 고민
- `enum Juice`와 `enum Fruit`를 각각 `JuiceMaker`와 `FruitStore`안에 정의했는데, 처음에는 각 쥬스 메이커와 과일 가게가 그 타입을 소유한다고 생각해서 그렇게 작성했었다(공부해야 할 내용에 `Nested Type`이 있기도 했고).
- `enum Juice`와 `enum Fruit`을 분리해서 별도의 파일에 정의하는 것이 좋을까??? 리뷰어님한테 질문해보자..!

---

### 7. 🔗 참고 링크

- [Swift Language Guide - Access Control
](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
- [Swift Language Guide - Nested Types
](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)

