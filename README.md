# 쥬스메이커 프로젝트
쥬스 메이커가 레시피에 따라 후르츠 스토어의 과일을 사용하여 쥬스를 만드는 프로젝트

---
## 1. 팀원 소개
|Andrew|혜모리|
|---|---|
|<img src="https://github.com/Andrew-0411/ios-juice-maker/blob/step1/images/Andrew.png" width="250">|<img src="https://github.com/Andrew-0411/ios-juice-maker/blob/step1/images/hyemory.png" width="250">|

## 2. 타임라인 (23.01.02. ~ 23.01.20.)
|날짜|진행 내용|
|---|---|
|2023-01-02|프로젝트 시작 <br/> FruitStore, JuiceMaker 타입과 각 기능 구현|
|2023-01-03|네이밍 정리, 테스트 코드 삭제 후 STEP1 PR 발송|
|2023-01-04|review 내용 확인 및 반영 (기능 분리, 접근 제어자 추가)|
|2023-01-05|FruitStore의 stock 프로퍼티를 은닉화하도록 기능 분리 / Merge 완료|
|2023-01-06|STEP2 진행 시작, UIKit 학습|

## 3. 프로젝트 순서도
*(아직 프로젝트가 STEP3까지 공개되지 않아 미제작)*

## 4. 실행화면
*(아직 프로젝트 실행화면이 미완성되어 미제작)*

## 5. 트러블 슈팅
- **과일과 재고 수량을 함께 담는 방법?**
과일과 과일의 재고 수량을 담는 방법을 고민하다가 `Dictionary`를 사용하여 과일은 중복될 일이 없고 과일과 재고를 묶어 사용하는 것이 효율적이라 판단하여 과일(key), 재고 수량(value)을 한번에 담았습니다.
이와 같은 의도로 각 쥬스의 레시피도 `Dictionary`를 사용하였습니다.

- **쥬스를 만드는 기능(`makeJuice` 메서드)과 과일을 빼는 기능(`substractFruit` 메서드)**
처음엔 `makeJuice` 메서드에 `FruitStore`의 재고 정보를 가져와서 함께 비교하려고 하였는데, 역할을 나누고자 `FruitStore` 타입에서 재고 정보와 필요한 과일의 개수를 비교하여 사용한 과일의 개수를 빼주는 `substractFruit` 메서드를 구현하였습니다.

- **Result Type 사용 시 에러처리?**
에러처리를 위해 만든 열거형 `JuiceMakerError`가 Error 프로토콜을 채택할 뿐이라 마지막에 catch한 error와 함께 `failure`의 Error로 묶을 수가 없었습니다. 그래서 extension을 이용하여 `LocalizedError` 프로토콜을 수정하였고 하나의 error로 사용할 수 있게 됐습니다. 또한 `LocalizedError`의 `localizedDescription` 기능으로 오류에 대한 문구 출력도 간편해졌습니다.

## 6. 참고 링크
1. [애플 개발자 공식문서 : Result](https://developer.apple.com/documentation/swift/result)
2. [애플 개발자 공식문서 : LocalizedError](https://developer.apple.com/documentation/foundation/localizederror)
