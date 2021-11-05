# 목차
- [🍹 쥬스메이커](#---------)
    * [키워드](#키워드)
- [Contributors](#Contributors)
- [Reviewers](#Reviewers)
- [STEP 1 : 쥬스 메이커 타입 정의](#STEP-1--쥬스-메이커-타입-정의)
    + [고민했던 것](#1-1-고민했던-것)
    + [의문점](#1-2-의문점)
    + [Trouble Shooting](#1-3-Trouble-Shooting)
    + [배운 개념](#1-4-배운-개념)
    + [PR 후 개선사항](#1-5-PR-후-개선사항)
- [STEP 2 : 초기화면 기능구현](#STEP-2--초기화면-기능구현)
    + [고민했던 것](#2-1-고민했던-것)
    + [의문점](#2-2-의문점)
    + [Trouble Shooting](#2-3-Trouble-Shooting)
    + [배운 개념](#2-4-배운-개념)
    + [PR 후 개선사항](#2-5-PR-후-개선사항)
- [STEP 3 : 재고 수정 기능구현](#STEP-3--재고-수정-기능구현)
    + [고민했던 것](#3-1-고민했던-것)
    + [의문점](#3-2-의문점)
    + [Trouble Shooting](#3-3-Trouble-Shooting)
    + [배운 개념](#3-4-배운-개념)
    + [PR 후 개선사항](#3-5-PR-후-개선사항)


# 🍹 쥬스메이커

1. 프로젝트 기간: 2021.10.18 - 2021.11.05
2. Grounds Rules
    - Time Rule
        - 아침: 10시
        - 점심시간: 12시~ 1시
        - 저녁시간: 6시~7시
        - 프로젝트 최대 제한시간: 저녁 9시 ~ 최대 9시 30분 까지!
3. 커밋 규칙
    - 단위 : 기능 단위로
    - Convention: Karma Style

# 키워드

- `struct`, `class`, `enum`
- `Initialization`
- `Nested Types`
- `Dictionary`
- `zip`
- `typealias`
- `Function Types as Parameter Types`
- `Type Casting`
- `Error Handling`
- `Access Control`
- `MVC (Model-View-Controller)`
- `Singleton`
- `UILabel`, `UIButton`, `UIStepper`
- `HIG`, `Modality`
- `UIAlertController`, `UIAlertAction`
- `NavigationViewController`, `bar`, `button`
- `NotificationCenter`
- `prepare()`
- `Auto Layout`
- `Dynamic Type`, `Content Priority`

# Contributors

[@CodingJT](https://github.com/CodingJT) [@leeari95](https://github.com/leeari95)

# Reviewers

[@daheenallwhite](https://github.com/daheenallwhite)

# STEP 1 : **쥬스 메이커 타입 정의**

- 쥬스메이커 타입을 정의합니다.

## 1-1. 고민했던 것

- 과일과 주스를 사용자 정의 타입 `enum`으로 구현하는 것
- 초기 재고 10개를 어떻게 기본값으로 초기화 해줄 것인지에 대한 고민
    - `Dictionary`의 `init(uniqueKeysWithValues:)`, `zip`
    - 코드 가독성을 위하여 전역변수 `defaultFruitCount`를 생성
- 각 주스 제조에 필요한 과일의 갯수를 저장하는 방법에 대한 고민
    - 코드 내부 가독성을 위해 `typealias`를 활용하여 `Recipe` 를 정의해준 부분
    - `Dictionary` 를 활용하여 `key`에는 주스, `value`에는 재료가 들어가게 구성
- `Juice` 타입을 파라미터로 받아서 레시피를 조회하여, 필요한 과일의 갯수를 재고에서 차감해주는 방법에 대한 고민
    - 레시피 내부에 **과일 종류**와 **과일 갯수**를 받아서 과일의 재고가 있는지 확인하는 것
    - 재고가 부족하다면 **예외처리**를 하도록 구현

## 1-2. 의문점

- `Nested Type`을 이용하여 `JuiceMaker` 타입 내부에 `Juice` 타입을 작성하는 것이 좋은 방법인지 의문이 들었다. 내부에 타입을 작성을 해준 이유는 `Juice`타입을 타입 내부에서만 사용하고 있기 때문인데, 이게 적절한 방법인지 의문이 들었다. `Juice` 타입의 값을 사용하고자 할 때에 `JuiceMaker.Juice.strawberry`와 같은 형태로 길게 작성을 해야하는데, 그렇다면 바깥에 타입을 생성하는게 좋은걸까? 가독성 측면에서 어떤 것이 좋은 방법인지 의문이 들었다.
- 예외처리를 해주었는데 `do-catch`를 활용하여 에러를 처리해주는 부분은 구현하지 않았다. 이유는 나중에 `Controller`에서 사용할 때 처리해주어야 한다고 생각했기 때문인데, `Model`에서 미리 구현을 해놔야하는건지 헷갈린다.
- `JuiceMaker` 타입에 구현한 메소드 `fruitsMixer(juice:)` 코드를 아래와 같이 구현해주었다.
    
    ```swift
    // JuiceMaker 타입 내부의 메소드 fruitsMixer
    func fruitsMixer(juice: Juice) throws {
        guard let juiceRecipe = juiceRecipes[juice] else { return }
        guard canMakeJuice(recipe: juiceRecipe) else {
            throw RequestError.fruitStockOut
        }
        try juiceRecipe.forEach { (fruit, count) in
            try fruitStore.subFruitStock(fruit: fruit, count: count)
        }
    }
    ```
    
    `canMakeJuice(recipe:)`를 이용해 주스를 만들 수 있는지 미리 검증해주고 있고, 해당 코드의 아래에서 사용하는 `FruitStore` 타입의 `subFruitStock(fruit:count:)` 메소드에서도 주스를 만들 수 있는지 검증해주고 있다. 즉 이중으로 검증하고 있는 것인데 불필요한 작업이 아닌가 의문이 든다.
    

## 1-3. Trouble Shooting

- `Error` 메세지를 출력하려고 코드를 작성하면서 알아냈던 방법들
    1. `enum`안에 `static` 키워드를 활용하여 메서드 작성
    2. `static` 키워드를 없애고 `as`로 다운캐스팅하여 사용
    
    ```swift
    enum RequestError: Error {
        case wrongInput
        case notFound
        case fruitStockOut
        
        func printErrorMessage() {
            switch self {
            case RequestError.wrongInput:
                print("수량을 잘못 입력하였습니다.")
            case RequestError.notFound:
                print("선택한 과일이 존재하지 않습니다.")
            case RequestError.fruitStockOut:
                print("과일의 재고가 부족합니다.")
            }
        }
    }
    do {
        try maker.fruitsMixer(juice: .strawberryBanana)
    } catch let error as RequestError {
        error.printErrorMessage()
    }
    ```
    
    1. `LocalizedError` 프로토콜을 채택하여 `errorDescription` 프로퍼티 작성하여 활용 (현재)
    
    ```swift
    enum RequestError: Error, LocalizedError {
        case wrongCount
        case fruitNotFound
        case fruitStockOut
        
        var errorDescription: String {
            switch self {
            case RequestError.wrongCount:
                return "수량을 잘못 입력하였습니다."
            case RequestError.fruitNotFound:
                return "선택한 과일이 존재하지 않습니다."
            case RequestError.fruitStockOut:
                return "과일의 재고가 부족합니다."
            }
        }
    }
    ```
    

- `Dictionary(uniqueKeysWithValues:)`와 `zip` 사용하면서 Sequence의 대한 정확한 개념에 대해서 알아보았다.
    - `Sequence`는 원소들을 순서대로 하나씩 순회할 수 있는 타입을 의미한다.
    - `Sequence`에는 `range`만 들어가는 줄 알았는데 `Array`도 넣을 수 있었다.
    - `Array`는 `Sequence` 프로토콜을 기반으로 작성되었다는 사실을 알았다. `Array` 타입을 사용할 때 `Sequence`의 대부분의 기능을 제공해준다. `map`, `filter`뿐만 아니라 `Sequence` 안에서 특정 조건을 만족하는 첫번째 요소를 찾는 기능 까지 모두 다 `Sequence` 프로토콜 안에 정의되어 있다.
    - `Sequence`는 두가지 중요한 특징이 있는데 무한하거나, 유한하다. 그리고 한번만 이터레이트(`iterate`)할 수 있다.
    
- 각 주스를 만드는 데에 필요한 과일의 수를 저장하는 방법에 대해 고민해보았다.
    - 초기에 작성한 코드는 아래와 같은 형태로 `switch문`을 이용해 만들어줄 주스에 따라 하드코딩으로 필요한 과일의 수를 넣어주었다.
        
        ```swift
        func fruitsMixer(juice: Juice) {
            switch juice {
            case .strawberry:
                ...
            case .banana:
                ...
            case .kiwi:
                ...
            case .pineapple:
                ...
            case .strawberryBanana:
                ...
            case .mango:
                ...
            case .mangoKiwi:
                ...
            }
        }
        ```
        
    - 위에서 작성한 `fruitsMixer(juice:)`의 코드를 더 간결하게 작성하고 싶었고 `Dictionary`를 이용하여 해당 문제를 해결하였다.
        
        ```swift
        typealias Recipe = [FruitStore.Fruit: Int]
        
        private let juiceRecipes: [Juice: Recipe] = [
            Juice.strawberry: [.strawberry: 16],
            Juice.banana: [.banana: 2],
            Juice.kiwi: [.kiwi: 3],
            Juice.pineapple: [.pineapple: 2],
            Juice.strawberryBanana: [.strawberry: 10, .banana: 1],
            Juice.mango: [.mango: 3],
            Juice.mangoKiwi: [.mango: 2, .kiwi: 1]
        ]
        
        func fruitsMixer(juice: Juice) throws {
            guard let juiceRecipe = juiceRecipes[juice] else { return }
          ...
          try juiceRecipe.forEach { (fruit, count) in
              try fruitStore.subFruitStock(fruit: fruit, count: count)
          }
        }
        ```
        

## 1-4. 배운 개념

- 에러 메세지를 출력할 때 사용할 수 있는 다양한 방법
- `Nested Type`을 적절하게 활용하는 방법
- `typealias`를 활용하여 가독성을 높이는 방법
- 함수 내에서 클로저를 파라미터로 받아  +, - 등 연산자 기호를 해당 함수에 전달하여 사용하는 방법
    - 연산자(+, -)도 하나의 함수였다.
    `static func + (lhs: Int, rhs: Int) -> Int`
    - 연산자 기호를 파라미터로 전달할 수 있다.
    `changeAmount(count: count, of: fruit, by: -)`
- `Sequence`의 대한 개념
- 코딩 컨벤션을 정할 때 이유와 근거를 생각해보는 방법
- 전역변수를 사용할 때 다른 타입에서 접근할 수는 없는지 고려해보자.

## 1-5. PR 후 개선사항

- `JuiceMaker` 내부에 있던 프로퍼티 `Recipe`를 `Juice` 내부로 이동 후 switch문으로 변경
- enum `Juice`를 타입 외부로 이동
    - `이유`  Juice를 외부로에서도 사용
- `JuiceMaker` 기본값 프로퍼티를 제거하고 `initializer` 구현
- `fruitMixer` 메서드 이름을 `mixFruit`으로 수정
- `subFruitStock` 메서드명을 `subtractFruitStock` 으로 수정

# STEP 2 : 초기화면 기능구현

화면에 구현되어있는 버튼들의 기능을 추가합니다.

## 2-1. 고민했던 것

- Singleton 패턴을 활용
- 화면 이동시 이동 방식에 대한 고민
    - `이유` 네비게이션을 따라서 화면을 이동하는 방식이 적절하지 못하다고 생각했기 때문이다. `임시적`으로 화면에 들어가서 재고를 수정하는 용도의 View라는 생각이 들었다. 따라서 `Push` 보다는 `Present`가 적합하다고 생각했다.
- [**Human Interface Guidelines**](https://developer.apple.com/design/human-interface-guidelines/)에 따른 Alert 버튼 구성
    - `Yes`, `No`의 사용은 하지 말라고 되어있다.
    - 단순 수락시 `OK`, 취소는 `Cancel`
    - `Cancel` 버튼은 왼쪽에 위치해야 한다.
- Alert을 메서드에 구현하여 재사용성을 고려
- 재고 수량이 바뀔 때마다 화면에 반영시키는 방식
    - `NotificationCenter`를 활용
- 하드코딩 개선방법

## 2-2. 의문점

- 프로토콜을 사용자 정의 타입에 채택 후 프로토콜이 정의한 프로퍼티가 아니라 이름은 같지만 타입이 다른 프로퍼티를 구현해주었다. 이후 값을 전달하는 과정에서 타입이 정의한 프로퍼티가 아니라 프로토콜의 프로퍼티가 자꾸 전달되었는데 이유를 모르겠다.
- 프로젝트 요구사항이 HIG 지침을 지키지 않았다.
- `FruitStore` 내부에 선언되어있는 `Fruit`타입을 외부로 빼줘야할까?
- `Navigation Controller`가 두개가 구현이 되어있다. 하나만 있어도 되지 않나?
- UI 관련 타입들을 네이밍할때 끝에 Label이나 Button을 넣어주는 것이 널리 쓰이는 방법같은데 적절한걸까?

## 2-3. Trouble Shooting

- `Navigation Controller`가 두개가 구현이 되어있었던 의문을 풀었다. `Navigation Bar`를 이용하기 위함이였다. 쥬스메이커 메인화면에서 재고수정하기 버튼을 터치하게 되면 화면 이동방식은 `modal`이 되어야 한다고 생각했다. 이유는 네비게이션을 따라서 화면을 이동하는 방식이 적절하지 못하다고 생각했기 때문이다. `임시적`으로 화면에 들어가서 재고를 수정하는 용도의 View라는 생각이 들었다. 따라서 메인 화면을 재고수정이 구현되어있는 `ViewController`가 아니라 재고수정 화면에 연결되어있는 `Navigation Controller`에 `Segue`를 연결해서 `modal`을 구현하고, `bar button`을 활용하여 Cancel 버튼을 구현해주었다.
- 프로토콜(`LocalizedError`)을 사용자 정의 타입(`RequestError`)에 채택 후 프로토콜이 정의한 프로퍼티가 아니라 이름은 같지만 타입이 다른 프로퍼티를 구현해주었다. 이후 파라미터로 값을 전달하는 과정에서 타입이 정의한 프로퍼티가 아니라 프로토콜에서 기본 구현이 된 프로퍼티가 자꾸 전달되었는데 알고보니, **같은 이름**이지만 **타입이 다른** 두 프로퍼티가 공존하고 있을 때, 파라미터로 전달할 때에는 **타입이 일치**하는 프로퍼티가 들어갔다. 예를 들어 함수의 파라미터 후보로 `String`과 `String?` 두가지가 있고, 파라미터의 타입은 `String?` 이라면 컴파일러는 당연히 `String?`을 전달해주려고 할 것이다. 다만 최후의 후보가 `String` 뿐이라서 **String? 자리**에 `String`을 전달하는 경우 String을 `String?`으로 **포장**해줄 수는 있겠다. 당시에는 왜 **String을 전달**하고 있는데 왜 `nil`이 전달되는 것인지 이해가 가지 않았었는데, 그 의문을 질문을 통해서 해결하였다. 이후 `LocalizedError` 프로토콜을 사용할 이유가 없어져서 채택한 것을 없애주고 해결하였다.
- 맨 처음 `Model`을 구현할 때 당시에는 `Fruit`을 밖에서 사용하지 않는다고 생각하여 `FruitStore` **내부**에 구현을 해주었었는데, `STEP 2`를 구현하다보니 외부에서도 쓰이는 상황을 마주했다. 그래서 내부로 다시 빼주는 작업을 하였고 앞으로 설계할 때 **정말 안에서만 쓰이는 타입**인지 잘 고민하고 중첩 타입을 사용해야겠다는 큰 깨달음을 얻었다.

## 2-4. 배운 개념

- `MVC` 패턴
- `Navigation bar`를 이용하여 `title`, `button` 아이템 활용방법
- `Alert`을 만드는 방법
- `NotificationCenter`를 활용하여 `Model`이 `Controller`에게 데이터 변화를 알려주는 방법
- `Singleton` 패턴을 활용하여 `Model`의 데이터를 `View`에서 활용
- 직접 구현한 화면(ViewController)이 아니라 `Navigation View Controller`에 `Segue`를 연결하면 `modal` 방식으로 화면이 이동되면서 동시에 `Navigation bar button`과 `Navigation bar title`을 사용할 수 있다.
- `Device Orientation`
    - 이 부분을 통해서 세로모드, 가로모드를 제어할 수 있다.

    ![](https://i.imgur.com/fqlvpGR.png)
    
- 가로모드에서는 모달창을 위에서 아래로 내리는 제스처를 사용할 수 없다. (세로모드만 가능한 제스처)
- 변수들을 따로 모아서 `enum`타입으로 구현하고 `static` 변수로 구현하여 별도로 관리하는 방법
- `Bundle`을 활용하는 방법
- `extension`으로 코드를 분리하여 가독성을 향상시키는 방법

## 2-5. PR 후 개선사항

- 문자열을 따로 `enum` 타입으로 분리하여 관리하도록 개선
- String init으로 형변환했던 Int값을 `description` 프로퍼티를 활용하여 개선
- 어색한 용도로 쓰고있던 `CustomStringConvertible` 프로토콜을 제거
- Alert Action Button의 title을 `Bundle`을 활용하여 다국어를 지원하도록 개선
- 전역변수로 선언되어있던 FruitStore init의 기본값을 `enum` 타입으로 구현하여 `static` 변수로 구현
- Alert 메소드 내부에 있던 `handler` 클로저를 분리하여 가독성 개선
- 오버스펙으로 구현된 부분 삭제

# **STEP 3 : 재고 수정 기능구현**

재고 추가 화면의 기능을 구현합니다.

## 3-1. 고민했던 것

- 재고 수정 화면으로 전환시 재고 관련 Label들이 업데이트 되는 부분을 고민했습니다. 따로 재고수정 화면에서 재고를 조회하고 Label에 반영해주는 방법도 있겠지만 같은 일을 두번 반복하는 것이 좋지않아 보였고, JuiceMakerViewController의 Label의 값들을 다음 화면에다가 넘겨주면 좋겠다고 생각하여 `prepare`메소드를 이용하여 넘겨주는 방식을 선택했다.
- Controller 내부 가독성을 어떻게 하면 향상 시킬 수 있는지 고민했다. `extension`을 이용하여 Controller를 분리해보았다. 실제로 가독성도 좋아지는 것 같은 효과[?]를 보았다.
- 초기에는 Stepper가 터치될 때 (Event가 `Touch Up Inside`일 때) FruitStore의 과일 갯수 저장 프로퍼티 값이 바뀌도록 `IBAction Method` 메소드를 작성해 구현해보았다. 해당 방식으로 구현하면 Stepper의 값이 변화하지 않았을 때에도 `IBAction Method`를 사용하게 되어 메소드 내부에서 수동으로 값의 변화를 체크해야 했다. 자동으로 값의 변화를 체크해주는 방법을 애플에서 제공해주지 않을까 생각이 들었고 Event를 `Touch Up Inside`에서 `Value Changed`로 바꾸어주어 해당 방식을 선택했다.
- `Label`과 `Button`이 **Dynamic Type** 크기에 따라 커지고 작아질 때마다 실시간으로 반영될 수 있도록 **`adjustsFontForContentSizeCategory`** 옵션을 true로 주었다.
- `Label`과 `Button`이 **Dynamic Type** 크기에 따라 폰트 크기가 변화할 때마다 글씨가 잘리는 현상을 발견했습니다. 그래서 버튼 크기 너비에 맞게 크고 작아질 수 있도록 `AdjustsFontSizeToFitWidth` 옵션을 true로 주었다.
- 

## 3-2. 의문점

- 화면 전환 시 Label을 넘겨줄 때 prepare 메소드 내부에서 loadViewIfNeeded 메소드를 이용하여 다음 View를 미리 load 해주고 있다. 이게 적절한 타이밍에 사용했다고 생각하긴 하는데, 정말 적절한건지 모르겠다.
- present 메소드를 통해 특정 view controller를 띄어준 뒤 view controller의 view 프로퍼티에 접근하여 값을 수정하였을 때 UI가 반영되었다. present 메소드 사용 이전에 view controller의 UI 관련 값을 설정하고 present를 해주어야하는 줄 알았는데 그렇지 않아 의외였다.

## 3-3. Trouble Shooting

### 1. ViewController 내부 코드 가독성 향상에 대하여

- `상황` Controller의 내부가 길어지고 많아져서 가독성을 향상 시킬 수 있는 방법이 없을까 하다가 extension을 알게되었다.

    ![](https://i.imgur.com/uvbjm9X.png)


- `해결` 코드 배치 순서를 활용하여 가독성을 높혀주는 방법도 있겠지만 extension을 이용하여 메서드들을 분리해주었더니 위와 같이 조금은 읽기 수월해진 코드가 되었다.

### 2. prepare() 메소드로 데이터가 제대로 전달이 안되는 경우

- `상황` prepare 메소드를 이용하여 Label의 값들을 넘겨주는 기능을 추가하다가 다음 화면에서 정상적으로 값이 전달되지않아 Label.text 값이 nil인 것을 확인했다. View가 load가 되어있지 않아서 값을 전달하는게 불가능 했다.
- `시도` 첫번째 방법으로 임시로 값을 담아둘 프로퍼티를 전환할 Controller에 구현해주고 넘겨주려고 했다. 하지만 해당 방법은 프로퍼티를 여러개 생성해야되서 코드 가독성 측면에서 떨어진다고 생각이 들었다.
- `해결` 두번째 방법으로는 View를 미리 load할 수는 없을까 찾아보다가 `loadViewIfNeeded()` 메소드를 찾게되어 해당 메소드를 호출 후에 Label 값을 전달해주니 정상적으로 다음 화면에서 Label의 값이 적용되었다.

### 3. button에 Dynamic Type 적용이 안되는 경우

- `상황` 보통 Label은 우측 Inspector에서 간단한 체크로 Automatically Adjusts Font를 설정해줄 수가 있는데 버튼의 titleLabel은 우측 Inspector에서 설정해줄 수가 없었다.
- `이유와 해결` 찾아보니 코드로 적용하는 방법 뿐이였고, 버튼들 모두 실시간으로 Dynamic Type이 적용될 수 있도록 코드로 옵션을 활성화 해주었다.
    
    ```swift
    // MARK: - Setup Label and Button
    extension JuiceMakerViewController {
        func buttonLabelFontSizeFix() {
            orderStrawberryBananaJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
            orderMangoKiwiJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
            orderStrawberryJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
            orderBananaJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
            orderPineappleJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
            orderKiwiJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
            orderMangoJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
    ```
    

### 4. NavigationViewController에 연결되어있는 ViewController를 가져오기

- `상황` NavigationViewController를 생성해서 Label에 접근해서 값을 전달해주려고 했으나 접근할 수가 없었다.
- `이유` NavigationViewController는 실제로는 뷰가 존재하지 않기 때문에 연결되어있는 ViewController를 가져와야 했다.
- `해결` topViewController라는 프로퍼티를 이용하여 ViewController를 생성해주고, 타입캐스팅으로 FruitStoreViewController를 가져와서 Label에 접근하는데에 성공했다.
    
    ```swift
    private func presentFruitStoreViewController(_ action: UIAlertAction) {
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") as? UINavigationController else { return }
            self.present(viewController, animated: true, completion: nil)
            guard let nextViewController = viewController.topViewController as? FruitStoreViewController else { return }
            setupNextViewLabel(of: nextViewController)
        }
    ```
    
    
## 3-4. 배운 개념

- 화면 사이의 데이터 공유하는 여러가지의 방법
- UIControl.Event
- UIStepper
- Auto Layout
    - Dynamic Type
    - Content Priority
- prepare 메소드 활용법
- 지정된 식별자를 가지고 스토리보드의 데이터를 초기화해서 ViewController를 가져오는 방법
- Navigation View Controller의 스택의 맨 위에 있는 ViewController를 가져오는 방법
- 상위 클래스를 하위 클래스로 형변환하여 사용하는 방법
    ```swift
    guard let navigationController = segue.destination as? UINavigationController else { return }
    guard let nextViewController = navigationController.topViewController as? FruitStoreViewController else { return }
    nextViewController.strawberryStockLabel.text = strawberryStockLabel.text
    ```
## 3-5. PR 후 개선사항

- 메소드명이 동사로 시작하도록 개선
- `Singleton`을 제거
- 화면간 데이터 전달 방식을 `NotificationCenter`를 활용하는 것으로 전체적인 수정
- `extension`을 활용하여 코드를 간결화
