  

# Step 1

  

## 1. 코드 설명 🖥

### 1) 과일 저장소 타입 (class FruitStore)

#### [타입]
`enum Fruit: CaseIterabl`  
- 초기화 시 Fruit를 배열처럼 다루기 위해 CaseIterable 프로토콜을 사용했습니다.

 `var fruitsInventory: FruitsInventory = [:]` 
- 과일명을 key 값, 과일 재고를 value 값으로 갖는 변수를 사용했습니다.
- 과일 저장소 타입을 딕셔너리로 선언한 이유 : 과일명을 기반으로 과일 재고를 조회하고자 했습니다. 따라서 과일 재고의 변경 및 새로운 과일명 추가 가능성을 생각하여 데이터 수정 및 추가를 자유롭게 할 수 있는 딕셔너리 타입이 적합하다고 생각했습니다.


#### [그 외]

`typealias FruitsInventory = [Fruit: Int]` 

- 과일명과 과일 재고를 딕셔너리로 가져오는 경우가 많아 가독성을 높이기 위해 typealias 를 사용했습니다.

#### [메서드]

`init()`
- 각 과일의 초기 재고를 10개로 초기화하기 위해 init 사용했습니다.
- 매직넘버 사용을 줄이기 위해 초기값은 상수로 선언했습니다.
- 코드 가독성을 높이기 위해 `for-in loop` 대신 `forEach` 사용하여 각 과일에 10개씩 넣어주었습니다.

`reduceInventory(of ingredient: FruitsInventory)`
- 과일 재고를 줄일 때 사용하는 메서드입니다.
- 메서드의 기능을 줄이기 위해 과일 재고를 줄이는 일을 하는 메서드와 채우는 일을 하는 메서드를 따로 선언했습니다.
- 매개변수 *_ingredient_*는 쥬스를 만들 때 필요한 재료들이 모여 있는 *_FruitsInventory_* 타입으로 선언했습니다.

`supplyInventory(of ingredient: FruitsInventory)`
- 과일 재고를 채울 때 사용하는 메서드입니다.
- 매개변수 *_indredient_*는 채우고자 하는 과일들이 모여 있는 *_FruitsInventory_* 타입으로 선언했습니다.

`hasEnoughInventory(of ingredient: FruitsInventory, in inventory: FruitsInventory)`
- 쥬스 만들기가 가능한지 확인하는 메서드입니다.
- 재고가 부족하면 에러메세지가 뜨도록 에러처리했습니다.

  
### 2) 쥬스 메이커 타입 (struct JuiceMaker)

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


# Step 2

### 1. 쥬스 주문 버튼
- 처음에는 쥬스 주문 버튼 7개를 각각의 `@IBAction func`로 가져왔습니다.
- 7개의 버튼은 모두 같은 메서드를 사용하는 같은 역할의 버튼이라고 생각해 하나의 메서드로 묶어보았습니다.
- 개선하고 싶은 점:
    - 현재 코드에서는 스토리보드에서 버튼의 내용을 바꾸면 `juiceOrderButtonTapped` 메서드의 switch 문의 case와 일치하지 않아 분기처리에 문제가 생깁니다.
    - 만약 7개의 버튼 각각에 JuiceMaker.Menu 타입을 담을 수 있다면, `juiceOrderButtonTapped` 메서드의 아규먼트로 메뉴 자체를 전달 받고 싶습니다. 이런 방식의 구현이 가능하다면 switch문 분기를 사용하는 대신, 전달 받은 메뉴를 `order` 메서드에 넣어주기만 하면 코드가 훨씬 간결해지고, 버튼의 타이틀을 수정하면서 발생할 수 있는 문제도 해결될 것 같습니다.
    - `질문👀`: 이런 접근 방법으로 개선해보는 게 가능할까요? 가능하다면, 어떤 키워드를 검색해보면 좋을까요? 

<img width="1596" alt="Pasted image 20220503112639" src="https://user-images.githubusercontent.com/96630194/166413551-ea09892b-b654-457e-8a39-938a61a8e41f.png">


