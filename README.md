## 📝 프로젝트 정보

- Project: 쥬스메이커

- Date: [3주] 2021-10-18 ~ (진행 중)

- Contributors: 요한(@YohanBlessYou, 예거(@Jager-yoo)

- Reviewer: 엘림 (@lina0322)

<br>

---

<br>



## 🔑 키워드

- API Design Guidelines - Naming

- Initialization
- Access Control
- Nested Types
- Error Handling
- Optional Binding
- Control Flow
- Protocol (CaseIterable)

<br>

---

<br>

## 🤔 고민한 부분
<br>

### 타입 설계
<br>

**1. 과일 재고를 관리하는 변수 타입을 `Dictionary` 와 `Array with tuples` 중에 고민했습니다.**
- 각 과일의 이름과 재고를 pair 로 관리하고 싶었습니다.

- 튜플을 배열 안에 담아 쓰는 방법을 고민했으나, 과일 이름 중복도 피하고 순서(index) 또한 고려할 필요가 없으니, 딕셔너리가 적합할 것이라 생각했습니다.

```swift
private var inventory: [Fruit: Int] = [:]
```
    


**2. 초기화할 때 `CaseIterable` 프로토콜을 채택했습니다.****

- `FruitStore` 인스턴스를 생성할 때 5가지 과일 모두 10개씩 채워주는 과정이 필요했습니다.

- `Fruit` 열거형에 `CaseIterable`프로토콜을 채택하여 `for문`으로 초기화했습니다.

```swift
enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

// FruitStore 클래스 내의 init() 구문 안에서 for문 사용
for fruit in Fruit.allCases {
    self.inventory[fruit] = FruitStore.defaultFruitAmount
}
```
  


**3. 메서드 네이밍은 파라미터와 함께 자연스럽게 읽히도록 설계**

```swift
// 과일의 재고가 충분한지 확인하는 인스턴스 메서드
fruitStore.has(.strawberry, amount: 10)

// 과일의 개수를 증가시키는 인스턴스 메서드
fruitStore.increase(.kiwi, amount: 10)

// 쥬스를 만드는 인스턴스 메서드
juiceMaker.make(.bananaJuice)
```

<br>

### 파일 분리 vs Nested Type

<br>

- 열거형을 외부 파일로 분리할 것인가, 또는 타입 안에 Nested Type 으로 넣을 것인가를 고민했습니다.

- `Fruit` 열거형과 `Error` 열거형은 외부 파일로 분리했습니다. STEP이 진행되면서 프로젝트 내의 다른 파일에서도 사용될 가능성이 있다고 판단했습니다.

- `Juice` 열거형은 `JuiceMaker` 타입의 Nested Type 으로 넣었습니다.

- `Juice` 열거형 안에 있는 `recipe` 프로퍼티는 `fileprivate` 접근제어자를 적용했습니다.

- 외부 파일에서도 쥬스의 종류(cases)를 볼 수는 있지만, `recipe` 는 볼 수 없도록 만들었습니다.

```swift
// JuiceMaker.swift
struct JuiceMaker {
    enum Juice {
        case ...
        
        fileprivate var recipe: [(Fruit, Int)] {
            switch self {
                ...
            }
        }
    }
}
```