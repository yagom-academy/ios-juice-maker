# 쥬스 메이커

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [참고 링크](#-참고-링크)

## 🌱 소개

`Gundy`와 `준호`의 iOS 쥬스 메이커 프로젝트입니다.

## 📆 타임라인

- 220830
    - STEP 1
        - 열거형 `Fruit`
            - 과일을 나타내는 열거형 `Fruit` 추가
        - 클래스 `FruitStore`
            - 과일을 저장하는 `inventory` 프로퍼티 추가
            - 수량을 받아 모든 과일을 동일한 수량으로 초기화하는 이니셜라이저 추가
            - `inventory` 프로퍼티에 과일 수량을 추가하는 `add` 메서드 추가
            - `inventory` 프로퍼티에 과일 수량을 감소시키는 `subtract` 메서드 추가
            - 쥬스를 만들 과일 수량이 충분한지 확인하는 `canSubtract` 메서드 추가
            - `Dictionary<Fruit, Int>`를 받아 원하는 과일만 선택적으로 초기화하는 이니셜라이저 추가
            - `add`, `subtract` 메서드에 오류 처리 구문 추가
            - `canSubtract` 메서드 삭제
            - `[Juice.Material]` 배열을 받아 각 과일별 재고가 충분한지 확인하는 `checkStockOfFruits` 메서드 추가
            - `inventory` 프로퍼티의 값을 변경하는 `changeStock` 메서드 추가
            - `add`, `subtract` 메서드에서 `changeStock` 호출해 값을 변경하는 것으로 수정
        - 열거형 `Juice`
            - 쥬스를 나타내는 열거형 `Juice` 추가
            - 쥬스의 재료가 될 과일과 수량을 담을 중첩 구조체 `Material` 추가
            - 쥬스 case별로 `Material` 값으로 반환하는 `recipe` 연산 프로퍼티 추가
        - 구조체 `JuiceMaker`
            - 과일을 받을 `fruitStore` 프로퍼티 추가
            - `fruitStore` 프로퍼티의 `canSubtract` 메서드와 `subtract` 메서드를 호출해 쥬스를 만드는 `makeJuice` 메서드 추가
            - `FruitStore`의 인스턴스를 받아 `fruitStore` 프로퍼티를 초기화하는 이니셜라이저 생성
            - `makeJuice` 메서드에 오류처리 구문 추가
            - `makeJuice` 메서드에서 호출할 재고 확인 메서드를 `checkStockOfFruits` 메서드로 변경
            - `makeJuice` 메서드에서 호출할 과일 수량 변경 메서드를 `changeStock` 메서드로 변경
        - 에러타입 `FruitStoreError`
            - 에러 프로토콜을 준수하는 열거형 `FruitStoreError` 추가
            - 에러가 던져진 이유를 설명하는 `failureReason` 연산 프로퍼티 추가
            - 재고가 부족한 경우인 `outOfStock` 케이스 추가
    - STEP 1 1차 Feedback 반영
        - 네이밍
            - `add` 메서드 `increaseStock`으로 네이밍 변경
            - `subtract` 메서드 `decreaseStock`으로 네이밍 변경
            - `changeStock(of fruit: Fruit, amount: Int)` 메서드 `changeStock(of fruit: Fruit, by amount: Int)`로 아규먼트 레이블 변경
            - `checkStockOfFruits` 메서드 `checkStockOfIngredients`로 네이밍 변경
            - `makeJuice` 메서드 `make(_ juice: Juice)`로 네이밍 변경
            - 에러타입 `FruitStoreError`의 `wrongAmount` 케이스 `invalidAmount`로 네이밍 변경
            - 열거형 `Juice`의 모든 케이스 뒤에 Juice 붙이는 것으로 네이밍 변경
            - 열거형 `Juice` 내부의 중첩타입 `Material` 구조체 `Ingredient`로 네이밍 변경
        - 메서드
            - 현재 재고를 가져오는 `getCurrentStock` 메서드 추가
            - 재고가 충분한 지 확인하는 `checkInventoryHasStock` 메서드 추가
            - `checkStockOfIngredients` 메서드 내부의 재고 확인 기능을 `checkInventoryHasStock` 메서드 호출로 변경
        - 은닉화
            - `inventory` 프로퍼티를 `private(set)` 에서 `private`로 변경
    - STEP 1 2차 Feedback 반영
        - 창고 내부 과일 목록에 있는지 확인해 Bool값을 반환하는 `isInventoryFruitsListHas` 메서드 추가
        - `increase` 메서드 내부 재고 확인 기능 `isInventoryFruitsListHas` 메서드 호출로 변경
        - 에러타입 `FruitStoreError`의 `notInFruitList` 케이스 `notInInventoryFruitList`로 네이밍 변경
        - 에러타입 `FruitStoreError`의 `failureReason` 프로퍼티의 switch 구문 내부 `notInInventoryFruitList` 케이스 반환 문자열 변경
        - `checkInventoryHasStock` 메서드 은닉화
        - `isInventoryFruitsListHas` 메서드 은닉화

## 👀 시각화된 프로젝트 구조

> 최종 구조 이미지 들어갈 것으로 예상

## 💻 실행 화면

> 최종 화면 들어갈 것으로 예상

## ❓ 트러블 슈팅

- 딕셔너리의 값
    클래스 FruitStore 내부의 프로퍼티 inventory를 딕셔너리로 결정하였기 때문에, 과일의 현재 수량에 접근하려고 하면 항상 옵셔널인 것이 문제였습니다. increasStock, decreaseStock 등의 메서드에서 이 값에 접근할 때 닐 병합 연산자를 사용할지 고민을 하였는데, 닐 병합연산자를 사용한다면 nil일 때 해당 과일의 잔여 수량을 0으로 설정해야해서 이 부분이 자연스럽지 않았습니다. 옵셔널 바인딩을 통해 인벤토리에 해당 과일 키가 있는지 구분하여 추가하는 방식으로 고민해본 결과 0 등의 매직 넘버를 사용하지 않고 해결할 수 있었습니다.

- 조건 확인
    두 과일을 사용하는 딸기바나나, 망고키위 주스의 경우 한 과일이 재고가 충분하더라도 다른 과일이 불충분하면 만들 수 없어야 했습니다. 한 과일의 재료가 충분한지 확인하고 수량을 변경시켰었는데, 이 때 다른 과일이 부족한 경우가 발생했습니다. 이 문제를 해결하기 위해 클래스 FruitStore 내부에 checkStockOfIngredients 메서드를 생성해 실행한 결과 재료가 되는 과일 배열이 모두 충분할 때 쥬스를 만들게 했습니다.

- 이니셜라이저
    클래스 FruitStore는 각 과일의 초기 재고가 10개로 요구되어 있어 모든 과일을 같은 수량으로 초기화하는 이니셜라이저를 만들었습니다. 하지만 꼭 모든 과일을 원하지 않을 수도 있고, 과일 별로 수량을 맞추지 않을 수도 있다고 생각했습니다. 과일 종류와 수량을 원하는 값으로도 초기화 할 수 있도록 이니셜라이저를 하나 더 추가하였습니다.

- 오류 처리
    쥬스메이커 인스턴스가 쥬스를 만들 때 canSubtract 메서드로 확인해서 오류를 미연에 방지하기 때문에 보통의 경우 오류가 없을 것이라고 생각했지만, 쥬스메이커를 거치지않고 인스턴스 fruitStore의 add, subtract 메서드에 직접 접근하는 경우가 있을 수 있다고 생각해 add, subtract 메서드에만 오류 처리를 하였습니다. 하지만 쥬스를 만드는 make 메서드도 오류를 캐치해야한다고 생각했습니다. 지금의 checkStockOfIngredients 메서드를 만들고, make 메서드 내부에서 try 키워드가 두번 사용되지 않도록 과일 재고 수량을 변경하는 기능을 changStock 메서드로 분리해 increasStock(기존 add), decreaseStock(기존 subtract), make 메서드에서 호출하게 했습니다.
    
- 기능 분리
    getCurrentStock 메서드는 과일 재고량을 가져오면서 창고 과일 목록에 해당 과일이 없으면 오류를 던집니다. increaseStock 메서드에서는 목록에 과일이 있는지 확인하는 기능만 필요해서 getCurrentStock 메서드를 사용하는 건 적절하지 않았습니다. 목록에 과일이 있는지 판단해서 Bool 타입으로 반환해주는 isInventoryFruitsListHas 메서드를 추가 한 뒤, increaseStock 메서드에서 호출하도록 수정했습니다.
        
## 🔗 참고 링크

- Swift API Design Guidelines
    - [naming](https://www.swift.org/documentation/api-design-guidelines/#naming)
- Swift Language Guide
    - [Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
    - [Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
    - [Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
    - [Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
    - [Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)

---

[🔝 맨 위로 이동하기](#쥬스-메이커)