### 2. 재고 변동을 전달 받는 방식
활동학습에서 Notification으로 이벤트를 처리하는 방법을 배웠습니다. 이번 쥬스 프로젝트에도 적용해 볼 수 있을 것 같아 재고가 변화될 때마다 알림을 받아 재고 레이블을 업데이트하는 NotificationCenter를 아래와 같이 작성해보았습니다.

```swift

func notification(name: Notification.Name) {

        NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) 

        { 

            Notification in self.updateInventory()

        }

        NotificationCenter.default.post(name: name, object: nil)

}

  

// order에서 notifiation() 호출

func order(juice: JuiceMaker.Menu) {

        // ... 위에 코드 생략

        notification(name: Notification.Name("재고 변화"))

    }

```

`addObserver`와 `post`를 같은 메서드 안에서 호출한 건 이벤트가 일어나는 곳과 처리하는 곳이 동일하다고 생각했기 때문입니다. 현재 상태에서는 `order 메서드`의 `notification()` 호출 하는 자리에 `updateInventory()` 를 넣어도 동일하게 작동합니다.

활동학습 시간에 다뤘던 내용이기에 활용해보려고 했지만, 현재 프로젝트에서는 노티피케이션 센터의 개념을 활용할 때의 장점이 보이지 않았습니다. 오히려 코드가 더 길어지고 가독성이 떨어진다는 생각이 들어, 작성한 내용을 코드에 반영하지는 않았습니다.

1) 현재 코드에 노티피케이션을 활용할 때의 장점이 있을까요?

2) 만약 사용한다고 가정한다면, 아직 Notification 사용법이 익숙치 않아 위와 같이 구현했는데, 이벤트 발생과 처리를 동일한 함수에서 처리하는게 좋은 방향인지 궁금합니다.


---


# Step 3
  
## 1. 민쏜과 현이가 고민한 점 😲
### 1) 각 과일별 Label, Stepper, Button 등 Outlet의 하드코딩
- Label, Stepper, Button 등이 과일 별로 하나씩 있다보니 불필요한 코드가 반복됩니다.
- 지금까지 콘솔창으로 코딩할 때처럼 혹시 컬렉션 타입으로 다룰 수 있는 방법이 없을지 찾아보았지만 발견하지 못했습니다. Oultet 여러 개를 Array 혹은 Dictionary로 만들어, 값을 넣을 때 반복문을 돌리고 싶다는 마음이 간절했습니다.
- 이와 관련, IBOutlet Collection 이라는 개념을 찾을 수 있었습니다. Outlet 변수 하나에 여러 Label을 Array처럼 묶고, 반복문으로 변수의 아이템을 순회할 수 있었습니다. 하지만 일반적인 어레이의 인덱스와 같이, 각 Outlet을 구분할 수 있는 방법을 찾지 못했습니다. 각 Outlet을 늘 확실하게 구분할 수 있는 방법이 없다면, 모든 버튼에 같은 색상을 입히는 등의 일괄 작업에 더 적합한 개념인 것 같아 저희 코드에서는 활용하지 않았습니다.

### 2) UIStepper의 사용법
- Stepper를 보면 `-`/`+` 으로 나누어져 있는데, 처음에 저희는 이 버튼이 별개의 버튼으로 작동한다고 생각했습니다. 즉, 마이너스 버튼과 플러스 버튼이 따로 나뉘어져 있고, 이를 IBAction을 통해 sender로 받아와, 각 버튼이 눌릴 때의 작업을 나눠주는 것이라고 생각했습니다.
- 아무리 뒤져도 방법을 찾을 수 없었고, 저희가 생각한대로 작동하게 할 방법은 Custom Stepper를 만드는 것밖에 없다는 조언을 들었습니다. 나중에 만들어서 사용해보려고 합니다.
- 결국,  `-`/`+` 를 터치함에 따라 stepper.value가 변한다는 점에 착안, 그 값을 추적하여 재고 표시 Label에 실시간으로 반영해주고, 재고수정화면을 닫을 때는 각 과일별 stepper.value를 `JuiceMaker.shared.store.fruitsInventory`에 저장하는 방식을 선택했습니다.

