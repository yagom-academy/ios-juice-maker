import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quantityOfStrawberryLabel: UILabel!
    @IBOutlet weak var quantityOfBananaLabel: UILabel!
    @IBOutlet weak var quantityOfPineappleLabel: UILabel!
    @IBOutlet weak var quantityOfKiwiLabel: UILabel!
    @IBOutlet weak var quantityOfMangoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpQuantityOfFruits()
    }
    
    func setUpQuantityOfFruits() {
        guard let quantityOfStrawberry = JuiceMaker.shared.fruitStore.fruitList[.strawberry],
              let quantityOfBanana = JuiceMaker.shared.fruitStore.fruitList[.banana],
              let quantityOfPineapple = JuiceMaker.shared.fruitStore.fruitList[.pineapple],
              let quantityOfKiwi = JuiceMaker.shared.fruitStore.fruitList[.kiwi],
              let quantityOfMango = JuiceMaker.shared.fruitStore.fruitList[.mango] else { return }
        quantityOfStrawberryLabel.text = String(quantityOfStrawberry)
        quantityOfBananaLabel.text = String(quantityOfBanana)
        quantityOfPineappleLabel.text = String(quantityOfPineapple)
        quantityOfKiwiLabel.text = String(quantityOfKiwi)
        quantityOfMangoLabel.text = String(quantityOfMango)
    }
    
    func showJuiceComeOutAlert(fruitJuice: FruitJuice) {
        let alert = UIAlertController(title: nil,
                                      message: "\(fruitJuice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    func showFruitsOutOfStockAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요. 재고를 수정할까요?",
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
    
    @IBAction func touchUpFruitJuiceOrderButton(_ sender: UIButton) {
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
    
    func order(_ fruitJuice: FruitJuice) {
        if !JuiceMaker.shared.takeAnOrder(fruitJuice: fruitJuice) {
            showFruitsOutOfStockAlert()
        } else {
            setUpQuantityOfFruits()
            showJuiceComeOutAlert(fruitJuice: fruitJuice)
        }
    }
}

