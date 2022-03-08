# 쥬스메이커 프로젝트
> 프로젝트 기간 2022.02.22 ~ 2022.
팀원 : [@malrang](https://github.com/kinggoguma) [@doogie97](https://github.com/doogie97) / 리뷰어 : [@yoo-kie](https://github.com/yoo-kie)

- [프로젝트 팀 규칙](#프로젝트-팀-규칙)
- [실행화면](#실행화면)
- [UML](#uml)
- [STEP 1 기능 구현](#step-1-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
- [STEP 2 기능 구현](#step-2-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
- [STEP 3 기능 구현](#step-3-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)

**Ground Rules**
- 프로젝트에 집중하는 시간: 10:00 ~ 19:00
- 밥먹는 시간: 13:00 ~ 14:00
- Commit Message Style: Karma Style
- 의견 눈치보지 말고 얘기하기

**프로젝트 수행이 어려운 시간**
- Doogie: 수: 18:00 이후, 금: 18:00 이후
- malrang: 상관없음

## 실행화면
![화면_기록2022-03-08오후_12_22_10_AdobeCreativeCloudExpress](https://user-images.githubusercontent.com/82325822/157161081-14a93f78-1f12-401a-ac52-c59a170076ee.gif)

## UML

![스크린샷 2022-03-02 오전 11 39 42](https://user-images.githubusercontent.com/82325822/156287001-9b674eb3-9a57-43b5-aba3-66d29816fee0.png)

## STEP 1 기능 구현
- JuiceMaker 타입 구현
- 주스 제작 함수(makeJuice)
- 재고 관리 함수(manageStock)
-> do - catch 문을 이용한 에러 관리.

- FruitStore 타입 구현
- 재고 비교 함수(checkStock) : 쥬스 타입에서 리턴되는 딕셔너리를 for구문을 통해 현재 재고와 필요 재료를 비교하는 기능
- 재고 계산 함수(calculateStock): 재고를 n개만큼 더하거나 뺄수 있는 기능

- Fruit 타입 구현
- enum 을 컬렉션 타입으로 활용(CaseIterable)

- CalculationType

- Juice 타입 구현
- 쥬스의 종류를 case 로 구현, 연산프로퍼티를 활용해 쥬스의 재료를 딕셔너리로 반환

- ErrorCase 타입 구현

## 고민했던 것들
1. 에러가 날 수 없는 경우
```swift
func calculateStock(fruit: Fruits, amount: Int, calculationType: CalculationType) throws {
guard let stock = fruitList[fruit] else {
throw FruitStoreError.invalidSelection
}
```
위 코드에서 매개변수 *`fruit`* 는 잘못 선택될 일이 없고 단순히 *`fruitList[fruit]`* 의 값이 nil일 경우는 없을 것이라고 생각하는데 옵셔널 바인딩을 위해 guard let을 사용하게 될 경우 else 내부에 어떤 내용을 적어줘야 하는지 고민.
(일단은 에러 중 하나인 *`invalidSelection`* 으로 던지긴 했지만 return을 사용한다거나 혹은 다른 방법이 있는지...)

2. Error 프로토코콜을 채택한 열거형의 네이밍을 무엇으로 할지 고민

3. *`JuiceMaker는 FruitStore를 소유하고 있습니다`* 라는 말의 뜻을 어떻게 해석해야할지 고민.
일단은, *`JuiceMaker`* 안에서 *`FruitStore`* 의 인스턴스를 생성하는 것으로 해석 했는데 
이런 경우 *`(A 클래스 안에 B 클래스의 인스턴스를 생성한 경우)`* A 클래스를 B클래스의 부모로 볼 수 있는지 의문.

## 배운 개념
### Error Handling
- Swift에서 에러는 `Error protocol`을 채택하여 표현됩니다. 
- `Error protocol` 은 에러를 처리하는 것에 대해 사용될 수 있음을 나타냅니다. 
```swift
enum VendingMachineError: Error {
case invalidSelection
case insufficientFunds(coinsNeeded: Int)
case outOfStock
}
```
- 에러가 발생할 수 있는 함수, 메서드 는 파라미터 뒤에 `throws` 키워드를 작성합니다.
- 함수, 메서드가 반환타입이 지정되어 있다면 `throws` 키워드는 반환 화살표 (->) 전에 작성합니다.
```swift
func canThrowErrors() throws {}
func canThrowErrors() throws -> String {}
```
- `if, guard` 등 을 사용해 특정 조건에 `Error` 프로토콜을 채택한 열거형의 `case`를 던져줄수 있습니다.
```swift
guard item.price <= coinsDeposited else {
throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
}
```
위의 예시는 가진돈 보다 상품의 가격이 높을때 `endingMachineError.insufficientFunds` error를 던질수 있도록 작성된 코드

#### Handling Errors Using Do-Catch
- `do-catch` 구문을 사용하여 코드의 블럭을 실행하여 에러를 처리합니다.
- `do` 절에서 error 가 발생되면 발생된 `error` 를 `catch` 절 에서 비교하여 어떻게 처리해줄지 결정 합니다.
```swift
do {
try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
print("Invalid Selection.")
```
위의 예시에서 `do` 절의 `try`는 `buyFavoriteSnack` 함수,메서드 가 `error` 를 던질수 있다는것을 의미합니다.
`buyFavoriteSnack` 에서 던져진 error 가 `VendingMachineError.invalidSelection` 일 경우 `print("Invalid Selection.")`를 실행 하라는 뜻으로 해석 할수 있다.

## PR 후 개선사항
1. 기존 재료 비교 함수
```swift
func checkStock(menu: Menu) throws {
        for (ingredent, amount) in menu.recipie {
            guard let stock = fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            guard amount <= stock else {
                throw FruitStoreError.outOfStock
            }
            fruitList[ingredent] = stock - amount
        }
    }
```
위 함수에서 재료가 두개인 쥬스의 경우 첫 번째 재료는 재고가 있어 차감이 진행되었는데 두 번째 재료는 재료가 없어 음료를 만들지 못했음에도 첫 번째 재료는 차감된 그대로 방치되는 상황 발생.
- 변경후 함수
```swift
    func checkStock(menu: Menu) throws {
        for (ingredent, amount) in menu.recipe {
            guard let stock = store.fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            guard amount <= stock else {
                throw FruitStoreError.outOfStock
            }
        }
        
        for (ingredent, amount) in menu.recipe {
            try store.calculateStock(fruit: ingredent, amount: amount, calculationType: .minus)
        }
    }
```
위의 함수에서 반복문으로 Menu 에 들어가는 재료가 모자라진 않는지 확인한후
두번째 반복문에서 재고를 관리하는 calculateStock() 메서드를 재사용 하여 재고를 차감하도록 수정함

2. Error Handling 방법 변경
Error Handling 을 하기위해 do-catch 문 내부에서 catch 구문에 각 에러 케이스들을 나열해 두었으나 바인딩,다운캐스팅을 활용하고 switch 를 이용하여 전체 에러를 확인할 수 있도록 수정함

- 변경전
```swift
func makeJuice(menu: Menu) {
        do {
            try checkStock(menu: menu)
        } catch FruitStoreError.outOfStock {
            print("재고 없음!")
        } catch FruitStoreError.invalidSelection {
            print("선택된 과일이 없습니다.")
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
```
- 변경후
```swift
func makeJuice(menu: Menu) {
        do {
            try checkStock(menu: menu)
        } catch let error as FruitStoreError {
            switch error {
            case .invalidSelection:
                print("선택된 과일이 없습니다.")
            case .outOfStock:
                print("재고 없음!")
            } 
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
```
3. 메서드 재사용 
JuiceMaker 에서 checkStock 을 호출시 쥬스레시피에 따라 과일의 재고를 차감시키는 기능을 FruitStore 의 과일을 재고를 관리하는 기능인 calculateStock 를 사용하여 calculateStock 메서드를 재사용 할수있도록 수정함

- 변경전
```swift
func checkStock(menu: Menu) throws {
        for (ingredent, amount) in menu.recipie {
            guard let stock = store.fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            guard amount <= stock else {
                throw FruitStoreError.outOfStock
            }
        }
        try store.minusStock(menu: menu)
    }
```

- 변경후
```swift
    func checkStock(menu: Menu) throws {
        for (ingredent, amount) in menu.recipe {
            guard let stock = store.fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            guard amount <= stock else {
                throw FruitStoreError.outOfStock
            }
        }
        
        for (ingredent, amount) in menu.recipe {
            try store.calculateStock(fruit: ingredent, amount: amount, calculationType: .minus)
        }
    }
```





## STEP 2 기능 구현
- navigationController를 이용한 화면 전환 기능 구현
-> segue 사용 시 이 프로젝트에서는 크게 문제가 없으나 프로젝트 규모가 커질 경우 각 segue를 관리하기 힘들어질 것이라는 판단하에 moveToManageView 함수에 코드로 구현
- 재고 표시 함수(showStock) 구현
- 각 주문 버튼 별로 outlet생성 및 하나의 IBAction으로 이어 각 버튼에 따라 다른 동작을 시행할 수 있게 구현
- JuiceMaker구조체에서 구현한 오류 캐치 구문인 makeJuice함수 viewController로 이동
-> 구조체 내에서 alert을 호출 할 수 있는 방법이 생각나지 않아(있어도 불필요한 작업이 너무 많아) 이동
- 각 상황에 맞는 alert생성 함수 구현
- 현재 기능들이 클래스 외부에서 사용되지 않는 경우 은닉화 진행

## 고민했던 것들
1. 각 과일의 Label 에 String 값을 어떻게 넣어줄지 고민함
- switch 와 for 문을 이용한 방법
```swift 
    private func showStock() {
        for (fruit, stock) in  juiceMaker.store.fruitList {
            switch fruit {
            case .strawberry:
                self.strawberryStockLabel.text = String(stock)
            case .banana:
                self.bananaStockLabel.text = String(stock)
            case .pineapple:
                self.pineappleStockLabel.text = String(stock)
            case .kiwi:
                self.kiwiStockLabel.text = String(stock)
            case .mango:
                self.mangoStockLabel.text = String(stock)
            }
        }
    }
```
- Label 을 배열에 넣어 사용한 방법
```swift
 lazy var stocks: [Fruits : UILabel] = [
        .strawberry : strawberryStockLabel,
        .banana : bananaStockLabel,
        .pineapple : pineappleStockLabel,
        .kiwi : kiwiStockLabel,
        .mango : mangoStockLabel]

 override func viewDidLoad() {
        super.viewDidLoad()
        for (fruit, stock) in juiceStore.store.fruitList {
            guard let fruitLabel = stocks[fruit] else { return }
            fruitLabel.text = String(stock)
        }
    }
```
재고 표시 함수 코드를 작성할 때는 후자의 방법을 이용해 작성하는 것이 더 보기 좋다고 생각했으나 전체적으로 봤을 때 Label을 배열로 관리하게 되면 가독성이 떨어진다고 생각해 전자의 방법을 선택
2. alert 
- alert의 중복제거를 위한 고민
-> invalideSelection에러와 알 수 없는 오류, 주문 완료 후 나타나는 alert을 하나하나 만들어 줬으나 title과 message를 매개변수로 받아 하나의 함수로 통합
-> alert 함수 통합 이후 주문 완료 alert의 경우 최초에는 메뉴에 따라 하나하나 메세지를 수정해 호출하는 함수로 구현하였으나 *`"메뉴에 따라"`* 작동한다는 사실에 초점을 두어 열거형 Menu 에 메세지를 return 하는 연산 프로퍼티 추가하여 간단하게 작성

- alert 을 error 열거형 처럼 관리해줄수는 없을까? 고민
열거형은 View 가 아니기 때문에 alert 을 띄우도록 하는 present 를 사용할수 없으며
저장 프로퍼티를 갖지 못하기때문에 연산프로퍼티를 활용할 방법을 찾아보았으나
사례를 찾을수 없었고 불가능 할것 같지는 않지만 지금의 실력으로 구현하기에는 무리가 있어보여 실패함

## 배운 개념
### 1. alert
### 2. 여러개의 버튼을 하나의 @IBAction 에 연결해서 조건문으로 버튼을 관리하는 방법
### 3. ViewController life cycle
![](https://i.imgur.com/ASSlasn.jpg)

## PR 후 개선사항
### tag를 사용해 함수 간략화 및 함수 호출 중복 제거

- 변경 전
```swift
    @IBAction func touchToOrderJuice(_ sender: UIButton) {
        switch sender {
        case ddalBaJuiceOrderButton:
            makeJuice(menu: .ddalBaJuice)
        case mangKiJuiceOrderButton:
            makeJuice(menu: .mangKiJuice)
        case strawberryJuiceOrderButton:
            makeJuice(menu: .strawberryJuice)
        case bananaJuiceOrderButton:
            makeJuice(menu: .bananaJuice)
        case pineappleJuiceOrderButton:
            makeJuice(menu: .pineappleJuice)
        case kiwiJuiceOrderButton:
            makeJuice(menu: .kiwiJuice)
        case mangoJuiceOrderButton:
            makeJuice(menu: .mangoJuice)
        default:
            presentBasicAlert(title: "경고", message: "알 수 없는 오류.")
        }
```
- 변경 후
```swift
    @IBAction func touchToOrderJuice(_ sender: UIButton) {
        guard let menu = Menu(rawValue: sender.tag) else {
            presentBasicAlert(title: "경고", message: "알 수 없는 오류.")
            return
        }
        makeJuice(menu: menu)
        showStock()
    }
```

## STEP 3 기능 구현
- MainViewController 타입 확장
    - ManageViewControllerDelegate 프로토콜을 채택후 전달된 값을 받는 함수(sendStocks)
- ManageViewControllerDelegate 프로토콜 구현
    - 데이터를 전달할 함수(sendStocks)
- ManageViewController 타입 구현
    - 현재 과일 재고 를 재고화면 의 label 에 적용 하는 함수(showStock)
    - 닫기 버튼 터치시 현재 view 를 제거 하는 함수(touchCloseButton)
    - 스테퍼 버튼 터치시 label 의 값이 변경되는 함수(touchStepper)
    - 변경된 스테퍼의 value 를 과일재고 에서 차감 해주고 다른 객체로 전달 해주는 함수(changeStocks) 
    - 확인 버튼 터치시 과일의 재고가 변경된 것을 적용할것인지 아닌지 alert 을 띄워주는 함수(touchConfirmButton)

## 고민했던 것들
### data전달 방식의 선택
1. 값을 넘겨 줄 때
```swift 
let manageVC = self.storyboard?.instantiateViewController(withIdentifier: "ManageViewController")
```
코드로 화면 전환을 구현하기 위해 *`manageVC`* 라는 *`ManageViewController`* 의 인스턴스를 생성 했으며 이미 생성된 인스턴스를 활용하고자 해당 인스턴스를  *`ManageViewController`* 로 다운캐스팅만 진행해 data를 넘겨줌.
```swift
guard let manageVC = self.storyboard?.instantiateViewController(withIdentifier: "ManageViewController") as? ManageViewController else { return }
```

2. 재고 관리 화면에서 변경된 값을 가져올 때(delegate패턴 vs notification)

- notification의 userInfo는 *`[AnyHashable : Any]`* 타입의 딕셔너리로 값을 주고 받기에 딕셔너리의 key와 value를 꺼내서 쓰는 해당 어플에서는 delegate패턴이 더 유리하다고 생각.
### 코드를 간소화 시킬 때 가독성의 문제


dictionary를 통해서 코드를 많이 간소화 시켰고 가독성 또한 크게 떨어지지 않는다고 생각함.
변경전
```swift 
    @IBAction func touchStepper( sender: UIStepper) {
     switch sender {
        case strawberryStepper:
            self.strawberryStockLabel.text = String(Int(sender.value))
        case bananaStepper:
            self.bananaStockLabel.text = String(Int(sender.value))
        case pineappleStepper:
            self.pineappleStockLabel.text = String(Int(sender.value))
        case kiwiStepper:
            self.kiwiStockLabel.text = String(Int(sender.value))
        case mangoStepper:
            self.mangoStockLabel.text = String(Int(sender.value))
        default:
            print("에러")
        }   
    }
```

변경 후 
```swift 
    @IBAction func touchStepper( sender: UIStepper) {
            let selectedStepperDic = stepperDic.filter{ $0.value == sender }
            selectedStepperDic.forEach{ fruit, stepper in labelDic[fruit]?.text = String(Int(sender.value)) }
    }
```
다만 위 코드는 간소화를 시켰으나 코드를 볼때 직관성이 많이 떨어진다고 생각하는데 기능적인 측면에서는 큰 차이가 없다고 생각이 든다면 코드가 길어져도 상관이 없는건지 고민.
(길어진 코드의 가독성이 더 좋다고 생각된다면.)

## 배운 개념
1. notification
2. delegate 패턴
3. autolayout 사용법

## PR 후 개선사항
