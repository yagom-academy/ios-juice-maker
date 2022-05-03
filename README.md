# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

# [Step 1]
---
# 공부한 내용
> Initialization, [struct & class], enum.allcases, naming 



# 기능구현 
> Step01에 필요한 기능구현에 대한 부연설명 


### FruitStore 
- 재고를 확인하는 함수
```swift 
func count(of fruit: Fruit) -> Int?
```

- 과일 수량 소진하는 함수 

```swift 
func consume(fruits: Fruits)
```

- 쥬스의 요구 과일의 수량 체크하는 함수 -> 없을시 Throws 

```swift 
func figure(out fruits: Fruits) throws 
```

- 과일 수량 추가하는 함수
```swift 
func add(fruit: Fruit, as amount: Int)
```

### JuiceMaker

- 쥬스 제조 함수
```swift 
func make(of juice: Juice)
```


# 고민한 점
- FruitStore 타입의 과일들의 초기 재고를 10으로 지정해 주기 위한 고민 
    - 이니셜라이저에 초기값을 넣어주어 각 과일의 갯수를 10으로 `updateValue()` 해 주었다. 
- 각 과일의 수량 n개를 변경하는 함수들을 FruitStore에 넣을지, JuiceMaker에 넣을지 고민 
    - `consume()` , `add()` 
    - Solid원칙 안에 단일 책임원칙을 적용하여 과일 재고의 전반적인 관리는 FruitStore에서 해준다고 판단
- 반복해서 사용되는 값을 줄여주기 위해 `enum`으로 선언 
- 은닉화와 캡슐화를 위해 `protocol`을 사용하여 구분감을 주었다.
- 인스턴스화 됐을 때 함수 이름이 문장으로 이어질 수 있도록 naming을 고민했다. 
- `JuiceMaker()`
    - enum으로 쥬스의 case를 만들어주고, case별 재료 요구량을 딕셔너리[Fruit:Int]로 반환하여 해당 값들을 FruitStore에서 재료마다 소진 할 수 있도록 구현 하였습니다. 
- <span style="background-color: #fff5b1"> **consume()**</span>
    - 들어가는 재료가 2개인 경우, `재고부족에러`를 확인해줄 때 두 경우 따로 확인해주는 과정을 거쳤다.   
    
    ex) 딸기바나나를 만들기 위한 재료들의 재고수량을 파악 해줄 때, 딸기의 수량은 부족해서 `재고부족오류`를 던져주지만, 바나나의 재료는 사용 가능하여 consume()이 실행이 되었다. 두 재료중 하나라도 수량이 부족하면 묶어서 `재고부족오류` 로 던저주기 위해 `figure()` 함수에서 딕셔너리 (key,value) 페어를 for문에 적용하여 두 경우 중에 한 경우라도 재고가 부족하면 if 문으로 빠져 `재고부족오류`를 throw를 해주도록 했다. 


### FruitStore(class) 
> 참조 타입
> 값타입
> class -> RC 관리 필요 >> ? 

- juice Maker 안에서 FruitStore가 인스턴스화 되어 사용될 때 juiceMaker.make() 를 실행하면 재료로 쓰이는 과일이 특정 갯수만큼 소비가 되어야 한다. 즉, FruitStore 안에있는 원본 과일의 갯수가 바뀌어야 한다. intialValue = 10 <- 참조 되어서 계속 변경 되어야하는데 struct 로 선언이 되면, FruitStore가 인스턴스화 된 곳에서만 값이 변경되고, 원본값은 변경되지 않는다. 

- Final class를 사용한 이유는 FruitStore는 상속이 필요하지 않기 때문입니다. 


# [Step 2]
---
# 공부한 내용
> `Initialization`, `Access Control`, `Nested Types`, `Type Casting`, `Result Type`, `HIG :: Alert, Modality, Navigation`, `Identifier`

### Initialization
> 이전 Step01에서는 생각해보지 않고 사용한 지정 프로퍼티의 개념에 대해서 생각 해볼수 있게 되었고 FruitStore class에서 init(initialValue: Int = 10) 으로 초기값을 기본 값으로 설정해준 부분에 대해서 다시 돌아 볼 수 있었다. 

