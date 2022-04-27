### ⏰ Timeline

#### 1주차
- 월 Step0 : 저장소 포크 및 복제, 프로젝트에 필요한 Swift Language Guide 공부 
- 화 Step1 : STEP1 기능 구현(과일타입 정의,초기화,메서드 구현)
- 수 Step1 : 변수명 수정, README 파일 생성 및 작성
- 목 Step : 
- 금 Step :

<br>

---

<br>

## 🖥 코드리뷰

### 과일 저장소 타입 (class FruitStore)

#### [타입]

`enum Fruit: CaseIterabl`  
- 초기화 시 Fruit를 **배열처럼 다루기 위해** CaseIterable 프로토콜을 사용함

 `var fruitsInventory: FruitsInventory = [:]` 
- 과일명을 key 값, 과일 갯수를 value 값으로 갖는 변수를 사용함
- **과일 저장소 타입을 사전으로 선언한 이유** : 과일명을 기반으로 과일 갯수를 조회 하려고, 과일 갯수의 변경과 새로운 과일명 추가 가능성을 생각하여 데이터 수정 및 추가를 자유롭게 하려고 사전으로 선언함

#### [그 외]

`typealias FruitsInventory = [Fruit: Int]` 
- 과일명과 과일 갯수를 딕셔너리로 가져오는 경우가 많아 **가독성을 높이기 위해** typealias 를 사용함

#### [메서드]

`init()`
- 각 과일의 초기 재고를 10개로 **초기화하기 위해 init 사용**
- **매직넘버 사용을 줄이기 위해** 초기값은 상수로 선언 함
- **코드 가독성을 높이기 위해** for-in 대신 foreach 사용하여 각 과일에 10개씩 넣어줌

`reduceInventory(of ingredient: FruitsInventory)`
- **과일 갯수를 줄일 때 사용하는 메서드**
- 메서드의 기능을 줄이기 위해 과일 갯수를 줄이는 일을 하는 메서드랑, 채우는 일을 하는 메서드랑 따로 선언함
- 매개변수 *indredient*는 쥬스를 만들 때 필요한 재료들이 모여 있는 *FruitsStock* 타입으로 선언함

`supplyInventory(of ingredient: FruitsInventory)`
- **과일 갯수를 채울 때 사용하는 메서드**
- 매개변수 *indredient*는 채우고자 하는 과일들이 모여 있는 *FruitsStock* 타입으로 선언함

`hasEnoughInventory(of ingredient: FruitsInventory, in inventory: FruitsInventory)`
- **쥬스 만들기가 가능한지 확인하는 메서드**
- 재고가 부족하면 에러메세지가 뜨도록 에러처리함

<br>

### 쥬스 메이커 타입 (**struct** JuiceMaker)

#### [타입]

`var store = FruitInventory()`  
- JuiceMaker는 FruitStore를 소유하고 있다는 요구서 조건을 만족하기 위해 선언함

`enum Menu`
- 주문할 수 있는 쥬스 메뉴들이 담김

#### [메서드]

`checkRecipe(of juice: Menu) -> [FruitStore.Fruit: Int]`
- 쥬스를 만드는데 필요한 레시피를 확인하는 메서드

`make(juice: Menu, at store: FruitStore)`
- 쥬스를 만드는 메서드

---

### 📐 GroundRule

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
