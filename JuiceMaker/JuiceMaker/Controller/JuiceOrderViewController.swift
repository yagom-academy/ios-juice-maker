
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
            return
        }
        
        make(juice: juice)
    }
    
    private func make(juice: Juices) {
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
    
    private func updateFruitsStock() {
        do {
            strawberryStockLabel.text = try getFruitStock(which: .strawberry)
            bananaStockLabel.text = try getFruitStock(which: .banana)
            kiwiStockLabel.text = try getFruitStock(which: .kiwi)
            mangoStockLabel.text = try getFruitStock(which: .mango)
            pineappleStockLabel.text = try getFruitStock(which: .pineapple)
        }
        catch FruitStockError.invalidValue {
            showSystemError()
        }
        catch {
            print(error)
        }
    }
    
    private func getFruitStock(which fruit: Fruits) throws -> String {
        guard let stock = fruitStore.fruitStorage[fruit] else {
            throw FruitStockError.invalidValue
        }
        return String(stock)
    }
    
    private func showSuccessAlert(juice: Juices) {
        let alert = UIAlertController(title: nil, message: "\(juice)가 나왔습니다. 맛있게 드세요!😁", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showNotEnoughStock() {
        let message = FruitStockError.outOfStock.localizedDescription
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "재고 수정하기", style: .default, handler: presentFruitStoreViewController)
        let cancleAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showSystemError() {
        let message = FruitStockError.outOfStock.localizedDescription
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func presentFruitStoreViewController(_ action: UIAlertAction) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStock") else { return }
        self.present(viewController, animated: true, completion: nil)
    }
}
