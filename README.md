# 쥬스메이커 프로젝트 저장소
> 프로젝트 기간 2022.02.21 ~ 2022.03.11 <br/>
팀원 : [@grumpy-sw](https://github.com/grumpy-sw) [@cathy171](https://github.com/cathy171)

- [쥬스 메이커](#쥬스-메이커)
- [STEP 1](#[STEP-1]-쥬스-메이커-타입-정의)
    + [기능 구현](#STEP-1-기능-구현)
    + [고민했던 것](#STEP-1-고민했던-것들)
    + [배운 개념](#STEP-1-배운-개념)
    + [PR 후 개선사항](#STEP-1-PR-후-개선사항)
- [STEP 2](#[STEP-2]-초기화면-기능구현)
    + [기능 구현](#STEP-2-기능-구현)
    + [고민했던 것](#STEP-2-고민했던-것들)
    + [배운 개념](#STEP-2-배운-개념)
    + [PR 후 개선사항](#STEP-2-PR-후-개선사항)
- [STEP 3](#[STEP-3]-재고수정-기능구현)
    + [기능 구현](#STEP-3-기능-구현)
    + [고민했던 것](#STEP-3-고민했던-것들)
    + [배운 개념](#STEP-3-배운-개념)
    + [PR 후 개선사항](#STEP-3-PR-후-개선사항)


## 쥬스 메이커

## [STEP 1] 쥬스 메이커 타입 정의
- FruitStore.swift 파일에 과일의 재고를 관리하는 FruitStore 타입을 정의합니다
- JuiceMaker.swift 파일에 다음의 조건을 충족하는 JuiceMaker 타입을 정의합니다
- (Optional) 필요한 경우 오류처리(throw, try-catch)를 구현합니다


## STEP 1 기능 구현
- ```FruitStore```
    - ```Fruit```: 과일의 종류를 담고 있는 열거형
    - ```defaultStock```: 과일들의 초기 재고 
    - ```fruits```: 과일들의 종류와 재고 상황을 담고 있는 딕셔너리
    - ```increaseStock(fruit, amount)```: ```amount```만큼 ```fruit```의 재고를 증가시키는 함수
    - ```decreaseStock(fruit, amount)```: ```amount```만큼 ```fruit```의 재고를 감소시키는 함수

    
- ```JuiceMaker``` 
    - ```fruitStore```: JuiceMaker가 소유하고 있는 FruitStore
    - ```JuiceRecipe``` : dictionary를 선언하는 typealias사용
    - ```Juice```: 주스의 종류를 담고 있는 열거형으로 표현, recipe 함수로 필요한 재료들의 개수를 반환
    - ```makeJuice```: 재료가 있는지 확인하여 에러처리를 하거나 주스를 만드는 함수
    - ```hasEnoughFruitStock```: 재고가 충분한지 확인하는 함수
    - ```consumeFruitStock```: 레시피를 따라 필요한 재료를 소모하는 함수

- ```JuiceError```
    - ```notEnoughStock```: 재고가 부족한 경우의 에러
    
## STEP 1 고민했던 것들
1. JuiceMaker의 타입이 구조체이고 FruitStore의 타입이 클래스인 이유
2. 함수의 Naming이 적절한지
3. Juice의 recipe의 반환 타입을 튜플로 할 것인지, 딕셔너리로 할 것인지
4. FruitStore 생성 시 과일 딕셔너리 fruits의 초기화 방법
5. 재고 부족 외에 처리할 에러가 없는지
6. 열거형을 정의할 위치(사용자 타입 내부/외부)


## STEP 1 배운 개념
- struct와 class
- MVC 구조
- typeAlias
- Error Handling
- 열거형과 Caseiterable 프로토콜
- 배열과 튜플, 딕셔너리

## STEP 1 PR 후 개선사항
- FruitType 열거형 타입의 정의 위치 변경
- 변수, 열거형 이름 디테일하게 변경
    - ```defaultStock```-> ```defaultNumberOfStock```
    - ```ErrorType``` -> ```JuiceMakerError```
    - ```Fruit``` -> ```FruitType```
    - ```Juice``` -> ```JuiceType```
- JuiceType.recipe() 반환 타입 변경
    - ```[[FruitType: Int]]``` -> ```[FruitType: Int]```
- 불필요한 주석 제거
- 메서드, 프로퍼티의 Access Control 변경
- 기능 동작 중 던지는 에러 타입 상세화
    - 쥬스를 만들 재고가 부족할 때: ```JuiceMakerError.notEnoughStock```
    - 재고를 0 미만으로 감소시킬 때: ```JuiceMakerError.outOfStockRange```
---

## [STEP 2] 초기화면 기능구현
- 재고 수정 버튼을 터치하면 재고 추가 화면으로 이동합니다.
- 주문 버튼 터치 시
    - 쥬스 재료의 재고가 있는 경우 구현
    - 쥬스 재료의 재고가 없는 경우 구현
- 과일의 재고가 변경되면 적절한 요소에 변경사항 반영

## STEP 2 기능 구현

- ```ViewController```
    - ```stockOfStrawberryLabel```, ```stockOfBananaLabel```, ```stockOfPineappleLabel```, ```stockOfKiwiLabel```, ```stockOfMangoLabel``` : 과일 재고 입력 위해 UILabel 변수 생성
    - ```orderStrawberryBananaButton```, ```orderMangoKiwiButton```, ```orderStrawberryButton```, ```orderBananaButton```, ```orderPineappleButton```, ```orderKiwiButton```, ```orderMangoButton``` : 쥬스 종류별 UIButton 변수 생성
    - ```orderJuiceAction```: 주스 제조 완료 알림과 과일 재고를 업데이트하는 함수
    - ```showNotEnoughStockAlert```: 재고가 충분하지 않을 경우 알림을 띄워주는 함수
    - ```showJuiceReadyAlert```: 주스 제조 완료 시 알림을 띄워주는 함수
    - ```updateFruitStockLabel```: 과일 재고를 초기화하고 업데이트하는 함수
    - ```switchScreenToManageStockView```: 재고 관리 화면으로 화면을 전환하는 함수
    - ```modifyFruitStockAction```: 재고 입력 버튼 클릭 시 재고 관리 화면으로 전환하는 함수


    
## STEP 2 고민했던 것들

1. 같은 기능을 하는 '~쥬스 주문' 버튼에 대한 액션을 어떻게 구현할 것인지 고민했습니다.
2. 버튼으로부터 쥬스에 대한 변수값을 부여해서 이를 갖고올 수 없는지 고민했습니다.
3. 화면에 현재 재고가 반영되는 시점은 언제가 되어야 하는지 고민했습니다.
4. 재고 수정 화면으로 이동하는 방법은 어떤 방법을 사용해야 하는지 고민했습니다.
5. 특정 객체에서만 접근 가능하도록 하기 위해 private 접근 제어자를 사용해야 하는지 고민했습니다.
6. 매직 리터럴의 사용을 최대한 줄이기 위해 NameSpace의 사용을 고민했습니다.

## STEP 2 배운 개념
- AlertController 활용
- 화면 이동 방법
- Storyboard 내 아이템의 값과 이벤트 관리

## STEP 2 PR 후 개선사항
- View Controller 명사형으로 이름 수정
- IBAction의 sender Any타입에서 특정 타입으로 수정
- 쥬스 타입을 가져오는 방식을 juiceType에서 주스 이름을 반환하는 방식으로 변경
- juiceMaker내에 있는 fruitStore를 private(set)으로 변경
- sender를 from button으로 변경
- NameSpace로 생성했던 상수들을 내부에서 선언하도록 수정
- updateFruitStockLabel의 파라미터를 딕셔너리 타입으로 수정



---

## [STEP 3] 재고수정 기능구현
- 화면 제목 '재고 추가' 및 '닫기' 버튼 구현
- 화면 진입 시 과일의 현재 재고 수량 표시
- -,+를 통한 재고 수정
- iPhone 12 외에 다른 시뮬레이터에서도 UI가 정상적으로 보일 수 있도록 오토레이아웃 적용

## STEP 3 기능 구현
- FruitStore
    - ```updateStock(fruit: FruitType, amount: Int```
        - 과일의 재고를 전달받은 ```amount```로 수정하는 함수
- JuiceOrderViewController
    - ```fruitStockStatus() -> [FruitType: Int]```
        - 현재 과일의 전체 재고 상태를 딕셔너리로 만드는 함수
    - ```sendData(fruits: [FruitType: Int])```
        - 데이터를 전달받는 dataDelegate 프로토콜의 함수를 구현한 함수
- StockInventoryViewController
    - ```fruitStockStatus: [FruitType: Int]```
        - 현재 과일의 재고 상태를 저장하는 변수
    - ```minimumNumberOfStock: Double = 0```
        - 과일 재고가 될 수 있는 최소값을 나타내는 상수
    - ```dataDelegate: dataDelegate?```
        - StockInventoryViewController에서 JuiceOrderViewController로 데이터를 전달하는 위임자
    - ```setupFruitStockLabel()```
        - 뷰가 로드됐을 때 과일 재고 수량을 세팅하는 함수 
    - ```setupFruitStockStepper()```
        - 과일 재고 조절을 하는 -,+ 버튼(stepper)의 설정을 하기 위한 함수
    - ```setupFruitStockStepperOption()```
        - stepper의 옵션을 설정하기 위한 함수
    - ```setupFruitStockStepperLabel()```
        - stepper의 초기값을 설정하기 위한 함수
    - ```stepperValueChangedAction(_ sender: UIStepper)```
        - stepper의 값에 변화가 감지되었을 때 수행할 액션을 지정한 함수
    - ```changedFruitsStock() -> [FruitType: Int]```
        - 재고 변경으로 인해 변경된 과일과 그 수량을 담은 딕셔너리를 반환하는 함수
    - ```isStockChanged(fruit: FruitType, currentStock: Int) -> Bool```
        - 해당 과일의 재고가 변경되었는지 확인하는 함수
    - ```viewWillDisappear(_ animated: Bool)```
        - 뷰가 사라지기 직전에 호출되는 함수. 위임자를 통해 데이터를 JuiceOrderViewController로 전달하는 함수

   
## STEP 3 고민했던 것들
1. 뷰 컨트롤러 사이 데이터 전송 방법을 고민했습니다.
2. 뷰 컨트롤러 간 어떤 데이터를 전송해야 할지 고민했습니다.
3. 변경된 재고만을 업데이트하는 방법을 고민했습니다.
4. label과 stepper에 필요한 데이터를 입력하는 과정에서 중복된 동작을 최대한 줄일 수 있는 방법을 고민했습니다.
5. stepper로 인해 재고가 변경되었을 때 어떤 행동을 수행해야 할 지 고민했습니다.
6. 오토레이아웃을 적용하는 방법에 대해 고민했습니다.


## STEP 3 배운 개념
- Stepper의 활용
- UI Item Outlet Collection의 사용
- 화면 사이의 데이터 공유(직접 공유 방법과 Delegate를 활용한 공유)
- 오토레이아웃을 위한 Stack View와 Constraints의 활용

## STEP 3 PR 후 개선사항

