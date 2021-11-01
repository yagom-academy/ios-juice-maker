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
<br/>

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

# STEP 2

## **구현 내용**

- 노티피케이션 센터 & 프로퍼티 옵져버

`FruitStore`의 stock의 변동사항을 `JuiceMakerViewController`에게 전달하기 위해서 노티피케이션 센터를 활용하였다. post를 stock이 변하고 나서 보내기 위해 stock에 프로퍼티 옵져버를 사용하여 didSet 부분에 `NotificationCenter.default.post(name:, object:)` 를 구현하였다. 

`JuiceMakerViewController`에서는 앱이 실행될때 한번만 실행되도록 `addObserver()`를 `viewDidLoad()` 부분에 구현하였다. `changeStockLabel()`에 `@objc` 어트리뷰트를 붙여서 노티를 받고나서 실행되는 부분을 명시해주었다.   
<br/>


- 싱글턴

 `FruitStore`의 재고를 어디에서든 불러와서 업데이트가 가능하도록 하기 위해서 `FruitStore`를 싱글턴으로 구현하여 `FruitStore`의 인스턴스가 앱 전반에서 하나만 존재하게 하였다. 

`static let shared = FruitStore()` : 인스턴스를 생성하여 타입 프로퍼티에 할당하여 .shared 로 접근시 언제나 똑같은 인스턴스를 불러오도록 하였다. 

`private init(quantity:)` : 이니셜라이저를 private하게 선언하여 타입 외부에서 새로운 인스턴스가 만들어지지 못하게 접근제어를 하였다.  
<br/>


- JuiceMakerViewController 클래스 설계

`initJuiceMakerViewController()` : 과일의 초기 재고를 과일별 Label에 표시해주고, 과일 재고의 변동 사항이 생겼다는 노티를 받기 위해 `addObserver`해줌.

`@objc changeStockLabel()` : 과일 재고를 과일별 Label에 표시해주는 함수, 과일의 변동사항 생겼다는 노티를 받으면 동작함.

`touchUpOrderButton(_ sender:)` : 쥬스 주문 버튼을 누르면 동작하는 버튼 이벤트. 버튼의 타이틀을 가공하여 어떤 쥬스를 주문했는지 판단함.

`tapStockModifyButton(_ sender:)` :  재고 수정 바 버튼 아이템을 탭하면 동작하는 버튼 이벤트.

`presentStockModifyView()` : 재고 수정 화면을 `present`하는 함수. 재고 수정화면의 `StoryboardID`를 사용해 이동함.

`showCompletedOrderAlert(of order:)` 쥬스가 성공적으로 만들어졌을 때 성공 `Alert`을 띄워주는 함수.

`showFailedOrderAlert(fruitAndQuantity: )` : 쥬스가 만들어지지 못했을 때 실패 `Alert`을 띄워주는함수. 매개변수 fruitAndQuantity는 부족한 과일과 개수를 담고 있는 [Fruit: Int] 딕셔너리 타입. 

`AlertAction`으로 `재고 수정하기`, `아니오` 가 있으며 `재고 수정하기` 버튼을 누를 경우 재고 수정화면으로 이동함. `아니오` 버튼은 `Alert`을 닫음.  
<br/>


- StockModifyNavController 클래스 설계

`let storyboardName = "Main"`

`let storyboardID = "StockModifyNavController"`

`StockModifyNavContorller`를 띄울 때 `storyboardName`, `storyboardID`의 문자열을 직접 입력하는 것을 지양하기 위해  `storyboardName`, `storyboardID` 상수를 만듦.

---

## **고민했던 부분**

- 네비게이션 컨트롤러는 왜 주문 화면, 재고 수정 화면 둘 다 붙어 있는가?

네비게이션 바를 사용하기 위함이라고 생각했지만, 네비게이션바를 재고수정화면에 넣어줄수도 있다.  

또 네비게이션 바를 사용하지 않고 타이틀은 Label로, 닫기 버튼은 UIButton 등으로 구현할 수도 있다.


<br/>

- 네비게이션 컨트롤러가 붙은 뷰는 모달, 네비게이션 두 가지 방식 모두 사용가능한가?

네비게이션 컨트롤러가 붙은 뷰 컨트롤러는 모달, 네비게이션 두 가지 방식 모두 사용가능하다.

또, 네비게이션 컨트롤러를 모달로 띄워줄 수 있다.

하지만 네비게이션 컨트롤러 자체를 push해 줄 순 없다. 정확한 이유는 찾아봐야겠지만 push 방식이 deprecated 되었기 때문이지 않을까라는 추측을 해본다. (아니면 원래 push는 뷰컨트롤러만 가능한 방식이고 새로운 방식인 show를 사용시 네비게이션, 뷰컨트롤러 둘다 가능하게 된건가?)  
<br/>

- 그렇다면 서브 뷰에 또 다른 서브 뷰들이 달려있을 때 네비게이션 컨트롤러를 안가져오면 그 달린 뷰들 간에 화면전환은 어떻게 이뤄질까?

