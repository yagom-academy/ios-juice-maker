# ios-juice-maker : 제인, 허황 팀 프로젝트

## **그라운드 룰**

- 활동 시간
    - 10:00 ~ 12:30 / 14:00 ~ 18:30 / 20:30 ~ 서로상의 /
    - 주말은 개인 공부, 한 주에 나왔던 이슈 정리
- 스크럼 시간
    - 10:00 (활동 학습하는 날은 점심시간 이후)
- 쉬는 시간 / TIL 작성 시간
    - 점심 : 12:30 ~ 14:00
    - 저녁 : 18:30 ~ 20:30
- 코딩 컨벤션
    - Swift API Desing Guidelines
    - 타입 추론, 타입 명시
    변수나 상수가 명확한 값을 가지는 경우 타입 추론을 사용한다.(선언과 동시에 초기화 할 경우)
    사용자 정의 타입은 타입을 명시해준다.
- 커밋 메시지 컨벤션
    - 카르마 스타일에 따라 제목 + 본문 까지 적어보기
- 커밋 단위
    - 함수 단위
- 질문은? 바로바로

# STEP 1

## **구현 내용**

- 에러 처리

`FruitStoreError`열거형에 `Error 프로토콜`을 채택하여 에러처리를 구현

`case outOfStock(_ fruitNeeded: [Fruit: Int])` 부족한 과일을 요청 받은 경우 에러를 발생하고 어떤 과일이 몇개가 부족한 지 추가 정보도 같이 제공하는 케이스

- FruitStore 클래스 설계
1. `initialFruitQuantity = 10`  과일의 초기 개수를 담고 있는 타입 프로퍼티
2. `stock: [Fruit: Int]` 과일의 종류와 과일 별 개수를 담고 있는 Dictionary
3. `init(quantity: Int = FruitStore.initialFruitQuantity)` 과일의 초기 개수를 받아 `stock 프로퍼티`를 생성해주는 이니셜라이저 (이니셜라이저 매개변수 기본값으로 타입 프로퍼티인 `initialFruitQuantity`를 사용)
4. `initializeStock(quantity: )` 초기화 시 사용되며 `stock 프로퍼티`에 과일별로 과일의 초기 재고를 설정해주는 타입 메소드
5. `add(fruit: Fruit, quantity: Int = 1)` 과일의 개수를 n 개씩 증가시켜주는 함수 (기본 증가 수량은 1)
6. `updateStock(of recipe: [Fruit: Int])`  `stock 프로퍼티`와 전달인자로 받은 `recipe 딕셔너리`를 `merging`하여 예외처리와 `stock 프로퍼티`의 값을 갱신해주는 함수
7. `checkOutOfStock(_ calculatedStock: [Fruit: Int]) throws`과일의 개수가 음수일 경우 부족한 과일의 종류와 개수를 같이 `throw` 하는 예외 처리 함수
8. `convertToString(using fruitAndQuantity: [Fruit: Int]) -> String` [Fruit: Int] 딕셔너리를 문자열로 변환해 주는 함수

- JuiceMaker 구조체 설계
1. `fruitStore` : FruitStore 타입을 담는 프로퍼티
2. `init(fruitStore: FruitStore = FruitStore())` : 매개변수 기본값으로 FruitStore() 을 담아서 초기화할 때 자동으로 인스턴스를 생성하는 이니셜라이저
3. `Juice 열거형` JuiceMaker가 만들 수 있는 쥬스의 케이스를 나열한 열거형. `연산 프로퍼티 recipe`로 쥬스 별 필요 과일 개수를 알 수 있음
4. `make(juice:)` : 자신의 프로퍼티인 fruitStore에 접근해 updateStock(of:) 메서드를 이용하여 쥬스를 만드는 함수

## **고민했던 부분**

- FruitStore 클래스 설계

처음에는 FruitInventory 클래스로 각 과일 별 재고를 관리하려고 시도했지만, 그렇게 하면 과일 별로 FruitInventory 클래스의 인스턴스가 생기게 되어 관리가 난해하다고 판단했다.

따라서 FruitInventory 클래스를 딕셔너리[과일: 개수]로 수정하였고 stock 딕셔너리에 Fruit 열거형의 키와 값을 한번에 추가하는 타입 메소드를 사용하는 방향으로 변경했다. 

```swift
// 설계 초반 FruitInventory 클래스 사용 코드
class FruitStore {
    static let initialFruitsQuantity: Int = 10
    
    class FruitInventory {
        let fruit: Fruit
        var quantity: Int = FruitStore.initialFruitsQuantity
        
        init(fruit: Fruit) {
            self.fruit = fruit
        }
    }
    
    let strawberries: FruitInventory = FruitInventory(fruit: .strawberry)
    let bananas: FruitInventory = FruitInventory(fruit: .banana)
    let pineapples: FruitInventory = FruitInventory(fruit: .pineapple)
    let kiwis: FruitInventory = FruitInventory(fruit: .kiwi)
    let mangoes: FruitInventory = FruitInventory(fruit: .mango)
}
```

```swift
// 개선후 [Fruit: Int] 딕셔너리 사용 코드
class FruitStore {
    private var stock: [Fruit: Int]
    
    init(quantity: Int = 10) {
        self.stock = FruitStore.initializeStock(quantity: quantity)
    }

    private static func initializeStock(quantity: Int) -> [Fruit: Int] {
        var stock: [Fruit: Int] = [:]
        
        for key in Fruit.allCases {
            stock[key] = quantity
        }
        
        return stock
    }
    // ...
}
```

- 프로퍼티 기본값을 이니셜라이저 매개변수 기본값으로 변경

처음에는 stock 딕셔너리의 프로퍼티 기본 값으로 타입 메소드를 사용했다. 그러나 프로퍼티의 기본값으로 값을 직접 넣어주게되면 나중에 설계가 바뀔 경우 프로퍼티의 기본값 자체가 바뀌게 된다. 

따라서, 이니셜라이저의 매개변수의 기본값을 사용하게 된다면 나중에 또 다른 이니셜라이저를 만들어서 관리할 수 있기 때문에 혼란을 방지 할 수 있다. 이러한 이유로 stock 프로퍼티에 기본값을 넣지 않고 이니셜라이저 매개변수의 기본값을 넣게끔 변경했다. 

```swift
// 개선 전
class FruitStore {
    static let initialFruitsQuantity: Int = 10
    var inventory: [Fruit: Int] = initializeInventory()
    
    static func initializeInventory() -> [Fruit: Int] {
        var inventory: [Fruit: Int] = [:]
        
        for key in Fruit.allCases {
            inventory[key] = FruitStore.initialFruitsQuantity
        }
        
        return inventory
    }
}
```

```swift
// 개선 후
class FruitStore {
    var inventory: [Fruit: Int]
    
    init(quantity: Int = 10) {
        self.inventory = FruitStore.initializeInventory(quantity: quantity)
    }
    
    static func initializeInventory(quantity: Int) -> [Fruit: Int] {
        var inventory: [Fruit: Int] = [:]
        
        for key in Fruit.allCases {
            inventory[key] = quantity
        }
        
        return inventory
    }
}
```
