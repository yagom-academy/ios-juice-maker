# ios-juice-maker
iOS 쥬스 메이커 재고관리 

### 프로젝트 만든 사람들

신나 @smart8612 & 제리 @llghdud921

---

### 프로젝트 개요

[Step 1]

`FruitStore` type 은 과일 을 추가 및 제거해주고 과일 별 보관 양을 관리해주는 역할이다.

`JuiceMaker` 는 사용자에게 주스 주문을 받으면 FruitStore를 통해 받은 과일로 주스를 만들어서 사용자에게 전달하는 역할이다.

---

### 설계도

<img src="https://user-images.githubusercontent.com/25794814/138388654-d7f61a90-3be3-494c-b61f-d2e7b1bd4071.png" width="700">

---

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
