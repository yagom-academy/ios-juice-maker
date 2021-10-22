# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

## STEP1

### 고려사항
1. 코드의 의도
    - 추후 Controller에서 과일의 재고를 알기 위해  `JuiceMaker` 인스턴스 내부의 `FruitStore` 인스턴스 프로퍼티인 `inventory`에 직접 접근하도록 하는 것 보다, 해당 재고정보를 Controller에게 전달할 수 있는 메서드를 구현하는 것이 캡슐화/은닉화에 더 적합한 것 같아서 `FruitStore` 인스턴스는 `private`로 설정함.
    - 추후 과일 종류가 추가될 때 `Fruit` 열거형에 `case`로만 추가하면 자동으로 `FruitStore`에 초기화될 수 있도록 열거형에 `CaseIterable` 프로토콜을 채택하고 `FruitStore`의 이니셜라이저에서 `allCases`를 통해 모든 케이스를 딕셔너리 내부에 초기화할 수 있도록 구현함.
    - 에러 상황들은 View에 `Alert`을 표시하는 방식이 될 것 같아서, 현재 모델에서는 `throw`만 해줬으며 `catch`하여 처리하는 기능은 구현하지 않음. 추후 Controller 구현 시 에러처리를 하게 될 것 같다.
2. 고민한 것
    - 딕셔너리로 과일을 관리하는 방법과 `Int`타입 프로퍼티로 관리하는 방법 중 어떤 것이 효율적일까
    당장은 `Int`타입 프로퍼티로 `var strawberry = 10` 과 같이 쓰는 것이 편리할 것 같기는 하지만, 추후 과일의 종류가 추가되는 상황 등의 유지보수를 위하여 `Dictionary<Fruit, Int>` 타입으로 관리하도록 함.
    - 과일의 재고를 `UInt`로 저장할지 `Int`로 저장할지 고민했는데, 
    `UInt`를 쓰면 연산 시 매번 형변환 해야하는 어려움도 있고, 굳이 `UInt`를 쓰지 않아도 음수가 되지 않도록 조건을 걸어주면 되기에 `Int`를 사용하기로 함.

### 구현내용
#### 주요 타입
1. FruitStore (class 타입)

	1. 주요 프로퍼티
		- inventory(Dictionary<Fruit, Int>): (key: 과일의 종류)-(value: 해당 과일의 재고)쌍을 원소로 갖는 딕셔너리.

	1. 주요 메서드
		- increaseFruitStock: inventory의 과일 재고를 추가하는 함수. 변경할 과일의 종류, 추가할 수량(기본값 = 1)을 매개변수로 전달받는다.
		- decreaseFruitStock: inventory의 과일 재고를 감소하는 함수. 변경할 과일의 종류, 감소할 수량(기본값 = 1)을 매개변수로 전달받는다.

	1. 중첩 타입
		- Fruit (enum 타입, CaseIterable 채택): FruitStore에서 관리할 과일의 종류를 정의함. CaseIterable 프로토콜을 채택하여, case가 추가되더라도 inventory에 allCases를 통해 초기화되도록 구현. 

1. JuiceMaker (struct 타입)

	1. 주요 프로퍼티
		- recipe(Dictionary<Fruit: Int>): 판매하는 주스들의 레시피를 switch 문을 통해 사용되는 과일과 개수를 리턴

	1. 주요 메서드
		- makeJuice: 주스를 만드는 함수. 만들어야 하는 메뉴를 전달 받아 사용되는 과일의 재고를 감소시킨다.

	1. 중첩 타입
		- JuiceMenu (enum타입): 주스 메뉴들을 case에 정의하고, 주스의 레시피를 recipe에 정의

1. FruitStoreError (enum 타입, Error 채택) : FruitStore에서 발생할 수 있는 에러를 정의
