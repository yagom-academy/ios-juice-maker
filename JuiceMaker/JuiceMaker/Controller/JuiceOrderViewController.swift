
import UIKit

class JuiceOrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    private let fruitStore: FruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryBananaOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiOrderButton: UIButton!
    @IBOutlet weak var strawberryOrderButton: UIButton!
    @IBOutlet weak var bananaOrderButton: UIButton!
    @IBOutlet weak var mangoOrderButton: UIButton!
    @IBOutlet weak var kiwiOrderButton: UIButton!
    @IBOutlet weak var pineappleOrderButton: UIButton!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsStock()
    }

    @IBAction func clickJuiceButton(_ sender: UIButton) {
        var juice: Juices
        
        switch sender {
        case strawberryOrderButton: juice = .strawberry
        case strawberryBananaOrderButton: juice = .strawberrybanana
        case bananaOrderButton: juice = .banana
        case mangoKiwiOrderButton: juice = .mangokiwi
        case mangoOrderButton: juice = .mango
        case kiwiOrderButton: juice = .kiwi
        case pineappleOrderButton: juice = .pineapple
        default:
            juice = .strawberry //temp
        }
        
        manageJuiceMaking(juice: juice)
    }
    
    func manageJuiceMaking(juice: Juices) {
        do {
            try juiceMaker.makeJuice(juice: juice)
            updateFruitsStock()
            showSuccessAlert(juice: juice)
        }
        catch FruitStockError.outOfStock {
            showNotEnoughStock()
        }
        catch FruitStockError.invalidValue {
            showSystemError()
        }
        catch {
            print(error)
        }
    }
    
    func updateFruitsStock() {
        strawberryStockLabel.text = String(fruitStore.fruitStorage[.strawberry] ?? .zero)
        bananaStockLabel.text = String(fruitStore.fruitStorage[.banana] ?? .zero)
        kiwiStockLabel.text = String(fruitStore.fruitStorage[.kiwi] ?? .zero)
        mangoStockLabel.text = String(fruitStore.fruitStorage[.mango] ?? .zero)
        pineappleStockLabel.text = String(fruitStore.fruitStorage[.pineapple] ?? .zero)
    }
    
    func showSuccessAlert(juice: Juices) {
        let alert = UIAlertController(title: nil, message: "\(juice)가 나왔습니다. 맛있게 드세요!😁", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showNotEnoughStock() {
            let alert = UIAlertController(title: nil, message: "재고가 모자라요, 재고를 수정할까요?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "재고 수정하기", style: .default, handler: presentFruitStoreViewController)
            let cancleAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
            alert.addAction(okAction)
            alert.addAction(cancleAction)
            present(alert, animated: true, completion: nil)
        }

        func showSystemError() {
            let alert = UIAlertController(title: nil, message: "SystemError", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }

        private func presentFruitStoreViewController(_ action: UIAlertAction) {
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStock") else { return }
            self.present(viewController, animated: true, completion: nil)
        }
}
