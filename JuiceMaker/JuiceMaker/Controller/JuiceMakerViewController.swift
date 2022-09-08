import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet weak private var strawberryCountLabel: UILabel!
    @IBOutlet weak private var bananaCountLabel: UILabel!
    @IBOutlet weak private var pineappleCountLabel: UILabel!
    @IBOutlet weak private var kiwiCountLabel: UILabel!
    @IBOutlet weak private var mangoCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpQuantityOfFruits()
    }
    
    private func setUpQuantityOfFruits() {
        guard let quantityOfStrawberry = JuiceMaker.shared.fruitStore.fruitList[.strawberry],
              let quantityOfBanana = JuiceMaker.shared.fruitStore.fruitList[.banana],
              let quantityOfPineapple = JuiceMaker.shared.fruitStore.fruitList[.pineapple],
              let quantityOfKiwi = JuiceMaker.shared.fruitStore.fruitList[.kiwi],
              let quantityOfMango = JuiceMaker.shared.fruitStore.fruitList[.mango] else { return }
        strawberryCountLabel.text = String(quantityOfStrawberry)
        bananaCountLabel.text = String(quantityOfBanana)
        pineappleCountLabel.text = String(quantityOfPineapple)
        kiwiCountLabel.text = String(quantityOfKiwi)
        mangoCountLabel.text = String(quantityOfMango)
    }
    
    private func showJuiceComeOutAlert(fruitJuice: FruitJuice) {
        let message = "\(fruitJuice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!"
        let alert = UIAlertController(title: nil,
                                      message: String(format: message),
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    private func showFruitsOutOfStockAlert() {
        let message = "재료가 모자라요. 재고를 수정할까요?"
        let alert = UIAlertController(title: nil,
                                      message: String(format: message),
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "modifyFruitVC")
            self.present(vc, animated: true, completion: nil)
        }
        
        let cancleAction = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        present(alert, animated: true)
    }
    
    @IBAction private func touchUpFruitJuiceOrderButton(_ sender: UIButton) {
        let fruitJuice: FruitJuice
        
        switch sender.restorationIdentifier {
        case "strawberryBananaJuiceOrderButton":
            fruitJuice = .strawberryBananaJuice
        case "mangoKiwiJuiceOrderButton":
            fruitJuice = .mangoKiwiJuice
        case "strawberryJuiceOrderButton":
            fruitJuice = .strawberryJuice
        case "bananaJuiceOrderButton":
            fruitJuice = .bananaJuice
        case "pineappleJuiceOrderButton":
            fruitJuice = .pineappleJuice
        case "kiwiJuiceOrderButton":
            fruitJuice = .kiwiJuice
        case "mangoJuiceOrderButton":
            fruitJuice = .mangoJuice
        default:
            return
        }
        
        order(fruitJuice)
    }
    
    private func order(_ fruitJuice: FruitJuice) {
        if !JuiceMaker.shared.takeAnOrder(fruitJuice: fruitJuice) {
            showFruitsOutOfStockAlert()
        } else {
            setUpQuantityOfFruits()
            showJuiceComeOutAlert(fruitJuice: fruitJuice)
        }
    }
}

