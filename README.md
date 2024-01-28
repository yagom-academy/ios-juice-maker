## 쥬스메이커 프로젝트 🍹

### 0. 목차
[1. 소개](#1-소개)  
[2. 팀원](#2-팀원)  
[3. 타임라인](#3-타임라인)  
[4. 실행 화면](#4-실행-화면)    
[5. 트러블 슈팅](#5-트러블-슈팅)    
[6. 팀 회고](#6-팀-회고)    
[7. 참고 자료](#7-참고-자료)

### 1. 소개
맛있는 과일 쥬스(딸기쥬스, 바나나쥬스, 파인애플쥬스, 키위쥬스, 망고쥬스, 딸기바나나쥬스, 망고키위쥬스)를 주문하면, 해당 과일 쥬스를 만드는 데에 필요한 과일의 재고를 파악한 후에 재고가 있다면 맛있는 쥬스를 만들어줍니다. 
과일의 재고가 없다면, 재고가 부족하다는 것을 알려주고 과일 재고를 수정할 수 있는 기능을 제공합니다.

### 2. 팀원
| [HAMZZI](https://github.com/kkomgi) | [Danny](https://github.com/dannykim1215) |
| --- | --- |
| <img src="https://avatars.githubusercontent.com/u/65929788?v=4" width="200"> | <img src="https://avatars.githubusercontent.com/u/154333967?v=4" width="200"> |

### 3. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.01.15(월) | 팀 그라운드 룰즈 및 프로젝트 요구사항 파악, FruitStore, JuiceMaker 타입 정의 및 은닉화 |
| 24.01.16(화) | updateValue를 사용한 과일 개수 변경 함수 생성, JuiceMaker init() 메소드를 추가, 쥬스메이커 함수 생성 - 딸기쥬스 생성 시, 카운트 |
| 24.01.17(수) | FruitStore, JuiceMaker 타입 재정의, 쥬스 생성하기 전 재고 체크 기능 추가, 필요없는 주석 제거 및 코드 정리  |
| 24.01.22(월) | 리뷰어 "Serena"의 1차 PR 답변 수신, 필요없는 주석 삭제, 약어 -> 풀네임으로 수정, if 조건 컨벤션 통일, viewController 이릅 변경, 함수명 기능 분리, JuiceMenu 객체로 분리(Enum 형태), Enum으로 에러 핸들링으로 변경 |
| 24.01.24(수) | Error Handdling 수정 진행 중, 함수 명칭 변경, JuiceMenu의 ingredients 속성 수정, JuiceMaker 구조체 내부에서 fruitStore 인스턴스 초기화(초기 과일 재고 수량 10), do, try-catch문 추가|
| 24.01.25(목) | Fruit Enum 객체 분리 차 파일 생성, Assets, AppDelegate, SceneDelegate 폴더 생성 및 해당 파일 분리, 쥬스메이커 프로젝트 폴더 정리 |
| 24.01.26(금) | 쥬스메이커 프로젝트 1차 ReadMe 작성 | 


### 4. 실행 화면
| <img src="./Screenshots/Screenshot1.png"> |
| :--- |
| **EOF 처리** |

### 5. 트러블 슈팅

## **JuiceMaker - JuiceMaker.swift**

### 1: FruitStore 초기화 변경

#### 이전 코드:

```swift
private var fruitStore: FruitStore = FruitStore()
```

#### 변경된 코드:

```swift
private var fruitStore: FruitStore = FruitStore(initialStock: [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10])
```

**문제상황:** 이전 코드에서는 `fruitStore`를 기본 생성자로 초기화했지만, 변경된 코드에서는 초기 재고를 포함한 생성자를 사용하고 있습니다.

**해결방안:** 변경된 코드에 따라 `fruitStore`를 초기화할 때 초기 재고를 설정하도록 수정했습니다.

```swift
private var fruitStore: FruitStore = FruitStore(initialStock: [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10])
```
<br>

### 2: makeJuice 메서드 변경

#### 이전 코드:

```swift
func makeJuice(juiceName: String, amount: Int) -> String
```

#### 변경된 코드:

```swift
func makeJuice(juiceMenu: JuiceMenu, amount: Int) -> Result<String, FruitResultError>
```

**문제상황:** `makeJuice` 메서드의 시그니처가 변경되었습니다. 이전 코드에서는 문자열을 받아 문자열을 반환했지만, 변경된 코드에서는 `juiceMenu` 열거형을 사용하고 `Result`를 반환합니다.

**해결방안:** 변경된 코드에 따라 메서드 호출 시 `juiceMenu` 열거형 값을 사용하고, `Result` 타입을 처리했습니다.

```swift
let result = makeJuice(juiceMenu: .딸기쥬스, amount: 2)
switch result {
case .success(let message):
    print(message) // 성공한 경우 메시지 출력
case .failure(let error):
    print(error) // 실패한 경우 에러 처리
}
```

<br>

### 3: deductFruit 메서드 변경

#### 이전 코드:

```swift
func deductFruit(reqJuiceName: String, reqFruits: [String: Int], reqJuiceAmount: Int) -> [String: Any]
```

#### 변경된 코드:

```swift
func deductFruit(requestJuiceName: String, requestFruits: [Fruit: Int], requestJuiceAmount: Int) -> String
```

**문제상황:** `deductFruit` 메서드의 시그니처가 변경되었습니다. 이전 코드에서는 `[String: Int]` 딕셔너리를 받아 `[String: Any]` 딕셔너리를 반환했지만, 변경된 코드에서는 `[Fruit: Int]` 딕셔너리를 받아 문자열을 반환합니다.

**해결방안:** 변경된 코드에 따라 메서드 호출 시 인자를 전달하고, 반환된 문자열을 처리했습니다.

```swift
let message = deductFruit(requestJuiceName: "딸기쥬스", requestFruits: [.strawberry: 2], requestJuiceAmount: 1)
print(message) // "딸기쥬스를 1잔 만들었습니다."
```

<br>

### 4: 그 외
#### FruitStore 초기화 방식 변경, changeFruitQuantity 메서드 수정, showFruitQuantity 메서드 변경

#### 이전 코드:

```swift
class FruitStore {
    var fruitStorage = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func changeFruitQuantity(changeFruit: String, changeQuantity: Int) {
        fruitStorage.updateValue(changeQuantity, forKey: changeFruit)
    }

    func showFruitQuantity(showFruits: [String: Int], showAmount: Int) -> Int {
        // 코드 내용 생략
    }
}
```

#### 변경된 코드:

```swift
class FruitStore {
    var fruitStorage: [Fruit: Int]

    init(initialStock: [Fruit: Int]) {
        fruitStorage = initialStock
    }
    
    func changeFruitQuantity(fruitName: Fruit, quantity: Int) {
        fruitStorage[fruitName] = quantity
    }

    func showFruitQuantity(fruitsStock: [Fruit: Int], amount: Int) -> Bool {
        // 코드 내용 생략
    }
}
```

<br>

## **JuiceMaker - FruitStore.swift**

### 1: FruitStore 초기화 변경

**문제상황:** 이전 코드에서는 `fruitStorage`를 문자열을 키로 하는 딕셔너리로 초기화했지만, 변경된 코드에서는 `fruitStorage`를 `[Fruit: Int]` 타입으로 초기화합니다.

**해결방안:** 변경된 코드에 따라 `fruitStorage`를 초기화하는 방식을 `[Fruit: Int]` 타입의 딕셔너리로 수정하였습니다.

```swift
var fruitStorage: [Fruit: Int]

init(initialStock: [Fruit: Int]) {
    fruitStorage = initialStock
}
```

### 2: changeFruitQuantity 메서드 변경

**문제상황:** 이전 코드에서는 `changeFruitQuantity` 메서드가 문자열과 정수를 받아 업데이트했지만, 변경된 코드에서는 `Fruit` 열거형과 정수를 받아 업데이트합니다.

**해결방안:** 변경된 코드에 따라 메서드 호출 시 `Fruit` 열거형을 사용하고, 해당 과일의 재고를 업데이트하도록 수정하였습니다.

```swift
func changeFruitQuantity(fruitName: Fruit, quantity: Int) {
    fruitStorage[fruitName] = quantity
}
```

### 3: showFruitQuantity 메서드 변경

**문제상황:** 이전 코드에서는 `showFruitQuantity` 메서드가 문자열을 키로 하는 딕셔너리와 정수를 받아 재고 확인했지만, 변경된 코드에서는 `[Fruit: Int]` 타입의 딕셔너리와 정수를 받아 재고를 확인합니다.

**해결방안:** 변경된 코드에 따라 메서드 호출 시 `[Fruit: Int]` 타입의 딕셔너리를 사용하고, 모든 과일의 재고를 확인하여 충분한 재고가 있는지를 반환하도록 수정하였습니다.

```swift
func showFruitQuantity(fruitsStock: [Fruit: Int], amount: Int) -> Bool {
    // 코드 내용 생략
}
```

<br>

### 6. 팀 회고
#### 우리팀이 잘한 점 😍
- 

#### 우리팀 개선할 점
- 

#### 서로에게 좋았던 점 피드백 😊
- HAMZZI: 
- Danny:
   
#### 서로에게 아쉬웠던 점 피드백
- 

### 7. 참고 자료

e5af0327ba48970ca6d4a16debc052aa8b8d4f69
