# juice-maker
## 팀원
minseong, papri
## UML
<img src="https://i.imgur.com/TRKpcLH.png" width="1000" height="700"/>

## STEP 1 수행 내용
- 과일의 재고를 관리하는 FruitStore 타입을 정의
> - FruitStore가 관리하는 과일의 종류 : 딸기, 바나나, 파인애플, 키위, 망고
> - 각 과일의 초기 재고 : 10개
> - 각 과일의 수량 n개를 변경하는 기능 구현
- JuiceMaker 타입 정의
> - FruitStore의 과일을 사용해 과일쥬스를 제조
> - 딸기쥬스 : 딸기 16개 소모
> - 바나나쥬스 : 바나나 2개 소모
> - 키위쥬스 : 키위 3개 소모
> - 파인애플 쥬스 : 파인애플 2개 소모
> - 딸바쥬스 : 딸기 10개 + 바나나 1개 소모
> - 망고 쥬스 : 망고 3개 소모
> - 망고키위 쥬스 : 망고 2개 + 키위 1개 소모
> - 과일의 재고가 부족하면 과일쥬스를 제조할 수 없습니다
> - JuiceMaker는 FruitStore를 소유
## 구현함수
- `makeJuice()`: 음료를 입력받아 음료제작이 가능한지 확인 후 가능하면 제작
- `isEnoughStock()`: 음료에 필요한 재료가 있는지 확인
- `decreaseFruitStock()`: 음료제작에 필요한 재료만큼  과일저장소의 정보최신화
## 고민한 점
- `Enum Fruit`를 `FruitStore`에 종속되게 해줄지 아니면 파일을 따로 빼줄지 고민했습니다. 
  - `FruitStore`가 과일종류와 재고의 관한 목록만 있으면 된다고 판단하여 파일을 분리했습니다.
> 리뷰어: 해당 타입이 정말 그 파일 내에서만 쓰이는 게 아니라면, 분리해주는 게 좋다
- `Class FruitStore`에서 과일과 과일재고의 구현. 
  - a. `enum Fruit`을 만들어 해당 과일과 재고를 `Dictionary`의 `key`와 `index`로 두어 관리할지
  - b. `Fruit`이란 구조체를 만들어 그 안에 과일이름과 과일재고를 넣고 `struct Fruit`객체들의 배열로 관리할지 
> b를 선택하면 과일 객체를 하나하나 다 만들어줘서 배열에 넣어야 하고, 과일 값을 줄일 때 배열.과일구조체인스턴스.재고 << 이렇게 접근해야해서, a 방식을 선택하였습니다. 
> 추후에 `FruitStore`에서 취급하는 과일의 종류가 다양해지더라도 `Fruit enum`에 `case`를 추가하면 되기 때문에 a방식으로 결정했습니다.
- 매직넘버
  - `Class FruitSore`에서 초기화를 진행할 때, 초기 재고인 10이 매직넘버이기 때문에 `DefaultSetting`이란 `enum`을 만들어 해결하였습니다.
- 접근지정자
  - `Class FruitStore`의 재고관리는 `decreaseFruitQuantity()`메소드를 통해 `private`한 과일인벤토리에 접근하는 식으로 이뤄져야겠다고 생각했습니다. 
  - 과일을 만드는 것 외에 다른 이유로 과일인벤토리를 건들지 못하게 만들어야 한다고 생각했습니다.
- 에러처리 - `throw`를 하는 부분과 `catch`를 할 부분
  - 재고를 검사하는 동시에 `Error`를 던져줄지 검사가 끝나고 `Bool`값으로 반환받아 그 결과값에 따라서 `Error`를 던져줄지 고민하였습니다.
> 재고를 확인하는 부분은 `FruitStore`에서 진행해야 한다고 생각하여 `Error`를 `isEnoughStock()`서 던져주었습니다.
- 네이밍
  - `JuiceMakeError`, `JuiceMakerError`라는 네이밍을 고민하였습니다
