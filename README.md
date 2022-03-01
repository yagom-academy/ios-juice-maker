# 쥬스 메이커 프로젝트 저장소 
> 프로젝트 기간 2022.02.21 ~ 2022.03.11 </br>
팀원 : [@Tiana](https://github.com/Kim-TaeHyun-A) [@마이노](https://github.com/Mino777) / 리뷰어 : [@린생](https://github.com/jungseungyeo)

## 프로젝트 소개

야곰과 함께 음료수를 만듭시다. 

## 키워드
- Initialization
- Access Control
- Nested Types
- Type Casting
- Error Handling

## [STEP 1]

## UML

<img width="418" alt="스크린샷 2022-02-23 오전 11 26 39" src="https://user-images.githubusercontent.com/54234176/155252212-3f0f5059-5a10-4e4e-b64e-4f15eecd2c33.png">

### 구현 내용
- **enum**  Constant: 상수를 모아둔 타입
- **enum**  JuiceMakerError: Error를 관리하는 타입
- **struct**  JuiceMaker: 주스를 제조하는 역할을 지닌 타입
    - **func**  takeOrder(of juice: JuiceMenu): 주문을 받고, 에러 핸들링을 해주는 메서드
    -  **private**  **func**  produce(juice: JuiceMenu) **throws**: 주스를 제조하는 메서드
    - **private**  **func**  findRecipe(of juice: JuiceMenu) -> Constant.Recipe: 레시피를 찾아 반환해주는 메서드
- **enum**  JuiceMenu: 주스메뉴를 관리하는 타입
- **final**  **class**  FruitStore: 재고를 관리하는 타입
    - **func**  consume(fruit: Fruit, amount: Int) **throws**: 재고를 사용하는 메서드
    - **private**  **func**  hasEnoughStock(of fruit: Fruit, amount: Int) **throws**: 재고의 양을 체크해주는 메서드
    - **private**  **func**  hasStock(of fruit: Fruit) **throws** -> Int: 재고의 유무를 체크해주는 메서드
    - **enum**  Fruit: String, CaseIterable: 과일을 관리하는 타입

### 고민한 점
- Naming
- Error 관리
    - do - catch 문에서 catch를 간결하게 작성하기 위해 타입캐스팅을 이용해보았습니다.
- Struct, Class를 선택하는 것
    - FruitStore의 경우 원본값을 직접 참조해서 수정이 되어야 한다고 생각해서 Class로 진행했습니다.
    - JuiceMaker의 경우 Struct 자체만으로 사용하고, 참조값의 개수가 두개 미만이고, 큰 제약사항이 없기 때문에 성능적으로 이점을 가진 Value Type의 Struct를 사용하는것이 좋다고 생각해서 진행했습니다.
- Enum들의 위치
    - 각각 저희만의 이유를 정하고 위치를 지정해주었습니다.
- 자료구조를 선택하는 기준
    - 재고 관리를 할때, key, value 형식의 자료구조가 적절하다고 생각했습니다.
- Enum타입이 가져야 할 역할에 대한 고민
    - Enum 타입안에서 열거형만 가지고 있을지, 메서드까지 구현해서 역할을 좀 더 줄지 고민했습니다.
    - 메서드의 경우 해당 Enum타입을 사용하는 타입에서 진행을 할지에 대해 고민했습니다.
    - 해당 부분은 뭔가 상황에 따라 다른 느낌이어서 이번에는 두 경우 모두 사용해보았습니다.
- 하드코딩과 전역변수를 지양하기 위해 해당 부분을 Enum으로 관리를 했는데 이 부분이 적절한 방법인지에 대해 고민했습니다.

## [STEP 2]

### 구현 내용
- **final** **class** JuiceMakerViewController: UIViewController: JuiceMaker 스토리보드에 연동된 viewController
    - **@IBAction** **func** touchUpJuiceOrderButton(_ sender: UIButton): 쥬스 주문 버튼을 눌렀을 경우 실행되는 메서드
    - **static** **func** instance(juiceMaker: JuiceMaker) -> JuiceMakerViewController: 의존성 주입 및 viewController 생성을 위한 타입 메서드
    - **override** **func** viewDidLoad(): NotificationCenter Observer 세팅 진행
    - **@objc** **private** **func** updateStockLabels(): StockLabels Update를 처리해주는 메서드
    - **private** **func** configureStockLabels(): StockLabels를 Fruit에 매칭시켜 현재 해당 과일에 대한 재고를 Labels에 할당해주는 메서드
    - **private** **func** findStockLabel(of fruit: Fruit) -> UILabel: StockLabel에 Fruit을 매칭시키고, 매칭된 Label을 리턴해주는 메서드
    - **private** **func** takeOrder(sender: UIButton) **throws** -> JuiceMaker.Menu: UIButton을 Menu에 매칭시키고 Menu를 리턴해주는 메서드
    - **private** **func** showSuccessOrder(of menu: JuiceMaker.Menu): 주문이 성공했을 경우 성공 알럿을 띄워주는 메서드
    - **private** **func** showFailedOrder(with error: Error): 주문이 실패했을 경우 실패 알럿을 띄워주는 메서드
    - **private** **func** presentModifyingStockViewController(): ModifyingStockViewController를 모달리티로 띄워주는 메서드
    - **extension** [Notification.Name](http://notification.name/)
    - **extension** UIViewController
        - **func** showAlert(title: String?,
        confirmTitle: String?,
        message: String? = nil,
        cancelTitle: String? = nil,
        confirmHandler: (() -> Void)? = nil,
        cancelHandler: (() -> Void)? = nil): alert을 편리하게 관리하기 위한 메서드
### 고민한 점
- Naming
- 하드 코딩 지양
    - switch문으로 레이블과 Fruit 대응시키고 레이블 배열을 만들 수 있습니다.
- alert 함수화
    - 매개변수를 통해 다양한 alert 생성 가능합니다.
    - UiViewController 에서 extension을 해서 다른 viewcontroller에서도 사용 가능합니다.
- label 갱신
    - notification에서 이벤트 발생 시 레이블을 수정합니다.
- IBAction에 여러 버튼 연결
    - IBAction 하나에 여러 개의 버튼을 연결해서 코드 중복을 막았습니다.
    - switch 문을 통해 sender를 구분합니다.
- 의존성 주입
    - JuiceMakerViewController의 타입 매서드로 뷰 컨트롤러를 만들었습니다.
    - SceneDelegate에서 위 타입 메서드 호출로 초기화하고 루트 뷰 컨트롤러로 연결했습니다.
- Constant 확장
    - Fruit 타입에서만 사용되는 상수를 extention으로 Fruit 파일 내부에 만들었습니다.
    - fileprivte으로 해당 파일 내부에서만 사용 가능하도록 했습니다.
## 그라운드 룰 
## 시간 
-   프로젝트에 집중하는 시간: 10:00 ~ 23:00
-   밥먹는 시간: 12 ~ 14 / 18 ~ 19:30
-   공식적인 휴일: 주말

### 연락이 어려운 시간

-   티아나: 수요일 오전 10시 이후 가능, 나머지는 가능
-   마이노: 연락 24시간 받을 수 있음.

> 유동적!

### 규칙

-   늦지 말자.
-   일이 생기면 미리 이야기하기
-   눈치보지 않고 편하게 서로 질문하기
-   공동 노션 사용하기
-   문서 읽고 프로젝트 시작하기
    -   사전에 시간을 두고 읽고 프로젝트 진행하기
-   요구사항 읽고 로드맵 작성한 후 코드 짜기
-   모르는 개념 나오면 그때 그때 정리하기
    -   트러블슈팅 기록하기
-   코딩 컨벤션
    -   카르마 스타일
    -   커밋 단위: 기능 단위 최대한 잘 지키기, 기능 잘 쪼개기
-   리드미 작성하기

## Commit 규칙

커밋 제목은 최대 50자 입력
본문은 한 줄 최대 72자 입력
함수 단위로 돌아가면서 짝 코딩 
드라이버가 코드 작성 후 푸시

## Commit 제목 규칙

-   기능(feat): 새로운 기능을 추가
-   버그(fix): 버그 수정
-   리팩토링(refactor): 코드 리팩토링
-   형식(style): 코드 형식, 정렬, 주석 등의 변경(동작에 영향을 주는 코드 변경 없음)
-   테스트(test): 테스트 추가, 테스트 리팩토링(제품 코드 수정 없음, 테스트 코드에 관련된 모든 변경에 해당)
-   문서(docs): 문서 수정(제품 코드 수정 없음)
-   기타(chore): 빌드 업무 수정, 패키지 매니저 설정 등 위에 해당되지 않는 모든 변경(제품 코드 수정 없음)
