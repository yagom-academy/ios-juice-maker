# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

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