> 쥬스를 만드는 과정에서 에러가 생기는 것이기 때문에 JuiceMakeError라는 이름을 선택하였습니다.
---
## STEP 2 수행 내용
- 초기화면 기능구현
- ‘재고수정’ 버튼을 터치하면 ‘재고 추가’ 화면으로 이동
- 각 주문 버튼 터치 시
> - 쥬스 재료의 재고가 있는 경우 : 쥬스 제조 후 “*** 쥬스 나왔습니다! 맛있게 드세요!” 얼럿 표시
> - 쥬스 재료의 재고가 없는 경우 : “재료가 모자라요. 재고를 수정할까요?” 얼럿 표시
> - ‘예’ 선택시 재고수정화면으로 이동
> - ‘아니오’ 선택시 얼럿 닫기
- 과일쥬스를 제조하여 과일의 재고가 변경되면 화면의 적절한 요소에 변경사항을 반영
## 구현함수
- `getFruitsStock()`: 과일의 재고를 읽어옴
- `clickMakeJuiceButton()`: 쥬스제작 버튼이 눌렸을 때 그에 해당하는 쥬스를 제작
- `makeJuice()`: 음료를 입력받아 음료제작이 가능한지 확인 후 가능하면 제작. 
- `updateFruitsStock()`: 과일 `inventory`의 현황을 `VC`의 `UILabel`에 각각 표시
- `showSuccessAlert()`: 과일 제조에 성공했을 때 `Alert`표시
- `showFailAlert()`: 과일 제조에 실패했을 때 `Alert`표시 후 재고 수정시 화면전환
- `checkClickedJuice()`: 어떤 버튼이 눌렸는지 확인하여 해당하는 버튼 리턴
## 고민한 점 및 해결
- 각각의 과일의 재고를 표시하는 `UILabel`을 한번에 관리할 수 있게 하고 싶었습니다
> `IBOutlet Collection`을 사용했습니다.
- `ViewControl`에서 과일 수량 표시하는 `label`의 값을 띄워줘야 하는데 어떻게 `FruitStore` 인벤토리의 값을 가져올지 고민하였습니다.
> 싱글턴패턴을 이용하여 `FruitStore` 인벤토리에 접근하여 반복문을 통해  각각의 `Label` 세팅해 주었습니다
- 주문버튼을 눌렀을 때 재고가 있을 경우와 없을 경우를 어떻게 구별해야 할지 고민하였습니다.
> `makeJuice()`의 `return` 타입을 `bool`타입으로 주어 제조에 성공한 경우와 실패한 경우를 구분해 주었습니다.
- 각각의 쥬스주문버튼의 기능들이 중복이 되는데 하나의 액션으로 다양한 버튼의 기능을 수행할 수 있게 만드는 방법이 있을까요?? 혹시;;; 있다면 그 (정보or기법??)에대한 키워드등을 얻을 수 있을까요??😭
> 버튼을 하나로 묶을 수 있다! 태그나 센더를 통해 버튼을 구분
---
## STEP 3 수행 내용
- 화면 제목 ‘재고 추가’ 및 ‘닫기’ 버튼 구현
- 닫기를 터치하면 이전화면으로 복귀
- 화면 진입시 과일의 현재 재고 수량 표시
- stepper의 -, + 를 통한 재고 수정
- iPhone 12 외에 다른 시뮬레이터에서도 UI가 정상적으로 보일 수 있도록 오토레이아웃 적용
## 구현함수
- `clickUpdateFruitStockButton()`: 재고수정 버튼 클릭시 재고추가 창으로 이동시켜줌
- `didDismiss`: delegate패턴을 이용하여 창이 닫혔을 경우 재고를 업데이트 시켜줌
- `init?(juiceMaker: JuiceMaker, coder: NSCoder)`: FruitStoreViewController생성시 juiceMaker에 값 할당
- `closeButton()`: 닫기 버튼 클릭시 현재 켜져있던 뷰가 닫힘
- `updateStepperValue()`: Stepper의 Value를 현재 재고에 맞게 설정해줌
- `tapStepper()`: Stepper를 탭할 때 마다 변경사항을 LabelText와 재고에 즉각반영
- `updateInventory()`: StepperValue를 inventory에 반영
## 고민한 점 및 해결
**1. 화면전환 방식**
navigation vs present
<img src="https://i.imgur.com/ydtbzD2.png" width="400" height="400"/>

