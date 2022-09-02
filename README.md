# **쥬스 메이커 (juice-maker)*


## 1. **소개**

사용자가 버튼을 통해 쥬스를 주문하면 쥬스를 만들어주고 재료를 소모합니다.
재료 수정 페이지를 통해 부족한 재료를 추가할 수 있습니다.


## 2. **🧑‍🤝‍🧑 팀원**

### 팀원
| **stone** | **제이푸시** |
| ----- | ----- |
| <img width="180px" src="https://avatars.githubusercontent.com/u/74972815?v=4"> | <img width="180px" src="https://i.imgur.com/JqEDLOf.jpg"> |

## 3. 👩🏻‍💻 실행 화면(기능 설명)
-- 이후 추가

## 4. **🔥 트러블 슈팅**

### **레시피를 만들때 튜플 배열 or 딕셔너리 사용**
- 레시피를 만들 때 둘 중 어떤 방식을 채택할지 고민했습니다.
    - [.strawberry : 10, .banana : 1]
    - [(.strawberry, 10), (.banana, 1)]
- 가독성이 조금 더 좋다고 생각한 딕셔너리를 사용했습니다.

### **switch문을 사용해서 에러 메세지를 catch 할 때 catch문이 많아지는 문제**
 - 예상외의 에러를 체크해주는 부분을 한번에 묶어주기 위해서 `LocalizedError`를 사용했습니다.
    

### **enum에서 원시값으로 딕셔너리를 주지 못하는 문제**
- 딕셔너리를 가지는`Struct`로 구현했으나 enum의 값들과 중복되는 부분이 많아, enum내에 enum value를 이용해 레시피를 구현하는 방법을 채택했습니다.

## **5. 🤔고민한 부분**
**이미 유효성을 확인 한 후에 `Dictionary`의 값을 사용할 때**
- `fetchFruitAmount`함수를 사용하여, 과일의 유효성 체크를 하는데, 유효성 체크 후 `useFruits`함수를 사용하여 과일의 갯수를 감소시킵니다.
- `useFruits`함수 내부에서 `Dictionary`값인 `fruits`를 사용하는데,이미 유효성 검사가 끝난 값이라 굳이 `throw`로 에러를 던지지 않고 `return`으로 처리해도 되지 않을까 고민했습니다.

**딕셔너리 [Fruit : Int]를 사용해서 과일 저장소를 구현할 때 Int의 모호함을 해결하기 위한 고민**

딕셔너리로 표현시 처음 보는 사람이 의미를 잘 파악하지 못할 수 있으므로 과일명과 재고를 가지고 `Struct`를 정의해서 구현을 고민했습니다.

1. Typealias 파일을 만들어서 `typealias`들을 명시합니다.
    - 단점: 사용하는 파일에 `typealias`가 무슨 타입인지 구현을 확인해야 합니다.

2. 사용하는 파일에 각각 `typealias`를 명시해줍니다.
    - 단점: 다른 파일의 코드를 가져다 쓴다면 매개변수에 쓰이는 부분때문에 중복 명시가 있습니다.

두가지 방법중 1번의 단점을 좀 더 크게 보고 2번의 방법을 채택하고 싶었으나 파일의 길이가 길어지면 1의 단점이 똑같이 드러나게 된다고 생각했습니다. 2가지 방법으로도 해결을 하지 못한다 생각해서 `Struct`로 딕셔너리를 구현할 생각을 했습니다.
`Sturct`로 구현하는 방법을 채택하여 진행하려 했지만, `Dictionary`를 사용했을 때의 로직들을 전부 리팩토링이 이루어져야해, 비효율적으로 느껴졌습니다. 그래서 `Dictionary` 값을 할당하고 있는 `fruits` 변수의 네이밍 수정을 통하여 `Dictionary`타입의 방식을 채택하기로 결정했습니다.


## 6. **🔗 참고 링크**
[Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)

[Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)

[Swift Language Guide - AccessControl](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