답변) show 방식으로 네비게이션 컨트롤러 자체를 가져오면 해결이 가능하다. show을 이용하면 네비게이션 컨트롤러도 네비게이션 방식으로 화면 전환이 가능하기 때문이다.  
<br/>
  
- navigationController는 왜 옵셔널 타입인가?

답변) 메인 뷰컨트롤러(=앱이 실행되고 처음뜨는 화면)에 네비게이션 컨트롤러가 연결되어있지 않으면 

서브 뷰컨트롤러를 네비게이션 컨트롤러 Stack에 push할 수 없기 때문이다.  
<br/>

- 뷰 컨트롤러를 코드로 띄우는 방식 : show와 push(네비게이션 방식) / present(모달 방식)

pushViewController 방식은 네비게이션 컨트롤러를 띄울 수 없다.

show 방식은 뷰컨트롤러, 네비게이션 컨트롤러 둘다 띄울 수 있다. 

뷰컨트롤러 인스턴스를 그냥 불러오면 뷰컨트롤러 안에는 UI요소들이 없기때문에 껍데기만 불러와진다.

따라서 storyboard ID와 storyboard name 을 이용해서 instantiateViewController를 통해 UI요소까지 불러와야한다.

```swift
func presentStockModifyView() {
      let stockModifyNavController = StockModifyNavController() 
      let storyboard = UIStoryboard(name: stockModifyNavController.storyboardName, bundle: nil)
      let stockModifyNC = storyboard.instantiateViewController(identifier: stockModifyNavController.storyboardID)
        
       //네비게이션 컨트롤러를 띄우는 방식 두가지
       //1. 모달로 띄우기
      present(stockModifyNC, animated: true, completion: nil)
       //2. 네비게이션으로 띄우기
      navigationController?.show(stockModifyNC, sender: nil) //새로운 방식
			navigationController?.pushViewController(stockModifyNC, animated: true) //deprecated 방식 - 에러남: Navigation controller 못가져와서
 }
```

그렇지만 코드로 UI를 구현했으면 이 방식도 사용 가능

```swift
func presentStockModifyView() {
      let stockModifyNavController = StockModifyNavController() 
			navigationController?.show(stockModifyNavController, sender: nil) 
 }
```

---

## 고민했던 부분

과일의 수량을 각 Label에 반영하는 `changeStockLabel()` 함수를 만듦

`changeStockLabel()` 함수를 JuiceMakerViewController viewDidLoad() 내부에서 호출해주는 방식이 아닌 노티피케이션 센터 post를 이용해서 과일의 변동 사항을 과일 별 Label에 적용하고 싶었다.

### 문제 1.

프로퍼티 감시자를 이용해서 과일의 변동사항이 생길 때 마다 post를 보내는데 프로퍼티 감시자는 이니셜라이즈에서 값이 들어올 때를 감지하지 못한다. 

따라서, 과일 재고가 이니셜라이즈될때 post를 보내지 않는 것이 문제라고 생각해서 개선해보았다. 

**문제 1을 해결하기 위해 시도했던 방법**

과일 재고가 이니셜라이즈 될때도 post를 보내고, 그 후에 과일 재고가 변경될때도 post를 보내도록 개선했다.

```swift
private var stock: [Fruit: Int] {
    didSet {
        NotificationCenter.default.post(name: didChangeStock, object: nil)
    }
}
    
private init(quantity: Int = FruitStore.initialFruitQuantity) {
    self.stock = FruitStore.initializeStock(quantity: quantity)
		NotificationCenter.default.post(name: didChangeStock, object: nil)
}
```
  
<br/>

### 문제 2.

하지만, ViewController에서 NotificationCenter의 addObserver 매서드가 실행이 끝나기 전에, 과일의 재고를 이니셜라이즈 해주는 부분이 먼저 실행돼서 여전히 post를 받지 못했다. 

```swift
// 문제 해결 시도 전 코드
NotificationCenter.default.addObserver(self, selector: #selector(changeStockLabel), name: FruitStore.shared.didChangeStock, object: nil)
```

**문제 2를 해결하기 위해 시도했던 방법**

시도 1. lazy 키워드 사용 (juiceMaker에 fruitStore의 인스턴스를 넣어놓고 나중에 인스턴스만듦) → 실패

```swift
lazy var juiceMaker = JuiceMaker()
```

시도 2. 노티피케이션을 관리하는 매니저 구조체를 만들어서 과일의 재고를 이니셜라이즈 해주는 부분보다 먼저 addObserver가 실행하도록 시도함. → 실패

```swift
struct NotificationManager { /* ... */

	let didChangeStock = Notification.Name("재고 수정 완료")
}
/* ... */
NotificationCenter.default.addObserver(self, selector: #selector(changeStockLabel), name: NotificationManager.shared.didChangeStock, object: nil)
```