기능구현 명세서 그림에선` navigation bar`에 `닫기 버튼`만 존재했습니다.

`navigation 방식`을 활용하면, 이전 화면으로 돌아가는 버튼이 따로 왼쪽 상단에 생겼기 때문에
`present 방식`을 이용하여 화면을 전환하고,`dismiss를 활용`하여 닫기 버튼을 누르는 것으로만 화면을 닫고 이전화면으로 이동 할 수 있게 하였습니다.
```swift
//JuiceMakerViewController의 '재고 수정' 버튼을 누를 시
@IBAction func clickUpdateFruitStockButton(_ sender: UIBarButtonItem) {
        guard let fruitStoreVC = storyboard?.instantiateViewController(identifier: "FruitStoreVC") as? FruitStoreViewController else {
            return
        }
        fruitStoreVC.delegate = self
        fruitStoreVC.juiceMaker = juiceMaker
       
        present(fruitStoreVC, animated: true, completion: nil)
    }
```
```swift
// FruitStoreViewController에서 '닫기' 버튼을 누를 시
@IBAction func closeButton(_ sender: UIBarButtonItem) {
        delegate?.updateFruitStock()
        presentingViewController?.dismiss(animated: true, completion: nil)
}
```


**2. stepper의 -, + 를 통한 재고 수정**
`text`와 별개로 `stepper`를 탭하면 0부터 시작하는 문제가 발생하였습니다.
> `value`의 값을 `viewDidLoad`에서 초기화 시켜주어서 해결했습니다.

**3. ViewController간 데이터 전달 방식**
`JuiceMakerViewController` -> `FruitStoreViewControlle` 프로퍼티에 `직접접근`하여 데이터를 전달하였습니다
`FruitStoreViewControlle` -> `JuiceMakerViewController` `delegate`를 활용하여 데이터를 전달하였습니다.

**4. ViewController간 데이터(JuiceMaker 인스턴스의 FruitStore의 inventory)를 공유하는데 문제 발생**
FruitStoreViewController에서 stepper로 재고 수정을 한 후, JuiceMakerViewController에서 수정된 만큼 Label에 표시가 되었지만 쥬스를 만들 때 재고 부족 알림이 뜨는 문제가 발생했습니다.

```swift
func updateInventory(fruit: Fruit, value: Int) {
        inventory[fruit] = value
}
```
> updateInventory 메소드를 FruitStore 클래스에 추가적으로 구현하여

```swift
@IBAction func tapStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else {
            return
        }
        fruitLabelCollection[sender.tag].text = Int(sender.value).description
        juiceMaker?.fruitStore.updateInventory(fruit: fruit, value: Int(sender.value))
}
```
> FruitStoreViewController에서 stepper를 눌렀을 때 JuiceMaker의 FruitStore의 inventory에 접근 할 수 있게 하였습니다.


## 조언을 얻고 싶은 부분!
`UIStepper`의 크기가 고정이라서 작은 화면에서 겹치는 일이 발생하였습니다.
`UIstepper`의 경우 사이즈를 따로 처리해주는 방법이 존재할까요??🧐 (구글에서 관련 글을 못 찾았습니다ㅠ) 
> 사이즈 조절이 가능한 커스텀 뷰를 만들어야 할 것 같다
<img src="https://i.imgur.com/tEHdqYC.png" width="400" height="400"/>