### 3) 재고수정화면으로의 이동 방식
- 첫화면인 쥬스주문화면에서 재고주문화면으로 이동할 때 Navigation 방식과 Modality 중 후자를 선택했습니다. 이유는 아래와 같습니다.
- 저희가 이해한 바로는 Navigation 이동 방식은 단계에 따른 계층구조 간 화면 전환이었습니다. 만약 Navigation을 선택한다면, 마치 옛날 게임처럼 앱을 켜면 메인 화면이 있고, 그 화면의 선택지로 `1. 쥬스주문`, `2. 재고 수정`과 같은 선택 버튼을 눌러 이동하는 방식이 더 자연스러울 것이라고 생각했습니다.
- Modality는 쥬스주문화면에서 쥬스를 주문하다가, 재고 수정이 필요할 때 임시로 들어가 수정하고 나오는 느낌이었습니다. 이 부분이 Navigation보다 더 자연스럽게 느껴졌습니다.


### 4) Label에 배경을 적용하는 법
![[Pasted image 20220512154952.png]]
 
- 위 이미지와 같이 화면의 타이틀에 회색 바탕을 적용하고 싶었습니다. Label에 '재고 수정'이라고 적어 Title 역할을 하게 만들고, '닫기'는 버튼으로 만든 후, 오브젝트 라이브러리에서 View를 선택해 회색 사각형을 만들어 윗부분에 놓았습니다.
- 하지만 회색 사각형의 View가 재고 수정 레이블과 닫기 버튼을 모두 가려, 빌드했을 때 레이블과 버튼이 보이지 않았습니다. 혹시 파워포인트처럼 '맨 앞으로 보내기', '맨 뒤로 보내기'와 같은 기능이 있을지 찾아보았는데 발견하지 못했습니다.


---


## 2. 코드 설명 🖥

### - JuiceOrderViewController

#### [속성]
 `@IBOutlet private weak var**strawberryInventoryLabel: UILabel!` (외 4개)
 - 레이블에 과일 재고를 넣기 위해, 각각의 과일 레이블을 IBOutlet으로 가져왔습니다.
    
`@IBOutlet private weak var**strawberryBananaJuiceOrderButton: UIButton!` (외 6개)
- 어떤 버튼이 눌렸는지 구분하기 위해, 각각의 쥬스 주문 버튼을 IBOutlet으로 가져왔습니다.
    
#### [UI 관련 메서드]
`private func**updateFruitsInventoryLabels()`
- 과일 재고가 변경될 때마다 과일 레이블을 업데이트 해주는 메서드입니다.
- IBOutlet으로 가져온 과일 레이블 변수마다 FruitStore의 fruitsInventory 재고 값을 넣어 주었습니다.

`private func**showSuccessAlert(message: String)`
- 쥬스 주문 버튼을 눌러 쥬스 제조에 성공할 시 뜨는 얼럿입니다.
    
`private func**showFailureAlert(message: String)`
- 쥬스 주문 버튼을 눌러 쥬스 제조에 실패할 시 뜨는 얼럿입니다.
- 얼럿창의 “예” 를 누를 경우 "InventoryViewController”로 이동하며, 강한 순환 참조를 해결하기 위해 [**weak self**]를 사용했습니다.
 
#### [Action 관련 메서드]
`@IBAction private func**tapJuiceOrderButton(sender: UIButton)`
- 앱 화면에 있는 쥬스 주문 버튼을 누를 때 실행되는 메서드입니다.
- 쥬스 버튼을 key, 버튼에 해당하는 쥬스 메뉴를 value로 갖는 딕셔너리를 생성해 사용자가 쥬스 주문 및 제조를 구현했습니다.    

