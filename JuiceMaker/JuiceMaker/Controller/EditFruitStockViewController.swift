import UIKit

class EditFruitStockViewController: UIViewController {
    private var fruitStore: FruitStore?
    
    @IBOutlet var stockOfStrawberryLabel: UILabel!
    @IBOutlet var stockOfBananaLabel: UILabel!
    @IBOutlet var stockOfPineappleLabel: UILabel!
    @IBOutlet var stockOfKiwiLabel: UILabel!
    @IBOutlet var stockOfMangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationButton()
        updateStockLabel()
    }
    
    private func updateStockLabel() {
        let stringOfFruitStock: [Fruit: String]? = fruitStore?.fruitStock.mapValues { String($0) }
        guard let currentStock = stringOfFruitStock else {
            return
        }
        for (fruit, stock) in currentStock {
            switch fruit {
            case .strawberry:
                stockOfStrawberryLabel.text = stock
            case .banana:
                stockOfBananaLabel.text = stock
            case .pineapple:
                stockOfPineappleLabel.text = stock
            case .kiwi:
                stockOfKiwiLabel.text = stock
            case .mango:
                stockOfMangoLabel.text = stock
            }
        }
    }
    
    fileprivate func configureNavigationButton() {
        navigationItem.title = "재고 추가"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(hitDoneButton))
    }
    
    @objc
    func hitDoneButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configure(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func changeQuantity(of fruit: Fruit, by operation: FruitStore.Operation) {
        fruitStore?.changeQuantity(of: fruit, count: 1, by: operation)
    }
}
