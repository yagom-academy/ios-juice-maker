# Juice Maker
1. 각 주스에 해당하는 주문 버튼을 클릭한다.
2. 주스에 해당하는 레시피만큼 재고가 차감된다.(어떤 주스가 나왔는지 Alert로 알려준다)
3. 과일 재고가 부족하다면 Alert로 경고를 띄운다.
4. 재고 수정을 클릭하면 재고를 수정할 수 있는 View로 전환된다. 
5. 재고 수정 View에서 Stepper를 통해 재고를 추가/감소시킬 수 있다.

## 페어프로그래밍 규칙
- 커밋 단위: 함수 단위 (=기능 단위)
- 커밋 메세지: 카르마 문법 준수
- 프로젝트를 하다 모르는 부분이나 애매한 부분은 공식문서를 통해 스터디

## UML (Class Diagram)
![](https://i.imgur.com/ec2Pbaq.png)

## Step 1
### 주요 함수
- `fillStock` : 과일의 초기 재고값을 할당해주는 함수
- `takeOutStock` : 과일의 재고를 뺴내 Int 타입으로 반환 해주는 함수
- `decreaseStock` : 과일의 재고를 감소시키는 함수
- `increaseStock` : 과일의 재고를 증가시키는 함수
- `checkStock` : 과일의 현재 재고를 확인하는 함수
- `consumeStock` : 쥬스 레시피에 따라 소모되는 과일의 갯수를 과일의 재고에 감소시키는 함수

### 고민했던 부분 & 해결 과정
1. 각 과일 별로 어떻게 초기 재고를 부여할 지 고민했습니다.

```swift=
func fillStock(by amount: Int) {
        for fruit in Fruit.allCases {
            stock[fruit] = amount
        }
    }
재고를 채워주는 메서드를 FruitStore 클래스 내부에 만들어 준 뒤

init(stockAmount: Int) {
    fillStock(by: stockAmount)
}
    
convenience init() {
    self.init(stockAmount: 10)
        
    fillStock(by: 10)
}
```


init과 convenience init을 각각 만들어줘서 재고 값을 입력받을 수도 있고 초기재고 값 '10'으로 시작할 수 있도록 이니셜라이저를 구현하여 해결했습니다.


2. 주스별 레시피를 어떻게 표현할 지 고민했습니다. 주스의 종류에 대한 열거형을 만든 뒤, 각 열거형 케이스에 주스의 레시피를 연결해주고 싶었습니다. 따라서 열거형 내부에 연산 프로퍼티를 생성하여 각 케이스 별로 레시피가 반환될 수 있도록 해줬습니다.


3. 딕셔너리로 생성된 레시피를 과일과 수량 각각으로 가져와서 재고를 체크할 수 있는 방법에 대해 고민했습니다. 딕셔너리의 Key와 Value를 각각 가져오기 위해 튜플을 사용했습니다.
```swift=
let recipe = juice.recipes
        
for (fruit, amount) in recipe {
    guard try fruitStore.takeOutStock(fruit: fruit) >= amount else {
        throw StockError.notEnoughStock
    }
}
```


### 개선한 점
1. 열거형 Juice, Fruit, StockError를 따로 소스파일을 만들어 관리했습니다. 
처음에는 FruitStore 내에서 파는 과일은 5가지 종류라고 가정하고 FruitStore에서 파는 과일을 FruitStore.Fruit 이런 식으로 호출해주는 것이 적합하다고 판단하여 Fruit을 nested type으로 설정했습니다. 하지만 다시 생각해보니 FruitStore에서는 재고를 관리하는 메서드와 재고를 나타내는 프로퍼티만 있는 것이 FruitStore 라는 Type의 기능을 보다 명확히 한다고 판단했습니다. 따라서 Fruit 열거형을 분리해주고 따로 파일(Fruit)을 만들어 관리해줬습니다.


2. FruitStore 내에 초기 재고에 해당하는 initialStock이란 프로퍼티가 존재했었으나, 이니셜라이저에서 한 번 사용하는 관계로 따로 fillStock이란 메서드를 만들어 수정했습니다


## STEP 2


### 주요 함수
- `touchUpStrawberryBananaJuiceOrder` : 딸바 쥬스 주문 버튼 클릭시 동작하는 함수
- `touchUpMangoKiwiJuiceOrder` : 망키 쥬스 주문 버튼 클릭시 동작하는 함수
- `touchUpStrawberryJuiceOrder` : 딸기 쥬스 주문 버튼 클릭시 동작하는 함수
- `touchUpBananaJuiceOrder` : 바나나 쥬스 주문 버튼 클릭시 동작하는 함수
- `touchUpPineappleJuiceOrder` : 파인애플 쥬스 주문 버튼 클릭시 동작하는 함수
- `touchUpKiwiJuiceOrder` : 키위 쥬스 주문 버튼 클릭시 동작하는 함수
- `touchUpMangoJuiceOrder` : 망고 쥬스 주문 버튼 클릭시 동작하는 함수
- `order` : 쥬스 레시피 각각의 수량에 따라서 fruitStore에 과일의 재고를 소비시키는 함수
- `showOrderSuccessAlert` : 과일의 재고가 충분할때 주문이 성공되었다는 alert를 띄워주는 함수
- `showNoExistStockAlert` : 과일의 재고가 부족할때 과일의 재고가 부족하다는 alert를 띄워주는 함수




### 고민했던 부분 & 해결 과정
1. Alert에서 재고 수정을 클릭했을 때 재고 수정 View로 전환될 수 있는 방법에 대해 고민했습니다. 
단순히 재고 수정 버튼을 클릭할 때에는 스토리보드를 통해 재고 수정 화면으로 넘어갈 수 있도록 했습니다. 다만 이렇게 할 경우 Alert에서 재고 수정을 클릭했을 때 재고 수정 화면으로 넘어가는 기능을 구현할 수 없었습니다. 
따라서 alert의 `handler`에서 `instantiateViewController` 메서드를 활용하여 화면전환을 할 수 있도록 해주었습니다. 

2. 재고 수정에 대한 view를 modal 방식으로 화면 전환
앱을 사용하면서 재고가 부족하면 재고 수정이라는 단편적인 기능을 수행해야하기 때문에 modal 방식을 채택하여 사용했습니다.
alert의 재고 수정 버튼을 눌렀을 때도 재고 수정 view로 넘어가야 하는데 이 때 navigation 방식을 사용해 view를 보여주는 것은 맞지 않다고 판단했습니다.

3. alert의 버튼 구성
H.I.G 가이드 라인을 따라 alert 버튼을 구성했습니다.
Alert Button을 yes or no는 사용하지 않는 것이 좋다고 하여 재고수정, 취소로 구성했습니다.
작업을 취소하는 버튼은 언제나 왼쪽에 있다라고 하여 취소버튼을 왼쪽에 배치했습니다.

4. modal 방식으로 전환한 view에 닫기 버튼 구현
H.I.G 문서의 Always include a button that dismisses the modal view 문장에 따라 modal view의 닫기 버튼을 구현했습니다.

### 개선한 점
1. 재고를 수정하는 ViewController의 이름을 명사형으로 수정했습니다. 
처음에는 재고를 수정하는 ViewController의 이름을 `ModifyStockViewController`로 했습니다. 하지만 명사형으로 타입 명을 표시해주는 것이 맞다고 판단하여 `StockModificationViewController`로 수정했습니다. 

2. 발생할 수 없다고 판단한 오류를 `throw`하지 않고 `return`으로 수정했습니다.
정해진 과일에 대해 `updateFruitStockLabel()`을 하기 때문에 없는 재고의 Key값이 없는 오류는 발생할 수 없다고 판단했습니다. 따라서 이 때 따로 오류 처리를 해주지 않고 `return`으로 처리해주었습니다. 

## Step 3
### 주요 함수
- `touchUpDismissButton` : 재고 수정 뷰에서 `닫기`버튼을 누르면 이전 화면으로 돌아가는 함수
- `prepare` : segue를 활용해서 StockModificationView 에서 MainView에 데이터를 전달하기 위해 사용하는 함수
- `updateStock` : stockModificationView의 레이블에 현재 과일의 재고를 표시하기 위해 사용하는 함수
- `updateStepperValue` : stepper의 value를 과일의 현재 재고로 맞추기 위한 함수
- `touchUpStrawberryStepper` : 딸기 stepper의 액션이 있을 때 재고를 더하거나 빼주는 함수
- `touchUpBananaStepper` : 바나나 stepper의 액션이 있을 때 더하거나 빼주는 함수
- `touchUpPineappleStepper` : 파인애플 stepper의 액션이 있을 때 더하거나 빼주는 함수
- `touchUpKiwiStepper` : 키위 stepper의 액션이 있을 때 더하거나 빼주는 함수
- `touchUpMangoStepper` : 망고 stepper의 액션이 있을 때 더하거나 빼주는 함수

### 고민했던 부분 & 해결 과정
1. `MainViewController`에서 `StockModificationViewController`로 데이터를 전달하는 방법에 대해 고민했습니다.
이 부분은 `prepare`와 `performSegue`를 통해 화면 전환 시 segue를 통해 데이터가 전달되도록 하여 해결했습니다. 통일된 방법을 사용하고 싶었으나 Alert를 통해 재고 수정 페이지로 갈 경우 `prepare`함수를 사용할 수 없었고, Alert의 경우 `performSegue`를 통해 데이터를 전달해주는 방법을 사용했습니다. 

2. Stepper를 통해 바로 FruitStore의 재고를 수정해주고 싶었습니다. 
`FruitStore`의 `stock`을 `private(set)`으로 읽기 전용으로 해놓았기 때문에 외부에서 이를 수정할 수 없었습니다. 따라서 Controller에 있는 것이 더 적합하다고 판단했지만, 불가피하게 Stepper를 통해 재고를 수정하는 함수를 Model인 FruitStore에 생성해주었습니다. 

3. Stepper를 눌렀을 때 Stepper의 Value가 0으로 되어 있어 Stepper를 클릭하면 무조건 0부터 더해지는 문제가 있었습니다. 
따라서 현재 각 과일의 재고 label로 보여지는 값을 Stepper의 Value로 설정해주었습니다. 

4. `StockModificationViewController`에서 `MainViewController`로 데이터를 전달하는 방법에 대해 고민했습니다. 
`StockModificationViewController`에서 `MainViewController`로는 따로 Segue가 연결되어 있지 않았기 때문에 Segue를 통한 데이터 전달 방식은 적합하지 않다고 판단했습니다. 따라서 Notification Center를 활용하여 데이터를 전달하는 방식을 선택했습니다. 또한 현재 재고를 즉각적으로 반영해주기 위해 싱글톤을 사용했습니다. 

5. 화면이 작은 디바이스 시뮬레이터로 실행을 했을 경우 버튼의 글씨가 생략되는 문제가 있었습니다. 
```swift=
if kiwiOrderButton.titleLabel?.adjustsFontSizeToFitWidth == false {
            kiwiOrderButton.titleLabel?.adjustsFontSizeToFitWidth = true
            kiwiOrderButton.titleLabel?.lineBreakMode = .byWordWrapping
            kiwiOrderButton.titleLabel?.textAlignment = .center
        }
```
`.adjustsFontSizeToFitWidth`메서드를 활용하여 버튼의 titleLabel이 버튼 넓이에 맞는지 확인해줬고 맞지 않다면 조절할 수 있도록 해주었습니다. 
또한 `.lineBreakMode`를 `.byWordWrapping`로 해주어 단어 단위로 버튼의 넓이가 부족하면 띄워쓰기를 할 수 있도록 구현했고, 가운데로 정렬될 수 있도록 `.textAlignment`를 `.center`로 해주었습니다. 



## 참고 문서
https://swift.org/documentation/api-design-guidelines/
https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html
https://docs.swift.org/swift-book/LanguageGuide/Initialization.html
https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/
https://developer.apple.com/documentation/foundation/notificationcenter
https://developer.apple.com/documentation/uikit/uilabel/1620546-adjustsfontsizetofitwidth
https://developer.apple.com/documentation/uikit/uiviewcontroller/1621490-prepare
https://developer.apple.com/documentation/uikit/uiviewcontroller/1621413-performsegue
