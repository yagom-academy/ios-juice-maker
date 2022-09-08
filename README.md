## UML Diagram
![](https://i.imgur.com/vhFSCPA.png)


# STEP02 - No noti

1. 버튼을 구현하는 다른 방법.
- 기존에 Restoration ID, Accessibility ID를 이용한 버튼 식별말고, 버튼하나하나 아울렛으로 선언해 스위치 문을 통해 버튼을 식별해 보았습니다.
```swift
    @IBOutlet weak var strawberryBananaOrder: UIButton!
    @IBOutlet weak var mangoKiwiOrder: UIButton!
    @IBOutlet weak var strawberryOrder: UIButton!
    @IBOutlet weak var bananaOrder: UIButton!
    @IBOutlet weak var pineappleOrder: UIButton!
    @IBOutlet weak var kiwiOrder: UIButton!
    @IBOutlet weak var mangoOrder: UIButton!

    @IBAction private func tappedOrderButton(_ sender: UIButton) {
        var juice: Juice?
        
        switch sender {
        case strawberryBananaOrder:
            juice = .strawberryBananaJuice
        case mangoKiwiOrder:
            juice = .mangoKiwiJuice
        case strawberryOrder:
            juice = .strawberryJuice
        case bananaOrder:
            juice = .bananaJuice
        case pineappleOrder:
            juice = .pineappleJuice
        case kiwiOrder:
            juice = .kiwiJuice
        case mangoOrder:
            juice = .mangoKiwiJuice
        default:
            juice = nil
        }
        
        guard let juice = juice else { return }
        
        if juiceMaker.makeJuice(juice) {
            self.madeJuiceAlert(message: juice.name)
        } else {
            self.failedAlert()
        }
    }
```
- 비록 메서드와 선언이 길어졌지만, 오히려 직관적이고 한눈에 들어와 코드를 쉽게 이해할 수 있는 장점이 있다고 생각하였습니다.
- 이전에 사용했던 버튼 레이블을 사용하여 식별하는 방법은 코드가 간결해지는 장점이 있지만, 코드를 쉽게 이해할 수 없고, 레이블의 이름이 바뀐다면 그 부분에 대해 대응하기 힘들다는 단점이 있는 것 같습니다.

2. KVO를 이용한 데이터 전달.
- 기존에 사용하던 알림센터를 지우고 KVO를 사용해보았습니다. 
```swift
class FruitStore: NSObject {
    @objc dynamic private(set) var stock: [Int]
}

class MainViewController: UIViewController {
    @objc let store = FruitStore(stockCount: 10)
    private lazy var juiceMaker = JuiceMaker(store: store)
    
    private var stockChangeObserver: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockChangeObserver = observe(\.store.stock,
                                       options: [.new, .initial],
                                       changeHandler: { (object, stock) in
            guard let newStock = stock.newValue else { return }
            self.updateStockCount(stock: newStock)
        })
    }
```
- 저희가 사용하며 느꼈던 KVO의 단점은, 프로퍼티 옵저버와 마찬가지로 값이 변화할 때 마다 옵저빙을 하는 방식인데, 이 방법을 사용하려면 하나의 프로퍼티가 반드시 필요하다는 것이었습니다. 알림센터의 경우 꼭 프로퍼티의 값이 변화하는 것이 아니라도 원하는 시점에 `post`를 호출할 수 있었는데, KVO는 값이 변하는것을 감지하는 방식이다 보니, 이부분에서 어려움이 있었습니다.

- 기존 알림센터를 사용 시 쥬스 메이커가 실패와 성공을 `post`하는 방식으로 데이터와 정보를 전달하였었습니다.
```swift
struct JuiceMaker {
    func makeJuice(_ juice: Juice) {
        if store.canSupplyRequest(ingredient: juice.ingredient) {
            NotificationCenter.default.post(name: .madeJuiceAlert,
                                            object: nil,
                                            userInfo: ["JuiceName" : juice.name])
        } else {
            NotificationCenter.default.post(name: .failedAlert,
                                            object: nil)
        }
    }
}
```
- 하지만 KVO의 경우, 이런 방식으로 정보를 전달 해주려면 `makeJuice`메서드가 성공과 실패를 의미하는 어떠한 데이터를 반환하고, 그 값을 메인 뷰 컨트롤러에서 받아서 그 값을 변수로 넣어주면서 변하는 값을 옵저빙해야만 했습니다.
```swift
struct JuiceMaker {
    func makeJuice(_ juice: Juice) -> String {
        if store.canSupplyRequest(ingredient: juice.ingredient) {
            return juice.name
        } else {
            return ""
        }
    }
    
class MainViewController: UIViewController {
    @objc let store = FruitStore(stockCount: 10)
    private lazy var juiceMaker = JuiceMaker(store: store)
    var juiceName: String = ""
    
    private var stockChangeObserver: NSKeyValueObservation?
    private var makingJuiceObserver: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockChangeObserver = observe(\.store.stock,
                                       options: [.new, .initial],
                                       changeHandler: { (object, stock) in
            guard let newStock = stock.newValue else { return }
            self.updateStockCount(stock: newStock)
        })
        
        makingJuiceObserver = observe(\.juiceName,
                                       options: [.new, .initial],
                                       changeHandler: { (object, name) in
            guard let juiceName = name.newValue else { return }
                                                       
            if !juiceName.isEmpty {
                self.madeJuiceAlert(message: juiceName)
            } else {
                self.failedAlert()
            }
        })
        
```
- 하지만, `juiceName`이라는 변수를 하나 더 생성하게 되고, `""`이라는 매직 리터럴을 사용하게 됨 과 동시에 너무 하드 코딩한다는 느낌이 들어서 이부분을 KVO방식이 아닌 버튼을 눌렀을 때 바로 그 처리를 하는 방식으로 수정하였습니다.

- 그리고 어떤 버튼인지 구분하는 로직과 실제 쥬스를 만들 수 있는지 확인하는 로직을 구분하여 구현해보았습니다.
```swift
    @IBAction private func tappedOrderButton(_ sender: UIButton) {
        var juice: Juice?
        
        switch sender {
        case strawberryBananaOrder:
            juice = .strawberryBananaJuice
        case mangoKiwiOrder:
            juice = .mangoKiwiJuice
        case strawberryOrder:
            juice = .strawberryJuice
        case bananaOrder:
            juice = .bananaJuice
        case pineappleOrder:
            juice = .pineappleJuice
        case kiwiOrder:
            juice = .kiwiJuice
        case mangoOrder:
            juice = .mangoKiwiJuice
        default:
            juice = nil
        }
        
        checkCanMakeJuice(juice)
    }
    
    private func checkCanMakeJuice(_ juice: Juice?) {
        guard let juice = juice else { return }
        
        if juiceMaker.makeJuice(juice) {
            self.madeJuiceAlert(message: juice.name)
        } else {
            self.failedAlert()
        }
    }
```
3. 뷰 컨트롤러간 데이터 전달을 위해 만든 싱글톤 패턴.
- 저희가 또 고민했던 부분은 뷰 컨트롤러간 데이터를 전달하는 방식이었습니다. 말씀해주신 부분 처럼, 화면 전환과 함께 값을 직접적으로 전달하게 되면 뷰 컨트롤러간 결합도가 강해지는 문제가 있었습니다. 이 문제를 해결하기 위해 처음 생각한 방법은 위임자 패턴 이었습니다.

```swift
//MARK: - 메인 뷰 소스 파일
protocol SendDataDelegate: AnyObject {
    func sendStock(_ stock: [Int])
}

class MainViewController: UIViewController {
    weak var delegate: SendDataDelegate?
    
    @IBAction private func tappedModifyBarButton(_ sender: Any) {
        delegate?.sendStock(store.stock)
        present(navigationController, animated: true)
    }
}

//MARK: - 재고수정 소스 파일
extension EditViewController: SendDataDelegate {
    func sendStock(_ stock: [Int]) {
        updateStockCount(stock: stock)
    }
}

class EditViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        
        mainViewController.delegate = self
    }
}
```
- 하지만, 이 방법으로 사용하는 것은 실패했습니다.. 정확한 이유를 열심히 찾아보았지만 찾을 수는 없었고, 저희는 재고수정하는 소스파일의 뷰컨트롤러 안에서 새로운 메인 뷰 컨트롤러를 인스턴스화 하고 위임자를 지정하는데, 그 위임자가 현재 실행중인 메인 뷰가 아니라 새로 만든 인스턴스이기 때문이라고 생각하였습니다.

- 이 반대의 상황이라면(재고 수정에서 메인으로 데이터를 전달하고자 할때), 모달 창이 `dismiss`되면서 메모리상에서 사라졌다가, 다시 창을 부르면 새롭게 인스턴스화 시켜서 `present`하기 때문에 가능할 거 같다고 생각했습니다. 이는 step3에서 시도해보기로 했습니다.

- 저번에 미팅을 통해 말씀해주신 부분(생각하는 기능들은 거의 대부분 구현 가능하다!)처럼, 분명 여기서 위임자를 통해 재고수정 뷰에 값을 넘겨주는 방법이 있을 것 같은데, 찾지를 못하였습니다.. 저희가 이부분에서 추가로 찾아봐야할 키워드나 방향성이 있을까요?

- 무튼, 이 다음 저희가 생각한 방식은 `appDelegate`를 활용하는 것이었습니다. `appDelegate`안에 `stock`을 선언하고 장면 전환시 여기에 데이터를 전달한 후, 뷰가 새로 올라올 때 이 데이터를 취하는 방식이었습니다.
```swift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var stock: [Int]?
    
}
//MARK: - 메인 뷰 소스 파일
class MainViewController: UIViewController {    
    @IBAction private func tappedModifyBarButton(_ sender: UIBarButtonItem) {
        guard let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "EditNavigationController") as? UINavigationController else { return }
        navigationController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.stock = store.stock
        
        present(navigationController, animated: true)
    }
}

//MARK: - 재고수정 소스 파일
class EditViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
              let delegateStock = delegate.stock else { return }
        updateStockCount(stock: delegateStock)
        delegate.stock = nil
    }
```
- 이 방법을 활용하니 하나의 저장소를 만들어서 그 저장소를 통해 데이터를 주고받기 때문에, 결합도를 낮출 수 있다고 판단하였습니다.

- 하지만, `app delegate`에 대해 더 찾아본 결과, 이 `app delegate`는 앱의 상태에 따라 응답하는 콘텐츠가 그려지는 창(window)을 만드는 역할이고, entry point와, 앱의 입력 이벤트를 전달하는 run loop를 생성하는 역할이라고 하는데, 공부하지 못한 부분이 너무 많아 정확하게 이해는 안되었지만, 이 용도로 쓰는 부분이 아니라는 것은 확실한 느낌이었습니다.

- 하지만 이 `AppDelegate`가 마치 싱글톤 처럼 사용되는 느낌을 받아서, 차라리 스토리지용 싱글톤을 만들어보자! 라고 생각하였습니다.
```swift

//MARK: - 재고스토리지 소스 파일
class StockStorage {
    static let shared: StockStorage = StockStorage()
     var stock: [Int]?
    
    private init() {}
}

//MARK: - 메인 뷰 소스 파일
class MainViewController: UIViewController {
    @IBAction private func tappedModifyBarButton(_ sender: Any) {
        guard let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "EditNavigationController") as? UINavigationController else { return }
        navigationController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        navigationController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        StockStorage.shared.stock = store.stock
        
        present(navigationController, animated: true)
    }
}

   //MARK: - 재고수정 소스 파일 
class EditViewController: UIViewController {
    
    @IBOutlet var fruitCountLabelArray: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let storageStock = StockStorage.shared.stock else { return }
        
        updateStockCount(stock: storageStock)
        StockStorage.shared.stock = nil
    }
}
```
- 이러한 용도로 싱글톤을 사용하는 것이 적절한지 약간의 의문이 있었지만, 기존에 사용하던 방법보다는 더 나은 방법이라 판단하였고, 데이터를 전달 받은 후 다시 `nil`을 할당해 메모리에서 해제시켜줘서 메모리에 필요할 때만 상주하도록 해보았습니다. 물론 `shared`가 메모리에 상주하게 되겠지만, 이런식으로 하면 결합도를 낮추면서 메모리를 최소한으로 사용할 수 있을것이라는 생각에 싱글톤을 사용해 보았습니다.