`private func**order(juice: JuiceMaker.Menu)`
- JuiceMaker의  make 함수를 호출하여 쥬스를 제작 할 수 있으면 showSuccessAlert 메서드를 실행하고, 쥬스를 제작할 수 없으면 showFailureAlert 메서드를 실행합니다.


### - InventoryViewController

#### [속성]
`@IBOutlet private weak var strawberryInventoryLabel: UILabel!`
- 과일 재고를 표시하는 레이블입니다. 
`@IBOutlet private weak var strawberryInventoryStepper: UIStepper!`
- 과일 재고를 수정하기 위해 UIStepper가 사용되었습니다.

#### [액션]
`@IBAction private func updateInventoryLabels(_ sender: UIStepper)`
- 각 과일별 Stepper의 TouchUp을 감지해, 각 과일에 해당하는 Stepper의 값을 재고 표시 레이블에 넣어줍니다. 
`@IBAction private func touchUpDismissButton(_ sender: UIButton)`
- 재고 수정화면에서 `닫기` 버튼을 터치하면 실행됩니다.
- 재고 수정화면에서 과일별 Stepper에 의해 수정된 재고 데이터를 모듈 전체에서 공유하기 위해 `JuiceMaker.shared.store.applyChangesToFruitsInventory(from: saveInventoryModifiedByStepper())`를 실행합니다. 

`private func saveInventoryModifiedByStepper() -> [FruitStore.Fruit: Int]`
- 재고 수정화면에서 과일별 Stepper에 의해 수정된 재고 데이터를 모듈 전체에서 공유하기 위한 데이터를 집계하는 메서드입니다.
- JuiceMaker의 과일 재고는 `fruitsInventory: [FruitStore.Fruit: Int]` 타입으로, 각 과일을 key로, 재고수량을 Int로 관리 중입니다. 값을 넘겨줄 때의 편의성을 위해, 이 메서드 또한 같은 타입으로 값을 반환합니다.
- 재고수정화면 종료시 실행됩니다.

`private func giveStepperFruitsInventory()`
- 재고수정 화면에 진입시 실행됩니다.
- 기존 재고와 재고 수정용 Stepper.value의 값을 동기화 하기 위해 사용합니다.

`private func setInitialInventoryLabels()`
- 재고수정 화면의 재고 표시 레이블에 JuiceMaker의 기존 재고를 표시하기 위해 사용합니다.


### - 과일 재고 타입 (class FruitStore)

#### [속성]
`enum Fruit: CaseIterabl`
- 초기화 시 Fruit를 ****배열처럼 다루기 위해**** CaseIterable 프로토콜을 사용했습니다.

`var fruitsInventory: FruitsInventory = [:]`
- 과일명을 key 값, 과일 재고를 value 값으로 갖는 변수를 사용했습니다.
- ****과일 저장소 타입을 딕셔너리로 선언한 이유**** : 과일명을 기반으로 과일 재고를 조회하고자 했습니다. 따라서 과일 재고의 변경 및 새로운 과일명 추가 가능성을 생각하여 데이터 수정 및 추가를 자유롭게 할 수 있는 딕셔너리 타입이 적합하다고 생각했습니다.

`private(set) var fruitsInventory: FruitsInventory = [:]`
- fruitsInventory의 값을 직접 변경하지 못하는, 읽기 전용으로 만들기 위해 private(set)으로 설정했습니다.

#### [그 외]
`typealias FruitsInventory = [Fruit: Int]`
- 과일명과 과일 재고를 딕셔너리로 가져오는 경우가 많아 ****가독성을 높이기 위해**** typealias 를 사용했습니다.

#### [메서드]
`init(initialInventory: Int = 10)`
- 각 과일의 초기 재고를 10개로 ****초기화하기 위해 init 사용****했습니다.
- 추후 초기 재고가 바뀌는 경우를 고려하여 초기값을 설정할 수 있게 했습니다.
- ****코드 가독성을 높이기 위해**** `for-in loop` 대신 `forEach` 사용하여 각 과일에 10개씩 넣어주었습니다.

