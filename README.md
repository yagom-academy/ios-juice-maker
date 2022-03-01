# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

# 쥬스메이커
- 팀원: 쿼카, 도니
- 리뷰어: 개굴

# UML
![juiceMaker_Step1_UML](https://user-images.githubusercontent.com/74251593/155289035-e6babcc5-e609-425c-b967-0806c1ee272c.png)

# [STEP1] 
# 고민되었던점
- class와 struct 사용에대해 고민했습니다.
- FruitStore내에 Fruit타입을 두는게 좋을지에 대해서 FruitStore안에 과일이 있다고 생각되어 중첩타입으로 묶었습니다.
- changeFruitQuantity()메서드에대한 재사용성을 고려했습니다. plus를 시키는 메서드와 minus를 시키는 메서드 둘다 만들기보다 minus를 해야하는 수에 - 를 붙여서 마이너스인 경우는 차감하고 플러스인경우는 더하게끔 구현을 해보았습니다.
- 코드 개선
subtractFruitQuantity메서드 내 self.fruitStore.changeFruitQuantity코드가 중복되는데 코드 개선을 해볼수있을까요 ?

[Before]
```Swift=
    private func subtractFruitQuantity(for juice: Juice) {
        switch juice {
        case .strawberry:
            fruitStore.changeFruitQuantity(by: .strawberry, count: juice.recipe[.strawberry] ?? 0)
        case .banana:
            fruitStore.changeFruitQuantity(by: .banana, count: juice.recipe[.banana] ?? 0)
        case .pineapple:
            fruitStore.changeFruitQuantity(by: .pineapple, count: juice.recipe[.pineapple] ?? 0)
        case .kiwi:
            fruitStore.changeFruitQuantity(by: .kiwi, count: juice.recipe[.kiwi] ?? 0)
        case .mango:
            fruitStore.changeFruitQuantity(by: .mango, count: juice.recipe[.mango] ?? 0)
        case .strawberryBanana:
            fruitStore.changeFruitQuantity(by: .strawberry, count: juice.recipe[.strawberry] ?? 0)
            fruitStore.changeFruitQuantity(by: .banana, count: juice.recipe[.banana] ?? 0)
        case .mangoKiwi:
            fruitStore.changeFruitQuantity(by: .mango, count: juice.recipe[.mango] ?? 0)
            fruitStore.changeFruitQuantity(by: .kiwi, count: juice.recipe[.kiwi] ?? 0)
        }
    }
```
[After]
```Swift=
    private func subtractFruitQuantity(for juice: Juice) {
        juice.recipe.forEach { (fruit: Juice.Fruit, count: Int) in
            fruitStore.changeFruitQuantity(by: fruit, count: count)
        }
    }
```

# [STEP2]
# 고민되었던점&문제해결
- 쥬스주문하는 Action메서드들을 구현하게될때 중복코드가 발생하였던 것을 convertToJuice 메서드로 Juice값을 확인해주어 해결해주었습니다.
- 재고수정화면으로 이동시 identifier를 이용한 하드코딩 문제를 identifier타입 메서드 생성하여 해결하였습니다.
- 얼럿메세지 출력시 쥬스 이름값을 같이 출력하는 부분 -> 매개변수로 juice를 받고 juice내에 이름이라는 연산프로퍼티를 만들어 string값을 반환해주었습니다.
- STEP2 기능구현보다 더 많은 기능구현을 하게된것을 알게되어 요구사항에 맞는 기능구현을 준수하기위해 커밋을 reset하여 다시 진행하였습니다.
-  얼럿에 사용되는 문자열들이 하드코딩이 발생하여 이를 방지하기위해 AlertMessage라는 열거형으로 담아주었습니다.

# 조언을 얻고 싶은 부분
* 화면이동시 identifier로 접근을 시도하였는데 ViewController를 다운캐스팅하여 타입을 확인하는 방법도 있었지만 단순한 identifier를 사용해보았습니다. 조언해주실 부분이 있다면 조언부탁드립니다.
* updateFruitStockCountLabel() 메서드내 bringStockValue중복 코드를 개선해볼 수 있을까요 ??
- [IBAction중복코드 해결]

[Before]

```Swift=
    @IBAction func orderStrawberryBananaButton(_ sender: Any) {
        makeJuice(.strawberryBanana) ? showSuccessAlert() : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction func orderStrawberryButton(_ sender: Any) {
        makeJuice(.strawberry) ? showSuccessAlert() : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction func orderBananaButton(_ sender: Any) {
        makeJuice(.banana) ? showSuccessAlert() : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction func orderPineappleButton(_ sender: Any) {
        makeJuice(.pineapple) ? showSuccessAlert() : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction func orderMangoKiwiButton(_ sender: Any) {
        makeJuice(.mangoKiwi) ? showSuccessAlert() : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction func orderKiwiButton(_ sender: Any) {
        makeJuice(.kiwi) ? showSuccessAlert() : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction func orderMangoButton(_ sender: Any) {
        makeJuice(.mango) ? showSuccessAlert() : showFailureAlert()
        updateFruitStock()
    }
```

[After]
```Swift=
    @IBOutlet weak var sbJuiceButton: UIButton!
    @IBOutlet weak var sJuiceButton: UIButton!
    @IBOutlet weak var bJuiceButton: UIButton!
    @IBOutlet weak var pJuiceButton: UIButton!
    @IBOutlet weak var kJuiceButton: UIButton!
    @IBOutlet weak var mJuiceButton: UIButton!
    @IBOutlet weak var mkJuiceButton: UIButton!

    func filterJuice(sender: UIButton) -> Juice {
        if sender == sbJuiceButton {
            return .strawberryBanana
        } else if sender == sJuiceButton {
            return .strawberry
        } else if sender == bJuiceButton {
            return .banana
        } else if sender == pJuiceButton {
            return .pineapple
        } else if sender == kJuiceButton {
            return .kiwi
        } else if sender == mJuiceButton {
            return .mango
        }
        return .mangoKiwi
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        let juice = filterJuice(sender: sender)
        if juiceMaker.makeJuice(juice) {
            showSuccessAlert(juice: juice)
        } else {
            showFailureAlert()
        }
        updateFruitStock()
    }
```

# 학습키워드
- Classes And Struture
- Initialization, Deinit
- Type Casting
- Erro Handling
- Properties
- Method
- Access Control
- Nested Types
- Model-View-Controller
- Key-value observing
- NSObject
- Alert
- self
- forEach
