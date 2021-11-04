# ios-juice-maker
iOS 쥬스 메이커 재고관리 

### 프로젝트 만든 사람들

신나 @smart8612 & 제리 @llghdud921

---

### 프로젝트 개요

**[Step 1]**

`FruitStore` type 은 과일 을 추가 및 제거해주고 과일 별 보관 양을 관리해주는 역할이다.

`JuiceMaker` 는 사용자에게 주스 주문을 받으면 FruitStore를 통해 받은 과일로 주스를 만들어서 사용자에게 전달하는 역할이다.


**[Step 2]**

초기화면에서 주스주문 버튼을 클릭하면 해당 주스를 만듭니다. 만약 재고가 부족하다면 재고 수정화면으로 이동하여 재고 관리를 진행합니다.

---

### 설계도

<img src="https://user-images.githubusercontent.com/25794814/138388654-d7f61a90-3be3-494c-b61f-d2e7b1bd4071.png" width="700">

---
## [Step1] JuiceMaker Type 정의
### keyword

- MVC Design Pattern
- struct and class
- error handling
- Dictionary

---

### 고민했던 부분

- **`FruitStore`가 class인 이유와 `JuiceMaker`가 struct인 이유**
    
    
    type 을 설계함에 있어서 struct 와 class 를 선택할 때 사용한 기준은 다음과 같습니다.
    
    > Use classes when you need to control the identity of the data you're modeling.
    모델링한 데이터의 identity를 제어하는 경우에는 클래스를 사용해야한다
    - Apple Article ([Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes))
    > 
    
    FruitStore 는 과일들을 저장하는 역할로 모델링 한 데이터를 조작하는 책임을 가진 타입 입니다.
    
    쥬스메이커 앱에서 FruitStore 는 변수나 함수의 인자로 할당될 때 주소값으로 저장되어서 해당 인스턴스를 참조하는 다른 인스턴스가 동일한 데이터를 보고 있다는 것을 보장할 수 있어야 합니다.
    따라서 해당 데이터를 식별할 필요성이 있는 경우로 판단되어 `class` 로 정의하였습니다.
    
    반대로, 구조체는 데이터의 아이덴티티를 제어하지 않기 때문에 local 인스턴스에 대한 변경 사항이 값을 변경할 위험이 없습니다. JuiceMaker는 주스를 만드는 역할로서 데이터의 아이덴티티를 통제하지 않아도 되기 때문에 `struct`로 정의하였습니다.
    
- **에러 처리를 사용해야 되는 상황에 관한 고민**
    
    
    어느 작업을 처리하는 함수가 문제 상황 대응하지 못해서 상대방(메서드를 호출한 코드)에게 문제 상황을 알려야 하는 경우에 에러 처리가 필요하다고 생각했습니다.
    
    ```swift
    func subtract(fruit: Fruits, of count: Int) {
        ...
        guard let fruitInventory[fruit] >= count else {
            throw Error.outOfStock
            // 과일 개수를 빼주는 해당 함수의 기능을 처리하지 못하고 문제 상황을 알림
        }
    
        fruitInventory[fruit] = numberOfFruit - count
    }
    ```
    
    위와 같은 경우가 아니라면 메서드가 결과값을 반환하도록 해서 좀 더 능동적으로 처리할 수 있도록 에러를 사용하지 않는 방향으로 코드를 구현했습니다.
    
- **객체지향설계를 Flowchart로 구현했을 때의 문제점**
  
  인스턴스 간에 메서드를 사용하여 메시지를 주고 받는 관계를 표현할 수 없습니다.
  
FruitStore             |  JuiceMaker
:-------------------------:|:-------------------------:
<img src="https://user-images.githubusercontent.com/40068674/138082027-66fdd3d9-1b85-4cbf-ad6f-83fb9ba5bcac.png" width="800" height="700">  |  <img src="https://user-images.githubusercontent.com/40068674/138082093-2030f79d-be82-4864-b9d3-4581d5794667.png" width="800" height="700">

## [Step2] **초기화면 , 재고관리 기능구현**

### keyword

- ViewController & NavigationController
- Singleton
- NotificationCenter
- RestorationID
- 데이터 중심의 Programming (데이터 무결성을 위한)

---

### 코드를 작성하며 고민했던 점

과일 재고관리 화면에서 label, stepper 와 같은 view 에 데이터를 불러오고 데이터가 변동되었을 때 View에 반영하는 방법을 고민했습니다.

1. 스토리보드에 있는 UIComponent(예: label, button)를 식별하기위해 `Restoration ID` 값을 부여해주었습니다.
    - 식별자 네이밍 규약을 통해 접두사로 `Fruit`, `Juice` 이름을 붙여주기로 정했습니다.
    - String 의 `hasPrefix` 메서드를 사용하여 UIComponent에 대응하는 Fruit, Juice 를 찾을 수 있었습니다.
2. FruitStore 의 `fruitInventory` 에 있는 모든 재고 현황을 순회하며 View 에 반영해줬습니다.
    - 재고 관리 창인 `ModifyInventoryViewController` 코드는 데이터를 중심으로 구현하는 것을 목표했습니다.
    - FruitStore 싱글턴 인스턴스 를 통해 FruitInventory 를 접근하면서 모든 과일에 대한 재고 현황을 불러왔습니다.
    - 이벤트가 발생한 View 의 ID 를 통해 식별된 과일의 종류가 모든 재고 현황 내부에 존재하는 과일이라면 재고 개수를 해당 View 에 반영했습니다.
3. Stepper 를 사용하거나 주스를 주문해서 과일의 재고 현황이 변동되는 경우 NotificationCenter 를 통해 데이터가 변동될 때 마다 이벤트를 발생시켜서 View 에 데이터가 반영되도록 구현했습니다.

데이터를 기준으로 view 를 찾아서 데이터를 갱신하는 작업을 하면 동기화도 쉬워지고 발생할 수 있는 예외 사항이 많이 줄어드는 장점이 있었습니다.

### 데이터 중심의 Programming

이번 프로젝트에서 Stepper 는 자신도 값을 가지면서 모델의 값도 변경시키기 때문에 다루기 까다로운 친구였다. Stepper 의 값이 바뀔때마다 모델의 데이터가 바뀌고 바뀐 결과가 항상 Stepper와 일치함을 보장하려면 어떻게 해야할까? View 와 Model 간의 **데이터 동기화 문제**가 발생한 것이다.

오늘의 나는 데이터를 감시하다가 데이터가 변경되는 것을 기준으로 View 에 데이터의 변동사항을 반영하는 것이 매우 효율적인 방법이라고 생각했다.

Stepper 에 위 개념을 적용해본다면 사용자가 Stepper 를 터치하여 값을 변경하면 Model의 재고 현황을 갱신하고 Model이 변경되면 Notification Center 를 통해 이벤트가 발생하게 되며 다시 레이블과 stepper의 값을 갱신하기 때문에 언제나 모델과 Stepper의 값은 일치하게 된다. 동기화 문제에서 벗어날 수 있다.