`reduceInventory(of ingredient: FruitsInventory) throws`
- 쥬스 주문 시, ****과일 재고를 줄이는 메서드****입니다.
- 매개변수 *_ingredient_*는 쥬스를 만들 때 필요한 재료들이 모여 있는 __FruitsInventory__ 타입으로 선언했습니다.

`func applyChangesToFruitsInventory(from changedInventory: FruitsInventory)`
- 재고 수정 화면에서 ****과일 재고를 수정할 때 사용하는 메서드****입니다.
- 매개변수 *_changedInventory_*는 채우고자 하는 과일들이 모여 있는 __FruitsInventory__ 타입으로 선언했습니다.

`func isInventoryEnough(for ingredient: FruitsInventory) -> Bool`
- ****쥬스 만들기가 가능한지 확인하는 메서드****입니다.
- 재고가 부족하면 false를 반환하고 재고가 충분하면 true를 반환 합니다.

### - 쥬스 메이커 타입 (****struct**** JuiceMaker)
#### [속성]
`private(set) var store = FruitStore()`
- JuiceMaker는 FruitStore를 소유하고 있다는 요구서 조건을 만족하기 위해 선언했습니다.
- store를 읽기 전용으로 만들기 위해 private(set)으로 설정했습니다.

`static let shared = JuiceMaker()`과 `private init() { }`
- FruitStore를 소유하는 JuiceMaker를 싱글톤으로 만들어 앱의 모든 곳에서 store를 공유할 수 있게 했습니다.

#### [메서드]
`func make(juice: Menu) throws`
- 쥬스를 만드는 메서드입니다.


### - 쥬스 메이커 타입 확장 (JuiceMaker+Menu)
#### [속성]
`enum Menu: String`
- 쥬스 주문 성공 시 나오는 쥬스 이름을 표현하기 위해 String 타입으로 선언했습니다.

`var recipe: [FruitStore.Fruit: Int]`
- 각 쥬스마다 제조에 필요한 과일 수량이 담긴 변수입니다.

---

## 3. Timeline ⏰

### 1주차
- 월 Step 0 : 저장소 포크 및 복제, 프로젝트에 필요한 Swift Language Guide 공부
- 화 Step 1 : STEP1 기능 구현(과일타입 정의,초기화,메서드 구현)
- 수 Step 1 : 변수명 수정, README 파일 생성 및 작성
- 목 Step 1 : 피드백 수정 및 객체지향 의논
- 금 Step 2 : STEP2 기능 구현을 위한 APP 공부(화면전환, 버튼 액션등)

### 2주차
- 월 Step 2 : STEP2 기능 구현(재고 화면전환, 얼럿적용)
- 화 Step 2 : 버튼별로 액션을 처리한 걸 하나의 액션으로 합침
- 수 Step 2 : UI Button 익스텐션을 위한 공부
- 목 Step 2 : 강환 순환참조를 해결하기 위한 클로저 공부
- 금 Step 2 : 피드백 수정(싱글톤 적용, 쥬스 오더분기 기준 수정 등)

### 3주차
- 월 Step 3 : STEP3 기능 구현(레이블에 재고 출력 및 UIStepper 값 반영하는 메서드 추가)
- 화 Step 3 : STEP3 기능 구현(타이틀 추가, 수정한 제고 저장하는 메서드 추가)
- 수 Step 3: 피드백 수정 (Mark 주석을 이용해 가독성 높임, 네이밍 및 구조 수정 등)
- 목 Step 3 : STEP3 PR 요청
- 금 Step 3 :

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
-  feat: 기능  추가
-  fix: 버그 수정
-  refactor: 리팩토링 (변수 네이밍 수정 등)
-  style: 스타일 (세미콜론 등, 형식적인 스타일 수정)
-  docs: 문서 변경
-  test: 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
-  chore: 별로 중요하지 않는 것들 (빌드 스크립트 수정 등)
