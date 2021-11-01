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




## STEP2

### 고려사항

1. 코드의 의도
-  화면 이동 방식을 `Modal`로 채택한 이유
재고 수정은 정보의 흐름이 이어지는 것이 아닌, 잠시  다른 맥락의 내용을 다루는 부분이라 생각하여 `Push`가 아닌 `Present`가 더 적합하다고 생각했습니다.

-  화면 이동 구현 방식  
a. storyboard에서 버튼→뷰컨트롤러로 segue를 연결하는 방식  
b. storyboard에서 뷰컨트롤러→뷰컨트롤러로 segue를 연결하는 방식  
c. 코드로 구현하는 방식    `storyboard?.instantiateViewController(withIdentifier: )` , `present`  
세 가지 방법 중 고민했는데, 앱의 뷰컨트롤러가 아주 많아지지 않는 이상 스토리보드에서 가시적으로 연결상황을 확인할 수 있기에 `segue`를 쓰는 a, b 방법으로 좁혔습니다.    
**버튼을 누르는 경로와 얼럿을 통해 이동하는 경로에 재사용**될 로직이기에   
b. 방법으로 `segue`를 `뷰컨 → 다음 뷰컨을 담은 네비게이션 컨트롤러` 로 연결시킨 후 `performSegue(withIdentifier:)` 메서드를 사용해 화면 전환을 구현했습니다.
`prepare(for segue:)` 메서드를 오버라이드하여 위 `segue`가 작동될 때 다음 뷰 컨트롤러에 juiceMaker객체를 주입할 수 있도록 구현했습니다.

-  Alert의 버튼에 대하여
재고가 모자란 경우 표시되는 얼럿에서, 요구사항에는 `예` / `아니오`로 표시하도록 했지만, 이것이 H.I.G.에서는 권장되지 않는다는 이의제기가 받아들여져 다른 내용으로 구현하게 되었습니다. 
저희는 왼쪽에 `취소`, 오른쪽에 `재고수정` 버튼을 배치했습니다. HIG에 따르면 사용자가 가장 누를법한 버튼은 오른쪽에 배치하도록 권장하며, 취소 버튼은 항상 왼쪽에 배치하라고 합니다.

-  라벨 업데이트 방식
모델에서 과일 재고가 수정되면 컨트롤러로 이를 알리게 되는데, 그 때 
a. 변경된 각각의 과일만 라벨 업데이트를 할지
b. 변경이 일어나면 모든 라벨을 다 업데이트할지
에 대해 고민했는데, 현재 5종류의 라벨 업데이트에는 하드웨어적으로 큰 부담이 없을 것이라 판단하여 전체 업데이트 방식을 선택했습니다. 이러면 의도치 않게 다른 과일의 재고가 변경되는지도 확인이 가능한 점도 부가적인 장점이 될 것 같습니다. 

-  모델의 변경에 대한 `notification post` 를 어디에서 할지
`JuiceMaker`에서 과일 재고를 변경하는 메서드인 `changeFruitStock`에서 post를 해 줄까 생각했지만, 이 메서드 말고도 예상치 못한 어떠한 경로로든 과일 재고가 바뀌면 항상 알림을 주는 것을 보장하도록 `FruitStore`의 `inventory` **프로퍼티 옵저버** `didSet`에 구현했습니다.

-  extension
타입이 프로토콜을 따른다면 프로토콜 채택과 그에 따른 구현 내용을 별도의 `extension`에서 정의했습니다. 가독성과 유지보수 측면에서 이점이 있다고 생각했습니다.
또한, `NotificationCenter`의 `Notification.Name`을 추가하는 `extension`도 별도의 파일에서 정의했습니다.

-  파일 / 폴더 분리 기준
현재 몇몇 열거형과 `extension`에 대해 별도의 파일 및 폴더로 분리하여 관리합니다. 해당 내용이 MVC 패턴의 특정 역할 내에서만 사용되는 경우, 해당 폴더에서 새로운 파일을 만들어 정의했고, 직접 정의한 타입의 `extension`인 경우에는 해당 타입이 정의된 파일 하단에 정의했습니다. 해당 내용이 MVC 중 어딘가에 속하지 않으며, 범용적으로 사용된 경우(`NotificationCenter`) 새 폴더를 만들어 extension을 정의해 두었습니다.
 
