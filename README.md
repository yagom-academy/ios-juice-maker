# ios-juice-maker

# STEP 1

## 고민되었던 점 및 해결 방법

### Nested Type

주스나 과일 종류 같은 타입들을 어떻게 관리해야하나 고민을 했었습니다. 외부에서는 사용될 필요가 없는 종류들이기 때문에 연관된 타입에서만 사용할 수 있도록 만들어주고 싶었습니다. 

> 해결 방법 : Nested Type으로 구현
>
> Fruit 타입은 FruitStore 타입 내에 선언하고, Juice 타입은 JuiceMaker 타입 내에 선언하여 각 상위 타입 내부에서만 사용되도록 구성하였습니다.

### 접근 제어자(은닉화)

해당 타입 외부에서 접근할 필요가 없는 메서드와 프로퍼티들의 접근 제어자를 `fileprivate`와 `private`로 설정해주었습니다. 예시로, 주스를 만들 수 있는지 확인하는 메서드는 직접적으로 주스를 만드는 `makeJuice` 함수에서만 사용되므로 외부에서 독립적인 사용을 방지하고자 은닉화 처리하였습니다.

### 에러 핸들링

어떤 상황, 어떤 메서드에서 에러를 던져야할지 고민이 되었습니다. 우선 에러의 종류를 먼저 정리하여 `JuiceMakeError` 타입에 선언해주었습니다. 선언한 에러 케이스에 따라 에러를 반환해야하는 메서드에서 try, throws를 활용하여 처리를 해주었습니다. 

가장 고민이 되었던 부분은 Bool 타입도 반환 가능하고 에러도 던질 수 있는 메서드였습니다. 

```swift
func checkEnoughStock(of fruit: Fruit, requiredAmount: Int) throws -> Bool {
    guard let fruitCounts = stock[fruit] else {
        throw JuiceMakeError.invaildKey
    }

    guard fruitCounts >= requiredAmount else {
        return false
    }

    return true
}
```
기존에 guard 문의 else에는 모두 에러를 던지도록 하였으나, false를 반환하여 해당 메서드를 사용하는 곳에서 true/false를 판단하여 자율적으로 결과를 처리해줄 수 있도록 만들어주었습니다. 

```swift
guard fruitCounts >= requiredAmount else {
    return false
}
```


### guard vs if 

guard와 if문 사이에서 고민이 되었을 때는 현재 빠른 종료가 필요한 상황인지를 기준으로 판단하였습니다. 또한 가독성을 고려했을 때 guard를 사용하는 방법이 더 직관적으로 보여 guard를 우선적으로 사용했습니다.



### Initializer

기존에는 `FruitStore`의 재고를 일일이 하드코딩 방식으로 각 케이스에 대해 개수를 선언해주었으나, 추후 케이스가 많아질 경우 문제가 발생할 것 같다는 생각을 했습니다. 이를 해결하기 위해서 enum에 `CaseIterable` 프로토콜을 채택하여 모든 case를 반환하였고, 이에 대하여 일괄적으로 재고 상태를 초기화해주는 이니셜라이저를 구현하였습니다. 


# Step 2 

## 고민되었던 점 및 해결 방법

### `stock`의 접근 제어자 

`stock`의 값을 조회(get)하는 행위는 허용해줘도 괜찮을 것이라고 생각했고, 값은 변경(set)하는 것만 방지해주면 될 것이라고 생각했습니다. 

> 해결 방법: `private(set)` 접근 제어자 추가
> 
> 값을 읽는 것은 기본 접근 제어자로 설정하고, 값에 접근하여 변경하는 것은 `FruitStore` 내에서만 가능하도록 해주어 외부에서는 변경하지 못하도록 만들었습니다. 

### AlertAction의 위치

취소 버튼과 재고 수정 버튼의 위치를 각각 어디에 배치해야할 지 고민을 했습니다. 

> 해결 방법: HIG - Alert 문서 확인
> 
> HIG 문서를 살펴보니 "취소" 버튼은 항상 왼쪽에 위치해야한다는 문구가 있어 취소 버튼을 왼쪽으로, 재고 수정 버튼을 오른쪽으로 배치했습니다.
