# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

# 쥬스메이커
- 팀원: 쿼카, 도니
- 리뷰어: 개굴

# UML
![Untitled](https://user-images.githubusercontent.com/74251593/157680342-4e904059-b021-498d-af48-7409c65df4cd.png)



# [STEP2 PR 후 수정완료]

# 이번 스텝 수행 중 핵심 경험
- 내비게이션 바 및 바 버튼 아이템의 활용
- 얼럿 컨트롤러 활용
- Modality의 활용

# 고민한점 
- 중복코드를 개선
- 하드코딩 방지
- 함수당 기능 한가지
- 화면전환 메서드에 super를 호출해야하는 이유
    * 1. Apple문서에 명시되어 있습니다.
    * 2. Apple은 언젠가 구현을 변경할 수 있으며 super를 생략하는 방향으로 코드를 작성하면 추후에 이상하게 작동을 할 수 있습니다.
    * 3. 올바른 패턴을 배우고 사용하는 것이 좋고 안전을 위해 패턴을 배우고 따르는 것이 좋습니다.
    * 4. subClass에서 메서트, 프로퍼티, 서브스크립트에 override를 제공할 때 기존 슈퍼클래스 구현을 사용하는 것이 유용한 경우가 있습니다. 적절한 경우 super를 사용하여 superClass에 접근합니다.
- 화면전환시 Modality 와 Navigation의 사용
    * 재고수정기능은 독립적인 계층구조로 이어나갈 이유는 없다고 판단했고 독립적인 작업으로서 재고수정이라는 기능에 집중하고 수정이 완료되었으면 종료할 수 있다고 판단함.


# 문제해결
- Notification을 사용하기 위해서는 옵저버 등록이 선행되어야 함을 알게 되었다. 옵저버가 먼저 등록이 되어 있어야 나중에 post를 하게 될때 등록된 옵저버로 데이터가 가게되는 메커니즘을 확실히 알게 되었다. post를 먼저 하고 옵저버 등록을 해도 될거라고 생각하였지만 예제를 돌려보면서 안된다는 것을 알게 되었다.  

# 어려웠던점
- NotificationCenter를 개념을 이해하는데 오래걸렸다. 이유를 생각해보면 NotificationCenter.default.post라는 메서드가 있는데 post는 게시글등록하다 라는 인식이 내머리에 박혀있어 알림들 보내다라는 의미에 가까운걸 자꾸 게시하다로 오해했다. 또한 extension으로 많이 사용되는 Notification.Name에 값을 넣는것은 발신자와 수신자가 서로를 확인하기위한 식별자이다. 마치 해커들끼리 서로만 아는 암호와 비슷하다. 그리고 수신받고자하는자는 addObserver를 등록하면되고 그 옵저버를 등록한 자들에게 post메서드를 실행했을때 수신자들이 전달받게되는것이다.

# 깨달은점
- 무조건 공부는 같이 하는것이 좋은것같다 왜냐하면 혼자 공부할때보다 집중력도 좋아지고 의욕이 생기며 서로이해하고 모르는 부분이 다르기때문이다. 그래서 몰랐던 부분을 알게되기도하고 잘못생각했던 부분을 바로 잡기도하고 지루하지않게 공부할 수 있는것같다.

- 본인이 이해하지 못한건 예제를 만들어 학습하고 설명해보는 것이 좋다. 설명할 수 없는건 이해하지못 했다는 뜻이기때문에 개념을 이해하지못하면 이론을 메모장에 정리해보기도하고 기능구현이 어렵다고하면 직접 예제를 만들어봐야한다. 그래야 자신감도 생기고 실전에서 잘 활용해볼 수 있는것같다.

# 학습키워드
- IBOutlet, IBAction Collection
- enum(rawValue: )
- tag
- String(describing: self)
- Extension
- NotificationCenter
- Alert
- View Life Cycle, super



# 리펙토링한 코드들
## rawValue(:)와 sender.tag는 찰떡궁합

> enum의 TypeName(rawValue(: ))를 사용하게되면 숫자의 값을 넣어줌으로써 case값을 반환할 수 있다.
이 기능은 sender.tag와 꽤나 찰떡궁합이다. 예를들어 UIButton의 값을 입력받아서 enum의 case로 반환해주어야할때 아주 요긴하게 사용된다. 그리고 sender.tag를 사용하게될때 하드코딩이 발생하게되는데 이러한 문제도 해결해줄 수 있었고 가독성도 높일 수 있는것같다

**Example1)**
[Before]
```swift=
    private func convertToJuice(_ sender: UIButton) -> Juice? {
        switch sender.tag {
            case 1:
                return .strawberryBanana
            case 2:
                return .strawberry
            case 3:
                return .banana
            case 4:
                return .pineapple
            case 5:
                return .kiwi
            case 6:
                return .mango
            case 7:
                return .mangoKiwi
            default:
                return nil
            }
        }
```

[After]
```swift=
private func convertToJuice(_ sender: UIButton) -> Juice? {
        switch Juice(rawValue: sender.tag) {
        case .strawberryBanana:
                return .strawberryBanana
        case .strawberry:
                return .strawberry
        case .banana:
                return .banana
        case .pineapple:
                return .pineapple
        case .kiwi:
                return .kiwi
        case .mango:
                return .mango
        case .mangoKiwi:
                return .mangoKiwi
            default:
                return nil
            }
        }
```

**Example2)**

[Before]
```swift=
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    func updateFruitStockCountLabel() {
        strawberryCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .strawberry)
        bananaCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .banana)
        pineappleCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .pineapple)
        kiwiCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .kiwi)
        mangoCountLabel.text = juiceMaker.fruitStore.bringStockValue(for: .mango)
    }
```

[After]
```swift=
    @IBOutlet private var fruitStockLabels: [UILabel]!

    private func updateFruitStockLabels() {
        fruitStockLabels.forEach({
            guard let fruit = FruitStore.Fruit(rawValue: $0.tag) else { return }
            $0.text = juiceMaker.fruitStore.bringStockValue(for: fruit)
        })
    }
```

## Extension UIViewController / identifier 연산프로퍼티
> 이전에는 하나의 클래스에 일일이 아래와 같은 코드를 넣어주어 identifier를 가졌다면, UIViewController를 확장함으로써 UIViewController를 상속받는 모든 클래스에 자동적으로 identifier를 가질 수 있도록 하였습니다.  
```swift=
extension UIViewController {
    static var identifier: String {
        return String(describing: self)
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