### Access Control
> 접근제어의 개념을 보다 명확하게 이해 할 수 있게 되어 은닉화를 위해 보여지지 않을 부분들을 명시적/암시적 private으로 처리 해줘야 한다는 것을 알게 되었다. 

### Nested Types
> struct, class 내에서 값 타입 혹은 또 다른 참조 타입에 대해서 중첩되게 정의 하는것이다. 하지만 이번 프로젝트에서의 필요성을 느끼지 못해 사용하지 않았습니다. 

> 중첩된 타입들은 뚱뚱해지면 불필요한 처리일 것으로 생각된다.

### Type Casting
> make() 함수에서 Error 타입을 상속하는 StockError 타입에 접근하기 위해 as? 를 이용하여 다운캐스팅 하였다. Optional 처리 & 다운 캐스팅을 함으로써 들어오는 프로퍼티의 타입을 보다 명확하게 정할 수 있게 되었다.

### Result Type
> 경우에 따른 연관값을 포함하여, 성공과 실패를 나타내는 값 Result<연관값타입, 에러타입> 
> .success(연관값) , .failure(에러타입의 case) 를 반환해 준다. 
> 반환 값을 case **.success(let juice)**: 로 받아서 연관값 처리를 해주었다.
> 반환 값을 case **.failure(let error)**: 로 받아서 에러 처리를 해주었다.
```swift=
// ------ JuiceMaker    
func make(_ beverage: Drink) -> Result<JuiceType, StockError> {
    do{
        try fruitStore.consume(beverage.juice.requireIngredients())
        return .success(beverage.juice)
    } catch let stockError {
        return .failure(stockError as? StockError ?? .notEnoughIngredient("재료가 모자라요. 재고를 수정할까요?"))
    }
}
```

```swift=
// ------ OrderViewController
// Return Result 값 
    switch result {
    case .success(let juice):
        showConfirmAlert(message: "\(juice.localeKorean) 쥬스 나왔습니다! 맛있게 드세요!")
    case .failure(let error):
        check(error: error)
    }
```

### HIG
> Alert, Modality, Navigation

`Alert` : 기기 또는 앱의 상태와 관련된 중요한 정보를 전달한다(최대한 작게, 스크롤이 될 정도로 긴 알림은 피해라)
`Modality` : 현재 작업 페이지 내에서 사용자들에게 주의를 집중 시키기 위해 혹은 현재 페이지 내에서 보조적인 역할을 위해 필요한 부분.
`Navigation` : 사용자의 화면 흐름을 통해 현재 페이지에서 필요한 부분인지 다음 페이지로 넘어가야 할 부분인지를 파악하기 위해 필요한 부분. 

### Identifier
> 해당 화면의 id 값을 설정 해줌으로써 화면 전환이 이루어 질수 있는 곳을 명확히 구분 하였습니다. 


# 기능구현 
> Step02에 필요한 기능구현에 대한 부연설명 


### OrderViewController 
- Return 에러 종류 체크 
```swift 
func check(error: StockError)
```

#### Alert

- 쥬스 생성 후 확인 알림 함수
```swift 
func showConfirmAlert(message: String) 
```

- 재고 부족시 알림 함수
```swift 
func showWarningAlert(message: String)
```

### JuiceMaker 
- make 함수 Result 타입 사용하여 반환 타입 추가 
```swift 
    func make(_ beverage: Drink) -> Result<JuiceType, StockError>
```

### JuiceType
- 쥬스 이름 반환 Computed Property
```swift 
    var localeKorean: String {
        switch self {
        case .strawberryJuice:
            return "딸기"
        case .bananaJuice:
            return "바나나"
        case .kiwiJuice:
            return "키위"
        case .mangoJuice:
            return "망고"
        case .pineappleJuice:
            return "파인애플"
        case .strawberryBananaJuice:
            return "딸바"
        case .mangoKiwiJuice:
            return "망키"
        }
    }
```
