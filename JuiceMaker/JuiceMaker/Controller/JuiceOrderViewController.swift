
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
        adjustFontSize()
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitsStock), name: .update, object: fruitStore)
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
    
    private func adjustFontSize() {
        strawberryOrderButton.titleLabel?.adjustsFontSizeToFitWidth = true
        bananaOrderButton.titleLabel?.adjustsFontSizeToFitWidth = true
        mangoOrderButton.titleLabel?.adjustsFontSizeToFitWidth = true
        kiwiOrderButton.titleLabel?.adjustsFontSizeToFitWidth = true
        pineappleOrderButton.titleLabel?.adjustsFontSizeToFitWidth = true
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
    
    @objc private func updateFruitsStock() {
        do {
            strawberryStockLabel.text = String(try fruitStore.getFruitStock(which: .strawberry))
            bananaStockLabel.text = String(try fruitStore.getFruitStock(which: .banana))
            kiwiStockLabel.text = String(try fruitStore.getFruitStock(which: .kiwi))
            mangoStockLabel.text = String(try fruitStore.getFruitStock(which: .mango))
            pineappleStockLabel.text = String(try fruitStore.getFruitStock(which: .pineapple))
        } catch FruitStockError.invalidValue {
            showSystemError()
        } catch {
            print(error)
        }
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
    
    private func makeCurrentStock() -> [String] {
        let fruitLabels = [
            strawberryStockLabel.text,
            bananaStockLabel.text,
            mangoStockLabel.text,
            kiwiStockLabel.text,
            pineappleStockLabel.text
        ]
        
        var currentStock: [String] = []
        
        fruitLabels.forEach { stock in
            currentStock.append(stock ?? "0")
        }
        return currentStock
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.children.first is FruitStorageViewController {
            let viewController = segue.destination.children.first as? FruitStorageViewController
            viewController?.fruitStock = makeCurrentStock()
        }
    }

    private func presentFruitStoreViewController(_ action: UIAlertAction) {
        guard let navcontroller = self.storyboard?.instantiateViewController(withIdentifier: "FruitStock") else { return }
        
        let viewController = navcontroller.children.first as? FruitStorageViewController
        viewController?.fruitStock = makeCurrentStock()
        
        self.present(navcontroller, animated: true, completion: nil)
    }
}


extension Notification.Name {
    static let update = Notification.Name("update")
}
