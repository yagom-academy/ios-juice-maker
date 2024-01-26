## 🧃 쥬스메이커

### 목차
[1. 소개](#1.-소개)  
[2. 팀원](#2-팀원)  
[3. 타임라인](#3-타임라인)  
[4. 트러블슈팅](#4-트러블슈팅)  
[5. 참고 자료](#5-참고-자료)

---
### 1. 소개
앱 실행 시 기본적으로 과일을 소지하고있고, 화면 우상단의 ```재고수정``` 버튼을 눌러 과일 소지 수량을 수정하러 갈 수 있습니다. 쥬스 주문버튼을 눌렀을 때 재료가 충분하다면 정해진 과일 소모량만큼 소지 수량에서 차감하고 주문에 성공합니다. 재료가 충분하지 않다면 주문에 실패하고 재고를 수정하러 갈지 선택할 수 있습니다.

### 2. 팀원
|구성원|[Prism](https://github.com/PrismSpirit/)|[Gray](https://github.com/yawoong2)|
|:---:|:---:|:---:|
|사진| <img src="https://avatars.githubusercontent.com/u/27756800?s=48&v=4" width="200"> | <img src="https://avatars.githubusercontent.com/u/139211436?v=4" width="200">|

### 3. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.01.15(월) | 과일의 재고를 저장하는 FruitStore 구현 |
| 24.01.16(화) | 과일의 재고를 소모하고 채울 수 있는 기능 구현 |
| 24.01.17(수) | 예외 처리 추가 및 리팩토링 |
| 24.01.18(목) | 과일 초기 재고 저장 기능 수정 및 리팩토링 |
| 24.01.19(금) | ReadMe 작성 |
| 24.01.22(월) | 프로젝트 Delegation 패턴 적용 |
| 24.01.23(화) | 재고추가를 원할 때 Modal 화면을 띄우도록 구현 |
| 24.01.24(수) | 각 과일 쥬스 주문 버튼 구현, 과일 수량을 나타내는 Label 구현 |
| 24.01.25(목) | 리팩토링 |
| 24.01.26(금) | Alert button 화면 이동 기능 연결, ReadMe 작성 |

### 4. 트러블슈팅
#### 📌 문제 상황 1
```swift
func checkStock(fruit: Fruit, amount: Int) -> Bool {
    do {
        let stockOfFruit = try takeStock(fruit: fruit)

        return stockOfFruit >= amount ? true : false
    } catch FruitStoreError.fruitNotFound {
        print("해당 과일이 존재하지 않습니다.")
    } catch {
        print("알 수 없는 오류입니다.")
        
    return false
}
```
`checkStock()`은 `try takeStock()`으로 throw되는 error를 catch해 예외 처리를 하고 충분한 과일이 있으면 true, false를 반환하도록 구현했습니다. 최종적으로 `juiceMaker()`에서 `checkStock()`을 호출하고 error handling을 하게 되는데, 현재 구현으로는 과일이 부족하거나 다른 error가 발생해 false를 반환 받을 경우 정확히 어떤 원인으로 실패했는지 알기가 어렵고 중간에 error handling을 할 이유가 없다고 판단했습니다.

#### 🛠️ 해결 방법 1
```swift
func checkStock(fruit: Fruit, amount: Int) throws {
    if try takeStock(fruit: fruit) < amount {
        throw FruitStoreError.outOfStock
}
```
Error propagation을 통해 `takeStock()`이 유효하지 않은 과일을 받을 경우 `FruitStoreErorr.fruitNotFound`, 과일의 수량이 부족할 때 `FruitStoreError.outOfStock`을 throw해 `juiceMaker()`에서 error handling을 할 수 있도록 코드를 수정했습니다.

### 5. 참고 자료
📍[Swift documentation: Error Handling](<https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/>)  
📍[Swift documentation: Protocol(Delegation)](<https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/#Delegation>)