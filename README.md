# 쥬스메이커 프로젝트 (Judy & Finnn)

# 목차 📚
* [프로젝트 소개](#프로젝트-소개-📝)
* [개발환경 및 라이브러리](#개발환경-및-라이브러리-🧑‍💻)
* [[STEP 1] 기능구현 및 코드설명](#[STEP-1]-기능구현-및-코드설명-🧑‍🏫)
    * [[STEP 1] 고민한점 및 해결방안](#[STEP-1]-고민한점-및-해결방안-🤔)
    * [[STEP 1] 배운개념](#STEP-1-배운개념-💡)
* [[STEP 2] 기능구현 및 코드설명](#[STEP-2]-기능구현-및-코드설명-🧑‍🏫)
    * [[STEP 2] 고민한점 및 해결방안](#[STEP-2]-고민한점-및-해결방안-🤔)
    * [[STEP 2] 배운개념](#STEP-2-배운개념-💡)
* [참조](#참조)
<br/>

# 프로젝트 소개 📝
> 다양한 메뉴의 쥬스를 만들 수 있는 쥬스메이커를 스토리보드를 활용하여 만드는 프로젝트이다.

<br/>

# 개발환경 및 라이브러리 🧑‍💻
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

<br/>

# [STEP 1] 기능구현 및 코드설명 🧑‍🏫
- `JuiceMaker` : 과일 재고와 쥬스 만드는 메서드를 가진 구조체
-> `makeJuice` : `Menu`를 받아 해당 과일의 재고를 변경하는 메서드
- `FruitStore` : 과일 재고를 관리하는 클래스
-> `fruitStock` : 과일별 재고를 저장한 딕셔너리
-> `subtractQuantity` : 과일의 재고를 n개만큼 줄이는 메서드
-> `convertToString` : 재고를 `String` 타입으로 변환하는 메서드
- `Fruit` : 과일 종류를 나열한 열거형
- `Menu` : 쥬스 메뉴를 나열한 열거형
-> `returnRecipe` : 쥬스 메뉴별로 필요한 과일 수를 튜플 배열`[(Fruit, Int)]`로 반환하는 메서드
- `ThrowError` : 오류 상황을 나열한 열거형

<br/>

# [STEP 1] 고민한점 및 해결방안 🤔
## 고민한점
### 1. 열거형 (rawValue, 연관값, 메서드)
쥬스마다 필요한 과일 개수가 정해져 있어 `Menu` 열거형에서 필요한 과일 개수를 나타내고 싶었습니다. 처음에 `rawValue`를 사용하려 했으나 `case`별로 유니크한 값을 가져야 해서 같은 개수가 필요한 경우 표현할 수 없었습니다.  다음 방법으로 열거형에 연관값이 있음을 알고 연관된 값으로 필요한 개수를 `Int`로 넣으려 했으나 연관값 사용은 `Switch`문에 제한된 것 같았습니다.  결국 열거형에 `returnRecipe` 메서드를 추가해서 `case`별로 필요한 과일과 개수를 알 수 있도록 해결했습니다.
<br/>

### 2. Dictionary 사용
과일과 과일의 재고, 쥬스레시피와 들어가는 과일의 개수는 항상 짝을 이루기 때문에 해당 데이터를 `Dictionary`로 사용하는 것을 고민했습니다. `Dictionary` 타입은 두 가지의 데이터 타입이 항상 짝을 이루며, `Hashable` 타입이기 때문에 키 값을 입력하면 해당하는 데이터를 메모리에서 빠르게 찾을 수 있다는 장점이 있습니다. 때문에 다양한 과일 및 레시피를 `Int`와 연관지어 짝으로 관리해야 하는 쥬스메이커 프로젝트에 최적이라고 판단했습니다. 또한, 과일 및 레시피가 추가될 경우 `Dictionary`에 넣어주는 작업만 해주면 되기 때문에 확장성까지 고려할 수 있었습니다.
<br/>

### 3. 오류처리
프로젝트 요구사항에는 상품이 품절될 경우 과일을 만들 수 없다는 제약이 있었습니다. 단순히 `if else`와 같은 조건문 등으로 처리할 수도 있었지만, 확장성 및 가독성을 고려하여 `do` `try` `catch` 오류처리문으로 해결하고자 노력했습니다. 결과적으로 `try` 하는 메서드 및 `throw`를 하는 메서드에서 오류가 발생할 수 있다는 것을 직관적으로 알 수 있게되어 코드의 가독성이 향상되었습니다.
<br/>

# [STEP 1] 배운개념 💡

- `CaseIterable` : 모든 `case` 값들에 대한 컬렉션을 제공한다.
- `UIButton`의 `tag` : 애플리케이션의 개체를 식별할 수 있는 정수이다.

<br/><br/>

---
# [STEP 2] 기능구현 및 코드설명 🧑‍🏫
- `ViewController`
-> `showCompleteAlert` : 쥬스 제조 완료 알림을 띄우는 함수
-> `showOutOfStockAlert` : 과일 재고 부족 알림을 띄우는 함수
- `JuiceMaker`
-> `stockCount` : 특정 과일의 재고를 반환하는 함수
- `Menu` 
-> `juiceName` : 쥬스의 이름을 반환하는 연산 프로퍼티

<br/>

# [STEP 2] 고민한점 및 해결방안 🤔
## 고민한점

### 1. 화면 이동 방식
#### 1) 재고 수정 버튼
버튼을 터치 했을 때 이동하게 하는 것은 코드없이 스토리보드에서 연결해 `segue`를 통해 화면이동하도록 했습니다. 메인 View가 네비게이션 컨트롤러에 속해있으므로 네비게이션 방식으로 이동하여 재고 수정 화면에서 다시 메인 화면으로 돌아올 수 있습니다. 
#### 2) 재고 부족 알림
처음 시도할 때는 재고 수정 화면을 알림처럼 `present`로 띄우려고 했습니다. 하지만 화면은 넘어가지만 다시 이전 화면으로 되돌아갈 방법이 없어 문제가 됐습니다. 알림 버튼을 통해서도 네비게이션 방식으로 넘어가도록 해서 해결했습니다.
<br/>

### 2. 쥬스 이름 가져오기
쥬스 제조 완료 알림에는 쥬스 이름이 들어가 `String` 타입의 쥬스 이름이 필요했습니다. 하지만 쥬스 메뉴가 담긴 `Menu` 열거형은 이미 버튼의 `tag`를 구분하기 위해 `Int`형 `rawValue`를 사용하고 있었습니다. `Menu` 열거형에 연산 프로퍼티를 추가하여 케이스별로 쥬스 이름을 반환하게 했습니다.
<br/>

# [STEP 2] 배운개념 💡
- `storyboard?.instantiateViewController(withIdentifier:)` : 미리 지정해둔 `Identifier`를 통해 스토리보드의 인스턴스를 생성한다.
- `navigationController?.pushViewController(_:animated:)` : 파라미터로 전달된 `UIViewController` 타입의 인스턴스로 이동한다.
- `UIAlertController` : 화면에 띄울 수 있는 `alert` 창을 관리한다. 해당 인스턴스에 `UIAlertAction` 인스턴스를 추가하면 버튼 및 동작을 할당할 수 있다.

<br/>

---

## 참조
 
[Dictionary](https://developer.apple.com/documentation/swift/dictionary)

[CaseIterable](https://developer.apple.com/documentation/swift/caseiterable)

[Apple Developer - tag](https://developer.apple.com/documentation/uikit/uiview/1622493-tag)

[Apple Developer - UIAlertController](https://developer.apple.com/documentation/uikit/uialertcontroller)

[Apple Developer - UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)

