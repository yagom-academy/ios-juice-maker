import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet weak private var strawberryCountLabel: UILabel!
    @IBOutlet weak private var bananaCountLabel: UILabel!
    @IBOutlet weak private var pineappleCountLabel: UILabel!
    @IBOutlet weak private var kiwiCountLabel: UILabel!
    @IBOutlet weak private var mangoCountLabel: UILabel!
    private lazy var fruitCountLabels: [UILabel] = [
        strawberryCountLabel,
        bananaCountLabel,
        pineappleCountLabel,
        kiwiCountLabel,
        mangoCountLabel
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitsCountLabelsTag()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateAllFruitsCountLabel()
    }
    
    private func setFruitsCountLabelsTag() {
        for (index, label) in fruitCountLabels.enumerated() {
            label.tag = index + 1
        }
    }
    
    private func updateFruitCountLabel(by fruit: Fruits) {
        guard let label = view.viewWithTag(fruit.tagNumber) as? UILabel else { return }
        guard let fruitCount = JuiceMaker.shared.fruitList[fruit] else { return }
        label.text = String(fruitCount)
    }
    
    private func updateFruitCountLabel(by fruitJuice: FruitJuice) {
        for (fruit, _) in fruitJuice.ingredients {
            updateFruitCountLabel(by: fruit)
        }
    }
    
    private func updateAllFruitsCountLabel() {
        for fruit in Fruits.allCases {
            updateFruitCountLabel(by: fruit)
        }
    }
    
    private func order(fruitJuice: FruitJuice) {
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .alert)
        
        do {
            try JuiceMaker.shared.makeFruitJuice(of: fruitJuice)
            updateFruitCountLabel(by: fruitJuice)
            showJuiceComeOutAlert(alert, fruitJuice: fruitJuice)
        } catch JuiceMakerError.underFlowOfAmount {
            showFruitsOutOfStockAlert(alert)
        } catch {
            debugPrint(error)
        }
    }
    
    private func showJuiceComeOutAlert(_ alert: UIAlertController, fruitJuice: FruitJuice) {
        let message = String(format: "%@ 나왔습니다! 맛있게 드세요!", fruitJuice.menuName)
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        
        alert.message = message
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showFruitsOutOfStockAlert(_ alert: UIAlertController) {
        let message = "재료가 모자라요. 재고를 수정할까요?"
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            guard let vc = self.storyboard?.instantiateViewController(identifier: "modifyFruitVC") else {
                return
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        let cancleAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.message = message
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        present(alert, animated: true)
    }
    
    @IBAction private func touchUpModifyFruitsStockButton(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(identifier: "modifyFruitVC") else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction private func touchUpFruitJuiceOrderButton(_ sender: UIButton) {
        let fruitJuice: FruitJuice
        guard let fruitJuiceOrderButtonID = sender.restorationIdentifier else {
            return
        }
        
        switch fruitJuiceOrderButtonID {
        case FruitJuice.strawberryJuice.orderButtonID:
            fruitJuice = .strawberryJuice
        case FruitJuice.mangoJuice.orderButtonID:
            fruitJuice = .mangoJuice
        case FruitJuice.kiwiJuice.orderButtonID:
            fruitJuice = .kiwiJuice
        case FruitJuice.pineappleJuice.orderButtonID:
            fruitJuice = .pineappleJuice
        case FruitJuice.bananaJuice.orderButtonID:
            fruitJuice = .bananaJuice
        case FruitJuice.mangoKiwiJuice.orderButtonID:
            fruitJuice = .mangoKiwiJuice
        case FruitJuice.strawberryBananaJuice.orderButtonID:
            fruitJuice = .strawberryBananaJuice
        default:
            return
        }
        
        order(fruitJuice: fruitJuice)
    }
}