2. 고민한 것
- Notification  
모델에서 프로퍼티가 변경될 때마다 UILabel을 업데이트를 해주기 위해서 notificationCenter, KVO, Delegation 등  방법을 생각해 보았습니다.   
KVO는 열거형을 지원하지 않아서 열거형을 많이 쓴 현재 로직에 적합하지 않다고 생각했습니다. 
Delegation은 1대1로 매핑이 되기 때문에 프로퍼티가 바뀔 때마다 두개의 뷰에서 업데이트가 되어야 하는 현재 상황에서는 Delegation은 적합하지 않다고 생각했습니다.
그래서 M:N이 되고 현재 로직에서 사용할 수 있는 NotificationCenter를 사용하여 구현하게 되었습니다. 

- UI의 요소들을 네이밍할 때 어떤 컨벤션을 따라야 할지  
프로퍼티의 이름을 정할 때, 그 타입은 생략하는 것이 일반적이라고 알고 있는데, (ex - var memberArray: [Member] (X) -> var members: [Member] (O)),
UI요소들에 대해서는 strawberryLabel: UILabel와 같이 마지막에 타입 이름을 써 주는것이 일반적인 것 같아서 컨벤션의 일관성이 맞는 것인지 고민했습니다. 우선은 널리 쓰는 대로 타입까지 이름에 포함시켜줬고, 이 방법이 가독성은 좋다고 생각합니다.

- 뷰컨트롤러와 모델 간의 의존성 문제  
모델 설계 시 JuiceMaker가 FruitStore를 의존하지 않도록 FruitStockManaging 프로토콜을 통해 의존성을 역전시켰듯이, 뷰컨트롤러와 JuiceMaker 타입 간에도 의존 관계를 해소하고자 했습니다. 하지만, FruitStore때와는 달리 ViewController에서는 문제가 있었습니다. 뷰컨트롤러에서 이니셜라이저 구현 시 NSCoder와 관련된 부모 클래스의 이니셜라이저가 요구되고, 스토리보드를 사용하는 현재 상황에서는 생성자에서 객체를 주입할 수 없는 것 같다는 결론을 내렸습니다. 그래서 첫 번째 뷰컨트롤러는 FruitStore의 인스턴스를 직접 소유하되, JuiceMaking 프로토콜 타입으로 저장했으며 재고수정 뷰컨트롤러로 prepare()를 통해 객체를 주입하는 방식으로 구현했습니다. 재고수정 뷰컨트롤러에서는 JuiceMaking프로토콜만 의존하도록 했기에 JuiceMaker와의 의존관계를 해소한 것 같습니다. 하지만 아직 첫 번째 뷰컨트롤러와 JuiceMaker 의 소유 관계가 해소된게 아니라서 고민이 됩니다.

- 버튼 액션을 정의 하는 방식   
7개의 버튼의 액션에 대해서 정의할 때 1)버튼 하나 하나에 @IBAction 함수로 정의 하는 것이 좋을 지 2)하나의 함수로 switch문을 통해서 입력을 받아 그에 따른  액션을 하는 것이 좋을지 궁금합니다. 현재는 switch문을 통해서 하나의 함수(matchJuiceMenu())로 입력을 받아 해당 버튼에 맞는 쥬스를 리턴하여 처리하도록 하였습니다. 쓰지 않아도 음수가 되지 않도록 조건을 걸어주면 되기에 `Int`를 사용하기로 함.

### 구현내용
#### JuiceOrderViewController
주스 주문 화면에 대한 ViewController

1. 주요 프로퍼티
- UILabel: 각 과일의 재고사항을 출력
- UIButton: 주스를 주문할 때 터치하도록 함
- juiceMaker: juiceMaking 프로토콜을 따르도록 하는 Model의 JuiceMaker의 인스턴스

1. 주요 메서드
- juiceOrderButtonDidTap: 어떤 주문 버튼을 터치하는지 식별하여 과일 재고를 감소시키고 Alert을 띄우는 @IBAction 함수
- modifyStockButtonDidTap: “재고수정”버튼 터치 시 재고수정화면 버튼으로 넘어가도록 하는 @IBAction 함수
- updateAllLabels: 재고 현황을 출력하는 UILabel을 현재의 재고로 업데이트 해주는 함수. notification을 통해 이벤트가 발생할 때마다 호출된다.
- showSuccessAlert, showFailureAlert, showErrorAlert: 쥬스 제조에 성공 했을 때, 재고가 부족하여 쥬스 제조에 실패 했을 때, 옵셔널 바인딩에서 오류가 났을 때 에러를 Alert해주는 함수들
