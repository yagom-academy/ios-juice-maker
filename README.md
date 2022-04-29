
# Step 1

## 1. 코드 설명 🖥

### 과일 저장소 타입 (class FruitStore)

#### [타입]
`enum Fruit: CaseIterabl`  
- 초기화 시 Fruit를 **배열처럼 다루기 위해** CaseIterable 프로토콜을 사용했습니다.

 `var fruitsInventory: FruitsInventory = [:]` 
- 과일명을 key 값, 과일 재고를 value 값으로 갖는 변수를 사용했습니다.
- **과일 저장소 타입을 딕셔너리로 선언한 이유** : 과일명을 기반으로 과일 재고를 조회하고자 했습니다. 따라서 과일 재고의 변경 및 새로운 과일명 추가 가능성을 생각하여 데이터 수정 및 추가를 자유롭게 할 수 있는 딕셔너리 타입이 적합하다고 생각했습니다.


#### [그 외]
`typealias FruitsInventory = [Fruit: Int]` 
- 과일명과 과일 재고를 딕셔너리로 가져오는 경우가 많아 **가독성을 높이기 위해** typealias 를 사용했습니다.

#### [메서드]
`init()`
- 각 과일의 초기 재고를 10개로 **초기화하기 위해 init 사용**했습니다.
- **매직넘버 사용을 줄이기 위해** 초기값은 상수로 선언했습니다.
- **코드 가독성을 높이기 위해** `for-in loop` 대신 `forEach` 사용하여 각 과일에 10개씩 넣어주었습니다.

`reduceInventory(of ingredient: FruitsInventory)`
- **과일 재고를 줄일 때 사용하는 메서드**입니다.
- 메서드의 기능을 줄이기 위해 과일 재고를 줄이는 일을 하는 메서드와 채우는 일을 하는 메서드를 따로 선언했습니다.
- 매개변수 *ingredient*는 쥬스를 만들 때 필요한 재료들이 모여 있는 *FruitsInventory* 타입으로 선언했습니다.

`supplyInventory(of ingredient: FruitsInventory)`
- **과일 재고를 채울 때 사용하는 메서드**입니다.
- 매개변수 *indredient*는 채우고자 하는 과일들이 모여 있는 *FruitsInventory* 타입으로 선언했습니다.

`hasEnoughInventory(of ingredient: FruitsInventory, in inventory: FruitsInventory)`
- **쥬스 만들기가 가능한지 확인하는 메서드**입니다.
- 재고가 부족하면 에러메세지가 뜨도록 에러처리했습니다.


#### 쥬스 메이커 타입 (**struct** JuiceMaker)

#### [타입]

`var store = FruitStore()`  
- JuiceMaker는 FruitStore를 소유하고 있다는 요구서 조건을 만족하기 위해 선언했습니다.

`enum Menu`
- 주문할 수 있는 쥬스 메뉴들을 담았습니다.

#### [메서드]

`checkRecipe(of juice: Menu) -> [FruitStore.Fruit: Int]`
- 쥬스를 만드는데 필요한 레시피(재료)를 확인하는 메서드입니다.

`make(juice: Menu, at store: FruitStore)`
- 쥬스를 만드는 메서드입니다.

---

## 2. 민쏜과 현이가 고민한 점 😲

#### 객체의 권한과 책임
쥬스를 만들 때 과일 재고를 소모하는 것과 관련, 현재 코드에서는 JuiceMaker 객체의 `make` 메서드를 통해 FruitStore의 `reduceInventory` 메서드를 호출하고 있습니다. 객체지향 프로그래밍의 관점에서 이러한 구조를 어떻게 볼 수 있을지 궁금합니다.
1) 현재 코드처럼 JuiceMaker의 메서드 안에서 FruitStore의 재고를 감소시키는 메서드를 호출하는 게 FruitStore 객체의 역할을 침범하는 걸까요?
2) 아니면 JuiceMaker 안에서 직접 FruitStore의 저장 프로퍼티를 다른 값으로 초기화하지 않으니 역할을 침범하는 건 아닌 걸까요?
3) 만약 침범하고 있다면, 어떤 방식으로 구조를 가져가는 게 조금 더 객체지향 프로그래밍에 가까운 걸까요?

### 에러 처리
`FruitStore`의 `hasEnoughInventory` 메서드를 보면 필요한 재료에 비해 재고가 부족한 경우 `AppError.lackOfInventory`를 throw 하고 있습니다. 코드를 다시 정리하면서, 이 지점에서 에러를 던지는 게 맞는지에 대한 의문이 들었습니다. 재고가 있는 것과 없는 것 모두 일어날 수 있는 자연스러운 일로, 없다고 해서 `Error`가 될 이유는 없다는 생각이 들었습니다. 이런 경우 Error 처리를 할지, 아니면 자연스러운 경우이므로 false 등을 리턴하여 재고가 없음을 알릴지 고민입니다. (혹은 error라는 단어를 너무 단어의 의미로만 접근하여 프로그래밍 내에서의 의미와 혼동하고 있을 수 있다는 우려가 들기도 합니다.)


---

## 3. Timeline ⏰

#### 1주차
- 월 Step 0 : 저장소 포크 및 복제, 프로젝트에 필요한 Swift Language Guide 공부 
- 화 Step 1 : STEP1 기능 구현(과일타입 정의,초기화,메서드 구현)
- 수 Step 1 : 변수명 수정, README 파일 생성 및 작성
- 목 Step : 
- 금 Step :

---

## 4. GroundRule 📐

#### 짝프로그래밍
- 50분 역할 정해서 하고 10분 쉬고 50분 의견나누기

#### 안되는 시간
- 점심시간 : 활동시간 끝나고 1시간 뒤 or 12시 ~ 1시 
- 저녁시간 : 8시 ~ 9시 
- 단! 특정상황 발생시, 합의하에 유동적으로 변경 가능. (안되는 거든, 되는 거든)

#### 쉬는 날 
- 주차별로 서로 합의하여 평일 중 1일

#### 커밋 방식
- 최소 기능으로, 커밋 메세지 규칙 지켜서 커밋하기

#### 규칙
-  feat: 기능  추가
-  fix: 버그 수정
-  refactor: 리팩토링 (변수 네이밍 수정 등)
-  style: 스타일 (세미콜론 등, 형식적인 스타일 수정)
-  docs: 문서 변경
-  test: 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
-  chore: 별로 중요하지 않는 것들 (빌드 스크립트 수정 등)
